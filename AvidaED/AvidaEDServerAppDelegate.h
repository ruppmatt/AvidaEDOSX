//
//  AvidaEDServerAppDelegate.h
//  AvidaED
//
//  Created by Matthew Rupp on 7/15/16.
//  Copyright © 2016 BEACON Center for the Study of Evolution in Action. All rights reserved.
//

#ifndef AvidaEDServerAppDelegate_h
#define AvidaEDServerAppDelegate_h


@interface AvidaEDServerAppDelegate : NSObject <NSApplicationDelegate>
- (void)waitForServerLaunch;
- (void)deleteEditMenuItems;
- (void)launchWebServer;
- (void)applicationDidFinishLaunching:(NSNotification*)notification;
- (IBAction)newAvidaEDInstance:(id)sender;
- (IBAction)copyURLToClipboard:(id)sender;
- (IBAction)showAboutWindow:(id)sender;
- (BOOL)validateMenuItem:(NSMenuItem *) menuItem;
- (void)openAvidaEDInstance;

@end

#endif /* AvidaEDServerAppDelegate_h */
