//
//  ViewController.m
//  Flutter
//
//  Created by deng on 2024/1/12.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      [button addTarget:self
                 action:@selector(showFlutter)
       forControlEvents:UIControlEventTouchUpInside];
      [button setTitle:@"Show Flutter!" forState:UIControlStateNormal];
      button.backgroundColor = UIColor.blueColor;
      button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
      [self.view addSubview:button];
}

- (void)showFlutter {
    FlutterEngine *flutterEngine =
        ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    

    FlutterViewController *flutterViewController =
        [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    [self presentViewController:flutterViewController animated:YES completion:nil];
}


@end
