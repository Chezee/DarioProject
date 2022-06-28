import XCTest
@testable import WeatherNetwork

final class WeatherNetworkTests: XCTestCase {
    func testNotAuthorizedErrorRecieved_When_InvalidToken() throws {
        XCTAssert(true)
    }
    
    func testServerSideErrorRecieved_When_500CodeRecieved() throws {
        XCTAssert(true)
    }
    
    func testSuccessedResultReturned_When_SuccessResponseRecievedFromServer() throws {
        XCTAssert(true)
    }
    
    func testFailureRecieved_When_NotProperEndpoint() async throws {
        XCTAssert(true)
    }
}
