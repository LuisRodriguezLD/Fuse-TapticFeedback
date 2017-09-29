Fuse-TapticFeedback
===================

What is this?
-------------

Exposes Apple's [UIFeedbackGenerator](https://developer.apple.com/documentation/uikit/uifeedbackgenerator) to use with [Fuse](fusetools.com).
Written in Swift and implemented using Foreign code.



How do I use it?
----------
Quite simple, really.
Just `require` it and you are ready to go.

It has three styles:

 - *Light*
 - Medium
 - **Heavy**

There are also:
 - Success
 - Error
 - Warning


Example
----------
```
var Feedback = require("FeedbackModule");
Feedback.Raise("Success");
```


> **Important Notes:**
> - Only iPhone 7/7 plus and older have Taptic engine.
> - This API was introduced in iOS 10, you need to build for that OS.
> - Swift 3.2 is necessary if building with Xcode 9.
