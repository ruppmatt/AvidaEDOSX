//
//  AvidaEDServer-AboutController.m
//  AvidaED
//
//  Created by Matthew Rupp on 7/28/16.
//  Copyright © 2016 BEACON Center for the Study of Evolution in Action. All rights reserved.
//

#import "AvidaEDServerAboutController.h"



@implementation AvidaEDServerAboutController

- (id) init
{
  self = [super initWithWindowNibName:@"AboutPane"];
  return self;
}


- (void) windowDidLoad
{
  [super windowDidLoad];
  
}


- (void)showWindow:(id)sender
{
  [super showWindow:sender];
}


+ (AvidaEDServerAboutController*) sharedInstance
{
  static AvidaEDServerAboutController* sharedInstance = nil;
  
  if (sharedInstance == nil) {
    sharedInstance = [[self alloc] init];
  }
  
  return sharedInstance;
}

@end