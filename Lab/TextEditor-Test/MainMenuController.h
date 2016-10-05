//
//  MainMenuController.h
//  NSScanner-Test
//
//  Created by Eric Sunny on 10/19/15.
//  Copyright © 2015 Eric Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface MainMenuController : NSObject <NSApplicationDelegate>


@property (assign, nonatomic) IBOutlet NSMenu *encodingMenu;

-(void)setMenuUTF8;

@end
