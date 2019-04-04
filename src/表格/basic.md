### 基本用法

创建一个新的 UIViewController，继承 UITableViewController，

或者创建一个 UIViewController，并拖拽一个 UITableView 到头文件中，然后修改 delegate 和 dataSource

```
- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
```

然后在 storyboard 里修改 prototype cell 以及它的 reuseable identifier

最后实现这些方法，

```
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chatData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {   
    ChatListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"**ReuseIdentifier**" forIndexPath:indexPath];
    
    return cell;
}
```