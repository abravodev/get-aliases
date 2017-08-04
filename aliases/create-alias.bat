@echo off

:: Alias you want to use
SET alias=%1

:: The action you want to be aliased
SET action=%2
:: We remove the quotes
set action=%action:"=%

SET pathOfAliases=%~dp0
SET file=%pathOfAliases%%alias%.bat

if exist %file% (
	:: We should not override alias
    echo Couldnt create alias, there is already an alias with that name
	echo You can check the alias file in %file%
) else (   
	touch %file%
	echo @echo off > %file%
	echo %action% >> %file%

	echo Alias '%alias%' created!
)
