ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :url, :manufacturer, :prod_desc, :prod_feature, :price, :category_id
  # or
  #
  # permit_params do
  #   permitted = [:category_id, :name, :url, :manufacturer, :prod_desc, :prod_feature, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
