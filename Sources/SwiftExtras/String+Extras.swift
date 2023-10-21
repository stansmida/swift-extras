public extension String {

    @inlinable
    var lowercasedFirst: String {
        guard let first else {
            return self
        }
        return "\(first.lowercased())\(dropFirst())"
    }

    @inlinable
    var uppercasedFirst: String {
        guard let first else {
            return self
        }
        return "\(first.uppercased())\(dropFirst())"
    }
}
