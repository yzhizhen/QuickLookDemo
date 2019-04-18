//
//  NSQuickLookPreView.h
//  QuickLookDemo
//
//  Created by bst on 2018/9/17.
//  Copyright © 2018年 QuickLook.yzhizhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
#import "NSPerView.h"
@import Quartz;

@interface NSQuickLookPreView : NSObject<QLPreviewPanelDataSource, QLPreviewPanelDelegate>
{
    PreviewItem* item;
}
- (void)PreViewFile:(NSURL*)url;
@end
