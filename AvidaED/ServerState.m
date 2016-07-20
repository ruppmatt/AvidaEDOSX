//
//  ServerState.m
//  AvidaED
//
//  Created by Matthew Rupp on 7/15/16.
//  Copyright © 2016 BEACON Center for the Study of Evolution in Action. All rights reserved.
//

#import "ServerState.h"


@implementation ServerState
{
  NSNumber *port;
  NSNumber *err;
}


- (id)init
{
  port = [NSNumber numberWithInt:0];
  err  = [NSNumber numberWithInt:0];
  return self;
}


- (NSString*) getURL
{
  return [NSString stringWithFormat:@"http://localhost:%d/AvidaED.html", [self getServerPort]];
}


- (int)getServerPort
{
  int p;
  @synchronized(port){
    p = [port intValue];
  }
  return p;
}



- (void)setServerPortTo:(int) p
{
  @synchronized(port){
    port = [NSNumber numberWithInt:p];
  }
}


- (bool)isServerReady
{
  bool ready = false;
  @synchronized(port){
    ready = ([port integerValue] > 0) ? true : false;
  }
  return ready;
}



- (void)setError:(int) e
{
  @synchronized(err){
    err = [NSNumber numberWithInt:e];
  }
}


- (bool)hasError
{
  long e;;
  @synchronized(err){
    e = [err integerValue]; 
  }
  return (e != 0) ? true : false;
}
@end