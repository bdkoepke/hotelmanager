ActiveAdmin.register_page "Dashboard" do
 
  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    columns do 
      column do
        panel "Recent Customers" do
          table_for Customer.order("created_at desc").limit(5) do
            column :Name do |customer|
              link_to customer.first_name + " " + customer.last_name, [:admin, customer]
            end
            column :created_at
          end
          strong { link_to "View All Customers", admin_customers_path}
        end
      end
    end
  end
end