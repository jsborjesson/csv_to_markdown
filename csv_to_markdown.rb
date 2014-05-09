require 'csv'
require './lib/markdown_table_formatter'

class CsvToMarkdown
  def initialize(input)
    @input = input
  end

  def to_s
    MarkdownTableFormatter.new(as_array).to_s
  end

  private
  def as_array
    CSV.new(@input).to_a
  end
end

if $0 == __FILE__
  puts CsvToMarkdown.new(ARGF).to_s
end
