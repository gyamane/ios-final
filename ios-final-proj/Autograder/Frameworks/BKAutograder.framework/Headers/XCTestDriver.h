//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

//#import "NSObject.h"

#import "CDStructures.h"
#import "XCDebugLogDelegate-Protocol.h"
#import "XCTASDebugLogDelegate-Protocol.h"
#import "XCTestManager_TestsInterface-Protocol.h"
#import "XCTestDriverInterface-Protocol.h"
#import "XCTestManager_IDEInterface-Protocol.h"
#import "XCTestManager_ManagerInterface-Protocol.h"

@class DTXConnection, NSMutableArray, NSString, NSUUID, NSXPCConnection, XCTestConfiguration, XCTestSuite;

@interface XCTestDriver : NSObject <XCTestManager_TestsInterface, XCTestDriverInterface, XCDebugLogDelegate>
{
    XCTestSuite *_currentTestSuite;
    XCTestConfiguration *_currentTestConfiguration;
    CDUnknownBlockType _completionHandler;
    NSXPCConnection *_managerConnection;
    BOOL _connectionInProgress;
    BOOL _waitingToStart;
    BOOL _hasIDEConnection;
    BOOL _runningSuite;
    NSUUID *_sessionIdentifier;
    NSString *_sessionSocketPath;
    DTXConnection *_IDEConnection;
    id <XCTestManager_IDEInterface> _IDEProxy;
    long long _IDEProtocolVersion;
    unsigned long long _daemonProtocolVersion;
    int _daemonAvailabilityToken;
    NSMutableArray *_debugMessageBuffer;
    int _debugMessageBufferOverflow;
}

+ (id)sharedTestDriver;
@property unsigned long long daemonProtocolVersion; // @synthesize daemonProtocolVersion=_daemonProtocolVersion;
@property BOOL hasIDEConnection; // @synthesize hasIDEConnection=_hasIDEConnection;
@property BOOL waitingToStart; // @synthesize waitingToStart=_waitingToStart;
@property long long IDEProtocolVersion; // @synthesize IDEProtocolVersion=_IDEProtocolVersion;
@property(readonly) id <XCTestManager_IDEInterface> IDEProxy; // @synthesize IDEProxy=_IDEProxy;
@property(retain) DTXConnection *IDEConnection; // @synthesize IDEConnection=_IDEConnection;
@property(retain) NSUUID *sessionIdentifier; // @synthesize sessionIdentifier=_sessionIdentifier;
@property XCTestSuite *currentTestSuite; // @synthesize currentTestSuite=_currentTestSuite;
- (void)_XCT_applicationWithBundleID:(id)arg1 didUpdatePID:(int)arg2 andState:(unsigned long long)arg3;
- (id)_IDE_startExecutingTestPlanWithProtocolVersion:(id)arg1;
- (void)runTestConfiguration:(id)arg1 completionHandler:(CDUnknownBlockType)arg2;
- (void)runTestSuite:(id)arg1 completionHandler:(CDUnknownBlockType)arg2;
- (void)_checkForTestManager;
- (void)_connectToTestManager;
- (void)_checkManagerDaemonStateAndConnectIfAvailable;
- (void)_resetManagerConnection;
- (void)_connectToIDEWithTransport:(id)arg1;
- (void)_runSuite;
- (void)resumeAppSleep:(id)arg1;
- (id)suspendAppSleep;
@property(readonly) id <XCTestManager_ManagerInterface> managerProxy;
- (void)_softlinkDTXConnectionServices;
- (void)logDebugMessage:(id)arg1;
- (id)init;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) Class superclass;

@end

