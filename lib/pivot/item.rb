module Pivot
  class Item
    attr_accessor :name, :assignee, :points

    PROJECT_CODE_FORMAT = /^[a-zA-Z]*/
    VALID_PROJECTS = %w[EREC AZR]

    def initialize params = {}
      params.each { |key, value| send "#{key}=", value }
    end
    
    def +(another_item)
      return points unless (another_item.is_a?(Item))
      points + another_item.points
    end

    # assume name would be formated [a-zA-z]-
    def project_code
      name[PROJECT_CODE_FORMAT]
    end

    def valid?
      VALID_PROJECTS.include?(project_code)
    end
  end
end