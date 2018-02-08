class ParseArg

  NB_ARGS = 4
  FLOAT = 'a float'
  INTEGER = 'an integer'
  FILE = 'a file'

  attr_reader :clean_arg

  def initialize(args)
      @args = args
      @clean_arg = {period: 0, index: 0, sd_dev: 0}
      error = false
      exit 84 unless is_correct_size?
      @args.each_with_index do | arg, index |
        if index == 0 or index == 3
          type = INTEGER
        elsif index == 1
          type = FLOAT
        else
          type = FILE
        end
        unless is_correct_type?(arg, type)
          STDERR.puts "Arguments #{index}: \"#{arg}\" must be #{type}\n"
          error = true
        end
        convert_arg(arg, index) unless error
      end
      exit 84 if error
  end

  private

  def convert_arg(arg, index)
    if index == 0
      @clean_arg[:period] = arg.to_i
    elsif index == 1
      @clean_arg[:sd_dev] = arg.to_f
    elsif index == 3
      @clean_arg[:index] = arg.to_i
    end
  end
  
  # Check if correct nb of argument is pass
  def is_correct_size?
    (@args.size == NB_ARGS) ? true : false
  end

  # Check if arg is correct type
  def is_correct_type?(arg, type)
    case type
      when FLOAT
        (arg.to_f != 0.0)
      when INTEGER
        (arg =~ /\A[-+]?[0-9]+\z/)
      when FILE
        File.file? arg
      else
        false
      end
  end

end