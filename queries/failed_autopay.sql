SELECT * 
FROM autopay_attempts 
WHERE attempted_at >= NOW() - INTERVAL '1 day' AND status = 'failed';