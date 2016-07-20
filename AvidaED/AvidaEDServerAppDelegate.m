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
  [self deleteEditMenuItems];
  [self waitForServerLaunch];
  [self openAvidaEDInstance];
}



- (void)waitForServerLaunch
{
  [self launchWebServer];
  while(![s_state isServerReady]){
    [NSThread sleepForTimeInterval:0.1];
  }
}



- (void)deleteEditMenuItems
{
  NSMenu* edit = [[[[NSApplication sharedApplication] mainMenu] itemWithTitle: @"Edit"] submenu];
  if ([[edit itemAtIndex: [edit numberOfItems] - 1] action] == NSSelectorFromString(@"orderFrontCharacterPalette:"))
    [edit removeItemAtIndex: [edit numberOfItems] - 1];
  if ([[edit itemAtIndex: [edit numberOfItems] - 1] action] == NSSelectorFromString(@"startDictation:"))
    [edit removeItemAtIndex: [edit numberOfItems] - 1];
  if ([[edit itemAtIndex: [edit numberOfItems] - 1] isSeparatorItem])
    [edit removeItemAtIndex: [edit numberOfItems] - 1];
}



- (void)openAvidaEDInstance
{
   [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:[s_state getURL]]];
}




- (IBAction)newAvidaEDInstance:(id)sender 
{
  [self openAvidaEDInstance];
}



- (IBAction)copyURLToClipboard:(id)sender
{
  NSPasteboard *pb = [NSPasteboard generalPasteboard];
  [pb clearContents];
  NSArray *types = [NSArray     arrayWithObjects:NSStringPboardType, nil];
  [pb declareTypes:types owner:self];
  [pb setString: [s_state getURL] forType:NSStringPboardType];
}




- (BOOL)validateMenuItem:(NSMenuItem *) menuItem
{
  if ( ([menuItem action] == NSSelectorFromString(@"newAvidaEDInstance:") ||
        [menuItem action] == NSSelectorFromString(@"copyURLToClipboard:"))
        && (s_state != nil && [s_state isServerReady])){
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