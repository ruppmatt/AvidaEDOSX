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

- (void)launchWebServer;
- (void)applicationDidFinishLaunching:(NSNotification*)notification;
- (IBAction) newAvidaEDInstance:(id)sender;
- (BOOL)validateMenuItem:(NSMenuItem *) menuItem;

@end

#endif /* AvidaEDServerAppDelegate_h */
