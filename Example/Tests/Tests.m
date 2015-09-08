//
//  CurrencyRequestTests.m
//  CurrencyRequestTests
//
//  Created by Sam Kaufman on 09/07/2015.
//  Copyright (c) 2015 Sam Kaufman. All rights reserved.
//

@import XCTest;
#import <CurrencyRequest/CRCurrencyResults.h>
#import <CurrencyRequest/CRCurrencyRequest.h>
#import <CurrencyRequest/CRCurrencyRequestDelegate.h>


@interface Tests : XCTestCase <CRCurrencyRequestDelegate>

@property (strong, nonatomic) CRCurrencyRequest *req;
@property (strong, nonatomic) XCTestExpectation *reqExpectation;
@property (strong, nonatomic) CRCurrencyResults *lastCurrencies;

@end


@implementation Tests

- (void)testCanCallAllCurrencyMethods
{
    self.reqExpectation = [self expectationWithDescription:@"CurrentRequest retrieved currencies"];

    self.req = [CRCurrencyRequest new];
    self.req.delegate = self;
    [self.req start];
    
    [self waitForExpectationsWithTimeout:30.0 handler:^(NSError *error) {
        assert(!error);
        for (NSString *cur in [CRCurrencyResults supportedCurrencies]) {
            double v = [[self.lastCurrencies valueForKey:cur] doubleValue];
            XCTAssertGreaterThan(v, 0.0);
            XCTAssertLessThan(v, 100000.0);
        }
    }];
}


# pragma mark - CRCurrencyRequestDelegate implementation

- (void)currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(CRCurrencyResults *)currencies
{
    XCTAssertEqual(req, self.req);
    self.lastCurrencies = currencies;
    [self.reqExpectation fulfill];
}



@end

