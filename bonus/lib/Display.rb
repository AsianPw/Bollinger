module Display

  def self.input(input_data)
    printf("INPUT\nIndex: %i\n", input_data[:index])
    printf("Period: %i\n", input_data[:period])
    printf("SD_coef: %.2f\n\n", input_data[:sd_dev])
  end

  def self.output(output_data)
    printf("OUTPUT\n")
    printf("MA: %.2f\n", output_data[:mov_average])
    printf("SD: %.2f\n", output_data[:st_dev])
    printf("B+: %.2f\n", output_data[:high_b])
    printf("B-: %.2f\n", output_data[:lower_b])
  end

end