//
//  NSPerView.h
//  QuickLookDemo
//
//  Created by bst on 2018/6/28.
//  Copyright © 2018年 QuickLook.yzhizhen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuickLook/QuickLook.h>
@import Quartz;

@interface PreviewItem : NSObject<QLPreviewItem>
@property(nullable, nonatomic) NSURL * previewItemURL;
@property(nullable, nonatomic) NSString * previewItemTitle;
@end

