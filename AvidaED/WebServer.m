//
//  WebServer.m
//  AvidaED
//
//  Created by Matthew Rupp on 7/15/16.
//  Copyright © 2016 BEACON Center for the Study of Evolution in Action. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServer.h"
#include "mongoose.h"

@implementation WebServer
{
  __weak ServerState *s_state;
  struct mg_mgr mgr;
  struct mg_connection *nc;
  struct mg_serve_http_opts s_http_server_opts;
  NSNumber *shutdown;
}


- (id) initWithServerState:(ServerState *)ss
{
  s_state = ss;
  [[NSNotificationCenter defaultCenter] 
      addObserver:self 
      selector:@selector(stopServer) 
      name:NSThreadWillExitNotification
      object:nil
  ];
  shutdown = @false;
  return self;
}



- (void) startServer:(void* ) v;
{
  mg_mgr_init(&mgr, NULL);
  
  if ( [self tryToBindToPort] ){
    // Set up HTTP server parameters
    mg_set_protocol_http_websocket(nc);
    s_http_server_opts.document_root = [[[NSBundle mainBundle] resourcePath] UTF8String];
    bool s = false;
    do {
      mg_mgr_poll(&mgr, 1000);
      @synchronized(shutdown) {s = shutdown;}
    } while (!s);
  } else {
    if (s_state != nil)
      [s_state setError:1];
      mg_mgr_free(&mgr);
  }
}



- (void)stopServer
{
  @synchronized(shutdown) {shutdown=@true;}
  mg_mgr_free(&mgr);
}


- (bool) tryToBindToPort {
  const int min_port = 8000;
  const int max_port = 8099;
  int port;
  for (port=min_port; port<=max_port; ++port){
    NSString *str_port = [NSString stringWithFormat:@":%d", port];
    if ( mg_bind(&mgr, [str_port UTF8String], NULL) != NULL)
      break;
  }
  if (port < max_port && s_state != nil){
    [s_state setServerPortTo:port];
    return true;
  }
  return false;
}


@end