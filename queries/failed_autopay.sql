SELECT
    ca.account_id,
    ca.customer_name,
    ca.email,
    ca.phone,
    aa.attempted_at,
    aa.amount,
    aa.failure_reason
FROM
    customer_accounts ca
JOIN
    autopay_attempts aa ON ca.account_id = aa.account_id
WHERE
    aa.status = 'failed'
    AND aa.attempted_at >= NOW() - INTERVAL '1 day';