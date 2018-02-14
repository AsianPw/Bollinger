module GetData

  def self.get_data_from(file)
    content = []
    File.open(file, "r") do |infile|
      while (line = infile.gets)
        content << line.to_f
      end
    end
    content
  end

  def self.create_batch(end_index, period, data)
    data.values_at end_index-period+1..end_index
  end
    
end