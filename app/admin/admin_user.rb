ActiveAdmin.register AdminUser do     
<<<<<<< HEAD
=======
  menu :if => proc{ current_admin_user.role == "admin" }
  controller.authorize_resource
  
  
  rolesnames = ["admin", "sales associate"]
>>>>>>> 0456d704fc81140d9e461b4d934b862b91815b5e
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
<<<<<<< HEAD
    column :sign_in_count             
		column :role
=======
    column :sign_in_count   
    column :role   
>>>>>>> 0456d704fc81140d9e461b4d934b862b91815b5e
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
<<<<<<< HEAD
			f.input :role
=======
      #f.input :role
      f.input :role, :as => :select, :collection => rolesnames  
>>>>>>> 0456d704fc81140d9e461b4d934b862b91815b5e
    end                               
    f.actions                         
  end                                 
end                                   
