-- Job Application Tracker: database structure (SQLite)

CREATE TABLE companies (
    id      INTEGER PRIMARY KEY,
    name    TEXT NOT NULL UNIQUE,
    city    TEXT
);

CREATE TABLE applications (
    id          INTEGER PRIMARY KEY,
    company_id  INTEGER NOT NULL REFERENCES companies(id),
    role        TEXT NOT NULL,
    applied_on  DATE NOT NULL,
    status      TEXT NOT NULL CHECK (status IN ('Applied', 'Interview', 'Offer', 'Rejected', 'No response')),
    source      TEXT
);

CREATE TABLE interviews (
    id              INTEGER PRIMARY KEY,
    application_id  INTEGER NOT NULL REFERENCES applications(id),
    interview_date  DATE NOT NULL,
    round           TEXT,
    notes           TEXT
);
