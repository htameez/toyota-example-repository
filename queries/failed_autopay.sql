SELECT
    a.account_id,
    a.customer_name,
    a.email,
    a.phone,
    ap.attempted_at,
    ap.failure_reason
FROM
    customer_accounts a
JOIN
    autopay_attempts ap ON a.account_id = ap.account_id
WHERE
    ap.status = 'failed' AND
    ap.attempted_at >= NOW() - INTERVAL '24 HOURS';
