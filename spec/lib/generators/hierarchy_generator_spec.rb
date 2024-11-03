require 'spec_helper'
require 'rspec'
require 'json'

require 'hr_tool/generators/hierarchy_generator'
require 'hr_tool/models/employee'

RSpec.describe HrTool::Generators::HierarchyGenerator do
  let(:valid_file_path) { 'spec/fixtures/valid_employees.json' }
  let(:employees) { HrTool::Loaders::EmployeeDataLoader.load_data(valid_file_path) }

  subject do
    HrTool::Generators::HierarchyGenerator.new(employees)
  end

  describe '#build_hierarchy' do
    it 'correctly builds the hierarchy graph as an adjacency list' do
      # Verify graph structure
      graph = subject.instance_variable_get(:@graph)
      expect(graph[150]).to contain_exactly(100, 400)
      expect(graph[100]).to contain_exactly(220, 275)
      expect(graph[400]).to contain_exactly(190)
      expect(graph[190]).to be_empty
    end

    # Correctly identifies the employee with no manager
    it 'correctly identifies the root node' do
      root = subject.instance_variable_get(:@root)
      expect(root).to eq(150)  # Jamie
    end
  end

  describe '#display_hierarchy' do
    it 'prints the hierarchy starting from the root (CEO) in DFS order' do
      expect { subject.display_hierarchy }.to output(
        " Jamie\n\t| Alan\n\t|\t| Martin\n\t|\t| Alex\n\t| Steve\n\t|\t| David\n"
        ).to_stdout
    end
  end

  
end
