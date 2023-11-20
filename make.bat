@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

REM Determine the absolute path where this Makefile resides.
REM From: https://stackoverflow.com/a/73509979
SET ROOT_DIR=%~dp0

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR=source
set BUILDDIR=build

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.https://www.sphinx-doc.org/
	exit /b 1
)

if "%1" == "build" goto build
if "%1" == "clean" goto clean
if "%1" == "publish" goto publish
if "%1" == "server" goto server
if "%1" == "" goto help

%SPHINXBUILD% -M %1 %ROOT_DIR%%SOURCEDIR% %ROOT_DIR%%BUILDDIR% %SPHINXOPTS% %O%
goto end

:help
%SPHINXBUILD% -M help %ROOT_DIR%%SOURCEDIR% %ROOT_DIR%%BUILDDIR% %SPHINXOPTS% %O%
goto end

:build
%SPHINXBUILD% -M html %ROOT_DIR%%SOURCEDIR% %ROOT_DIR%%BUILDDIR% %SPHINXOPTS% %O%
goto end

:clean
rm -rf build/ docs/
goto end

:publish
if not exist "%ROOT_DIR%build" %SPHINXBUILD% -M html %ROOT_DIR%%SOURCEDIR% %ROOT_DIR%%BUILDDIR% %SPHINXOPTS% %O%
rm -rf "%ROOT_DIR%docs"
cp -R "%ROOT_DIR%build/html/" "%ROOT_DIR%docs"
goto end

:server
python "%ROOT_DIR%run_livereload.py"
goto end

:end
popd