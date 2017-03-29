require_relative 'dice'

class Generator
  def five_rolls
    extra_roll
    arr = []
    7.times do 
      arr.push(Dice.twenty_sides)
    end
      remove_two ? remove_from_set(arr) : 2.times{ remove_lowest(arr) }
    arr.sum < 55 ? five_rolls : arr
      extra_roll_second ? arr.push(25) : arr.push(Dice.twenty_sides)
  end

  private

  def extra_roll
    (1..7).cover?(Dice.thirty_sides) ? extra_roll_second : remove_two
  end

  def extra_roll_second
    (24..30).cover?(Dice.thirty_sides) ? true : false
  end

  def remove_from_set(set)
    remove_highest(set)
    remove_lowest(set)
    set
  end

  def remove_two
    false
  end

  def remove_lowest(arr)
    arr.delete_at(arr.index(arr.min))
  end

  def remove_highest(arr)
    arr.delete_at(arr.index(arr.max))
  end
end