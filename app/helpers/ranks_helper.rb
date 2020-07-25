module RanksHelper
  def return_trophy_path(n)
    case n
    when 0
      "golden_trophy.svg"
    when 1
      "silver_trophy.svg"
    when 2
      "bronze_trophy.svg"
    end
  end
end
