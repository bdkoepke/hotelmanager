ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
<<<<<<< HEAD

=======
>>>>>>> 0456d704fc81140d9e461b4d934b862b91815b5e
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

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
