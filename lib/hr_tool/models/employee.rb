module HrTool
  module Models
  	class Employee
	    attr_accessor :name, :id, :manager_id

	    def initialize(name, id, manager_id = nil)
	    	raise ArgumentError, "ID is required" if id.nil?
	    	
	      @name = name
	      @id = id
	      @manager_id = manager_id
	    end
	  end
  end
end