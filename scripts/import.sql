CREATE TABLE expenses(
  "txnidx" TEXT,
  "date" TEXT,
  "date2" TEXT,
  "status" TEXT,
  "code" TEXT,
  "description" TEXT,
  "comment" TEXT,
  "account" TEXT,
  "amount" REAL,
  "commodity" TEXT,
  "credit" REAL,
  "debit" REAL,
  "posting-status" TEXT,
  "posting-comment" TEXT
);

CREATE TABLE balance(
  "account" TEXT,
  "balance" REAL
);

.mode csv
.import ./expenses.csv expenses
.import ./balance.csv balance