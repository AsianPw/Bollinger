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

end