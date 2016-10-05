//
//  ScannerController.m
//  NSScanner-Test
//
//  Created by Eric Sunny on 30/09/2015.
//  Copyright © 2015 Eric Sunny. All rights reserved.
//

#import "ScannerController.h"

@implementation ScannerController

- (void)scanCSS:(NSTextView *)txtView{
    
    NSDictionary *attr1 = [NSDictionary
                           dictionaryWithObject:[NSColor colorWithRed:0.1 green:0.2 blue:1 alpha:0.9]
                           forKey:NSForegroundColorAttributeName];
    
    //argument library
    //string
    
    //So the logic over first one is to scan these 2
    //closures with argument then search backwardsupto
    //whitespace which seperates word possibly all #ids .classes and body
    //I don't need to color whats inside
    //so technically I could have searched withing rangeOfString to
    //color { and } as well as backwards searching for string
    [self centralScanner:txtView closureStart:@"{" closureEnd:@"}" closureColor:attr1];
    
    //this one still uses same principal of
    //backwards searching up to whitespace
    //so that it can highlight word up to :
    //the end part is a bit tricky
    //as I can search using charactersFromString which include ; and newline
    //so that they all can be matched and colored differently
    //possibly I could search for 0123456789 so I can highlight them differently from
    //string, technically it's just another if and color
    [self centralScanner:txtView closureStart:@":" closureEnd:@";|\n" closureColor:attr1];
}

- (void)scanHTML:(NSTextView *)txtView{
    //color library - has to have a dispatch engine to parse colors from file using RGBA params
    
    NSDictionary *attr1 = [NSDictionary
                           dictionaryWithObject:[NSColor colorWithRed:0.1 green:0.2 blue:1 alpha:0.9]
                           forKey:NSForegroundColorAttributeName];
    NSDictionary *attr2 = [NSDictionary
                           dictionaryWithObject:[NSColor colorWithRed:0.1 green:0.2 blue:0 alpha:0.7]
                           forKey:NSForegroundColorAttributeName];
    NSDictionary *attr3 = [NSDictionary
                           dictionaryWithObject:[NSColor colorWithRed:0.7 green:0.2 blue:0.5 alpha:0.9]
                           forKey:NSForegroundColorAttributeName];
    
    //argument library
    //string
    
    [self centralScanner:txtView closureStart:@"<" closureEnd:@">" closureColor:attr1];
    [self centralScanner:txtView closureStart:@"<!--" closureEnd:@"-->" closureColor:attr2];
    
    //I should theoretically use the same logic of backwards searching
    //I want to implement with CSS over here too so I can color word before ="
    //just before space 
    [self centralScanner:txtView closureStart:@"=\"" closureEnd:@"\"" closureColor:attr3];
    
    
}

//theoretically there is no need in creating these classes
//as all params like closures and colors can be taken from info file e.g. CSS.plist
//according to document type it matched?
//and centralScanner used as many times as there are KEYS with PARAMS
//So then central dispatcher becomes file the doctype matches if found

//unless I want to hardcode this, or half hardcode since some Settings will be there
//but these are considered, ah almost forgot, This is JUST ONE central Coloring dispatcher
//If I would want to able to change it I will have to add more, it can't be hardcoded
//No, no way it can be hardcoded


- (void)centralScanner:(NSTextView *)txtView
          closureStart:(NSString *)closureStart
            closureEnd:(NSString *)closureEnd
          closureColor:(NSDictionary *)attr{
    
    NSUInteger startLocation = 0;
    NSUInteger strLength = [[txtView string] length];
    NSScanner *aScanner = [NSScanner scannerWithString:[txtView string]];
    NSString *tempString;
    
    
    
    while (![aScanner isAtEnd]) {
        
        //lookup for opening closure
        if ([aScanner scanString:closureStart intoString:NULL]) {
            
            //if opening closure exists
            //then remember it's location
            startLocation = [aScanner scanLocation];
            
            
            //search for ending closure
            if ([aScanner scanUpToString:closureEnd intoString:&tempString])
            {
                //If found ending closure then color found range
                [[txtView layoutManager] addTemporaryAttributes:attr
                                              forCharacterRange:NSMakeRange(startLocation - [closureStart length], [tempString length] + [closureEnd length] + [closureStart length])];
                
                //this is to make sure that ending closure
                //wasn't last the character in whole string
                if ([aScanner scanLocation] < strLength) {
                    [aScanner setScanLocation:[aScanner scanLocation]+1];
                }
                
                
            }
            else
            {
                //for some logical strange reason this doesn't work
                //at all oh well
                NSLog(@"Tag Is Not Closed at location: %lu", [aScanner scanLocation]);
                //incase tag isn't closed stop at end of document
                [aScanner setScanLocation:strLength];
            }

            
        }
        else{
            [aScanner setScanLocation:[aScanner scanLocation]+1];
        }
        
        

    }
    
}













@end
