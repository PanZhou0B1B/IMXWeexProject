//
//  EXTScope.m
//  extobjc
//
//  Created by Justin Spahr-Summers on 2011-05-04.
//  Copyright (C) 2012 Justin Spahr-Summers.
//  Released under the MIT license.
//

#import "EXTScope.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
void ext_executeCleanupBlock(__strong ext_cleanupBlock_t *block) {
    (*block)();
}

#pragma clang diagnostic pop
