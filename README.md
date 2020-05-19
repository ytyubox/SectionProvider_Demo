#  SectionProvider Demo

使用 SectionProvider 作為取代 `switch indexPath.section` 的複雜行為 

## URL - 物件互動圖
```
                    +---------------+        +--------------------+            +-------------------+
                    |               |        |                    |            |                   |
                    |     main      |        |tableViewDataSource |            |  SectionProvider  |
                    |               |        |                    |            |                   |
                    +---------------+        +--------------------+            +-------------------+
                            |                           |                                |          
                            |                           |                                |          
                            |                           |                                |          
                            |                           |                                |          
                            |                           |                                |          
   tableView.reloadData()   |                           |                                |          
-------------------------->+++                          |                                |          
                           | |       dataSource         |                                |          
                           | |      .cellForRow()       |     sectionProvider            |          
                           | |----------------------->+-+-+     .heightForRowAt(         |          
                           | |                        |   |       tableView,             |          
                           | |                        |   |       At: indexPath.row)     |          
                           | |                        |   |--------------------------> +-+-+        
                           | |                        |   |                            |   |        
                           | |                        |   |                            |   |        
                           | |                        |   |                            |   |        
                           | |                        |   |                            |   |        
                           | |                        |   |                            |   |        
                           | |                        |   |                            |   |        
                           | |                        |   |                            |   |        
                           | |                        |   |                            |   |        
                           | |                        |   |       UITableViewCell      |   |        
                           | |                        |   |<---------------------------+-+-+        
                           | |      Finish stack      |   |                              |          
                           | |<-----------------------+-+-+                              |          
                           | |                          |                                |          
                           +++                          |                                |          
                            |                           |                                |          
                            |                           |                                |          
                            |                           |                                |          
                            |                           |                                |          
                            |                           |                                |          
                            |                           |                                |          
                            |                           |                                |          
```

## 使用技巧

1. 抽象工廠: 將 section 對應的 cell 判定 `as!` 交由 SectionProvider, 確保 `as!` 必定成功
2. 泛型隱藏: 使用 protocol 繼承的方式, 將泛型重用封裝, 使得 `[SectionProvider]` 可以成立
3.  Adoptor: Cell 所需要的資料由 `Cellinfo` 處理, 使得 model 在後續改動可以與 View 獨立運作  
