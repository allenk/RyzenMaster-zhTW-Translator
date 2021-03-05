:: Convert phrases from Simplified Chinese to Traditional.
:: ==========================================================
:: We try to use several conversion tools to achieve the best 
:: translation results.
:: ---------------------------
:: AllenK (kwyshell@gmail.com)
:: ==========================================================
@echo off

:: Languages
:: convert sc = tc in opencc
echo "Convert Languages SC => TC, output ..\Languages\chinese_traditional_convert.ts"
powershell.exe -ExecutionPolicy Bypass -Command .\opencc_conv.ps1 ..\Languages\chinese_simplified.ts ..\Languages\chinese_traditional_convert.ts
:: convert converted tc in msword
wscript .\msword_conv.vbs ..\Languages\chinese_traditional_convert.ts ..\Languages\chinese_traditional_convert.ts
:: apply the final patch
powershell.exe -ExecutionPolicy Bypass -Command ..\replace_zhtw_idiomatic.ps1 ..\Languages\chinese_traditional_convert.ts ..\Languages\chinese_traditional_convert.ts

::translations
echo "Convert translations SC => TC output ..\translations\chinese_traditional_convert.ts"
powershell.exe -ExecutionPolicy Bypass -Command .\opencc_conv.ps1 ..\translations\chinese_simplified.ts ..\translations\chinese_traditional_convert.ts
:: convert converted tc in msword
wscript .\msword_conv.vbs ..\translations\chinese_traditional_convert.ts ..\translations\chinese_traditional_convert.ts
:: apply the final patch
powershell.exe -ExecutionPolicy Bypass -Command ..\replace_zhtw_idiomatic.ps1 ..\translations\chinese_traditional_convert.ts ..\translations\chinese_traditional_convert.ts
