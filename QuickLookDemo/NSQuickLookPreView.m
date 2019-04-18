//
//  NSQuickLookPreView.m
//  QuickLookDemo
//
//  Created by bst on 2018/9/17.
//  Copyright © 2018年 QuickLook.yzhizhen. All rights reserved.
//

#import "NSQuickLookPreView.h"

@implementation NSQuickLookPreView

- (void)PreViewFile:(NSURL*)url
{
    [QLPreviewPanel sharedPreviewPanel].delegate = self;
    [QLPreviewPanel sharedPreviewPanel].dataSource = self;
    
    if ([QLPreviewPanel sharedPreviewPanelExists] && [[QLPreviewPanel sharedPreviewPanel] isVisible])
    {
        [[QLPreviewPanel sharedPreviewPanel] orderOut:nil];
    }
    else
    {
        [[QLPreviewPanel sharedPreviewPanel] makeKeyAndOrderFront:nil];
    }
    
    [[QLPreviewPanel sharedPreviewPanel] setFloatingPanel:NO];
    item = [[PreviewItem alloc] init];
    item.previewItemURL = url;
}

#pragma mark - Quick Look panel support


- (BOOL)acceptsPreviewPanelControl:(QLPreviewPanel *)panel
{
    return YES;
}

- (void)beginPreviewPanelControl:(QLPreviewPanel *)panel
{
    panel.delegate = self;
    panel.dataSource = self;
}

- (void)endPreviewPanelControl:(QLPreviewPanel *)panel
{

}


#pragma mark - QLPreviewPanelDataSource
- (NSInteger)numberOfPreviewItemsInPreviewPanel:(QLPreviewPanel *)panel
{
    return 1;
}

- (id <QLPreviewItem>)previewPanel:(QLPreviewPanel *)panel previewItemAtIndex: (NSInteger)index
{
    return item.previewItemURL;
}
@end
