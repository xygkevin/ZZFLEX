//
//  ZZScrollViewChainModel.h
//  zhuanzhuan
//
//  Created by 李伯坤 on 2017/10/24.
//  Copyright © 2017年 转转. All rights reserved.
//

#import "ZZViewChainModel.h"

@class ZZScrollViewChainModel;
@interface ZZScrollViewChainModel : ZZViewChainModel<ZZScrollViewChainModel *>

ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ delegate)(id<UIScrollViewDelegate> delegate);

ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ contentSize)(CGSize contentSize);
ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ contentOffset)(CGPoint contentOffset);
ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ contentInset)(UIEdgeInsets contentInset);

ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ bounces)(BOOL bounces);
ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ alwaysBounceVertical)(BOOL alwaysBounceVertical);
ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ alwaysBounceHorizontal)(BOOL alwaysBounceHorizontal);

ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ pagingEnabled)(BOOL pagingEnabled);
ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ scrollEnabled)(BOOL scrollEnabled);

ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ showsHorizontalScrollIndicator)(BOOL showsHorizontalScrollIndicator);
ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ showsVerticalScrollIndicator)(BOOL showsVerticalScrollIndicator);

ZZFLEX_CHAIN_PROPERTY ZZScrollViewChainModel *(^ scrollsToTop)(BOOL scrollsToTop);

@end

ZZFLEX_EX_INTERFACE(UIScrollView, ZZScrollViewChainModel)
