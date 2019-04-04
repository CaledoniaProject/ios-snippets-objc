### 自定义 bubble 颜色

在 model 里，

```
self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleBlueColor]];
```

### 隐藏左侧按钮

在 JSQMessagesViewController 子 class 里，

```
self.inputToolbar.contentView.leftBarButtonItem = nil
```