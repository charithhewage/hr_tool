require 'json'
require_relative '../models/employee'

module HrTool
  module Loaders
  	class EmployeeDataLoader
	    def self.load_data(file_path)
	      employees = []

	      begin
	        file = File.read(file_path)
	        data = JSON.parse(file, symbolize_names: true)
	        
	        data.each do |emp_data|
	          employees << HrTool::Models::Employee.new(emp_data[:name], emp_data[:id], emp_data[:manager_id])
	        end

	      rescue Errno::ENOENT
	        puts "Error: File not found at '#{file_path}'. Please check the file path and try again."
	        return []
	      rescue JSON::ParserError
	        puts "Error: The file at '#{file_path}' contains invalid JSON."
	        return []
	      end

	      employees
	    end
	  end
  end
end