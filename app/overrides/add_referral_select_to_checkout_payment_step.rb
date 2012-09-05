Deface::Override.new(virtual_path: 'spree/checkout/_payment',
                     name: 'add_referral_select_to_checkout_payment_step',
                     insert_before: 'fieldset#payment',
                     text: '<fieldset id="billing"><legend><%= t(:referral) %></legend><div><p>If you were referred to us by one of our salespeople, please select their name:</p><%= form.collection_select :dibs_referral_id, Spree::User.dibs_referrers, :id, :email, { include_blank: true } %></div></fieldset>'
                    )
