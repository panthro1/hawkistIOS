//
//  CDatePickerViewEx.h
//  MonthYearDatePicker
//
//  Created by Igor on 18.03.13.
//  Copyright (c) 2013 Igor. All rights reserved.
//

@protocol CDatePickerViewExDelegate <NSObject>

- (void) didSelect;

@end


@interface CDatePickerViewEx : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id<CDatePickerViewExDelegate> deleg;

@property (nonatomic, strong) UIColor *monthSelectedTextColor;
@property (nonatomic, strong) UIColor *monthTextColor;

@property (nonatomic, strong) UIColor *yearSelectedTextColor;
@property (nonatomic, strong) UIColor *yearTextColor;

@property (nonatomic, strong) UIFont *monthSelectedFont;
@property (nonatomic, strong) UIFont *monthFont;

@property (nonatomic, strong) UIFont *yearSelectedFont;
@property (nonatomic, strong) UIFont *yearFont;

@property (nonatomic, assign) NSInteger rowHeight;

@property (nonatomic, strong) NSDate *date;



-(void)setupMinYear:(NSInteger)minYear maxYear:(NSInteger)maxYear;
-(void)selectToday;


- (void)settingDate:(NSInteger)month year:(NSInteger)year;
@end
