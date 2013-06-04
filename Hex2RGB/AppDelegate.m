//
//  AppDelegate.m
//  Hex2RGB
//
//  Created by Phaedra Deepsky on 2013-06-03.
//  Copyright (c) 2013 Phaedra Deepsky. All rights reserved.
//

#import "AppDelegate.h"
#import "NSColor+HexColor.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[self.colorWell addObserver:self forKeyPath:@"color" options:0 context:NULL];
}

-(void)awakeFromNib
{
	//[self.colorWell addObserver:self forKeyPath:@"color" options:0 context:NULL];
}

- (NSString *)integerForHexValue:(NSString *)hexValue
{	
	unsigned result = 0;
	NSScanner *scanner = [NSScanner scannerWithString:hexValue];
	
	[scanner setScanLocation:0]; // bypass '#' character
	[scanner scanHexInt:&result];
	//NSLog(@"%d",result);
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

- (IBAction)copyFloats:(id)sender {
	NSArray *array = @[self.floatRed.stringValue, self.floatGreen.stringValue, self.floatBlue.stringValue];
	NSString *outString = [array componentsJoinedByString:@" "];
	
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
	[pasteboard clearContents];
	[pasteboard writeObjects:@[outString]];
}

- (IBAction)copyIntegers:(id)sender {
	NSArray *array = @[self.integerRed.stringValue, self.integerGreen.stringValue, self.integerBlue.stringValue];
	NSString *outString = [array componentsJoinedByString:@" "];
	
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
	[pasteboard clearContents];
	[pasteboard writeObjects:@[outString]];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	NSLog(@"%s",__PRETTY_FUNCTION__);
	if ([keyPath isEqualToString:@"color"]) {
		NSColor *myColor = [self.colorWell color];
		
	}
}

@end
