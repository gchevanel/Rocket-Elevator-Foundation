Trestle.resource(:elevator_stocks) do
  menu do
    group :stocks, priority: :last do
    item :elevator, icon: "fa fa-angle-double-right"
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :standard
    column :premium
    column :excelium
    column :doors
    column :displays
    column :buttons
    column :safety_gears
    column :updated_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |elevator_stock|
  
    row do
      col(xs: 6) { text_field :standard }
      col(xs: 6) { text_field :premium }
      col(xs: 6) { text_field :excelium }
      col(xs: 6) { text_field :doors }
      col(xs: 6) { text_field :displays }
      col(xs: 6) { text_field :buttons }
      col(xs: 6) { text_field :safety_gears }
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
  #   params.require(:elevator_stock).permit(:name, ...)
  # end
end
