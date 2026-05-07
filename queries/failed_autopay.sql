SELECT 
    ca.account_id, 
    ca.customer_name, 
    ca.email, 
    ca.phone, 
    ap.attempted_at, 
    ap.amount, 
    ap.failure_reason
FROM 
    autopay_attempts ap
JOIN 
    customer_accounts ca ON ap.account_id = ca.account_id
WHERE 
    ap.status = 'failed' 
    AND ap.attempted_at >= NOW() - INTERVAL '24 HOURS';