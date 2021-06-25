require 'csv'

class BaseRepository
  def initialize(filepath)
    @filepath = filepath
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@filepath)
  end

  def all
    @elements
  end

  def create(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    store_csv
  end

  def find(element_id)
    @elements.find { |element| element.id == element_id }
  end

  def remove(element)
    @elements.delete(element)
    store_csv
  end

  def edit(element)
    store_csv
  end

  private

  def load_csv(child_class)
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@filepath, csv_options) do |row|
      @elements << child_class.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def store_csv
    CSV.open(@filepath, 'wb') do |csv|
      csv << @elements.last.iv_names #["id", "name"]
      @elements.each do |item|
      csv << item.iv_values
      end
    end
  end

end
