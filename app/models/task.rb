class Task < ActiveRecord::Base

  belongs_to :project

  validates_presence_of :task

  #def count_tasks
    # count = Task.where(["project_id = ?", projectid]).count
    # if count = 0
    #   @count = 100
    # else
    #   @count = (100/count)
    # end
  #end

  def self.filter_tasks(projectid)
    where(["project_id = ?", projectid])
  end




end
