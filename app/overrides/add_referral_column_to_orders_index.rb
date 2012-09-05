Deface::Override.new(virtual_path: 'spree/admin/orders/index',
                     name: 'add_referral_column_to_orders_index',
                     insert_before: 'th:contains(":total")',
                     text: '<th><%= t(:referral) %></th>'
                    )

Deface::Override.new(virtual_path: 'spree/admin/orders/index',
                     name: 'add_referral_value_to_orders_index',
                     insert_before: 'td:contains(".total")',
                     text: '<td><%= order.dibs_referral.nil? ? "" : (link_to order.dibs_referral.email, admin_user_path(order.dibs_referral)) %></td>'
                    )
