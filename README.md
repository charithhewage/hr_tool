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

## Installation

To install the necessary dependencies, please run:

```bash
bundle install
```

## Usage
```bash
bin/hr_tool.rb [File Path]
```

## Testing with RSpec
```bash
rspec
```


## Development

Feel free to contribute to this project. If you have suggestions or improvements, please create a pull request or open an issue.

