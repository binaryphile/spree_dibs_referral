Deface::Override.new(virtual_path: 'spree/admin/orders/_form',
                     name: 'add_referral_select_to_admin_order_edit_form',
                     insert_before: 'table.index',
                     text: '<div id="dibs_referral"><b><%= t(:referral) %>:</b> <%= f.collection_select :dibs_referral_id, Spree::User.dibs_referrers, :id, :email, { include_blank: true } %></div>'
                     )
