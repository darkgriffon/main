//
//  Document.h
//  NSScanner-Test
//
//  Created by Eric Sunny on 30/09/2015.
//  Copyright © 2015 Eric Sunny. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument <NSApplicationDelegate, NSTextDelegate>{
    
    NSInteger encNum;
}

@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (assign, nonatomic) NSAttributedString *mString;

@property (strong, nonatomic) NSString *fileContentsGet;
@property (strong, nonatomic) NSString *fileContentsType;
@property (strong, nonatomic) NSString *fileEncoding;

- (IBAction)someAction:(id)sender;
-(IBAction)setTextDocument:(id)sender;
-(IBAction)setHTML:(id)sender;
-(IBAction)setCSS:(id)sender;


@end

