module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        if key == "lists"
          key = "authors"
          constraint = []
          Person.filter_by_lists(value).each do |person|
            unless constraint.include? person.id.to_s
              constraint << person.id.to_s
            end
          end
          value = constraint
        end        
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    end
  end
end
