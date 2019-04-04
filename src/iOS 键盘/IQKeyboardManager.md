### 抬高输入框

当输入框比较靠下，弹出的键盘会挡住输入框

这个时候需要让屏幕滚动到那个输入框的位置

可以直接使用这个库，

```
https://github.com/hackiftekhar/IQKeyboardManager
```

高级用法，不显示工具条

```
#import "IQKeyboardManager.h"
[[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
```

P.S 这个库会滑动整个 UIView，可能会导致 navigation bar 颜色异常

