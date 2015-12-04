require 'test_helper'

class ApproveProjectsControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

 #  test "it should print the message" do
 #  	adjustment = nil

 #  	date = Date.new(2013, 3, 20)
	# next_anniversary = Date.new(Date.today.year, date.month, date.day)
	# six_months  = next_anniversary.advance(:months => 6)

	# puts "Six months #{six_months}"
	# puts "Anni #{next_anniversary}"

	# if Date.today > six_months
	# 	puts "After"
	# 	adjustment = next_anniversary
	# elsif Date.today > next_anniversary
	# 	puts "After 6m"
	# 	adjustment = six_months
	# else

	# end
 #  end

  test "Ahmed's Algorithm" do
  	# calc_month = nil

    date = Date.new(2013, 12, 10) #current date

    if date.year < 2010
      date = Date.new(2010, 1, 1)
    end

    next_anniversary = Date.new(Date.today.year, date.month, date.day)
    six_months = next_anniversary.advance(:months => 6)

    puts "Six months #{six_months}"
    puts "Anniversary #{next_anniversary}"

    if Date.today > six_months
      puts 'Grant Date is After the Six Months Anniversary'
      calc_month = Date.new(six_months.year, six_months.month, 1)
    else
      puts 'Grant Date is Before the Six Months Anniversary'
      calc_month = Date.new(six_months.year - 1, six_months.month, 1)
      # Why is isn't there a retreat method!?
    end

    puts "Ahmed Result = #{calc_month}"
  end

  test "Joe's Algorithm" do
  	calc_month = nil
  	six_months = Date.new

  	install_month =  Date.new(2009, 9, 3)

    if install_month.year < 2010
      install_month = Date.new(2010,1,1)
    end

  	if install_month.month <= 6 
  		calc_month = install_month
  	else
  		calc_month = install_month.advance(:months => 6)
  	end

  	if Date.today.month >= calc_month.month && Date.today.month <= calc_month.advance(:months => 6).month
  		six_months = Date.new(six_months.year, calc_month.month, six_months.day)
  	else
  		six_months = calc_month.advance(:months => 6)
  	end

  	if Date.today.month > 6
  		calc_month = Date.new(Date.today.year, calc_month.month, 1)
  	elsif calc_month.month == six_months.month 
  		calc_month = Date.new(Date.today.year, calc_month.month, 1)
  	else
  		calc_month = Date.new(Date.today.year -1, calc_month.month, 1)
  	end

  	puts "Original Result = #{calc_month}"

  end

end
