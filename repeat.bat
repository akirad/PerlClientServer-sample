@echo off
 
rem %%aに1から10000まで代入して繰り返す
for /l %%a in (1, 1, 10000) do (
perl sendTime.pl
echo %%a
)
