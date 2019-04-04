### UITableViewCell textLabel 居中问题

只有 style 为 default 时，给 textLabel 设置的 NSTextAlignmentCenter 才会生效

```
cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
cell.selectionStyle = UITableViewCellSelectionStyleNone;
cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
cell.textLabel.font = cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
cell.textLabel.text = @"退出登录";
cell.textLabel.textAlignment = NSTextAlignmentCenter;
cell.accessoryType = UITableViewCellAccessoryNone;
```

