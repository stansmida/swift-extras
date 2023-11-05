// MARK: AdHocCodingKey

public struct AdHocCodingKey: CodingKey {

    public init(intValue: Int) {
        self.intValue = intValue
        stringValue = String(intValue)
    }

    public init(stringValue: String) {
        intValue = Int(stringValue)
        self.stringValue = stringValue
    }

    public let intValue: Int?
    public let stringValue: String
}

public extension CodingKey where Self == AdHocCodingKey {

    static func adHoc(_ intValue: Int) -> AdHocCodingKey {
        .init(intValue: intValue)
    }

    static func adHoc(_ stringValue: String) -> AdHocCodingKey {
        .init(stringValue: stringValue)
    }
}
