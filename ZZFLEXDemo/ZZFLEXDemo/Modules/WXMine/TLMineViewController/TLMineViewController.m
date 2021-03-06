//
//  TLMineViewController.m
//  TLChat
//
//  Created by 李伯坤 on 2017/7/6.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "TLMineViewController.h"
#import "TLMenuItemCell.h"
#import "TLMenuItem.h"
#import "TLUser.h"
#import "TLMineHeaderCell.h"
#import "WXUserViewController.h"

#define     ClassMineMenuCell       [TLMenuItemCell class]

typedef NS_ENUM(NSInteger, TLMineSectionTag) {
    TLMineSectionTagUserInfo,
    TLMineSectionTagWallet,
    TLMineSectionTagFounction,
    TLMineSectionTagSetting,
};

@interface TLMineViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *topView;

@end

@implementation TLMineViewController

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor colorGrayBG]];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(-1, 0, 0, 0));
    }];
    
    self.topView = self.collectionView.addView(0)
    .backgroundColor([UIColor whiteColor])
    .frame(CGRectMake(0, 0, self.view.frame.size.width, 0))
    .view;

    [self loadMenus];
}

#pragma mark - # Private Methods
- (void)loadMenus
{
    @weakify(self);
    [self clear];
    
    void (^selectAction)(TLMenuItem *) = ^(TLMenuItem *item) {
        UIViewController *vc = [[UIViewController alloc] init];
        [vc setTitle:item.title];
        [vc.view setBackgroundColor:[UIColor whiteColor]];
        PushVC(vc);
        
        if (item.badge || item.subTitle) {
            item.badge = nil;
            item.subTitle = nil;
            [self reloadView];
        }
    };
    
    // 用户信息
    TLUser *user = [self defaultUser];
    self.addSection(TLMineSectionTagUserInfo);
    self.addCell([TLMineHeaderCell class]).toSection(TLMineSectionTagUserInfo).withDataModel(user).selectedAction(^ (id model) {
        @strongify(self);
        WXUserViewController *vc = [[WXUserViewController alloc] initWithUserModel:user];
        PushVC(vc);
    });
    
    // 钱包
    self.addSection(TLMineSectionTagWallet).sectionInsets(UIEdgeInsetsMake(10, 0, 0, 0));
    TLMenuItem *wallet = createMenuItem(@"mine_wallet", LOCSTR(@"钱包"));
    [wallet setBadge:@""];
    [wallet setSubTitle:@"新到账1024元"];
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagWallet).withDataModel(wallet).selectedAction(selectAction);
    
    // 功能
    self.addSection(TLMineSectionTagFounction).sectionInsets(UIEdgeInsetsMake(10, 0, 0, 0));
    
    TLMenuItem *collect = createMenuItem(@"mine_favorites", LOCSTR(@"收藏"));
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagFounction).withDataModel(collect).selectedAction(selectAction);
    TLMenuItem *album = createMenuItem(@"mine_album", LOCSTR(@"相册"));
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagFounction).withDataModel(album).selectedAction(selectAction);
    TLMenuItem *card = createMenuItem(@"mine_card", LOCSTR(@"卡包"));
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagFounction).withDataModel(card).selectedAction(selectAction);
    TLMenuItem *expression = createMenuItem(@"mine_expression", LOCSTR(@"表情"));
    [expression setBadge:@"NEW"];
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagFounction).withDataModel(expression).selectedAction(selectAction);
    
    // 设置
    self.addSection(TLMineSectionTagSetting).sectionInsets(UIEdgeInsetsMake(10, 0, 30, 0));
    TLMenuItem *setting = createMenuItem(@"mine_setting", LOCSTR(@"设置"));
    self.addCell(ClassMineMenuCell).toSection(TLMineSectionTagSetting).withDataModel(setting).selectedAction(selectAction);
    
    [self reloadView];
}

#pragma mark - # Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        self.topView.y = scrollView.contentOffset.y;
        self.topView.height = -scrollView.contentOffset.y + 1;
    }
}

#pragma mark - # Private
- (TLUser *)defaultUser
{
    TLUser *user = [[TLUser alloc] init];
    user.avatar = @"avatar";
    user.username = @"李伯坤";
    user.userID = @"li-bokun";
    return user;
}

@end
