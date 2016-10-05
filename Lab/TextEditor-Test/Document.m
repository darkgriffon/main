//
//  Document.m
//  NSScanner-Test
//
//  Created by Eric Sunny on 30/09/2015.
//  Copyright © 2015 Eric Sunny. All rights reserved.
//

#import "Document.h"
#import "ScannerController.h"
#import "MainMenuController.h"

#define ANSI 301
#define UTF8 302


@implementation Document

@synthesize textView = _textView;


@synthesize fileContentsGet = _fileContentsGet;
@synthesize fileContentsType = _fileContentsType;

//@synthesize mString = _mString;


- (IBAction)someAction:(id)sender{
    //
    encNum = [sender tag];
}

-(IBAction)setTextDocument:(id)sender{
    [[_textView layoutManager] removeTemporaryAttribute:NSForegroundColorAttributeName forCharacterRange:NSMakeRange(0, [[_textView string]length])];

}
-(IBAction)setHTML:(id)sender{
    ScannerController *scn = [[ScannerController alloc] init];
    [scn scanHTML:_textView];
    
}
-(IBAction)setCSS:(id)sender{
    ScannerController *scn = [[ScannerController alloc] init];
    [scn scanCSS:_textView];
    
}
//then menu shouldn't be hardcoded to as there will be a lot of langs
//on other hand let me see if sublime text has that..

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        encNum = ANSI;
    }
    return self;
}



- (void)awakeFromNib
{
    
    [_textView setFont:[NSFont fontWithName:@"Menlo" size:12]];
    
}



- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
    /* determine the size for the NSTextView */
    
    //wrong
    if (_fileContentsGet){
        //
        [_textView setString:_fileContentsGet];
        
        //not the best aproach
        //much better would be not connected filetype
        if ([_fileContentsType isEqualToString:@"HTML"]) {
            
            //Not working
            //I know why, order
            [self setHTML:nil];
            
        }
        if ([_fileContentsType isEqualToString:@"CSS"]) {
            
            //
            [self setCSS:nil];
            
        }
        
        //encoding
        
        
        
        
    }
    
    
    
//Preference Panel Settings
    
    //[_textView setBackgroundColor:[NSColor blackColor]];
    //[_textView setTextColor:[NSColor blueColor] range:NSMakeRange(0, 10)];
    //[_textView setFont:[NSFont fontWithName:@"Menlo" size:14]];
    
}

//
//+ (BOOL)autosavesInPlace {
//    return YES;
//}

/*
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
//    return nil;
    NSData *data;
    [self setMString:[self.textView textStorage]]; // Synchronize data model with the text storage
    NSDictionary *dict = [NSDictionary
                                 dictionaryWithObject:typeName
                                 forKey:NSDocumentTypeDocumentAttribute];
    [self.textView breakUndoCoalescing];
    data = [self.mString dataFromRange:NSMakeRange(0, [self.mString length])
                    documentAttributes:dict error:outError];
    if (!data && outError) {
        *outError = [NSError errorWithDomain:NSCocoaErrorDomain
                                        code:NSFileWriteUnknownError userInfo:nil];
    }
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
//    return YES;
    BOOL readSuccess = NO;
    NSAttributedString *fileContents = [[NSAttributedString alloc] initWithData:data options:nil documentAttributes:NULL error:outError];
    
    if (!fileContents && outError) {
        *outError = [NSError errorWithDomain:NSCocoaErrorDomain
                                        code:NSFileReadUnknownError userInfo:nil];
    }
    if (fileContents) {
        readSuccess = YES;
        
        _fileContentsGet = fileContents;
    }
    return readSuccess;

}
 
 */
- (BOOL)writeToURL:(NSURL *)inAbsoluteURL ofType:(NSString *)inTypeName error:(NSError **)outError {
    
    
    BOOL writeSuccess = NO;
    
    //is true as causing shit like 0x1.8p-1070ndo ther ÅﬁÄwˇˇ 5fbfd920
    //Fixed
    NSString *newFile = [NSString stringWithFormat:@"%@", _textView.string];
    
    writeSuccess = [newFile writeToURL:inAbsoluteURL atomically:YES encoding:NSStringEncodingConversionAllowLossy error:outError];
    
    return writeSuccess;
}

- (BOOL)readFromURL:(NSURL *)inAbsoluteURL ofType:(NSString *)inTypeName error:(NSError **)outError {
    
    
    BOOL readSuccess = NO;
    
    //NSString *fileContents = [NSString stringWithContentsOfFile:inAbsoluteURL.path encoding:NSUTF8StringEncoding error:outError];
    
    NSStringEncoding enc;
    
    NSString *fileContentsE = [NSString stringWithContentsOfFile:inAbsoluteURL.path
                                                    usedEncoding:&enc
                                                           error:outError];
    
    if (fileContentsE)
    {
        readSuccess = YES;
        
        _fileContentsGet = fileContentsE;
        
        _fileContentsType = inTypeName;
        
//        CFStringEncoding cfEnc = CFStringConvertNSStringEncodingToEncoding(enc);
//        NSString *name = (NSString *)CFStringGetNameOfEncoding(cfEnc);
//
        encNum = UTF8;
        
}
    return readSuccess;
}


//- (BOOL)validateUserInterfaceItem:(id<NSValidatedUserInterfaceItem>)anItem{
//
////    NSMenuItem *menuItem = (NSMenuItem*) anItem;
////    NSString *menuString = menuItem.title;
////    
////    if ([menuString isEqualToString:_fileEncoding])
////    {
////        [menuItem setState:NSOnState];
////    }
//    return YES;
//}

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem{
    NSInteger tag = [menuItem tag];
    
    if (tag == ANSI || tag == UTF8) {
        [menuItem setState:((tag == encNum) ? NSOnState : NSOffState)];
    }
    
    return YES;
}

@end
