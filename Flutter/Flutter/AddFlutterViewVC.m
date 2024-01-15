//
//  AddFlutterViewVC.m
//  Flutter
//
//  Created by deng on 2024/1/15.
//

#import "AddFlutterViewVC.h"
#import "SingleFlutterVC.h"
@interface AddFlutterViewVC ()

@end

@implementation AddFlutterViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect safeFrame = self.view.safeAreaLayoutGuide.layoutFrame;
    CGFloat halfHeight = safeFrame.size.height / 2.0;
    
    SingleFlutterVC *topVC = [[SingleFlutterVC alloc] initWithEntrypoint:@"singleMain"];
    [self addChildViewController:topVC];
    topVC.view.frame = CGRectMake(CGRectGetMinX(safeFrame), CGRectGetMinY(safeFrame), CGRectGetWidth(safeFrame), halfHeight);
    [self.view addSubview:topVC.view];
    
    SingleFlutterVC *bottomVC = [[SingleFlutterVC alloc] initWithEntrypoint:@"doubleMain"];
    [self addChildViewController:bottomVC];
    bottomVC.view.frame = CGRectMake(CGRectGetMinX(safeFrame), CGRectGetMaxY(topVC.view.frame), CGRectGetWidth(safeFrame), halfHeight);
    [self.view addSubview:bottomVC.view];
    
    [topVC didMoveToParentViewController:self];
    [bottomVC didMoveToParentViewController:self];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
