require_relative 'Data'

module MovingAverage
  extend GetData

  def self.compute(data, period)
    sum = 0.0
    data.each do | value |
      sum += value.to_f
    end
    return (sum / period).to_f
  end

  def self.compute_standard_dev(data)
    mean = 0.0
    data.each do | value |
      mean += value
    end
    mean = mean / data.size
    sum = 0.0
    data.each do | value |
      sum += ( value - mean )**2
    end
    Math.sqrt(sum / data.size)
  end

  def self.compute_band(moving_average, standard_dev, coef_sd, lower)
    (lower ? moving_average - ( standard_dev * coef_sd ) : moving_average + ( standard_dev * coef_sd ))
  end

end

