# 导入
作为程序员都知道能自动化的流程绝对不能手动做. 同样账单导入也是比手动记录要方便, 快捷, 和准确的多.

下面是手工的流程来让大家了解具体行为, 也有一个现成的脚本自动化这个流程.

每个银行的账单下载方式都大相径庭, 后续会一个个加, 目前以招商银行为例:

1. 访问招商银行[个人银行大众版](https://pbsz.ebank.cmbchina.com/CmbBank_GenShell/UI/GenShellPC/Login/Login.aspx), 目前这个要求 IE 访问, 可以通过 IE Tab 等绕过.
2. 登录后访问交易记录, 选择交易时间段, 点击下载
3. 将下载的 CSV 从 gb2312 编码转为 UTF8
4. `hledger import <path> --rules-file 'rules\CMB Debit'`, 这里的 rules 可以参考 rules 目录下的文件
5. 检查导入的账单, 发现问题如未知支出时更新配置.

## 脚本
在scripts目录下有两个powershell脚本, 可以自动转编码并导入:
```
PS C:\code\journal> .\scripts\encoding.ps1 20210731
Complete Conversion ... 
Press Enter to continue...

PS C:\code\journal> .\scripts\import.ps1 20210731  
C:\code\journal\20210731\200009478172_145622639900_converted.csv
Choose a rule: [1 CMB Credit] [2 CMB Debit] [3 Sodexo] [4 CGB] [5 CMBC]: 4    
imported 2 new transactions from C:\code\journal\20210731\200009478172_145622639900_converted.csv

C:\code\journal\20210731\CMB_20210730_20210731_converted.csv
Choose a rule: [1 CMB Credit] [2 CMB Debit] [3 Sodexo] [4 CGB] [5 CMBC]: 2
imported 6 new transactions from C:\code\journal\20210731\CMB_20210730_20210731_converted.csv

C:\code\journal\20210731\sodexo.csv
Choose a rule: [1 CMBC] [2 CMBD] [3 Sodexo] [4 CGB] [5 CMBC]: 3
imported 2 new transactions from C:\code\journal\20210731\sodexo.csv

Complete Importing ... 
Press Enter to continue...
```
