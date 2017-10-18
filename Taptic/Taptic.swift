import Foundation
import UIKit

public class Impact: NSObject {
    public func light() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        DispatchQueue.main.async(execute: {() -> Void in
            generator.impactOccurred()
        })
    }
    public func medium() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        DispatchQueue.main.async(execute: {() -> Void in
            generator.impactOccurred()
        })
    }
    public func heavy() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        DispatchQueue.main.async(execute: {() -> Void in
            generator.impactOccurred()
        })
    }
}

public class Notification: NSObject {
    public func success() {
        let generator = UINotificationFeedbackGenerator()
        DispatchQueue.main.async(execute: {() -> Void in
            generator.notificationOccurred(.success)
        })
    }
    public func error() {
        let generator = UINotificationFeedbackGenerator()
        DispatchQueue.main.async(execute: {() -> Void in
            generator.notificationOccurred(.error)
        })
    }
    public func warning() {
        let generator = UINotificationFeedbackGenerator()
        DispatchQueue.main.async(execute: {() -> Void in
            generator.notificationOccurred(.warning)
        })
    }
}
