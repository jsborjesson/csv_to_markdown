require 'minitest/autorun'
require_relative '../lib/markdown_table_formatter'

describe MarkdownTableFormatter do
  let(:array) { [["Year", "Make", "Model"], ["1997", "Ford", "E350"], ["2000", "Mercury", "Cougar"]] }
  subject { MarkdownTableFormatter.new(array) }

  it 'formats an array as a table' do
    subject.to_s.must_equal <<TABLE
| Year | Make    | Model  |
| :--- | :------ | :----- |
| 1997 | Ford    | E350   |
| 2000 | Mercury | Cougar |
TABLE
  end

  it 'calculates column widths' do
    subject.send(:column_widths).must_equal [4, 7, 6]
  end
end
