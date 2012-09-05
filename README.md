spree_dibs_referral
===================

This is a simple [Spree](http://spreecommerce.com/) extension that allows tracking of sales referrals based on a role.

Installation
============

spree_dibs_referral is compatible with Ruby 1.9.x and Spree 1.1.

1. Edit your Gemfile, adding the line:

`gem 'spree_dibs_referral', :git => 'git://github.com/lilleyt/spree_dibs_referral`

2. Run the following commands:

```
bundle install
bundle exec rake spree_dibs_referral:install:migrations
bundle exec rake db:migrate
```

Start your Spree instance and you're done.

Details
=======

This is an early version of what will be a more sophisticated referral-tracking system.  It is open-source, so input/pull requests will certainly be considered,
but be aware that it is being developed specifically for the needs of DidItBetter Software's Spree implementation, which puts some constraints on what input is
accepted.  That said, please do contact me if you have a problem or suggestion, I just needed to mention that.

By referrals, we typically mean inside or outside salespeople who take an active role in assisting customers with finding suitable product(s) and who are
compensated for assisting closed sales.  This system makes it easier to track the referrers association with the sale so that credit can be given where it
is due.

As it stands, the system is exceedingly simple and will have some significant changes to the user experience in the near future.

There is a new role added by the extension, called "dibs_referral".  "dibs" is short for DidItBetter Software.

Each referrer (salesperson) must have an account on the system and must be assigned the dibs_referrer role.

Once the role is assigned, the referrer will show up in the list of referrers.  This list is shown to the user on the payment step of the checkout process.
It defaults to blank, and the customer is asked whether or not they were referred to the store.  They can select from the list of referrers' emails or leave
the selection blank.

In the orders list in the admin view, there is a new column that contains the referral, if one was specified with the order.  Currently the list isn't sortable
on that field like the others can be since I couldn't figure that part out.  On the order detail, the referral is listed in the order summary in the right-hand
sidebar.  If you edit the order, there is a dropdown to change the referral.

For the referrer, a new table has been added to the "My Account" page, which shows the referrals they have been named on, so they can see their current status.

Planned changes
===============

* Create a cart-specification and sending system

Referrers will be able to create carts targeted to a user and send a link to that cart.  If the customer purchases, the order will automatically be credited
to the referrer.

* Add email integration

Referrers get emails when their cart is purchased.

* Create a cart template system

Allow referrers to store pre-defined carts, tailor them and send them.

* Reporting

More detailed reports for admins and referrers

* Track compensation rates and calculate totals

Add the ability to set a rate (percentage) that the referrer receives and put totals in reporting

More detailed specifications can be found at the [DidItBetter Wiki](http://wiki.diditbetter.com/doku.php?id=Agent_Modules:Agent_Modules).

Copyright (c) 2012 DidItBetter Software, released under the New BSD License
