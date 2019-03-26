//
//  CertificatePinningTests.swift
//  PeakNetwork
//
//  Created by Sam Oakley on 11/11/2016.
//  Copyright © 2016 3Squared. All rights reserved.
//

import Foundation
import XCTest

#if os(iOS)

@testable import PeakNetwork_iOS

#else

@testable import PeakNetwork_macOS

#endif

class CertificatePinningTests: XCTestCase {
    func testNoCertificate() {
        let expect = expectation(description: "")
        
        let certificatePinningSessionDelegate = CertificatePinningSessionDelegate()
        let urlSession = URLSession(configuration: URLSessionConfiguration.default,
                                    delegate: certificatePinningSessionDelegate,
                                    delegateQueue: nil)
        
        let networkOperation = NetworkOperation(requestable: "https://google.com", session: urlSession)
        
        networkOperation.addResultBlock { result in
            do {
                try _ = result.get()
                XCTFail()
            } catch {
                expect.fulfill()
            }
        }
        
        networkOperation.enqueue()
        
        waitForExpectations(timeout: 5)
    }
    
    
    func testValidCertificate() {
        let expect = expectation(description: "")
        
        let certificatePinningSessionDelegate = CertificatePinningSessionDelegate()
        let urlSession = URLSession(configuration: URLSessionConfiguration.default,
                                    delegate: certificatePinningSessionDelegate,
                                    delegateQueue: nil)
        
        let networkOperation = NetworkOperation(requestable: "https://github.com", session: urlSession)
        
        networkOperation.addResultBlock { result in
            do {
                try _ = result.get()
                expect.fulfill()
            } catch {
                XCTFail()
            }
        }
        
        networkOperation.enqueue()
        
        waitForExpectations(timeout: 5)
    }
    
}
