//
//  CurrencyResults.h
//  Pods
//
//  Created by Sam Kaufman on 9/8/15.
//
//

@import Foundation.NSObject;

/*
 * Against $1 USD base.
 */
@interface CRCurrencyResults : NSObject

@property (readonly, nonatomic) double USD;
@property (readonly, nonatomic) double EUR;
@property (readonly, nonatomic) double JPY;
@property (readonly, nonatomic) double BGN;
@property (readonly, nonatomic) double CZK;
@property (readonly, nonatomic) double DKK;
@property (readonly, nonatomic) double GBP;
@property (readonly, nonatomic) double HUF;
@property (readonly, nonatomic) double PLN;
@property (readonly, nonatomic) double RON;
@property (readonly, nonatomic) double SEK;
@property (readonly, nonatomic) double CHF;
@property (readonly, nonatomic) double INR;
@property (readonly, nonatomic) double MXN;
@property (readonly, nonatomic) double ISK;

+ (NSSet *)supportedCurrencies;

@end
