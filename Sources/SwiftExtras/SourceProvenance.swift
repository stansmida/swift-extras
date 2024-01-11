/// A type that includes information about the instantiation source location.
public protocol SourceProvenanced {

    /// Source location where `Self` was instantiated.
    var sourceProvenance: SourceProvenance { get }
}

/// - Note: `#fileID`, `#line` and `#column` macros [allows some type flexibility](https://github.com/apple/swift/blob/f08f86c71617bacbc61f69ce842e284b27036598/stdlib/public/core/Macros.swift#L33).
/// This type "enforces" type consistency and requires `StaticString`
/// for `fileID` and `UInt` for `line` and `column` (common in Swift).
public struct SourceProvenance: CustomStringConvertible, Hashable {

    public init(_ fileID: StaticString, _ line: UInt, _ column: UInt? = nil) {
        self.fileID = fileID
        self.line = line
        self.column = column
    }

    public let fileID: StaticString
    public let line: UInt
    public let column: UInt?

    public var description: String {
        if let column {
            "\(fileID):\(line):\(column)"
        } else {
            "\(fileID):\(line)"
        }
    }

    public static func == (lhs: SourceProvenance, rhs: SourceProvenance) -> Bool {
        "\(lhs.fileID)" == "\(rhs.fileID)"
        && lhs.line == rhs.line
        && lhs.column == rhs.column
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(fileID)")
        hasher.combine(line)
        hasher.combine(column)
    }
}
