public extension Equatable {

    @inlinable
    func isEqual(to rhs: some Equatable) -> Bool {
        if let rhs = rhs as? Self {
            self == rhs
        } else{
            false
        }
    }

    @inlinable
    func isEqual(to rhs: (any Equatable)?) -> Bool {
        if let rhs {
            isEqual(to: rhs)
        } else{
            false
        }
    }
}

public extension Optional where Wrapped == any Equatable {

    @inlinable
    func isEqual(to rhs: some Equatable) -> Bool {
        if let lhs = self {
            lhs.isEqual(to: rhs)
        } else {
            false
        }
    }

    @inlinable
    func isEqual(to rhs: (any Equatable)?) -> Bool {
        if let lhs = self, let rhs = rhs  {
            lhs.isEqual(to: rhs)
        } else {
            self == nil && rhs == nil
        }
    }
}
