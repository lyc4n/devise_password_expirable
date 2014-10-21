module DevisePasswordExpirable
  module Orm
    # This module contains some helpers and handle schema (migrations):
    #
    #   create_table :accounts do |t|
    #     t.password_expirable
    #   end
    #
    module ActiveRecord
      module Schema
        include DevisePasswordExpirable::Schema


      end
    end
  end
end

ActiveRecord::ConnectionAdapters::Table.send :include, DevisePasswordExpirable::Orm::ActiveRecord::Schema
ActiveRecord::ConnectionAdapters::TableDefinition.send :include, DevisePasswordExpirable::Orm::ActiveRecord::Schema