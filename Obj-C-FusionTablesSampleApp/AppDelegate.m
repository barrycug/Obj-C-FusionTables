/* Copyright (c) 2013 Arseniy Kuznetsov
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//  AppDelegate.m
//  Obj-C-FusionTables
//  Copyright (c) 2013 Arseniy Kuznetsov. All rights reserved.

#import "AppDelegate.h"
#import "FusionTablesViewController.h"
#import "AppGeneralServicesController.h"
#import "EmptyDetailViewController.h"
#import "GTMOAuth2Authentication.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AppGeneralServicesController customizeAppearance];
    
    // [[GoogleAuthorizationController sharedInstance] signOutFromGoogle];
    // a way to despose Google Auth extra view, see link below
    // https://groups.google.com/forum/#!topic/gdata-objectivec-client/4L1AwhwKKoc        
    [[NSNotificationCenter defaultCenter] addObserverForName:kGTMOAuth2UserSignedIn 
          object:nil queue:[NSOperationQueue mainQueue] 
          usingBlock:^(NSNotification *note){
              EmptyDetailViewController *emptyDetailVC = [[EmptyDetailViewController alloc] init];
              [self.navigationController showDetailViewController:emptyDetailVC sender:self];                            
          }];
        
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
     
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.delegate = self;
    
    FusionTablesViewController *ftMasterVC = [[FusionTablesViewController alloc] init];    
    self.navigationController = [[UINavigationController alloc]
                                                initWithRootViewController:ftMasterVC];       
    EmptyDetailViewController *emptyDetailVC = [[EmptyDetailViewController alloc] init];
    
    splitVC.viewControllers = @[self.navigationController, emptyDetailVC];
    splitVC.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    self.window.rootViewController = splitVC;

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[NSNotificationCenter defaultCenter] removeObserver:self];    
}

@end


