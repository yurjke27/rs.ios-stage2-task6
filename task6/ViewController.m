//
//  ViewController.m
//  task6
//
//  Created by Yury Silantyev on 24.06.2020.
//  Copyright © 2020 Yury Silantyev. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Colors.h"
#import "TabBarVC.h"


@interface ViewController ()

@property (strong, nonatomic) UILabel* startLabel;
@property (strong, nonatomic) UIStackView* stackView;
@property (strong, nonatomic) UIButton* startButton;
@property (strong, nonatomic) UITabBarController* tabBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


-(void)setupUI {
    self.startLabel = [[UILabel alloc] init];
    self.startLabel.text = @"Are you ready?";
    self.startLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
    [self.view addSubview:self.startLabel];
    
    self.startButton = [[UIButton alloc] init];
    self.startButton.layer.cornerRadius = 25;
    [self.startButton setTitle: @"START" forState:UIControlStateNormal];
    [self.startButton setTitleColor: [UIColor colorFromHexString:@"<0x101010>"] forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor colorFromHexString:@"<0xFDF4E3>"] forState:UIControlStateHighlighted];
    self.startButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.startButton.backgroundColor = [UIColor colorFromHexString:@"<0xF9CC78>"];
    [self.view addSubview:self.startButton];
    [self.startButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *circle = [[UIView alloc] init];
    UIView *square = [[UIView alloc] init];
    UIView *triangle = [[UIView alloc] init];
    [self.view addSubview: circle];
    [self.view addSubview: square];
    [self.view addSubview: triangle];
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 70, 70)] CGPath]];
    circleLayer.fillColor = [[UIColor colorFromHexString:@"<0xEE686A>"] CGColor];
    [circle layer].mask = circleLayer;
    [[circle layer] addSublayer:circleLayer];
    
    CAShapeLayer *squareLayer = [CAShapeLayer layer];
    [squareLayer setPath:[[UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 70, 70)] CGPath]];
    squareLayer.fillColor = [[UIColor colorFromHexString:@"<0x29C2D1>"] CGColor];
    [[square layer] addSublayer:squareLayer];
    
    CAShapeLayer *triangleLayer = [CAShapeLayer layer];
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint: CGPointMake(35, 0)];
    [trianglePath addLineToPoint: CGPointMake(80, 70)];
    [trianglePath addLineToPoint: CGPointMake(0, 70)];
    [triangleLayer setPath:[trianglePath CGPath]];
    triangleLayer.fillColor = [[UIColor colorFromHexString:@"<0x34C1A1>"] CGColor];
    [[triangle layer] addSublayer:triangleLayer];
    
    self.stackView = [[UIStackView alloc] init];
    [self.stackView addArrangedSubview:circle];
    [self.stackView addArrangedSubview:square];
    [self.stackView addArrangedSubview:triangle];
    [self.stackView setDistribution:UIStackViewDistributionEqualCentering];
    [self.view addSubview:self.stackView];
    
    self.startLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startButton.heightAnchor constraintEqualToConstant:55.5].active = YES;
    [self.startButton.widthAnchor constraintEqualToConstant:250].active = YES;
    circle.translatesAutoresizingMaskIntoConstraints = NO;
    square.translatesAutoresizingMaskIntoConstraints = NO;
    triangle.translatesAutoresizingMaskIntoConstraints = NO;
    [circle.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [circle.widthAnchor constraintEqualToConstant:70.0].active = YES;
    [square.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [square.widthAnchor constraintEqualToConstant:70.0].active = YES;
    [triangle.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [triangle.widthAnchor constraintEqualToConstant:70.0].active = YES;
    
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.startLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.startLabel.bottomAnchor constraintEqualToAnchor:self.stackView.topAnchor constant: -100].active = YES;
    [self.stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 35].active = YES;
    [self.stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant: -35].active = YES;
    [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.startButton.topAnchor constraintEqualToAnchor:self.stackView.bottomAnchor constant: 100].active = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [UIView animateKeyframesWithDuration:3.0 delay:0 options:(UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat) animations:^{
        self.stackView.arrangedSubviews[0].transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:nil];
    CABasicAnimation *animationForTriangle = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animationForTriangle.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationForTriangle.fromValue = [NSNumber numberWithFloat:0];
    animationForTriangle.toValue = [NSNumber numberWithFloat:(2 * M_PI)];
    animationForTriangle.repeatCount = HUGE_VALL;
    animationForTriangle.duration = 5.0;
    animationForTriangle.removedOnCompletion = NO;
    [self.stackView.arrangedSubviews[2].layer addAnimation:animationForTriangle forKey:@"rotationAnimation"];
    
    CABasicAnimation *animationForSquare = [CABasicAnimation animationWithKeyPath:@"position"];
    animationForSquare.duration = 1.0;
    animationForSquare.repeatCount = HUGE_VALL;
    animationForSquare.autoreverses = YES;
    animationForSquare.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.stackView.arrangedSubviews[1].frame.origin.x + 35, self.stackView.arrangedSubviews[1].bounds.size.height / 2 + 10)];
    animationForSquare.toValue = [NSValue valueWithCGPoint:CGPointMake(self.stackView.arrangedSubviews[1].frame.origin.x + 35, self.stackView.arrangedSubviews[1].bounds.size.height / 2 - 10)];
    [self.stackView.arrangedSubviews[1].layer addAnimation:animationForSquare forKey:@"animatePosition"];
    
    self.stackView.arrangedSubviews[0].transform = CGAffineTransformMakeScale(0.9, 0.9);
    
}

- (void) buttonClick {
    self.tabBar = [[TabBarVC alloc] init];
    [self.navigationController pushViewController: self.tabBar animated:YES];
    [[self view] addSubview:self.tabBar.view];
}

@end
