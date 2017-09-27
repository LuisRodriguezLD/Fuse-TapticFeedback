Fuse-TapticFeedback
===================

What is this?
-------------

Exposes Apple's [UIFeedbackGenerator](https://developer.apple.com/documentation/uikit/uifeedbackgenerator) to use in [Fuse](fusetools.com).
Written in Swift and implemented using Foreign code.

So far it just has [UIImpactFeedbackGenerator](https://developer.apple.com/documentation/uikit/uiimpactfeedbackgenerator), but more coming soon...


How do I use it?
----------
Quite simple, really.
Just `require` it and you are ready to go.

It has three styles:

 - *light*
 - medium
 - **heavy**


```
var Taptic = require("TapticModule");

function light()
    Taptic.Light();
}

function medium(){
    Taptic.Medium();
}

function heavy(){
    Taptic.Heavy();
}
```


> **Important Notes:**
> - Only iPhone 7/7 plus and older have Taptic engine
> - This API was introduced in iOS 10, you need to build for that OS.
> - Swift 3.2 is necessary if building with Xcode 9.
