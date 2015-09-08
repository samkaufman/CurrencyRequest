//
//  CRCurrencyRequest.h
//  Pods
//
//  Created by Sam Kaufman on 9/8/15.
//
//

@import Foundation.NSObject;
#import "CRCurrencyRequestDelegate.h"

@interface CRCurrencyRequest : NSObject

@property (assign, nonatomic) id<CRCurrencyRequestDelegate> delegate;

- (instancetype)init;
- (void)start;

@end
