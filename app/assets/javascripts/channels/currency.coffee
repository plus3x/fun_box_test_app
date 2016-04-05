App.currency = App.cable.subscriptions.create "CurrencyChannel",
  received: (currency_view)->
    $('#currency').replaceWith currency_view
