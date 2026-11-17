-- Useful queries for the job application tracker

-- 1. All applications with company name, newest first
SELECT a.id, c.name AS company, a.role, a.applied_on, a.status
FROM applications a
JOIN companies c ON c.id = a.company_id
ORDER BY a.applied_on DESC;

-- 2. How many applications are in each status
SELECT status, COUNT(*) AS total
FROM applications
GROUP BY status
ORDER BY total DESC;

-- 3. Applications still waiting for a first response (status 'Applied')
SELECT c.name AS company, a.role, a.applied_on,
       CAST(julianday('now') - julianday(a.applied_on) AS INTEGER) AS days_waiting
FROM applications a
JOIN companies c ON c.id = a.company_id
WHERE a.status = 'Applied'
ORDER BY a.applied_on;

-- 4. Upcoming interviews
SELECT i.interview_date, c.name AS company, a.role, i.round, i.notes
FROM interviews i
JOIN applications a ON a.id = i.application_id
JOIN companies c ON c.id = a.company_id
WHERE i.interview_date >= date('now')
ORDER BY i.interview_date;

-- 5. Companies you applied to more than once
SELECT c.name AS company, COUNT(*) AS applications
FROM applications a
JOIN companies c ON c.id = a.company_id
GROUP BY c.name
HAVING COUNT(*) > 1;

-- 6. Share of applications that got past the first stage (Interview or Offer)
SELECT ROUND(100.0 * SUM(CASE WHEN status IN ('Interview', 'Offer') THEN 1 ELSE 0 END)
             / COUNT(*), 1) AS success_percent
FROM applications;

-- 7. Number of interviews per application
SELECT c.name AS company, a.role, COUNT(i.id) AS interview_count
FROM applications a
JOIN companies c ON c.id = a.company_id
LEFT JOIN interviews i ON i.application_id = a.id
GROUP BY a.id
ORDER BY interview_count DESC;
