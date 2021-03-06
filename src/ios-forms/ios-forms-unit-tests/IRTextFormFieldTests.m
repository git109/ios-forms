/*
 * IRTextFormFieldTests.m
 *
 * This file implements the IRTextFormFieldTests class that unit tests the
 * IRTextFormField class.
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

#import "IRTextFormField.h"
#import "IRTextFormFieldCell.h"

@interface IRTextFormFieldTests : GHTestCase
@end

@implementation IRTextFormFieldTests

- (void)testFormFieldSetsInitializesCell {
    NSMutableDictionary *model = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Michael", @"firstName", nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"firstName",
                                @"KeyPath",
                                @"TestField",
                                @"CellReuseIdentifier",
                                @"First Name",
                                @"LabelText",
                                @"First name",
                                @"Placeholder",
                                nil];
    IRTextFormField *formField = [[IRTextFormField alloc] initWithDictionary:dictionary model:model];
    
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    [[[mockTableView expect] andReturn:nil] dequeueReusableCellWithIdentifier:@"TestField"];
    
    UITableViewCell *cell = [formField cellForTableView:mockTableView];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:kIRFormFieldCellLabelTag];
    GHAssertNotNil(label, @"The label is nil.");
    GHAssertEqualStrings(@"First Name", label.text, @"The label is incorrect.");
    
    UITextField *textField = (UITextField *)[cell.contentView viewWithTag:kIRFormFieldCellTextTag];
    GHAssertNotNil(textField, @"The text field is nil.");
    GHAssertEqualStrings(@"First name", textField.placeholder, @"The placeholder is incorrect.");
    GHAssertEqualStrings(@"Michael", textField.text, @"The field text is incorrect.");
    
    [mockTableView verify];
}

- (void)testModelIsUpdatedWhenEditingEnds {
    NSMutableDictionary *model = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Michael", @"firstName", nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"firstName",
                                @"KeyPath",
                                @"TestField",
                                @"CellReuseIdentifier",
                                @"First Name",
                                @"Label Text",
                                @"First name",
                                @"Placeholder",
                                nil];
    IRTextFormField *formField = [[IRTextFormField alloc] initWithDictionary:dictionary model:model];
    
    id mockTextField = [OCMockObject mockForClass:[UITextField class]];
    [[[mockTextField expect] andReturn:@"John"] text];
    
    [formField textFieldDidEndEditing:mockTextField];
    
    GHAssertEqualStrings(@"John", [model objectForKey:@"firstName"], @"The first name is not correct.");
                                   
    [mockTextField verify];
}

@end
