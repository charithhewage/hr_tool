require 'set'

module HrTool
  module Generators
	  class HierarchyGenerator
	    def initialize(employees)
	      @employees = employees
	      @employee_map = {}
	      @root = nil
	      @graph = {}

	      build_hierarchy
	    end

	    # Define the graph as an adjacency list
	    def build_hierarchy
	      @employees.each do |emp| 
	      	@employee_map[emp.id] = emp
	      	@graph[emp.id] = Set.new
	      	@root = emp.id unless emp.manager_id
	      end

	      @employees.each do |emp|
	      	puts "Manager ID: #{emp.manager_id} is not a valid employee" if emp.manager_id && !valid_employee?(emp)

	      	@graph[emp.manager_id].add(emp.id) if valid_employee?(emp)
	      end
	    end

	    def display_hierarchy
	      dfs(@graph, @root) if @root
	    end

	    private

	    # DFS method to travel through the tree
	    def dfs(graph, node, visited = Set.new, level = 0)
			  # Mark the current node as visited
			  visited.add(node)
			  
			  puts "#{"\t|" * level} #{@employee_map[node].name}"

			  # Check all the other adjacents recersively
			  graph[node].each do |neighbor|
			    dfs(graph, neighbor, visited, level +1) unless visited.include?(neighbor)
			  end
			end

			def valid_employee?(employee)
				@graph[employee.manager_id]
			end
	  end
	end
end
