%dw 2.0
output application/json
var calculated = sum(payload.items map (i) -> i.quantity * i.unitPrice)
var diff = abs(calculated - payload.totalAmount)
---
{
  calculatedTotal: calculated,
  submittedTotal: payload.totalAmount,
  difference: diff,
  withinTolerance: diff <= (p('order.amount.tolerance') as Number)
}
