//
//  AppDelegate.m
//  Hypnosister
//
//  Created by oushunwu on 15/6/12.
//  Copyright (c) 2015年 oushunwu. All rights reserved.
//

#import "AppDelegate.h"
#import "OWNHypnosisView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    [self testViewAndRec];
//    [self testSingleView];
//    [self testScrollView];
    [self testScrollViewPage];
    
    self.window.backgroundColor = [UIColor lightGrayColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)testScrollViewPage{
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *=2;
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    [self.window addSubview:scrollView];
    
    OWNHypnosisView *hyposisView1 = [[OWNHypnosisView alloc]initWithFrame:screenRect];
    [scrollView addSubview:hyposisView1];
    
    screenRect.origin.x+=screenRect.size.width;
    OWNHypnosisView *hyposisView2 = [[OWNHypnosisView alloc]initWithFrame:screenRect];
    [scrollView addSubview:hyposisView2];
    [scrollView setPagingEnabled:YES];
    
    scrollView.contentSize=bigRect.size;
}


-(void)testScrollView{
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *=2;
    bigRect.size.height *=2;
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    [self.window addSubview:scrollView];
    
    OWNHypnosisView *hyposisView = [[OWNHypnosisView alloc]initWithFrame:bigRect];
    [scrollView addSubview:hyposisView];
    
    scrollView.contentSize=bigRect.size;
}

-(void)testSingleView{
    OWNHypnosisView * firstView = [[OWNHypnosisView alloc]initWithFrame:self.window.bounds];
    [self.window addSubview:firstView];
}

-(void)testViewAndRec{
    CGRect firstFrame = CGRectMake(160, 240, 100, 150);
    OWNHypnosisView * firstView = [[OWNHypnosisView alloc]initWithFrame:firstFrame];
    firstView.backgroundColor = [UIColor greenColor];
    [self.window addSubview:firstView];
    
    
    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
    OWNHypnosisView * secondView = [[OWNHypnosisView alloc] initWithFrame:secondFrame];
    secondView.backgroundColor=[UIColor yellowColor];
    [self.window addSubview:secondView];
    
    
    CGRect thirdFrame = CGRectMake(20, 30, 50, 50);
    OWNHypnosisView * thirdView = [[OWNHypnosisView alloc] initWithFrame:thirdFrame];
    thirdView.backgroundColor=[UIColor blueColor];
    [firstView addSubview:thirdView];
}

@end
