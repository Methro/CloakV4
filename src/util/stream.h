<<<<<<< HEAD
/*
Minetest
Copyright (C) 2022 Minetest Authors

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
// Copyright (C) 2022 Minetest Authors
>>>>>>> 5.10.0

#pragma once

#include <iostream>
#include <string_view>
#include <functional>

<<<<<<< HEAD
template<int BufferLength, typename Emitter = std::function<void(std::string_view)> >
=======
template<unsigned int BufferLength, typename Emitter = std::function<void(std::string_view)> >
>>>>>>> 5.10.0
class StringStreamBuffer : public std::streambuf {
public:
	StringStreamBuffer(Emitter emitter) : m_emitter(emitter) {
		buffer_index = 0;
	}

<<<<<<< HEAD
	int overflow(int c) {
		push_back(c);
		return c;
	}

	void push_back(char c) {
		if (c == '\n' || c == '\r') {
			if (buffer_index)
				m_emitter(std::string_view(buffer, buffer_index));
			buffer_index = 0;
		} else {
			buffer[buffer_index++] = c;
			if (buffer_index >= BufferLength) {
				m_emitter(std::string_view(buffer, buffer_index));
				buffer_index = 0;
=======
	int overflow(int c) override {
		if (c != traits_type::eof())
			push_back(c);
		return 0;
	}

	void push_back(char c) {
		// emit only complete lines, or if the buffer is full
		if (c == '\n') {
			sync();
		} else {
			buffer[buffer_index++] = c;
			if (buffer_index >= BufferLength) {
				sync();
>>>>>>> 5.10.0
			}
		}
	}

<<<<<<< HEAD
	std::streamsize xsputn(const char *s, std::streamsize n) {
=======
	std::streamsize xsputn(const char *s, std::streamsize n) override {
>>>>>>> 5.10.0
		for (std::streamsize i = 0; i < n; ++i)
			push_back(s[i]);
		return n;
	}
<<<<<<< HEAD
private:
	Emitter m_emitter;
	char buffer[BufferLength];
	int buffer_index;
};

class DummyStreamBuffer : public std::streambuf {
	int overflow(int c) {
		return c;
	}
	std::streamsize xsputn(const char *s, std::streamsize n) {
=======

	int sync() override {
		if (buffer_index)
			m_emitter(std::string_view(buffer, buffer_index));
		buffer_index = 0;
		return 0;
	}

private:
	Emitter m_emitter;
	unsigned int buffer_index;
	char buffer[BufferLength];
};

class DummyStreamBuffer : public std::streambuf {
	int overflow(int c) override {
		return 0;
	}
	std::streamsize xsputn(const char *s, std::streamsize n) override {
>>>>>>> 5.10.0
		return n;
	}
};
