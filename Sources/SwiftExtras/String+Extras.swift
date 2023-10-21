public extension String {

    @inline(__always)
    var lowercasedFirst: String {
        guard let first else {
            return self
        }
        return "\(first.lowercased())\(dropFirst())"
    }

    @inline(__always)
    var uppercasedFirst: String {
        guard let first else {
            return self
        }
        return "\(first.uppercased())\(dropFirst())"
    }
}
