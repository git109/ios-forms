/*
 * IRTextFormFieldCell.m
 *
 * This file implements the IRTextFormFieldCell class.
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

#import "IRTextFormFieldCell.h"

@implementation IRTextFormFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat x;
        CGFloat width;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            x = 228.0f;
            width = 67.0f;
        } else {
            x = 138.0f;
            width = 157.0f;
        }
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(x, 6.0f, width, 31.0f)];
        textField.tag = kIRFormFieldCellTextTag;
        textField.backgroundColor = [UIColor clearColor];
        textField.borderStyle = UITextBorderStyleNone;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.contentView addSubview:textField];
    }

    return self;
}

- (void)activateCell {
    UITextField *textField = (UITextField *)[self.contentView viewWithTag:kIRFormFieldCellTextTag];
    [textField becomeFirstResponder];
}

@end
