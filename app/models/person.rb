class Person
  include ActiveModel::AttributeMethods
  extend ActiveModel::Callbacks
  extend ActiveModel::Translation

  define_model_callbacks :update

  before_update :reset_me

  attr_accessor :name, :age, :address
  attribute_method_prefix 'clear_'

  # Call to define_attribute_methods must appear after the
  # attribute_method_prefix, attribute_method_suffix or
  # attribute_method_affix declarations.
  define_attribute_methods :name, :age, :address

  def update
    run_callbacks(:update) do
      
    end
  end

  def reset_me

  end

  private

  def clear_attribute(attr)
    send("#{attr}=", nil)
  end
end