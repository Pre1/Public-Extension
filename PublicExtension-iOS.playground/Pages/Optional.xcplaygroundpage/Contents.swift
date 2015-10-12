//: [Table of Contents](Table%20of%20Contents)

import UIKit

protocol Container {
    var isEmpty: Bool { get }
}

extension String: Container {} // String already has an `isEmpty` property
extension Array: Container {} // Array already has an `isEmpty` property via `CollectionType`

extension Optional where Wrapped: Container {
    var isNilOrEmpty: Bool {
        switch self {
        case .None:
            return true
        case let unwrapped?:
            return unwrapped.isEmpty
        }
    }
}