//
//  AccountDetailViewController.h
//  Hawkist
//
//  Created by Anton on 6/17/15.
//  Copyright (c) 2015 TecSynt Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWBaseViewController.h"

@interface AccountDetailViewController : HWBaseViewController <UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
- (IBAction)btnBack:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)tapImage:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *checkbox1;

@property (weak, nonatomic) IBOutlet UIButton *checkBox2;
@property (weak, nonatomic) IBOutlet UITextView *txtAboutMe;
- (IBAction)btnNext:(id)sender;

- (IBAction)checkBox:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *wwwww;
- (IBAction)tapView:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnContinue;
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@end
