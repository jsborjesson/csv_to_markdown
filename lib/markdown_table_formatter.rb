class MarkdownTableFormatter

  def initialize(grid, headers = true)
    @grid = grid
    insert_headers if headers
  end

  def to_s
    render_table
  end

  private

  def render_table
    @grid.reduce("") do |table, row|
      table + render_row(row)
    end
  end

  def render_row(row)
    "|" + align_row(row) + "|\n"
  end

  def align_row(row)
    row.each.with_index.map { |cell, index|
      align_cell(cell, index)
    }.join("|")
  end

  def align_cell(cell, column_index)
    " #{cell.ljust(column_widths[column_index])} "
  end

  def column_widths
    @column_widths ||= @grid.transpose.reduce([]) do |widths, column|
      widths << column.max_by(&:size).size
    end
  end

  def header_separator_array
    column_widths.map { |width| ":#{ '-' * (width - 1) }" }
  end

  def insert_headers
    @grid.insert(1, header_separator_array)
  end

end
