//
//  ZZImageViewChainModel.h
//  zhuanzhuan
//
//  Created by 李伯坤 on 2017/10/24.
//  Copyright © 2017年 转转. All rights reserved.
//

#import "ZZViewChainModel.h"

@class ZZImageViewChainModel;
@interface ZZImageViewChainModel : ZZViewChainModel <ZZImageViewChainModel *>

ZZFLEX_CHAIN_PROPERTY ZZImageViewChainModel *(^ image)(UIImage *image);
ZZFLEX_CHAIN_PROPERTY ZZImageViewChainModel *(^ highlightedImage)(UIImage *highlightedImage);
ZZFLEX_CHAIN_PROPERTY ZZImageViewChainModel *(^ highlighted)(BOOL highlighted);

@end

ZZFLEX_EX_INTERFACE(UIImageView, ZZImageViewChainModel)
