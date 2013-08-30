require 'open-uri'
require 'wunderground'
require 'erb'


	@w_api = Wunderground.new("a00a673d4ceba9c5")
	# @weather_data = @w_api.forecast_for("WA","Spokane")
	@weather_data = @w_api.forecast_for("Canada","Calgary")



	simpleForecast = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][0]

	weatherforFourDaysFourNights = @weather_data.values_at("forecast")[0].values_at("txt_forecast")[0].values_at("forecastday")[0]

	@day1 =weatherforFourDaysFourNights[0]
	@night1 =weatherforFourDaysFourNights[1]
	@day2 =weatherforFourDaysFourNights[2]
	@night2 =weatherforFourDaysFourNights[3]
	@day3 =weatherforFourDaysFourNights[4]
	@night3 =weatherforFourDaysFourNights[5]
	@day4 =weatherforFourDaysFourNights[6]
	@night4 =weatherforFourDaysFourNights[7]

	# @weather_data['forecast'].first['simpleforecast']
	puts simpleForecast['date']['tz_long']

	@dateInformation_Day1 = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][0].values_at("date")[0]
	@dateInformation_Day2 = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][1].values_at("date")[0]
	@dateInformation_Day3 = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][2].values_at("date")[0]
	@dateInformation_Day4 = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][3].values_at("date")[0]

	@icon_url_Day1 = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][0].values_at("icon_url")[0]
	@icon_url_Day2 = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][1].values_at("icon_url")[0]
	@icon_url_Day3 = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][2].values_at("icon_url")[0]
	@icon_url_Day4 = @weather_data.values_at("forecast")[0].values_at("simpleforecast")[0].values_at("forecastday")[0][3].values_at("icon_url")[0]

	@weekday_Day1 = @dateInformation_Day1.values_at("weekday")[0]
	@month_Day1 = @dateInformation_Day1.values_at("monthname")[0]
	@day_Day1 = @dateInformation_Day1.values_at("day")[0]

	@highTemperature_celsius = simpleForecast.values_at("high")[0].values_at("celsius")[0]
	@lowTemperature_celsius = simpleForecast.values_at("low")[0].values_at("celsius")

	
	

	html_template = File.read('index.erb.html')
	erb_result = ERB.new( html_template ).result

	File.open('index.html', 'w') { |file| file.write(erb_result) }
