Trestle.resource(:column_stocks) do
  menu do
    group :stocks, priority: :last do
    item :column, icon: "fa fa-angle-double-right"
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :doors
    column :cables
    column :displays
    column :callbuttons
    column :bearings
    column :updated_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |column_stock|
  
    row do
      col(xs: 6) { text_field :doors }
      col(xs: 6) { text_field :cables }
      col(xs: 6) { text_field :displays }
      col(xs: 6) { text_field :callbuttons }
      col(xs: 6) { text_field :bearings }
      col(xs: 6) { datetime_field :updated_at }
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:column_stock).permit(:name, ...)
  # end
end
