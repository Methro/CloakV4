/*
This file is a part of the JThread package, which contains some object-
oriented thread wrappers for different thread implementations.

Copyright (c) 2000-2006  Jori Liesenborgs (jori.liesenborgs@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
*/

#pragma once

#include <mutex>
<<<<<<< HEAD
using MutexAutoLock = std::unique_lock<std::mutex>;
using RecursiveMutexAutoLock = std::unique_lock<std::recursive_mutex>;
=======

/// @deprecated use std::lock_guard directly
using MutexAutoLock = std::lock_guard<std::mutex>;
/// @deprecated use std::lock_guard directly
using RecursiveMutexAutoLock = std::lock_guard<std::recursive_mutex>;
>>>>>>> 5.10.0
