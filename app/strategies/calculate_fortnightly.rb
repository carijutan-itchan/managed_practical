class CalculateFortnightly < FrequencyStrategy

  def calculate(rent, rent_changes)
    payment_dates = []

    current_date = Date.parse(rent.rent_start_date)
    end_date = Date.parse(rent.rent_end_date)

    # rent date range iteration
    while current_date <= end_date # Check if the current date is within the date range
      payment_date = apply_payment_method(current_date, rent.payment_method)

      if rent_changes.present?
        effective_date = Date.parse(rent_changes[:effective_date])
        amount = (current_date <= effective_date ? rent.rent_amount : rent_changes[:rent_amount])
        payment_dates << { date: payment_date.strftime("%Y-%m-%d"), amount:, payment_method: (rent.payment_method || 'instant') }
      else
        payment_dates << { date: payment_date.strftime("%Y-%m-%d"), amount: rent.rent_amount, payment_method: (rent.payment_method || 'instant') }
      end
      
      break if (current_date + 13.days) >= end_date

      week_end = current_date + 13.days
      current_date = week_end + 1
    end

    payment_dates
  end

  private

  def apply_payment_method(week_end, payment_method)
    case payment_method
    when 'credit_card'
      week_end + 2.days
    when 'bank_transfer'
      week_end + 3.days
    else
      week_end
    end
  end
end