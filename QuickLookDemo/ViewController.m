//
//  ViewController.m
//  QuickLookDemo
//
//  Created by bst on 2018/6/28.
//  Copyright © 2018年 QuickLook.yzhizhen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)OpenBtEvent:(id)sender
{
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:YES];
    [openDlg setCanChooseDirectories:NO];
    [openDlg setPrompt:@"Open"];
    [openDlg setAllowedFileTypes:@[@"Heic", @"mp4"]];
    [openDlg beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result)
     {
         if (result == NSFileHandlingPanelOKButton)
         {
             self.QuickLookPreView = nil;
             self.QuickLookPreView = [[NSQuickLookPreView alloc] init];
             [self.QuickLookPreView PreViewFile:[openDlg URL]];
         }
     }];
}

@end
