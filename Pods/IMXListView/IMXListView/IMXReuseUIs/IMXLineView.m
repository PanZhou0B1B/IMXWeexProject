//
//  IMXLineView.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/14.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "IMXLineView.h"
#import <Masonry/Masonry.h>

@implementation IMXLineView

- (void)initalConfig {
    self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:241/255.0 alpha:1.0];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self initalConfig];
}
- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self initalConfig];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initalConfig];
    }
    return self;
}

- (void)setIsDotted:(BOOL)isDotted {
    _isDotted = isDotted;
    [self setNeedsDisplay];
}
- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.backgroundColor = lineColor;
    if(self.isDotted){
        [self setNeedsDisplay];
    }
}
- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    if (self.isDotted) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds), 0);
        const CGFloat lengths[] = {2, 1.5};
        CGContextSetLineDash(context, 0, lengths, 2);
        CGContextSetLineWidth(context, CGRectGetHeight(self.bounds));
        CGContextSetStrokeColorWithColor(context, self.backgroundColor.CGColor);
        CGContextStrokePath(context);
    }
}

@end

@implementation UIView (IMXLineView)

- (NSArray *)addLinesForEdge:(UIRectEdge)edge {
    
    NSMutableArray *results = [NSMutableArray array];
    if (edge & UIRectEdgeBottom) {
        IMXLineView *lineView = [[IMXLineView alloc] init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@1);
            make.bottom.equalTo(self.mas_bottom);
            make.leading.equalTo(self.mas_leading);
            make.trailing.equalTo(self.mas_trailing);
        }];
        [results addObject:lineView];
    }
    if (edge & UIRectEdgeTop) {
        IMXLineView *lineView = [[IMXLineView alloc] init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@1);
            make.top.equalTo(self.mas_top);
            make.leading.equalTo(self.mas_leading);
            make.trailing.equalTo(self.mas_trailing);
        }];
        [results addObject:lineView];
    }
    if (edge & UIRectEdgeLeft) {
        IMXLineView *lineView = [[IMXLineView alloc] init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@1);
            make.bottom.equalTo(self.mas_bottom);
            make.leading.equalTo(self.mas_leading);
            make.top.equalTo(self.mas_top);
        }];
        [results addObject:lineView];
    }
    if (edge & UIRectEdgeRight) {
        IMXLineView *lineView = [[IMXLineView alloc] init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@1);
            make.bottom.equalTo(self.mas_bottom);
            make.trailing.equalTo(self.mas_trailing);
            make.top.equalTo(self.mas_top);
        }];
        [results addObject:lineView];
    }
    return [results copy];
}

@end
