SELECT * 
FROM autopay_attempts 
WHERE status = 'failed' 
AND attempted_at >= NOW() - INTERVAL '24 hours';