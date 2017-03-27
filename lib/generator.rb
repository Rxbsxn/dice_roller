require_relative 'dice'

class Generator
  def five_rolls
    arr = []
    7.times do 
      arr.push(Dice.twenty_sides)
    end
    remove_from_set(arr)
  end

  private

  def remove_from_set(set)
    remove_highest(set)
    remove_lowest(set)
    set
  end

  def remove_lowest(arr)
    arr.delete(arr.min)
  end

  def remove_highest(arr)
    arr.delete(arr.max)
  end
end