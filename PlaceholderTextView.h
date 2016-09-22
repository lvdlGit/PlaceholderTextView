//
//  PlaceholderTextView.h
//  TextView
//
//  Created by lvdl on 16/1/7.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlaceholderTextViewDelegate <NSObject>

@optional

- (void)placeholderTextViewDidChange:(UITextView *)textView;

@end

@interface PlaceholderTextView : UITextView<UITextViewDelegate>

@property (nonatomic, assign) id<PlaceholderTextViewDelegate> greyDelegate;

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@end
