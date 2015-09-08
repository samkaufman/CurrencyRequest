//
//  CRViewController.m
//  CurrencyRequest
//
//  Created by Sam Kaufman on 09/07/2015.
//  Copyright (c) 2015 Sam Kaufman. All rights reserved.
//

#import <CurrencyRequest/CRCurrencyRequest.h>
#import "CRViewController.h"


@interface CRViewController () <CRCurrencyRequestDelegate>

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) CRCurrencyRequest *req;

@end


@implementation CRViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.req = [CRCurrencyRequest new];
    self.req.delegate = self;
    [self.req start];
}

# pragma mark - CRCurrencyRequestDelegate

- (void)currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(NSDictionary *)currencies
{
    self.outputLabel.text = [currencies description];
}

@end
