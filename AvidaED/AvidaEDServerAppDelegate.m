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
#import "ServerState.h"




@implementation AvidaEDServerAppDelegate
{
  ServerState *s_state;
  NSThread *s_thread;
}



- (void)applicationDidFinishLaunching:(NSNotification*)notification
{
  s_state = nil;
  s_thread = nil;
  [self launchWebServer];
  while( ![s_state isServerReady] ){
    [NSThread sleepForTimeInterval:0.1];
  }
}


- (IBAction)newAvidaEDInstance:(id)sender 
{
  int port = [s_state getServerPort]; 
  NSString *str_url = [NSString stringWithFormat:@"http://localhost:%d/AvidaED.html", port];
  [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:str_url]];
}




- (BOOL)validateMenuItem:(NSMenuItem *) menuItem
{
  if ([menuItem action] == NSSelectorFromString(@"newAvidaEDInstance:")){
    if (s_state != nil && [s_state isServerReady])
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
    [s_thread start];
}


@end