import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(bank_ocr_katasTests.allTests),
    ]
}
#endif
