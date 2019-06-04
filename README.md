# Bank Tech Test

## Task

Build a Bank Account simulator that can be run on the command line.

## User Stories

```
In order to use my bank account
As a User
I want money on my account.

In order to make transactions
As a User
I want to add money to my account.

In order to make transactions
As a User
I want to withdraw money from my account.

In order to see my transactions details
As a User
I want to print a bank statement with date, amount and balance.
```

## Instructions

Clone this repository:

```
$ git clone https://github.com/yadlra/bank-tech-test.git
$ cd bank-tech-test
```

Install required gems:

```
$ bundle install
```

To view tests, run RSpec:

```
$ bundle exec rspec
```

## How to use in the command line

```
irb(main):001:0> require './lib/account.rb'
=> true
irb(main):002:0> require './lib/statement.rb'
=> true
irb(main):003:0> statement = Statement.new
=> #<Statement:0x00007ff225060a58 @transactions=[]>
irb(main):004:0> account = Account.new(statement)
=> #<Account:0x00007ff224842bf0 @balance=0, @statement=#<Statement:0x00007ff225060a58 @transactions=[]>>
irb(main):005:0> account.deposit(2000)
=> [{:date=>"04/06/2019", :credit=>2000, :debit=>"-", :balance=>2000}]
irb(main):006:0> account.deposit(1000)
=> [{:date=>"04/06/2019", :credit=>2000, :debit=>"-", :balance=>2000}, {:date=>"04/06/2019", :credit=>1000, :debit=>"-", :b
alance=>3000}]
irb(main):007:0> account.withdraw(500)
=> [{:date=>"04/06/2019", :credit=>2000, :debit=>"-", :balance=>2000}, {:date=>"04/06/2019", :credit=>1000, :debit=>"-", :b
alance=>3000}, {:date=>"04/06/2019", :credit=>"-", :debit=>500, :balance=>2500}]
irb(main):008:0> account.view_statement
date || credit || debit || balance
04/06/2019 || 2000 || - || 2000
04/06/2019 || 1000 || - || 3000
04/06/2019 || - || 500 || 2500
```
