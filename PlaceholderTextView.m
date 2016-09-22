//
//  PlaceholderTextView.m
//  TextView
//
//  Created by lvdl on 16/1/7.
//  Copyright (c) 2015年 www.palce.com. All rights reserved.
//

#import "PlaceholderTextView.h"

@implementation PlaceholderTextView

- (void)setPlaceholder:(NSString *)placeholder
{
    
    if (placeholder) {
        _placeholder = placeholder;
        _placeholderColor = [UIColor lightGrayColor];
        
    }else{
        self.text = @"";
    }
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (placeholderColor) {
        self.textColor = placeholderColor;
    }
    else {
        self.textColor = [UIColor grayColor];
    }
    
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveTextDidChangeNotification:)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:self];
        
        self.delegate = self;
        
        self.keyboardType = UIKeyboardTypeDefault;//键盘类型
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if([self.text length] == 0 && self.placeholder) {
        CGRect placeHolderRect = CGRectMake(6.0f,
                                            7.0f,
                                            rect.size.width,
                                            rect.size.height);
        
        [self.placeholderColor set];
        
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_0) {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
            paragraphStyle.alignment = self.textAlignment;
            
            [self.placeholder drawInRect:placeHolderRect
                          withAttributes:@{ NSFontAttributeName : self.font,
                                            NSForegroundColorAttributeName : self.placeholderColor,
                                            NSParagraphStyleAttributeName : paragraphStyle }];
        }
        else {
            [self.placeholder drawInRect:placeHolderRect
                                withFont:self.font
                           lineBreakMode:NSLineBreakByTruncatingTail
                               alignment:self.textAlignment];
        }
    }
}

- (void)didReceiveTextDidChangeNotification:(NSNotification*)noti
{
    [self setNeedsDisplay];
}

- (void)textViewDidChange:(UITextView *)textView
{
    if ([_greyDelegate respondsToSelector:@selector(placeholderTextViewDidChange:)]) {
        
        [_greyDelegate placeholderTextViewDidChange:textView];
    }
}

- (void)dealloc
{
    self.delegate = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}
@end
