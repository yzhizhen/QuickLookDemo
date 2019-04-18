//
//  VirtualDisk.m
//  QuickLookDemo
//
//  Created by bst on 2018/7/3.
//  Copyright © 2018年 QuickLook.yzhizhen. All rights reserved.
//

#import "VirtualDisk.h"

@implementation VirtualDisk
- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)CreateVirtualDisk:(NSString*)Path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *filePath=[paths    objectAtIndex:0];
    filePath = [NSString stringWithFormat:@"%@/Bitwar", filePath];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL bFile = NO;
    if (![fm fileExistsAtPath:filePath])
    {
        bFile = [fm createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    else
    {
        bFile = YES;
    }
    
    if (bFile)
    {
        NSLog(@"%@, 创建成功！",filePath);
    }
    else
    {
        NSLog(@"%@, 创建失败！",filePath);
    }
    
    NSString* strCommand = [NSString stringWithFormat:@"chflags hidden %@", filePath];
    NSString* la = [self Shell:strCommand];
    if ([la isEqualToString:@""] )
    {
        NSLog(@"隐藏成功！");
    }
    else
    {
        NSLog(@"隐藏失败！");
    }
    
    NSString * name = @"tset";
    u_int64_t size = 4194304;
    NSString * command;
    //NSString* command = [NSString stringWithFormat:@"diskutil erasevolume HFS+ \"%@\" `hdiutil attach -nomount ram://%llu`", @"tset", 4194304];
    
    NSString *pattern = @"d=$(hdiutil attach -nomount ram://%llu) && diskutil eraseDisk HFS+ %%noformat%% $d && "
    @"newfs_hfs -v \"%@\" \"$(echo $d | tr -d ' ')s1\" && hdiutil attach -nomount $d && "
    @"hdiutil attach -nobrowse \"$(echo $d | tr -d ' ')s1\"";
    
    command = [NSString stringWithFormat:pattern, size, name];
    [self Shell:command];
    
}

- (NSString*)Shell:(NSString*) command
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
    NSArray *arguments = [NSArray arrayWithObjects:@"-c",command,nil];
    NSLog(@"arguments : %@",arguments);
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data
                                   encoding: NSUTF8StringEncoding];
    NSLog(@"go :%@",string);
    return string;
}

@end
