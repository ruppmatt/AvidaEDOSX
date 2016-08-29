//
//  AvidaEDServer-AboutController.h
//  AvidaED
//
//  Created by Matthew Rupp on 7/28/16.
//  Copyright © 2016 BEACON Center for the Study of Evolution in Action. All rights reserved.
//

#ifndef AvidaEDServer_AboutController_h
#define AvidaEDServer_AboutController_h

#import <Cocoa/Cocoa.h>


@interface AvidaEDServerAboutController : NSWindowController
{
  IBOutlet NSWindow* window;
  IBOutlet NSTextField* license;
  
}

+(AvidaEDServerAboutController*) sharedInstance;

@end

#endif /* AvidaEDServer_AboutController_h */
