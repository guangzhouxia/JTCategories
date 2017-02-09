//
//  AppDelegate.h
//  JTCategoriesDemo
//
//  Created by YS-160408B on 17/2/9.
//  Copyright © 2017年 JT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

