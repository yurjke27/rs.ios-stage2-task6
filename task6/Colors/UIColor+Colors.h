//
//  UIColor+Colors.h
//  task6
//
//  Created by Yury Silantyev on 25.06.2020.
//  Copyright © 2020 Yury Silantyev. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Colors)

+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
