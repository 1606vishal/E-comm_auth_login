ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :image

  form do |f|
    f.inputs do
      f.input :name
      f.input :image, as: :file
    end
    actions
  end

  index do
    column "Image" do |category|
      image_tag category&.image, class: 'my_image_size', style: "width:150px; height:150px;"
    end
    column :name
  end
  
end
