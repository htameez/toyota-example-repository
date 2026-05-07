SELECT 
    ca.account_id, 
    ca.customer_name, 
    ca.email, 
    ca.phone, 
    ap.attempted_at, 
    ap.amount, 
    ap.failure_reason
FROM 
    customer_accounts ca
JOIN 
    autopay_attempts ap ON ca.account_id = ap.account_id
WHERE 
    ap.status = 'failed'
    AND ap.attempted_at >= (NOW() - INTERVAL '1 day');