unboxed-test
============

Having read the test, I realised that the first part is roughly of a type "Very quickly build an app with a single feature, that will be used by 3 users for about 10 minutes" or, in other words, a prototype. And so I did [this](https://dl.dropboxusercontent.com/u/362737/unboxed-test/index.html)

It took me 1 hour and 10 minutes to complete the first part. And another 2 hours and 20 minutes to do the css part (I didn't know the box shadow trick, so I spent some time googling that out).

Than later it occurred to me that, even though it fits the bill, this code does not show the skills unboxed guys might be after. Sure I can hack things together quickly, but can I engineer software?

So I put off my hacker hat and put on my engineer hat. But there was still something missing. The test description didn't justify this swap in my opinion. And so I went ahead and added the following bit to it: "Assume that this is a start of a big project with lots of features planned". Now everything seemed good.

It took me over 3 hours to do that, but this time I was focused on quality rather than speed. There are tests, there is more or less meaningful commit history, there are less bugs. Oh, and it is in Ruby. Might be important one, who knows?

## how to run ##

    $ git clone https://github.com/artemave/unboxed-test.git
    $ cd unboxed-test
    $ bundle install
    $ ./bin/fav_lang bob

## run tests ##

    $ bundle exec rspec && bundle exec cucumber
