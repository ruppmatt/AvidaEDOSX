//
//  avidaEDServerDelegate.m
//  AvidaED
//
//  Created by Matthew Rupp on 7/14/16.
//  Copyright © 2016 BEACON Center for the Study of Evolution in Action. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AvidaEDServerAppDelegate.h"
#import "WebServer.h"



@implementation AvidaEDServerAppDelegate
{
  ServerState *s_state;
  NSThread *s_thread;
}



- (void)applicationDidFinishLaunching:(NSNotification *) n
{
  [self launchWebServer];
  while( ![s_state isServerReady] ){
    [NSThread sleepForTimeInterval:0.1];
  }
}


- (IBAction)newAvidaEDInstance:(id)sender 
{
  [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://www.weather.gov"]];
}




- (BOOL)validateMenuItem:(NSMenuItem *) menuItem
{
  if ([menuItem action] == NSSelectorFromString(@"newAvidaEDInstance")){
    if ([s_state isServerReady])
      return YES;
  }
  return NO;
}


- (void)launchWebServer
{
    s_state = [[ServerState alloc] init];
    s_thread = [[NSThread alloc] 
                initWithTarget:[[WebServer alloc] initWithServerState:s_state]
                selector:@selector(startServer:)
                object:nil];
}


@end