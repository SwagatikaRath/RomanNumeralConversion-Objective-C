//
//  ViewController.h
//  RomanNumeral
//
//  Created by Swagatika on 9/28/15.
//  Copyright (c) 2015 swagatika. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchNumerals;
@property (weak, nonatomic) IBOutlet UILabel *resultingNumeralLabel;
- (NSInteger)romanToDecimal:(NSString *)romanNumeral;
- (NSString *) displayValue;
- (BOOL)isValidForRoman:(NSString *)text;
@end

