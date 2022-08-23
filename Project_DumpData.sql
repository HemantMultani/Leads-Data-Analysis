-- Cleaning the data
UPDATE sample_lead_dump
SET lead_status = NULL
WHERE lead_status != 'Verified';

UPDATE sample_lead_dump
SET form_initiated = IF(form_initiated = 1, 1, NULL), 
	paid_applications = IF(paid_applications = 1, 1, NULL);


-- Lead Origin wise Analysis
SELECT lead_origin,
	COUNT(name) AS total_leads,
    COUNT(lead_status) AS verified_leads,
    COUNT(form_initiated) AS form_initiated,
    COUNT(paid_applications) AS paid_applications,
    ROUND(COUNT(lead_status)*100/COUNT(name), 2) AS verification_percentage,
    ROUND(COUNT(form_initiated)*100/COUNT(lead_status), 2) AS FI_from_VL,
    ROUND(COUNT(paid_applications)*100/COUNT(lead_status), 2) AS PA_from_VL
FROM sample_lead_dump
GROUP BY lead_origin;


-- Course wise Analysis
SELECT course,
	COUNT(name) AS total_leads,
    COUNT(lead_status) AS verified_leads,
    COUNT(form_initiated) AS form_initiated,
    COUNT(paid_applications) AS paid_applications,
    ROUND(COUNT(lead_status)*100/COUNT(name), 2) AS verification_percentage,
    ROUND(COUNT(form_initiated)*100/COUNT(lead_status), 2) AS FI_from_VL,
    ROUND(COUNT(paid_applications)*100/COUNT(lead_status), 2) AS PA_from_VL
FROM sample_lead_dump
GROUP BY course;