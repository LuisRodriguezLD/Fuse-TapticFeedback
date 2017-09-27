import Foundation
import UIKit

public class Taptic: NSObject {
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
