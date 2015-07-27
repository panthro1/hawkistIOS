//
//  HWProfileViewController.m
//  Hawkist
//
//  Created by User on 14.07.15.
//  Copyright (c) 2015 TecSynt Solutions. All rights reserved.
//

#import "HWProfileViewController.h"
#import "NavigationVIew.h"

#import "HWButtonForSegment.h"

#import "FeedScreenCollectionViewCell.h"
#import "HWFollowInProfileCell.h"
#import "StarRatingControl.h"
#import "NetworkManager.h"
#import "HWUser.h"
#import "HWFollowUser.h"
#import "NSDate+NVTimeAgo.h"

#import "MyItemCellView.h"
#import "ViewItemViewController.h"



@interface HWProfileViewController () <NavigationViewDelegate, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, StarRatingDelegate, UIAlertViewDelegate, HWFollowInProfileCellDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *segmentView;
@property (weak, nonatomic) IBOutlet NavigationVIew *navigationView;

@property (weak, nonatomic) IBOutlet StarRatingControl *starRatingView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;


@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *salesLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastSeenLabel;
@property (weak, nonatomic) IBOutlet UILabel *responsTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (weak, nonatomic) IBOutlet UIButton *followUnfollowButton;

@property (strong, nonatomic) IBOutletCollection(HWButtonForSegment) NSArray *buttonSegmentCollection;
@property (weak, nonatomic) IBOutlet HWButtonForSegment *itemsButton;
@property (weak, nonatomic) IBOutlet HWButtonForSegment *followingButton;
@property (weak, nonatomic) IBOutlet HWButtonForSegment *followersButton;
@property (weak, nonatomic) IBOutlet HWButtonForSegment *wishlistButton;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) HWUser *user;

@property (nonatomic, strong) NSArray* selectedSegmentArray;
@property (nonatomic, strong) NSArray *itemsArray;
@property (nonatomic, strong) NSArray *followingArray;
@property (nonatomic, strong) NSArray *followersArray;
@property (nonatomic, strong) NSArray *wishListArray;

@property (nonatomic, strong) NetworkManager *networkManager;

@property (nonatomic, strong) NSString *userId;


@property (nonatomic, assign) NSInteger selectedArrayWithData;
@property (nonatomic, strong) id lastPressSegmentButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;

@end


typedef NS_ENUM (NSInteger, HWArrayWithDataForSegmentView)
{
    HWArrayWithItems = 10,
    HWArrayWithFollowers = 20,
    HWArrayWithFollowing = 30,
    HWArrayWithWishlist = 40
};


@implementation HWProfileViewController

#pragma mark-
#pragma mark Lifecycle



- (instancetype) initWithUserID:(NSString *)userID
{
    self = [super initWithNibName: @"HWProfileViewController" bundle: nil];
    if(self)
    {
        self.networkManager = [NetworkManager shared];
        self.userId = userID;
        
        [self.networkManager getUserProfileWithUserID:userID
                                            successBlock:^(HWUser *user) {
                                                
                                                self.user = user;
                                                [self updateUser];
                                                
                                            } failureBlock:^(NSError *error) {

                                                NSString *errorMessage = [NSString stringWithFormat:@"%@", error.localizedDescription];
       
                                                [[[UIAlertView alloc]initWithTitle:@"Error!"
                                                                           message:errorMessage
                                                                          delegate:self
                                                                 cancelButtonTitle:@"Ok!"
                                                                 otherButtonTitles: nil] show];
                                        }];
        [self setArrayForSegmentViewWithUserID:userID];
    
    }
    
    return self;
}

- (instancetype) init
{
    self = [self initWithUserID:nil];
    
    if(self)
    {
    
    }
    
    return self;
}



- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(!self.lastPressSegmentButton){
        
        [self segmentButtonAction:self.itemsButton];
        
    } else {
    
        [self segmentButtonAction:self.lastPressSegmentButton];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self commonInit];
    
    self.navigationView.delegate = self;
    self.navigationView.title.text = @"Profile";
    [self.navigationView.title setFont: [UIFont fontWithName:@"OpenSans" size:17]];
    [self.navigationView.title setFont:[UIFont systemFontOfSize:20]];
    [self.navigationView.rightButtonOutlet setImage:[UIImage imageNamed:@"points"] forState:UIControlStateNormal];
 
   
}


#pragma mark -
#pragma mark commonInit


-(void)commonInit
{
    
    CGFloat widthScreen = [UIScreen mainScreen].bounds.size.width;
    CGFloat yOriginForTableAndCollection = self.segmentView.frame.origin.y + self.segmentView.frame.size.height - 10;
    
    
    // init tableView
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, yOriginForTableAndCollection, widthScreen, 200) style:UITableViewStylePlain];
    [self.scrollView addSubview:self.tableView];
    self.tableView.hidden = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HWFollowInProfileCell" bundle:nil] forCellReuseIdentifier:@"tableViewCell"];
    
    
    // init tableView
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, yOriginForTableAndCollection, widthScreen, 500) collectionViewLayout:layout];
    [self.scrollView addSubview:self.collectionView];
    self.collectionView.hidden = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundCollection"]];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"myItemCell" bundle:nil] forCellWithReuseIdentifier:@"collectionViewCell"];
 
    self.starRatingView.delegate = self;
    
    NSString *currentUserId = [[NSUserDefaults standardUserDefaults] objectForKey:kUSER_ID];
    if([currentUserId isEqualToString:self.userId])
    {
      
        self.followUnfollowButton.hidden = YES;
    }
   
}



- (void) updateUser
{
    
    if([self.user.following integerValue] == 1)
    {
        [self.followUnfollowButton setTitle:@" UNFOLLOW " forState:UIControlStateNormal];
    }
    
    [self.avatarView setImageWithURL: [NSURL URLWithString: self.user.avatar] placeholderImage:[UIImage imageNamed:@"noAvatar"]];
    self.userNameLabel.text = self.user.username;
    if(self.user.city)
    {
        self.locationLabel.text =  [NSString stringWithFormat:@"%@, United Kingdom  ", self.user.city];
    }
    self.starRatingView.rating = [self.user.rating integerValue];
    self.ratingLabel.text = [NSString stringWithFormat:@"%@ (%@ reviews)",self.user.rating,self.user.review];
    self.salesLabel.text = self.user.number_of_sales;
    NSString *aboutTitle = [NSString stringWithFormat:@"    ABOUT %@",self.user.username.uppercaseString];
    [self.aboutButton setTitle:aboutTitle forState:UIControlStateNormal];
    
    NSDate *lastActivityDate = [NSDate dateFromServerFormatString:self.user.last_activity];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a MMM dd, yyyy"];
    
    self.lastSeenLabel.text = [dateFormatter stringFromDate:lastActivityDate];
    
}


- (void) setupSegmentButtonsConfig
{
    self.itemsButton.titleButton.text = @"ITEMS";
    self.itemsButton.count.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.itemsArray.count];
    
    self.followersButton.titleButton.text = @"FOLLOWERS";
    self.followersButton.count.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.followersArray.count];
    
    self.followingButton.titleButton.text = @"FOLLOWING";
    self.followingButton.count.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.followingArray.count];
    
    self.wishlistButton.titleButton.text = @"WISHLIST";
    self.wishlistButton.count.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.wishListArray.count];
    
    
}



#pragma mark -
#pragma mark set/get

- (void) setArrayForSegmentViewWithUserID:(NSString*)userId
{
// items
    [self setItemsArrayWithUserId:userId];
    
// following
    [self setFollowingArrayWithUserId:userId];
   
//followers
    [self setFollowersArrayWithUserId:userId];
    
//wishlist
    [self setWishlistArrayWithUsetId:userId];
    
}


// items
- (void) setItemsArrayWithUserId:(NSString*)userId
{
    
    [self.networkManager getItemsByUserId:userId
                             successBlock:^(NSArray *arrayWithItems) {
                                 
                                  self.itemsArray = arrayWithItems;
                                 
                                 if (self.selectedArrayWithData == HWArrayWithItems)
                                 {
                                     [self reloadDataIfSuccessBlockForTable:NO withDataArray:arrayWithItems];
                                 }
                                 
                                 
                             } failureBlock:^(NSError *error) {
                                 
                                 [self showAlertWithError:error];
                                 
                             }];
    
}

// following

- (void) setFollowingArrayWithUserId:(NSString*)userId
{
    [self.networkManager getFollowingWithUserId:userId
                                   successBlock:^(NSArray *followingArray) {
                                       
                                       self.followingArray = followingArray;
                                     
                                       if (self.selectedArrayWithData == HWArrayWithFollowing)
                                       {
                                           [self reloadDataIfSuccessBlockForTable:YES withDataArray:followingArray];
                                       }

                                   } failureBlock:^(NSError *error) {
                                       
                                       [self showAlertWithError:error];
                                       
                                   }];
}

//followers

- (void) setFollowersArrayWithUserId:(NSString*)userId
{
    [self.networkManager getFollowersWithUserId:userId
                                   successBlock:^(NSArray *followersArray) {
                                       
                                      self.followersArray = followersArray;
                                       
                                       if (self.selectedArrayWithData == HWArrayWithFollowers)
                                       {
                                           [self reloadDataIfSuccessBlockForTable:YES withDataArray:followersArray];
                                       }
                                       
                                } failureBlock:^(NSError *error) {
                                    
                                   [self showAlertWithError:error];
                                       
                                   }];
    
}

// wishlist

- (void) setWishlistArrayWithUsetId:(NSString*)userId
{
    [self.networkManager getWishlistWithUserId:userId
                                  successBlock:^(NSArray *wishlistArray) {
                                      
                                      self.wishListArray = wishlistArray;
                                      
                                      if (self.selectedArrayWithData == HWArrayWithWishlist)
                                      {
                                          [self reloadDataIfSuccessBlockForTable:NO withDataArray:wishlistArray];
                                      }
                                      
                                  } failureBlock:^(NSError *error) {
                                      
                                      [self showAlertWithError:error];
                                      
                                  }];
}


- (void) showAlertWithError:(NSError*)error
{
    [self showAlertWithTitle:@"Error!"
                     Message:error.localizedDescription];
}

#pragma mark -
#pragma mark Actions


- (IBAction)aboutAction:(UIButton *)sender {
    
}

- (IBAction)followUnfollowAction:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"  FOLLOW  "])
    {
        [sender setTitle:@" UNFOLLOW " forState:UIControlStateNormal];
        
        [ self.networkManager followWithUserId:self.user.id successBlock:^{
            
            
        } failureBlock:^(NSError *error) {
            
        }];
        
    } else {
        
        [sender setTitle:@"  FOLLOW  " forState:UIControlStateNormal];
        [self.networkManager unfollowWithUserId:self.user.id successBlock:^{
            
            
        } failureBlock:^(NSError *error) {
            
            
        }];
        
    }
    [self setFollowersArrayWithUserId:self.user.id];
    
}

- (IBAction)segmentButtonAction:(HWButtonForSegment *)sender {
    
    
    for (HWButtonForSegment *button in self.buttonSegmentCollection)
    {
        button.selectedImage.hidden = YES;
    }
    
    self.lastPressSegmentButton = sender;
    sender.selectedImage.hidden = NO;
    
    
    switch (sender.tag) {
        case 1:
            self.selectedArrayWithData = HWArrayWithItems;
            
            break;
        case 2:
            
            self.selectedArrayWithData = HWArrayWithFollowing;
            
            break;
        case 3:
            
            self.selectedArrayWithData = HWArrayWithFollowers;
            
            break;
        case 4:
            
            self.selectedArrayWithData  = HWArrayWithWishlist;
            
            break;
        default:
            break;
    }
    
    
    [self setItemsArrayWithUserId:self.userId];
    [self setFollowersArrayWithUserId:self.userId];
    [self setFollowingArrayWithUserId:self.userId];
    [self setWishlistArrayWithUsetId:self.userId];
    
}


#pragma mark -
#pragma mark reloadData

- (void) reloadDataIfSuccessBlockForTable:(BOOL)isTableView withDataArray:(NSArray *)array
{
    self.selectedSegmentArray = array;
    [self setupSegmentButtonsConfig];
    [self reloadTableAndCollectionViewWithData:self.selectedSegmentArray forTableView:isTableView];
    
}

- (void) reloadTableAndCollectionViewWithData:(NSArray*)dataArray forTableView:(BOOL)forTableView
{
    
    CGFloat yOriginForTableAndCollection = self.segmentView.frame.origin.y + self.segmentView.frame.size.height;
    
    self.selectedSegmentArray = dataArray;
    CGFloat heightForCollectionOrTable = 0;
    
    if(!forTableView)
    {
        self.tableView.hidden = YES;
        self.collectionView.hidden = NO;
        [self.collectionView reloadData];
        [self.collectionView layoutIfNeeded];
        heightForCollectionOrTable = self.collectionView.contentSize.height;
        
        CGRect frameCollection = self.collectionView.bounds;
        
        frameCollection.origin.y = yOriginForTableAndCollection;
        frameCollection.size.height = self.collectionView.contentSize.height;
        self.collectionView.frame = frameCollection;
        
    }
    else
    {
        self.collectionView.hidden = YES;
        self.tableView.hidden = NO;
        [self.tableView reloadData];
        [self.tableView layoutIfNeeded];
        heightForCollectionOrTable = self.tableView.contentSize.height;
        
        CGRect frameTable = self.tableView.bounds;
        frameTable.size.height = self.tableView.contentSize.height;
        frameTable.origin.y = yOriginForTableAndCollection;
        self.tableView.frame = frameTable;
        
    }
    
    [self setupHeightScrollView:heightForCollectionOrTable];
    
}


- (void) setupHeightScrollView:(CGFloat) height
{
    CGFloat heightForScrollView = self.segmentView.frame.origin.y + self.segmentView.frame.size.height + height;
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, heightForScrollView)];
    
}


#pragma mark -
#pragma mark NavigationDelegate


-(void) leftButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) rightButtonClick
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                              delegate:nil
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:@"Report",@"Block", nil];
    
    
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.selectedSegmentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HWFollowInProfileCell* cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
      cell.delegate = self;
    [cell setCellWithFollowUser:[self.selectedSegmentArray objectAtIndex:indexPath.row]];
  
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


#pragma mark -
#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.selectedSegmentArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyItemCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    
    cell.item = [self.selectedSegmentArray objectAtIndex:indexPath.row];
    cell.mytrash.hidden = YES;
    return cell;
}


#pragma mark -
#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HWItem *item = [self.selectedSegmentArray objectAtIndex:indexPath.row];
    ViewItemViewController* vc = [[ViewItemViewController alloc] initWithItem:item];
    [self.navigationController pushViewController: vc animated: YES];
    
    self.selectedSegmentArray = nil;
}



- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(11, 12, 15, 12); // top, left, bottom, right
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Make cell same width as application frame and 250 pixels tall.
    CGFloat width = self.view.width;
    CGFloat widthForView = (width - 36) / 2;
 
    return CGSizeMake(widthForView, ((widthForView * 488) / 291)-38);
}

#pragma mark -
#pragma mark UIAlertViewDelegate



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - 
#pragma mark HWFollowInProfileCellDelegate

- (void) transitionToUserProfileWithUserId:(NSString*)userId
{
    HWProfileViewController *profileVC = [[HWProfileViewController alloc]initWithUserID:userId];
    [self.navigationController pushViewController:profileVC animated:YES];
    
}


- (void) followUnfollowButton:(UIButton*)button follow:(BOOL)isFollow forUserId:(NSString*)userId
{
    if(!isFollow){
        
        [ [NetworkManager shared] unfollowWithUserId:userId successBlock:^{
            
                        [button setTitle:@"  FOLLOW  "  forState:UIControlStateNormal];
            
                                      } failureBlock:^(NSError *error) {
                        
                    }];
    } else {
        
        [ [NetworkManager shared] followWithUserId:userId successBlock:^{
            
                        [button setTitle:@" UNFOLLOW "  forState:UIControlStateNormal];
            
                                    } failureBlock:^(NSError *error) {
                        
                    }];
    }
}

- (BOOL) hideFollowUnfollowButtonForUserId:(NSString*)userId
{
    
    NSString *currentUserId = [[NSUserDefaults standardUserDefaults] objectForKey:kUSER_ID];
    return  ([currentUserId isEqualToString:userId]);
}


#pragma mark -
#pragma mark StarRatingDelegate

- (BOOL) enabledTouch
{
    return NO;
}



@end
