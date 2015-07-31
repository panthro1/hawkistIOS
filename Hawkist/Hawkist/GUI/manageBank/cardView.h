//
//  cardView.h
//  Hawkist
//
//  Created by Anton on 31.07.15.
//  Copyright (c) 2015 TecSynt Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cardViewDelegate <NSObject>

- (void)editCard:(id)sender;
- (void)removeCard:(id)sender;

@end

@interface cardView : UIView
- (instancetype)initWithCard:(HWCard*)card;
@property (nonatomic,strong)id <cardViewDelegate> delegate;
@end
