# HrTool: Organisational Chart

HrTool is a simple demonstration of the employee hierarchy based on a given dataset.

## Problem Summary

Below is the employee data for a small company. It represents the hierarchical relationship among employees. The CEO of the company does not have a manager.

| Employee Name | ID   | Manager ID |
|---------------|------|------------|
| Alan          | 100  | 150        |
| Martin        | 220  | 100        |
| Jamie         | 150  |            |
| Alex          | 275  | 100        |
| Steve         | 400  | 150        |
| David         | 190  | 400        |

Design a suitable representation of this data. You can choose any database (RDBMS, in-memory database, etc.), file system, or even a data structure like a list or map. Then, write code (in any language and framework) that displays the organizational hierarchy as follows:

| Jamie         |           |            |
|---------------|-----------|------------|
|               | Alan      |            |
|               |           | Martin     |
|               |           | Alex       |
|               | Steve     |            |
|               |           | David      |

The result can be displayed on the console, an HTML page, or even in a file—whatever suits you. 

Be sure to cover all possible scenarios, such as employees with no managers and managers who are not valid employees.

## Solution

The solution is a Ruby application built as a console application. To solve the issue, I have used the Depth First Search (DFS) graph algorithm to traverse the hierarchy and display it in a structured format.

## Usage

This project is written in Ruby programing language. You can simply clone this project to your development computer and run with your own commands. I recommend, you should have installed Ruby 2.2.2 or higher version in your computer. If you have already installed Ruby in your computer, Use the following command to check the version.

```
$ ruby -v
```

If you don’t have installed Ruby in your computer, see [these instructions](https://www.ruby-lang.org/en/documentation/installation/) on ruby-lang.org

### Clone the project
```
$ git clone git@github.com:charithhewage/hr_tool.git
$ cd ~/hr_tool
```


### Install gem dependencies
```
$ bundle install
```

### Run unit & integration tests
```
$ bundle exec rspec
```

### Run the application
To run the application, use the following command:
```
$ ruby ./bin/hr_tool.rb
```

You can also run the application with sample data files:
```
$ ruby ./bin/hr_tool.rb ./data/employees.json
```
Please note that the input data must be in JSON format.

## Development

Feel free to contribute to this project. If you have suggestions or improvements, please create a pull request or open an issue.

