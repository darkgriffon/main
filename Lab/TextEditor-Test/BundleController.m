//
//  BundleController.m
//  NSScanner-Test
//
//  Created by Eric Sunny on 02/10/2015.
//  Copyright © 2015 Eric Sunny. All rights reserved.
//

#import "BundleController.h"

@implementation BundleController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSBundle* mainBundle;
        // Get the main bundle for the app.
        mainBundle = [NSBundle mainBundle];
        
        //
        CFDictionaryRef bundleInfoDict;
        CFStringRef     myPropertyString;
        
        // Get an instance of the non-localized keys.
        bundleInfoDict = CFBundleGetInfoDictionary( CFBundleGetMainBundle() );
        
        // If we succeeded, look for our property.
        if ( bundleInfoDict != NULL ) {
            myPropertyString = CFDictionaryGetValue( bundleInfoDict,
                                                    CFSTR("CFBundleTypeExtensions") );
            NSLog(@"%@", myPropertyString);
            
        }

    }
    return self;
}
@end
