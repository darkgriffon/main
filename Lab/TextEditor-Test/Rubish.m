//
//  Rubish.m
//  NSScanner-Test
//
//  Created by Eric Sunny on 02/10/2015.
//  Copyright © 2015 Eric Sunny. All rights reserved.
//

#import "Rubish.h"

@implementation Rubish

/*
 //init
 NSUInteger startLocation = 0;
 
 //color library
 NSDictionary *attr = [NSDictionary dictionaryWithObject:[NSColor orangeColor] forKey:NSForegroundColorAttributeName];
 NSDictionary *attrComment = [NSDictionary dictionaryWithObject:[NSColor grayColor] forKey:NSForegroundColorAttributeName];
 NSDictionary *attrAttr = [NSDictionary dictionaryWithObject:[NSColor purpleColor] forKey:NSForegroundColorAttributeName];
 
 //string
 NSUInteger strLength = [[_someText string] length];
 NSScanner *aScanner = [NSScanner scannerWithString:[_someText string]];
 
 
 //engine for everything
 for (NSUInteger location = 0; location < strLength +1; location++) {
 
 if ([aScanner scanString:@"<" intoString:NULL]) {
 
 startLocation = location;
 
 
 
 }
 //
 else if ([aScanner scanString:@">" intoString:NULL]) {
 
 
 [[_someText layoutManager] addTemporaryAttributes:attr forCharacterRange:NSMakeRange(startLocation -1, location - startLocation +1)];
 
 //maybe if should be added to check wether more than one object seperated by space
 //is there to call attribute function to color that range of substring
 
 }
 
 
 [aScanner setScanLocation:location];
 }
 
 //dublicate just to check for attributes for example
 for (NSUInteger location = 0; location < strLength +1; location++) {
 
 if ([aScanner scanString:@"=\"" intoString:NULL]) {
 
 startLocation = location;
 
 
 
 }
 //
 else if ([aScanner scanString:@"\"" intoString:NULL]) {
 
 
 [[_someText layoutManager] addTemporaryAttributes:attrAttr forCharacterRange:NSMakeRange(startLocation -1, location - startLocation +1)];
 
 }
 
 
 [aScanner setScanLocation:location];
 }
 
 //dublicate just to check for comments for example
 for (NSUInteger location = 0; location < strLength +1; location++) {
 
 if ([aScanner scanString:@"<!--" intoString:NULL]) {
 
 startLocation = location;
 
 
 
 }
 //
 else if ([aScanner scanString:@"-->" intoString:NULL]) {
 
 
 [[_someText layoutManager] addTemporaryAttributes:attrComment forCharacterRange:NSMakeRange(startLocation -1, location - startLocation +3)];
 
 }
 
 
 [aScanner setScanLocation:location];
 }
 //dublicate just to check for comments for example
 for (NSUInteger location = 0; location < strLength +1; location++) {
 
 if ([aScanner scanString:@"<!DOCTYPE" intoString:NULL]) {
 
 startLocation = location;
 
 
 
 }
 //
 else if ([aScanner scanString:@"html>" intoString:NULL]) {
 
 
 [[_someText layoutManager] addTemporaryAttributes:attrComment forCharacterRange:NSMakeRange(startLocation -1, location - startLocation +5)];
 
 }
 
 
 [aScanner setScanLocation:location];
 }
 
*/
@end
