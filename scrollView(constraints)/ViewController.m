//
//  ViewController.m
//  scrollView(constraints)
//
//  Created by sjq on 15/11/16.
//  Copyright © 2015年 sjq. All rights reserved.
//


/**
 几个供学习滚动视图的链接
 http://www.cocoachina.com/ios/20141118/10242.html
 http://www.cocoachina.com/ios/20141011/9871.html
 http://tech.glowing.com/cn/practice-in-uiscrollview/
 http://blog.csdn.net/h1101723183/article/details/41895479
 */
#import "ViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageConstraintWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentConstraintWidth;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //二种写法实现引导页面
    //设置ScrollView的整体触摸与显示区域
    //注意 宽 高不要超过 320X480
    //否则会出现无法滚动的情况
    //设置ScrollView滚动内容的区域
    //它通常是需要大于ScrollerView的显示区域的
    //    //这样才有必要在ScrollerView中滚动它
    //    [_scrollView setContentSize:CGSizeMake(ScreenWidth*4, ScreenHeight)];
    
    //开启滚动分页功能，如果不需要这个功能关闭即可
    [_scrollView setPagingEnabled:YES];
    
    //隐藏横向与纵向的滚动条
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    
    //在本类中代理scrollView的整体事件
    [_scrollView setDelegate:self];
    
    
    
    //如果你打开横向或纵向的滚动条，这里可以设置滚动条的风格
    // UIScrollViewIndicatorStyleDefault, 默认风格
    // UIScrollViewIndicatorStyleBlack,   黑色风格
    // UIScrollViewIndicatorStyleWhite    白色风格
    //[_scrollView setIndicatorStyle:UIScrollViewIndicatorStyleBlack]
    
    
    /* for (int i =0; i<4; i++)
     {
     //在这里给每一个ScrollView添加一个图片 和一个按钮
     UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(i * ScreenWidth,0,ScreenWidth,ScreenHeight)];
     NSString *str = [NSString stringWithFormat:@"features_%d",i+1];
     [imageView setImage:[UIImage imageNamed:str]];
     [_scrollView addSubview:imageView];
     }*/    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    self.imageConstraintWidth.constant = ScreenWidth;
    self.contentConstraintWidth.constant = 4*ScreenWidth;
}

@end
