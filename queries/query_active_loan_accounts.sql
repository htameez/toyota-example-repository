SELECT account_id, customer_id, days_past_due, outstanding_balance, last_payment_date, 
       CASE 
           WHEN days_past_due <= 30 THEN 'Low Risk' 
           WHEN days_past_due <= 60 THEN 'Medium Risk' 
           ELSE 'High Risk' 
       END AS risk_score, 
       CASE 
           WHEN days_past_due <= 30 THEN 'Send Reminder' 
           WHEN days_past_due <= 60 THEN 'Contact Customer' 
           ELSE 'Initiate Collections' 
       END AS recommended_action 
FROM active_loan_accounts 
WHERE status = 'active';