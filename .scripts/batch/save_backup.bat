@echo off  
git add .  
  
:: Windows CMD 不直接支持 $(...) 格式，但我们可以使用 %date% 和 %time% 环境变量  
:: 但这些变量的格式可能因区域设置而异，所以我们可能需要一些额外的处理  
  
:: 获取日期和时间，然后格式化它们  
for /f "tokens=1-6 delims=/: " %%a in ('date /t') do set "datePart=%%c-%%b-%%a"  
for /f "tokens=1-3 delims=:." %%a in ('time /t') do set "timePart=%%a%%b%%c"  
  
:: 将日期和时间合并为一个字符串  
set "commitMessage=%datePart% %timePart%"  
  
:: 去除时间中的空格  
set "commitMessage=%commitMessage: =%"  
  
:: 提交更改  
git commit -m "%commitMessage%"  
  
:: 推送更改到远程仓库  
git push -u origin master  
  
:: 如果需要，可以添加一些额外的错误处理逻辑