Deface::Override.new(virtual_path: 'spree/admin/shared/_order_tabs',
                     name: 'add_referral_to_admin_order_tab_summary',
                     insert_after: '#payment_status',
                     text: '<h5 id="dibs_referral" style="width: 100%;"><%= t(:referral) %>: <%= @order.dibs_referral.nil? ? t(:nothing) : @order.dibs_referral.email %></h5>'
                    )
