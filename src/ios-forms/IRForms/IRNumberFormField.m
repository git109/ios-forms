/*
 * IRNumberFormField.m
 *
 * This file implements the IRNumberFormField class.
 *
 * Copyright 2012 ImaginaryRealities, LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMANGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#import "IRNumberFormField.h"

@implementation IRNumberFormField

- (id)initWithDictionary:(NSDictionary *)dictionary model:(id)aModel {
    self = [super initWithDictionary:dictionary model:aModel];
    if (self) {
        NSString *value = [dictionary objectForKey:@"Style"];
        if (value) {
            style = NSNumberFormatterNoStyle;
            value = [value lowercaseString];
            if ([value isEqualToString:@"decimal"]) {
                style = NSNumberFormatterDecimalStyle;
            } else if ([value isEqualToString:@"currency"]) {
                style = NSNumberFormatterCurrencyStyle;
            } else if ([value isEqualToString:@"percent"]) {
                style = NSNumberFormatterPercentStyle;
            } else if ([value isEqualToString:@"scientific"]) {
                style = NSNumberFormatterScientificStyle;
            } else if ([value isEqualToString:@"spellout"]) {
                style = NSNumberFormatterSpellOutStyle;
            }
        }
    }
    
    return self;
}

- (NSString *)displayValue {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:style];
    return [formatter stringFromNumber:[self value]];
}

- (NSString *)editValue {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    return [formatter stringFromNumber:[self value]];
}

- (id)valueForText:(NSString *)text {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    return [formatter numberFromString:text];
}

@end
