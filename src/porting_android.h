<<<<<<< HEAD
/*
Minetest
Copyright (C) 2014 celeron55, Perttu Ahola <celeron55@gmail.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
=======
// Luanti
// SPDX-License-Identifier: LGPL-2.1-or-later
// Copyright (C) 2014 celeron55, Perttu Ahola <celeron55@gmail.com>
>>>>>>> 5.10.0

#pragma once

#ifndef __ANDROID__
#error This header has to be included on Android port only!
#endif

#include "irrlichttypes_bloated.h"
#include <string>

namespace porting {
/**
 * Show a text input dialog in Java
 * @param hint Hint to be shown
 * @param current Initial value to be displayed
 * @param editType Type of the text field
 * (1 = multi-line text input; 2 = single-line text input; 3 = password field)
 */
void showTextInputDialog(const std::string &hint, const std::string &current, int editType);

/**
 * Show a selection dialog in Java
 * @param optionList The list of options
 * @param listSize Size of the list
 * @param selectedIdx Selected index
 */
<<<<<<< HEAD
void showComboBoxDialog(const std::string optionList[], s32 listSize, s32 selectedIdx);
=======
void showComboBoxDialog(const std::string *optionList, s32 listSize, s32 selectedIdx);
>>>>>>> 5.10.0

/**
 * Opens a share intent to the file at path
 *
 * @param path
 */
void shareFileAndroid(const std::string &path);

/*
 * Types of Android input dialog:
 * 1. Text input (single/multi-line text and password field)
 * 2. Selection input (combo box)
 */
enum AndroidDialogType { TEXT_INPUT, SELECTION_INPUT };

/*
 * WORKAROUND for not working callbacks from Java -> C++
 * Get the type of the last input dialog
 */
AndroidDialogType getLastInputDialogType();

/*
 * States of Android input dialog:
 * 1. The dialog is currently shown.
 * 2. The dialog has its input sent.
 * 3. The dialog is canceled/dismissed.
 */
enum AndroidDialogState { DIALOG_SHOWN, DIALOG_INPUTTED, DIALOG_CANCELED };

/*
 * WORKAROUND for not working callbacks from Java -> C++
 * Get the state of the input dialog
 */
AndroidDialogState getInputDialogState();

/*
 * WORKAROUND for not working callbacks from Java -> C++
 * Get the text in the current/last input dialog
 * This function clears the dialog state (set to canceled). Make sure to save
 * the dialog state before calling this function.
 */
std::string getInputDialogMessage();

/*
 * WORKAROUND for not working callbacks from Java -> C++
 * Get the selection in the current/last input dialog
 * This function clears the dialog state (set to canceled). Make sure to save
 * the dialog state before calling this function.
 */
int getInputDialogSelection();


bool hasPhysicalKeyboardAndroid();

<<<<<<< HEAD
#ifndef SERVER
float getDisplayDensity();
v2u32 getDisplaySize();
#endif
=======
float getDisplayDensity();
v2u32 getDisplaySize();
>>>>>>> 5.10.0

}
