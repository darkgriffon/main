//
//  MainMenuController.m
//  NSScanner-Test
//
//  Created by Eric Sunny on 10/19/15.
//  Copyright © 2015 Eric Sunny. All rights reserved.
//

#import "MainMenuController.h"
#import "Document.h"

@implementation MainMenuController

@synthesize encodingMenu;

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)awakeFromNib
{
    
    //
    for (NSMenuItem *menuItem in encodingMenu.itemArray){
        [menuItem setState:NSOnState];
    }
    
}

-(void)setMenuUTF8{
    //NSMenu *theMenu = [[NSMenu alloc] initWithTitle:@"Encoding Menu"];
    for (NSMenuItem *menuItem in encodingMenu.itemArray){
        [menuItem setState:NSOnState];
    }
    
    //[theMenu.itemArray[1] setState: NSOnState];
    NSLog(@"Set utf-8");
}


















@end
