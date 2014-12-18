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

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AppGeneralServicesController customizeAppearance];
    
    // [[GoogleAuthorizationController sharedInstance] signOutFromGoogle];
    
    FusionTablesViewController *viewController = [[FusionTablesViewController alloc]
                                            initWithNibName:@"FusionTablesViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc]
                                            initWithRootViewController:viewController];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end


