//
//  VWTAppController.m
//  Hex2RGB
//
//  Created by Phaedra Deepsky on 2013-06-19.
//  Copyright (c) 2013 Phaedra Deepsky. All rights reserved.
//

#import "VWTAppController.h"
#import "NSColor+HexColor.h"


@implementation VWTAppController

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (NSString *)integerForHexValue:(NSString *)hexValue
{
	unsigned result = 0;
	NSScanner *scanner = [NSScanner scannerWithString:hexValue];
	
	[scanner setScanLocation:0]; // bypass '#' character
	[scanner scanHexInt:&result];
	
	return [NSString stringWithFormat:@"%d", result];
}


- (IBAction)convert:(id)sender {
	NSString *inputString = [self.hexValue stringValue];
	NSString *hexString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
	NSString *redString = [hexString substringWithRange:NSMakeRange(0, 2)];
	[self.integerRed setStringValue:[self integerForHexValue:redString]];
	[self.floatRed setStringValue:[self calculateFloatString:self.integerRed.stringValue]];
	
	NSString *greenString = [hexString substringWithRange:NSMakeRange(2, 2)];
	[self.integerGreen setStringValue:[self integerForHexValue:greenString]];
	[self.floatGreen setStringValue:[self calculateFloatString:self.integerGreen.stringValue]];
	
	NSString *blueString = [hexString substringWithRange:NSMakeRange(4, 2)];
	[self.integerBlue setStringValue:[self integerForHexValue:blueString]];
	[self.floatBlue setStringValue:[self calculateFloatString:self.integerBlue.stringValue]];
	
	[self.colorWell setColor:[NSColor colorWithHexValue:inputString alpha:1.0]];
}

- (NSString *)calculateFloatString:(NSString *)input
{
	float numerator = [input floatValue];
	float denominator = 255.0;
	float result = numerator/denominator;
	return [NSString stringWithFormat:@"%.4f",result];
}

- (IBAction)copyFloats:(id)sender
{
	NSArray *array = @[self.floatRed.stringValue, self.floatGreen.stringValue, self.floatBlue.stringValue];
	NSString *outString = [array componentsJoinedByString:@" "];
	
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
	[pasteboard clearContents];
	[pasteboard writeObjects:@[outString]];
}

- (IBAction)copyCode:(id)sender
{
	NSString *codeString = [NSString stringWithFormat:@"[NSColor colorWithCalibratedRed:%@  green:%@  blue:%@ alpha:1.0]", self.floatRed.stringValue, self.floatGreen.stringValue, self.floatBlue.stringValue];
	
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
	[pasteboard clearContents];
	[pasteboard writeObjects:@[codeString]];
}

- (IBAction)copyIntegers:(id)sender {
	NSArray *array = @[self.integerRed.stringValue, self.integerGreen.stringValue, self.integerBlue.stringValue];
	NSString *outString = [array componentsJoinedByString:@" "];
	
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
	[pasteboard clearContents];
	[pasteboard writeObjects:@[outString]];
}

@end
