for /f %%a in ('dir /a:d /b %ANDROID_SDK%\cmake\') do set cmake_version=%%a
set cmake_bin=%ANDROID_SDK%\cmake\%cmake_version%\bin\cmake.exe
set ninja_bin=%ANDROID_SDK%\cmake\%cmake_version%\bin\ninja.exe

mkdir build_arm64_v8a
%cmake_bin% -H.\ -B.\build_arm64_v8a "-GAndroid Gradle - Ninja" -DANDROID=TRUE -DCMAKE_SYSTEM_NAME=Android -DANDROID_ABI=arm64-v8a -DANDROID_NDK=%ANDROID_NDK% -DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM=%ninja_bin% -DCMAKE_TOOLCHAIN_FILE=.\cmake\android.windows.toolchain.cmake "-DCMAKE_CXX_FLAGS=-std=c++11 -fexceptions"
%ninja_bin% -C .\build_arm64_v8a
mkdir .\plugin_lua53\Plugins\Android\Libs\arm64-v8a
move .\build_arm64_v8a\libxlua.so .\plugin_lua53\Plugins\Android\Libs\arm64-v8a\libxlua.so

echo "compile success"
pause