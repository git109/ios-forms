/*
 * IRTextFormField.h
 *
 * This file defines the IRTextFormField class. The IRTextFormField class
 * implements a form field that allows the user to edit a text value.
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

#import "IRLabelFormField.h"

/**
 * Form field that displays a form value in a text box and allows the user to
 * edit the field value.
 */
@interface IRTextFormField : IRLabelFormField <UITextFieldDelegate> {
    @private
    NSString *placeholder;
    UITextAutocapitalizationType autocapitalizationType;
    UITextAutocorrectionType autocorrectionType;
    UIKeyboardAppearance keyboardAppearance;
    UIKeyboardType keyboardType;
    BOOL enablesReturnKeyAutomatically;
    UIReturnKeyType returnKeyType;
    BOOL secureTextEntry;
    UITextSpellCheckingType spellCheckingType;
    UITextField *cellTextField;
}

/**
 * Gets the formatted text representation of the value.
 *
 * @return Returns the formatted text representation of the value.
 */
- (NSString *)displayValue;

/**
 * Gets the unformatted text representation of the value.
 *
 * @return Returns the unformatted text representation of the value.
 */
- (NSString *)editValue;

/**
 * Gets the field value from the text.
 *
 * @param text The text representation of the value.
 * @return Returns the field value.
 */
- (id)valueForText:(NSString *)text;

/**
 * Updates the text field with the current value from the model.
 */
- (void)updateText;

/**
 * Creates and returns the input view to display for the form field.
 *
 * @return Returns the UIView object for the input view, or nil to use the
 *      default keyboard input view.
 */
- (UIView *)createInputView;

@end
