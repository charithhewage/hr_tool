require 'spec_helper'
require 'rspec'
require 'hr_tool/models/employee'

RSpec.describe HrTool::Models::Employee do
  describe '#initialize' do
    it 'creates an employee with name, id, and manager_id' do
      employee = HrTool::Models::Employee.new("Alan", 100, 150)

      expect(employee.name).to eq("Alan")
      expect(employee.id).to eq(100)
      expect(employee.manager_id).to eq(150)
    end

    it 'requires an ID' do
      expect { HrTool::Models::Employee.new("Alan", nil) }.to raise_error(ArgumentError, "ID is required")
    end

    it 'sets manager_id to nil if not provided' do
      employee = HrTool::Models::Employee.new("Jamie", 150)

      expect(employee.name).to eq("Jamie")
      expect(employee.id).to eq(150)
      expect(employee.manager_id).to be_nil
    end
  end
end
