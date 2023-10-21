public extension Equatable {

    @inline(__always)
    func isEqual(to rhs: some Equatable) -> Bool {
        if let rhs = rhs as? Self {
            self == rhs
        } else{
            false
        }
    }
}
