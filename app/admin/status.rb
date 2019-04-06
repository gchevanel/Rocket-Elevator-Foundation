Trestle.admin(:status) do
    menu do
      group :informations, priority: :last do
      item :status, icon: "fa fa-tachometer"
      end
    end
  
    controller do
      def index
      end
    end
  end

 