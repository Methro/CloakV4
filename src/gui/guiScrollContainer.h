<<<<<<< HEAD
/*
Minetest
Copyright (C) 2020 DS

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
// Copyright (C) 2020 DS
>>>>>>> 5.10.0

#pragma once

#include "irrlichttypes_extrabloated.h"
#include "util/string.h"
#include "guiScrollBar.h"

class GUIScrollContainer : public gui::IGUIElement
{
public:
	GUIScrollContainer(gui::IGUIEnvironment *env, gui::IGUIElement *parent, s32 id,
			const core::rect<s32> &rectangle, const std::string &orientation,
			f32 scrollfactor);

	virtual bool OnEvent(const SEvent &event) override;

	virtual void draw() override;

<<<<<<< HEAD
=======
	inline void setContentPadding(std::optional<s32> padding)
	{
		m_content_padding_px = padding;
	}

>>>>>>> 5.10.0
	inline void onScrollEvent(gui::IGUIElement *caller)
	{
		if (caller == m_scrollbar)
			updateScrolling();
	}

<<<<<<< HEAD
	inline void setScrollBar(GUIScrollBar *scrollbar)
	{
		m_scrollbar = scrollbar;
		updateScrolling();
	}
=======
	void setScrollBar(GUIScrollBar *scrollbar);
>>>>>>> 5.10.0

private:
	enum OrientationEnum
	{
		VERTICAL,
		HORIZONTAL,
		UNDEFINED
	};

	GUIScrollBar *m_scrollbar;
	OrientationEnum m_orientation;
<<<<<<< HEAD
	f32 m_scrollfactor;
=======
	f32 m_scrollfactor; //< scrollbar pos * scrollfactor = scroll offset in pixels
	std::optional<s32> m_content_padding_px; //< in pixels
>>>>>>> 5.10.0

	void updateScrolling();
};
