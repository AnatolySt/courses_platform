ActiveAdmin.register Course do
  permit_params :title, :description, groups_attributes: %i[id title starts_at ends_at]

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :description
    end
    f.inputs do
      f.has_many :groups,
                 allow_destroy: true do |a|
        a.input :title
        a.input :starts_at
        a.input :ends_at
      end
    end
    f.actions
  end
end
