#workaround para evitar erros na paginacao do active_admin. O conflito se deve
#ao active_admin utilizar o kaminari. A ideia eh fazer um alias entre as duas
#gems, conforme a issue:
#http://stackoverflow.com/questions/14958438/rails-activeadmin-undefined-method-per-for-activerecordrelation0x4d15ee
# if defined?(WillPaginate)
#   module WillPaginate
#     module ActiveRecord
#       module RelationMethods
#         alias_method :per, :per_page
#         alias_method :num_pages, :total_pages
#       end
#     end
#   end
# end
#
# module ActiveRecord
#   class Relation
#     alias_method :total_count, :count
#   end
# end

if defined?(WillPaginate)
    module WillPaginate
      module ActiveRecord
         module RelationMethods
         def per(value = nil) per_page(value) end
         def total_count() count end
        end
      end
      module CollectionMethods
       alias_method :num_pages, :total_pages
    end
  end
end
