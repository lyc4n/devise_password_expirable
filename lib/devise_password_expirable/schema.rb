module DevisePasswordExpirable
  # add schema helper for migrations
  module Schema
    # Add last_password_reset columns in the resource's database table.
    #
    # Examples
    #
    # # For a new resource migration:
    # create_table :the_resources do |t|
    #   t.password_expirable
    # ...
    # end
    #
    # # or if the resource's table already exists, define a migration and put this in:
    # change_table :the_resources do |t|
    #   t.datetime :last_password_reset
    # end
    #
    def password_expirable
      apply_devise_schema :last_password_reset, DateTime
    end

  end
end
