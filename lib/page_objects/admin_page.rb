# :nocov:
class AdminPage < PageObject
  form :currency_form, xpath: '//form[action^="/currency"]', distinctive: true
  field :value, id: 'currency_value', distinctive: true
end
