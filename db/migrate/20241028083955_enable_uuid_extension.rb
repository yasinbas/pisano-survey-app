class EnableUuidExtension < ActiveRecord::Migration[7.1]
  def change
  end
end


def change
  enable_extension 'pgcrypto'
end
