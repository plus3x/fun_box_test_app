App.currency = App.cable.subscriptions.create "CurrencyChannel",
  received: (data)->

    console.log data

    $('#currency').replaceWith data.partial
