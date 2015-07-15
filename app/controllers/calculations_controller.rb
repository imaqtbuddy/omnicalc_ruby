class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ","").length

    @word_count = @text.split.count

    @occurrences = @text.split.count(@special_word)+ @text.split.count(@special_word.capitalize) + @text.split.count(@special_word.upcase) + @text.split.count(@special_word.downcase)
end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    @aprpct=@apr/100.to_f
    @monthly_apr=@aprpct/12.to_f
    @monthly_payment = (@monthly_apr + (@monthly_apr/((1+@monthly_apr)**(12*@years)-1)))* @principal
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending-@starting
    @minutes = @seconds/60.to_i
    @hours = @seconds/3600.to_i
    @days = @seconds/86400.to_i
    @weeks = @seconds/604800.to_i
    @years = @seconds/31449600.to_i
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max-@numbers.min

    @sorted_length=@sorted_numbers.length

    @median=2

    @sum = @numbers.sum

#I had trouble figuring out the last bottom most portion so I didn't want my code to error out. Perhaps we could cover some of the syntax around how to calculate these descriptive statistics? Thank you!


    # @mean = average(@numbers)

    # @variance = (@variance = @numbers.inject(0.0){|sum,x| sum+(x-@mean)**2}/@numbers.count

    # @standard_deviation = sqrt(@variance)

    # @mode = "Replace this string with your answer."
  end
end
