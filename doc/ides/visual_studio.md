# [Visual Studio](https://visualstudio.microsoft.com)

From the Visual Studio installer, you need to install the `Desktop development with C++` Workload. You need to make sure the `C++ CMake tools for Windows` component is included in the installation details panel.

<<<<<<< HEAD
You need to install [Vcpkg](https://vcpkg.io) and install Minetest dependencies as stated in the compilation documentation.
=======
You need to install [Vcpkg](https://vcpkg.io) and install Luanti dependencies as stated in the compilation documentation.
>>>>>>> 5.10.0

For the packages to be discoverable and used by Visual Studio, you need to run `vcpkg integrate install`.
