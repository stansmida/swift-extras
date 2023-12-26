/// A type that includes information about the instantiation source location.
public protocol SourceProvenanced {

    /// Typically "\(#fileID):\(#line)" at where `Self` was instantiated.
    var sourceProvenance: String { get }
}

public func sourceProvenance<
    FileID: ExpressibleByStringLiteral,
    Line: ExpressibleByIntegerLiteral
>(
    fileID: FileID,
    line: Line
) -> String {
    "\(fileID):\(line)"
}
