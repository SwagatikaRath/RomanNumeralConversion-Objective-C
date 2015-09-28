//
//  ViewController.m
//  RomanNumeral
//
//  Created by Swagatika on 9/28/15.
//  Copyright (c) 2015 swagatika. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak)NSString* display;
@property(nonatomic,strong) NSDictionary *roamnNumeralDictionary;
@end

@implementation ViewController

- (void)viewDidLoad {
    
   _roamnNumeralDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [NSNumber numberWithInt:1], @"I",
                                            [NSNumber numberWithInt:5], @"V",
                                            [NSNumber numberWithInt:10], @"X",
                                            [NSNumber numberWithInt:50], @"L",
                                            [NSNumber numberWithInt:100], @"C",
                                            [NSNumber numberWithInt:500], @"D",
                                            [NSNumber numberWithInt:1000], @"M", nil];
    _resultingNumeralLabel.hidden = YES;
    [super viewDidLoad];
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    return YES;
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    if ([_searchNumerals.text  isEqual: @""]) {
        _resultingNumeralLabel.hidden = YES;
    }
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if (![_searchNumerals.text  isEqual: @""] && [self isValidForRoman:_searchNumerals.text ]) {
       
        [ _resultingNumeralLabel setText:[NSString stringWithFormat:@"The numeric value of roman numeral is %ld",[self romanToDecimal:_searchNumerals.text]]];
        _resultingNumeralLabel.hidden = NO;
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!" message:@"Invalid Roman Numeral" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _resultingNumeralLabel.hidden = YES;
    }
    
    [_searchNumerals resignFirstResponder];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    _searchNumerals.text = @"";
    _resultingNumeralLabel.hidden = YES;
    [_searchNumerals resignFirstResponder];
}


#pragma mark - isValidForRoman
/**
 
 @method
 
 isValidForRoman
 
 @param romanNumeral text entered by the user
 
 @discussion This method will valiadate eneterd roman numeral.
 
*/

- (BOOL)isValidForRoman:(NSString *)text {
   
    NSString *romanRegex = @"^(?=.)(?i)M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$";
    NSPredicate *romanTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", romanRegex];
    return [romanTest evaluateWithObject:text];
}


#pragma mark - romanToDecimal
/**
 
 @method
 
 romanToDecimal
 
 @param romanNumeral text entered by the user
 
 @discussion This method will return equivalent decimal number for eneterd roman numeral.
 
 */

- (NSInteger)romanToDecimal:(NSString *)romanNumeral{
    
     NSInteger previousValue=0;
     NSInteger currentValue = 0;
     NSInteger finalValue = 0;
   
    for(NSInteger i = [romanNumeral length]-1; i>=0 ; i--)
    {
        NSString *getCharOfRomanString = [NSString stringWithFormat:@"%c", [[romanNumeral uppercaseString] characterAtIndex:i]];
        
        currentValue = [[_roamnNumeralDictionary objectForKey:getCharOfRomanString] integerValue];
        if(currentValue < previousValue)
            finalValue-=currentValue;
        else
            finalValue+=currentValue;
        previousValue = currentValue;
    }
    self.display = [NSString stringWithFormat:@"%ld",finalValue];
    return finalValue;
}

#pragma mark - displayValue
/*
 * The displayValue method retuns a copy of display.
 */
- (NSString *) displayValue {
    if ([self.display length]) {
        return [self.display copy];
    }
    return @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
