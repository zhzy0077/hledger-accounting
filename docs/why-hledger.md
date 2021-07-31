# 为什么是hledger?
目前市面上知名且免费的个人复式记账软件有如下三款:
1. GnuCash: https://gnucash.org/
2. Beancount: http://furius.ca/beancount/
3. hledger: https://hledger.org/

我都用过一段实践, 体验如下

|          | GnuCash                    | Beancount      | hledger                   |
| -------- | -------------------------- | -------------- | ------------------------- |
| 账本格式 | XML / SQLite               | 纯文本         | 纯文本                    |
| 客户端   | 重客户端, 需要安装         | 任意文本编辑器 | 任意文本编辑器            |
| 可视化   | 客户端图表                 | fava 等        | -                         |
| 账单导入 | 可直接导入 CSV, 无账户匹配 | 需要写 Python  | 配置文件配置 CSV 导入行为 |
| 其他     |                            | 不支持中文     |                           |

hledger 虽然缺少 fava 这样可视化软件, 但是支持方便的 csv 导入和中文账户使得它成为了最优秀的解决方案.