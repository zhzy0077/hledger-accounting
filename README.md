# 一个端到端的记账解决方案

我经常能在互联网上看到咨询日常记账软件或者资产管理软件的帖子, 但是在我看来通过常见的记账软件手工记账的方式, 对日常心智负担比较大, 一方面是容易漏记, 另一方面是无法同时实现对资产的管理.

我在年前开始有记账的想法, 先后用过诸多国产的记账软件, 以及 GnuCash, Beancount, 最后我遇到了我现在在用的 hledger, 已经记录了半年了, 平均一个月有 300+的交易记录:
```
Transactions span        : 2020-11-30 to 2021-08-01 (244 days)
Last transaction         : 2021-07-31 (0 days ago)
Transactions             : 1353 (5.5 per day)
Transactions last 30 days: 332 (11.1 per day)
Transactions last 7 days : 84 (12.0 per day)
Payees/descriptions      : 452
Accounts                 : 92 (depth 5)
Commodities              : 2 (CNY, USD)
Market prices            : 2 (USD)
```

目前这个解决方案的优势如下:
1. 全程离线, 不存在隐私安全的问题(当然我还是使用 GitHub 用来同步和备份数据)
1. 无日常心智负担, 无漏记, 每半个月或一个月花 10-15 分钟从银行下载账单通过脚本导入即可
1. 作为一个复式记账软件, 可以同时实现资产的管理和日常消费的记录
1. 账单可导出到其他系统分析可视化等, 图为我自建的 Superset ![image](https://raw.githubusercontent.com/zhzy0077/hledger-accounting/main/screenshot.png)

目前账单导入配置支持零钱通, 余额宝, 招商银行(信用卡 / 储蓄卡), 广发银行信用卡, 光大银行信用卡, 民生银行信用卡. 新配置写起来也很容易.

整个端到端流程为: 访问银行网站下载账单 - 通过脚本导入 hledger -上传到 GitHub - 通过 GitHub Actions 生成 SQLite 文件 - 传到我 VM 里的 Superset 上进行分析.

全部为开源软件, 并且除了 hledger 以外都可以替换, 比如 SQLite 换成 MySQL 备份, 或者 Superset 换 QuickBI 等.

有任何疑问直接提 issue 即可.

目前简中互联网上这块的内容还是相对较少, 写了点记账教程, 后续会根据反馈不断更新:

1. [会计](docs/accounting.md)
1. [为什么是 hledger](docs/why-hledger.md)
1. [hledger](docs/hledger.md)
1. [导入](docs/import.md)
