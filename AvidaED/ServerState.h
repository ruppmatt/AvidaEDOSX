//
//  ServerState.h
//  AvidaED
//
//  Created by Matthew Rupp on 7/15/16.
//  Copyright © 2016 BEACON Center for the Study of Evolution in Action. All rights reserved.
//

#ifndef ServerState_h
#define ServerState_h

#import <Foundation/Foundation.h>

@interface ServerState : NSObject

- (int)getServerPort;
- (void)setServerPortTo:(int) port;
- (bool)isServerReady;
- (bool)hasError;
- (void)setError:(int) err;

@end


#endif /* ServerState_h */
