class RemoveUidToProjects < ActiveRecord::Migration
  def change
    Project.all.each do |project|
      environment = project.environments.create!(id: project.id, name: :production)
      environment.update! uid: project.uid
    end
    
    remove_column :projects, :uid    
  end
end
