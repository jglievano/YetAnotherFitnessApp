#import <Foundation/Foundation.h>
#import "../NimbleObjectiveC/NMBExceptionCapture.h"
#import "../NimbleObjectiveC/NMBStringify.h"
#import "../NimbleObjectiveC/DSL.h"

#if TARGET_OS_TV
    #import "../../Carthage/Checkouts/CwlPreconditionTesting/Sources/CwlPreconditionTesting/Posix/CwlPreconditionTesting_POSIX.h"
#else
    #import "../../Carthage/Checkouts/CwlPreconditionTesting/Sources/CwlPreconditionTesting/Mach/CwlPreconditionTesting.h"
#endif

FOUNDATION_EXPORT double NimbleVersionNumber;
FOUNDATION_EXPORT const unsigned char NimbleVersionString[];
