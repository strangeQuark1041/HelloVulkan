# HelloVulkan

A simple Hello World program in [Vulkan](https://vulkan.org) based on https://vulkan-tutorial.com
The project uses [CMake](https://cmake.org) and [Conan](https://conan.io) for platform independence and ease of use

# Dependencies

| Dependency | URL | Documentation |
| ---        | --- | --- |
| python     | <https://www.python.org/downloads/> | <https://www.python.org/doc/> |
| git        | <https://git-scm.com/downloads/> | <https://git-scm.com/docs/> |
| cmake      | <https://cmake.org/download/> | <https://cmake.org/cmake/help/latest/> |
| conan      | <https://conan.io/downloads.html/> | <https://docs.conan.io/en/latest/> |

# Usage

```sh
git clone --depth 1 https://github.com/strangeQuark1041/HelloVulkan.git
cmake --preset=default
cmake --build --preset=default
./build/bin/main
```
