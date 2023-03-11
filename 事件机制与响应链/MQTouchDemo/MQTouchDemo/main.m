//
//  main.m
//  MQTouchDemo
//
//  Created by MagicianQuentin on 2023/3/10.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TestApplication.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    
    NSString * applicatonClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        applicatonClassName = NSStringFromClass([TestApplication class]);
    }
    return UIApplicationMain(argc, argv, applicatonClassName, appDelegateClassName);
}
