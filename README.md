BubblePresent
====

![preview](https://travis-ci.org/Joker-388/MessageImageCategory.svg?branch=master)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
<br>
![preview](https://github.com/Joker-388/JKRBubblePresent/blob/master/Preview/bubble.gif) 

You can use it like this:<br>
```objective-c
@interface JKRViewController : JKRBubbleViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    JKRViewController *controller = [JKRViewController new];
    controller.startPoint = point;
    controller.bubbleColor = [UIColor whiteColor];
    [self presentViewController:controller animated:YES completion:nil];
}
```

利用自定义的transitioningDelegate来实现百度外卖首页搜索界面弹出的效果
