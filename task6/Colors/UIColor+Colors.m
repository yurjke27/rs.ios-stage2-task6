//
//  UIColor+Colors.m
//  task6
//
//  Created by Yury Silantyev on 25.06.2020.
//  Copyright © 2020 Yury Silantyev. All rights reserved.
//

#import "UIColor+Colors.h"

// #import <AppKit/AppKit.h>

//black <0x101010>
//white <0xFFFFFF>
//red <0xEE686A>
//blue <0x29C2D1>
//green <0x34C1A1>
//yellow <0xF9CC78>
//yellowHighlighted <0xFDF4E3>
//gray <0x707070>

@implementation UIColor (Colors)

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
