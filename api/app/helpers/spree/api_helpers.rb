module Spree
  module Api
    module ApiHelpers
      def required_fields_for(model)
        required_fields = model._validators.select do |field, validations|
          validations.any? { |v| v.is_a?(ActiveModel::Validations::PresenceValidator) }
        end.keys
        # Permalinks presence is validated, but are really automatically generated
        # Therefore we shouldn't tell API clients that they MUST send one through
        required_fields.delete(:permalink)
        required_fields
      end

      def product_attributes
        [:id, :name, :description, :price,
         :available_on, :permalink, :count_on_hand, :meta_description, :meta_keywords]
      end

      def variant_attributes
        [:id, :name, :count_on_hand, :sku, :price, :weight, :height, :width, :depth, :is_master, :cost_price]
      end

      def option_value_attributes
        [:name, :presentation, :option_type_name, :option_type_id]
      end
    end
  end
end