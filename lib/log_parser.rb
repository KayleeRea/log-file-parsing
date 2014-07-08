require 'line'
require 'date'

class LogParser
  def initialize(file_text)
    @dates = Hash.new { |h, k| h[k] = []}
    @severities = Hash.new { |h, k| h[k] = []}
    @lines = file_text.split("\n").map do |line|
      line = Line.new(line)
      @dates[line.date] << line
      @severities[line.severity] << line
      line
    end
  end

  def total_lines
    @lines.length
  end

  def covered_dates
    @dates.keys
  end

  def line_count_for_date(date)
    @dates[date].size
  end

  def severity_counts
    Hash[@severities.map { |k, v|
      [k, v.size]
    }]
  end

end