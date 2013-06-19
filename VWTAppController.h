//
//  VWTAppController.h
//  Hex2RGB
//
//  Created by Phaedra Deepsky on 2013-06-19.
//  Copyright (c) 2013 Phaedra Deepsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VWTAppController : NSObject

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *hexValue;

@property (weak) IBOutlet NSTextField *floatRed;
@property (weak) IBOutlet NSTextField *floatGreen;
@property (weak) IBOutlet NSTextField *floatBlue;

@property (weak) IBOutlet NSTextField *integerRed;
@property (weak) IBOutlet NSTextField *integerGreen;
@property (weak) IBOutlet NSTextField *integerBlue;

@property (weak) IBOutlet NSColorWell *colorWell;

- (IBAction)convert:(id)sender;
- (IBAction)copyFloats:(id)sender;
- (IBAction)copyIntegers:(id)sender;

@end
