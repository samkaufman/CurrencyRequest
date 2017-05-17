//
//  CRCurrencyRequest.m
//  Pods
//
//  Created by Sam Kaufman on 9/8/15.
//
//

@import Foundation;
#import "CRCurrencyRequest.h"
#import "CRCurrencyResults.h"


@interface CRCurrencyResults ()

- (instancetype)_initWithXMLData:(NSData *)data;

@end


@implementation CRCurrencyRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        // pass
    }
    return self;
}

- (void)start {

    __weak CRCurrencyRequest *weakSelf = self;
    
    id url = [NSURL URLWithString:@"https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml"];
    id task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        CRCurrencyRequest *strongSelf = weakSelf;
        CRCurrencyResults *toRet;
        NSInteger code = [(NSHTTPURLResponse *)response statusCode];

        if (error || !data) {
            toRet = [self _offlineResponse];
        }
        else if (code < 200 || code >= 300) {
            toRet = [self _offlineResponse];
        }
        else {
            id parsed = [[CRCurrencyResults alloc] _initWithXMLData:data];
            if (!parsed) {
                toRet = [self _offlineResponse];
            }
            else {
                toRet = parsed;
            }
        }

        // Call delegate
        if (strongSelf) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf.delegate currencyRequest:strongSelf retrievedCurrencies:toRet];
            });
        }

    }];
    [task resume];
}


# pragma mark - Private

- (CRCurrencyResults *)_offlineResponse {
    NSBundle *subBundle = [NSBundle bundleForClass:[self class]];
    NSURL *snapshotURL = [subBundle URLForResource:@"eurofxref-daily-snapshot" withExtension:@"xml" subdirectory:@"CurrencyRequest.bundle"];
    NSData *snapshotData = [NSData dataWithContentsOfURL:snapshotURL];
    return [[CRCurrencyResults alloc] _initWithXMLData:snapshotData];
}

@end
