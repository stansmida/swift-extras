/// An identity for wrapped value. For general purpose.
/// Use anywhere where you need an `Identifiable` instance:
/// + For values of types that you don't want to arbitrarily make `Identifiable`.
/// + For `Identifiable`s whose identity needs to be adjusted.
/// + ...
@propertyWrapper
public struct Identified<Value>: Identifiable {

    /// Identifies `wrappedValue` with given `id`.
    public init<Id>(with id: Id, wrappedValue: Value) where Id: Hashable {
        self.id = id
        self.wrappedValue = wrappedValue
    }

    // MARK: "Convenience" inits

    /// Identifies `wrappedValue` with value at `keyPath`.
    public init<Id>(by keyPath: KeyPath<Value, Id>, wrappedValue: Value) where Id: Hashable {
        self.init(with: wrappedValue[keyPath: keyPath], wrappedValue: wrappedValue)
    }

    /// Identifies `wrappedValue` with the object identity.
    public init(object: Value) where Value: AnyObject {
        self.init(with: ObjectIdentifier(object), wrappedValue: object)
    }

    /// Identifies `wrappedValue` with ifself.
    public init(value: Value) where Value: Hashable {
        self.init(with: value, wrappedValue: value)
    }

    // MARK: - Identifiable

    public let id: AnyHashable

    // MARK: - Property Wrapper

    public let wrappedValue: Value
    public var projectedValue: Self { self }
}

extension Identified: Hashable {

    public static func == (lhs: Identified<Value>, rhs: Identified<Value>) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: Another "Convenience" inits depending on `Foundation`

#if canImport(Foundation)

import Foundation

public extension Identified {

    /// Identifies `wrappedValue` with an id unique for this instance.
    init(instance wrappedValue: Value) {
        self.init(with: UUID(), wrappedValue: wrappedValue)
    }
}

#endif
