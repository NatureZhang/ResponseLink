//
//  ViewController.m
//  ResponseLink
//
//  Created by 张东 on 16/11/16.
//  Copyright © 2016年 __Nature__. All rights reserved.
//

#import "ViewController.h"
#import "SuperView.h"
#import "UIView+HitExtension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *hitBtn;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.hitBtn.hitTestEdgeInsets = UIEdgeInsetsMake(-10, -10, -10, -10);
    self.btn2.hitTestEdgeInsets = UIEdgeInsetsMake(-10, -10, -10, -10);
    
//    for (UIView *subView in self.view.subviews) {
//        
//        if ([subView isKindOfClass:[SuperView class]]) {
//            
//            for (UIView *subsubView in subView.subviews) {
//                NSLog(@"%@", subsubView);
//            }
//            
//            break;
//        }
//        
//
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)hitBtnTaped:(id)sender {
    
    UIButton *tapBtn = (UIButton *)sender;
    
    NSLog(@"%@", tapBtn);
}


@end
