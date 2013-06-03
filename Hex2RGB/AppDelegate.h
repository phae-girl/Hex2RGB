//
//  AppDelegate.h
//  Hex2RGB
//
//  Created by Phaedra Deepsky on 2013-06-03.
//  Copyright (c) 2013 Phaedra Deepsky. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *hexValue;

@property (weak) IBOutlet NSTextField *floatRed;
@property (weak) IBOutlet NSTextField *floatGreen;
@property (weak) IBOutlet NSTextField *floatBlue;

@property (weak) IBOutlet NSTextField *integerRed;
@property (weak) IBOutlet NSTextField *integerGreen;
@property (weak) IBOutlet NSTextField *integerBlue;


- (IBAction)convert:(id)sender;
- (IBAction)copyFloats:(id)sender;
- (IBAction)copyIntegers:(id)sender;

@end
