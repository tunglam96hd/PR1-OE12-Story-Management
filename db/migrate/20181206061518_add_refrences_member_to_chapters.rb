class AddRefrencesMemberToChapters < ActiveRecord::Migration[5.2]
  def change
    add_reference :chapters, :member
  end
end
