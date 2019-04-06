Trestle.resource(:elevators) do
  menu do
    group :categories, priority: :last do    
      item :elevators, icon: "fa fa-compress"
    end
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  form do |elevator|  
    row do
        col(xs: 6) { select :column_id, Column.all.collect }
        col(xs: 6) { text_field :serial_number}
        col(xs: 6) { select :elevator_class, ["Excelium", "Premium", "Standard"] }
        col(xs: 6) { select :elevator_type, ["Commercial", "Corporate", "Hybrid", "Residential"] }
        col(xs: 12) { text_area :notes}
        col(xs: 6) { select :status, [ "Active", "Inactive", "Intervention"] }
        col(xs: 6) { datetime_field :date_of_commissioning }
        col(xs: 6) { datetime_field :date_of_last_inspection }
        col(xs: 6) { datetime_field :created_at }
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
  #   params.require(:elevator).permit(:name, ...)
  # end
end
