# spec/data_loader_spec.rb
require 'rspec'
require 'json'
require 'fileutils'

require 'hr_tool/loaders/employee_data_loader'
require 'hr_tool/models/employee'

RSpec.describe HrTool::Loaders::EmployeeDataLoader do
  let(:valid_file_path) { 'spec/fixtures/valid_employees.json' }
  let(:invalid_file_path) { 'spec/fixtures/non_existent_file.json' }
  let(:invalid_json_file_path) { 'spec/fixtures/invalid_json.json' }

  describe '.load_data' do
    context 'when the file exists and contains valid JSON' do
      it 'loads the data and returns an array of Employee objects' do
        employees = HrTool::Loaders::EmployeeDataLoader.load_data(valid_file_path)
        expect(employees).to all(be_an(HrTool::Models::Employee))
        expect(employees.size).to eq(6)
        expect(employees.map(&:name)).to contain_exactly("Alan", "Alex", "David", "Jamie", "Martin", "Steve")
      end
    end

    context 'when the file does not exist' do
      it 'returns an empty array and prints an error message' do
        expect { HrTool::Loaders::EmployeeDataLoader.load_data(invalid_file_path) }
          .to output("Error: File not found at '#{invalid_file_path}'. Please check the file path and try again.\n")
          .to_stdout
      end
    end

    context 'when the file contains invalid JSON' do
      it 'returns an empty array and prints an error message' do
        expect { HrTool::Loaders::EmployeeDataLoader.load_data(invalid_json_file_path) }
          .to output("Error: The file at '#{invalid_json_file_path}' contains invalid JSON.\n")
          .to_stdout
      end
    end
  end
end
