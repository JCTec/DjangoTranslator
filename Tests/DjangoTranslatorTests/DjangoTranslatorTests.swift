import XCTest
@testable import DjangoTranslator

final class DjangoTranslatorTests: XCTestCase {
    
    let djangoTranslator = DjangoTranslator()
    
    func testARemovalOfSource() {
        try? djangoTranslator.removeSource()
        XCTAssert(!djangoTranslator.managePyExists())
    }
    
    func testCopyMainSource() {
        try? djangoTranslator.copyMainSource()
        XCTAssert(djangoTranslator.managePyExists())
    }
    
    func testModelPyWrite() {
        djangoTranslator.register(TestDjangoTranslatable())
        djangoTranslator.writeModelsPyFromServices()
        djangoTranslator.writeAdminPyFromServices()
    }
}
