require_relative './loaders/employee_data_loader'
require_relative './generators/hierarchy_generator.rb'

module HrTool
  class CLI
    def self.start(file_path)
      employees = HrTool::Loaders::EmployeeDataLoader.load_data(file_path)
      hierarchy = HrTool::Generators::HierarchyGenerator.new(employees)
      hierarchy.display_hierarchy
    end
  end
end