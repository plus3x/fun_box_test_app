# :nocov:
require_relative 'partials/currency_partial'

class AdminPage < PageObject
  include CurrencyPartial

  form :currency_form, xpath: '//form[starts-with(@action,"/currenc")]', distinctive: true
  field :value, id: 'currency_value'
  select :to_year,   id: 'currency_to_1i'
  select :to_month,  id: 'currency_to_2i'
  select :to_day,    id: 'currency_to_3i'
  select :to_hour,   id: 'currency_to_4i'
  select :to_minute, id: 'currency_to_5i'
  button :submit, type: 'submit'

  def to=(datetime)
    datetime = Time.zone.parse(datetime)

    to_year_element.select   datetime.year
    to_month_element.select  datetime.strftime('%B')
    to_day_element.select    datetime.day
    to_hour_element.select   format('%02d', datetime.hour)
    to_minute_element.select format('%02d', datetime.min)
  end

  def to
    Time.new(to_year_element.value,
             to_month_element.value,
             to_day_element.value,
             to_hour_element.value,
             to_minute_element.value).in_time_zone
  end
end
