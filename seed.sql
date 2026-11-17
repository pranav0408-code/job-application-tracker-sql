-- Sample data (fictional companies) for testing the queries

INSERT INTO companies (id, name, city) VALUES
    (1, 'Acme Networks', 'Pune'),
    (2, 'Nimbus Software', 'Mumbai'),
    (3, 'Brightline Telecom', 'Bengaluru'),
    (4, 'Vertex AI Labs', 'Pune');

INSERT INTO applications (id, company_id, role, applied_on, status, source) VALUES
    (1, 1, 'Network Operations Executive', '2026-10-01', 'Interview', 'LinkedIn'),
    (2, 2, 'Junior Cyber Security Analyst', '2026-10-05', 'Rejected', 'Company website'),
    (3, 3, 'Customer Service Executive', '2026-10-12', 'Applied', 'Naukri'),
    (4, 4, 'AI/ML Intern', '2026-10-20', 'Applied', 'Referral'),
    (5, 1, 'Junior Cyber Security Analyst', '2026-11-02', 'No response', 'LinkedIn'),
    (6, 2, 'Data Analyst Trainee', '2026-11-08', 'Offer', 'Company website');

INSERT INTO interviews (id, application_id, interview_date, round, notes) VALUES
    (1, 1, '2026-11-20', 'Technical round', 'Questions on TCP/IP and DNS'),
    (2, 1, '2026-11-25', 'HR round', NULL),
    (3, 6, '2026-11-01', 'Final round', 'Discussed SQL and reporting');
