module MovingAverage

  def self.compute(data, period, start)
    batch = data.values_at start-period...start
    sum = 0.0
    batch.each do | value |
      sum += value.to_f
    end
    return (sum / period).to_f
  end


end
