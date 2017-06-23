//
//  WVDOMContext.m
//  Texture
//
//  Copyright (c) 2017-present, Pinterest, Inc.  All rights reserved.
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//

#import <Weaver/WVDOMContext.h>

#import <AsyncDisplaykit/ASRectTable.h>

@implementation WVDOMContext {
  NSInteger _counter;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    _idToObjectMap = [NSMapTable strongToStrongObjectsMapTable];
    _idToFrameInWindow = [ASRectTable rectTableForStrongObjectPointers];
  }
  return self;
}

+ (NSNumber *)idFromString:(NSString *)idString
{
  return @([idString integerValue]);
}

- (NSNumber *)idForObject:(NSObject *)object
{
  NSNumber *result = @(_counter++);
  [_idToObjectMap setObject:object forKey:result];
  return result;
}

@end