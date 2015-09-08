//
//  CRCurrencyRequestDelegate.h
//  Pods
//
//  Created by Sam Kaufman on 9/8/15.
//
//

@import Foundation.NSDictionary;
@class CRCurrencyRequest;
@class CRCurrencyResults;

@protocol CRCurrencyRequestDelegate

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies;

@end