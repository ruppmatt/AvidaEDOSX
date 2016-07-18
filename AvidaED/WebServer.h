//
//  WebServer.h
//  AvidaED
//
//  Created by Matthew Rupp on 7/15/16.
//  Copyright © 2016 BEACON Center for the Study of Evolution in Action. All rights reserved.
//

#ifndef WebServer_h
#define WebServer_h
#import "ServerState.h"
#include "mongoose.h"


@interface WebServer : NSObject

- (id)initWithServerState:(ServerState*) ss;
- (void)startServer:(void*) v;
- (void)stopServer;
- (BOOL)tryToBindToPort;
@end


#endif /* WebServer_h */
