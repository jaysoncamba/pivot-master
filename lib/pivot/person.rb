module Pivot
  class Person

    attr_accessor :email, :first_name, :last_name
    attr_reader :items

    def initialize params = {}
      params.each { |key, value| send "#{key}=", value }
    end

    def items
      @items ||= []
    end

    # would like to define interface/manager for adding the items to person
    # and other operations for persons and items
    def add_item(item)
      return false unless item.is_a?(Item)
      item.assignee = email
      items.push(item)
      yield if block_given?
    end
  end
end