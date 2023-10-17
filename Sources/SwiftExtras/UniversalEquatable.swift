@inline(__always)
public func areEqual<T: Equatable, U: Equatable>(lhs: T, rhs: U) -> Bool {
    if let rhs = rhs as? T {
        lhs == rhs
    } else {
        false
    }
}
