module Pivot::Tracker
  class << self
    def count(items)
      return 0 unless items.is_a?(Array)
      items.count
    end

    def item_for(items, assignee)
      items_for_assignee(items, assignee).last
    end

    def pivoted?(items, assignee)
      items_for_assignee(items, assignee).any?
    end

    def total_points(items, **options)
      assignee = options[:assignee]
      line_items = items_for_assignee(items, options[:assignee])
      line_items.sum{ |item| item[:points] }
    end

    def unique_assignees(items)
      items.uniq {|item| item[:assignee]}
    end

    def items_for_assignee(items, assignee = nil)
      return items unless assignee
      items.select{|item| item[:assignee] == assignee}
    end
  end
end