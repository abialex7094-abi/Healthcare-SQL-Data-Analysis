
 -- BASIC LEVEL (Q1 - Q30) --
 
-- Q1. Display all patient records.

SELECT * 
  FROM patients;

-- Q2. Display patient ID, first name, last name, gender and registration date.

SELECT patient_id, 
  first_name,
  last_name, 
  gender, 
  registration_date 
FROM patients;

-- Q3. Find all male patients.

SELECT * 
  FROM patients 
WHERE gender = 'M';

-- Q4. Find all female patients.

SELECT * 
  FROM patients 
WHERE gender = 'F';

-- Q5. Find patients registered after 1 June 2023.

SELECT * 
  FROM patients 
WHERE registration_date > '2023-06-01';

-- Q6. Find patients having HealthIndia insurance.

SELECT * 
  FROM patients
WHERE insurance_provider = 'HealthIndia';

-- Q7. Find patients whose first name starts with A.

SELECT * 
  FROM patients
WHERE first_name LIKE 'A%';

-- Q8. Find patients whose last name contains 'a'.

SELECT * 
  FROM patients 
WHERE last_name LIKE '%a%';

-- Q9. Find patients whose email belongs to Gmail.

SELECT * 
  FROM patients 
WHERE email LIKE '%@gmail.com';

-- Q10. Find patients who don't have an insurance provider.

SELECT * 
  FROM patients 
WHERE insurance_provider IS NULL;

-- Q11. Display all appointments.

SELECT * 
 FROM appointment;

-- Q12. Find completed appointments.

SELECT * 
 FROM appointment  
WHERE status = 'Completed';

-- Q13. Find cancelled appointments.

SELECT * 
  FROM appointment 
WHERE status = 'Cancelled';

-- Q14. Find no-show appointments.

SELECT *
   FROM appointment
WHERE status = 'No-show';

-- Q15. Find emergency appointments.

SELECT *
  FROM appointment
 WHERE reason_for_visit = 'Emergency';

-- Q16. Find appointments after 5 September 2023.

SELECT * 
  FROM appointment 
WHERE appointment_date > '2023/09/05';

-- Q17. Find total number of appointments.

SELECT COUNT(*) AS total_appointments 
 FROM appointment;

-- Q18. Count appointments by status.

SELECT status,
   COUNT(*) AS appointment_count 
FROM appointment
GROUP BY status;

-- Q19. Count appointments by reason for visit.

SELECT reason_for_visit, 
  COUNT(*) AS appointment_count 
FROM appointment 
GROUP BY reason_for_visit;

-- Q20. Find the earliest appointment date.

SELECT MIN(appointment_date) AS earliest_appointment 
 FROM appointment;

-- Q21. Display all doctors with specialization.

SELECT doctor_id,
  first_name, 
  last_name, 
  specialization 
FROM doctors;

-- Q22. Find doctors with more than 15 years of experience.

SELECT * FROM doctors
  WHERE years_experience > 15;

-- Q23. Count total doctors.

SELECT COUNT(*) AS total_doctors
  FROM doctors;

-- Q24. Count doctors by specialization.

SELECT specialization, 
 COUNT(*) AS doctor_count 
FROM doctors 
GROUP BY specialization;

-- Q25. Find average doctor experience.

SELECT AVG(years_experience) AS avg_experience 
 FROM doctors;

-- Q26. Find maximum treatment cost.

SELECT MAX(cost) AS maximum_treatment_cost
  FROM treatment;

-- Q27. Find minimum treatment cost.

SELECT MIN(cost) AS minimum_treatment_cost
  FROM treatment;

-- Q28. Find average treatment cost.

SELECT AVG(cost) AS average_treatment_cost
 FROM treatment;

-- Q29. Find total billing amount.

SELECT SUM(amount) AS total_billing_amount 
 FROM billing;

-- Q30. Count bills by payment status.

SELECT payment_status,
 COUNT(*) AS bill_count 
FROM billing
GROUP BY payment_status;


-- INTERMEDIATE — Q31 to Q60 -(JOINs + GROUP BY + HAVING + business analysis)

-- Q31. Display appointments with patient names.

SELECT
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.appointment_date,
    a.status
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id;
    
-- Q32. Display appointment, patient and doctor details.

SELECT
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.appointment_date,
    a.status
FROM appointment a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id;

-- Q33. Display doctors with department names.

SELECT
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialization,
    dep.Department_name
FROM doctors d
JOIN department dep
    ON d.dept_id = dep.Department_id;
    
-- Q34. Display patients who have at least one appointment.

SELECT DISTINCT
    p.patient_id,
    p.first_name,
    p.last_name
FROM patients p
JOIN appointment a
    ON p.patient_id = a.patient_id;
    
-- Q35. Find patients who never had an appointment.

SELECT
    p.patient_id,
    p.first_name,
    p.last_name
FROM patients p
LEFT JOIN appointment a
    ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

-- Q36. Display treatment with patient name.

SELECT
    t.treatment_id,
    t.procedure_scans,
    t.cost,
    t.treatment_date,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name
FROM treatment t
JOIN appointment a
    ON t.appointment_id = a.appointment_id
JOIN patients p
    ON a.patient_id = p.patient_id;
    
-- Q37. Display bills with patient name.

SELECT
    b.bill_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    b.treatment_id,
    b.amount,
    b.payment_status
FROM billing b
JOIN patients p
    ON b.patient_id = p.patient_id;
    
-- Q38. Display payment details with bill amount.

SELECT
    pay.payment_id,
    pay.bill_id,
    pay.amount AS payment_amount,
    b.amount AS bill_amount,
    b.payment_status
FROM payments pay
JOIN billing b
    ON pay.bill_id = b.bill_id;

-- Q39. Display medications associated with appointments.

SELECT
    m.appointment_id,
    m.medication_id,
    m.medication_name
FROM medications m
JOIN appointment a
    ON m.appointment_id = a.appointment_id;
    
-- Q40. Display admitted patients.

SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    ad.admission_date,
    ad.discharge_date
FROM admission ad
JOIN patients p
    ON ad.patient_id = p.patient_id;
    
-- Q41. Find number of appointments handled by each doctor.

SELECT
    doctor_id,
    COUNT(*) AS appointment_count
FROM appointment
GROUP BY doctor_id;

-- Q42. Find completed appointments handled by each doctor.

SELECT
    doctor_id,
    COUNT(*) AS appointment_count
FROM appointment
GROUP BY doctor_id;

-- Q43. Find doctors who handled more than 10 appointments.

SELECT
    doctor_id,
    COUNT(*) AS appointment_count
FROM appointment
GROUP BY doctor_id
HAVING COUNT(*) > 10;

-- Q44. Find number of appointments by department.

SELECT
    d.dept_id,
    dep.Department_name,
    COUNT(*) AS appointment_count
FROM appointment a
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN department dep
    ON d.dept_id = dep.Department_id
GROUP BY d.dept_id, dep.Department_name;

-- Q45. Find total treatment cost by procedure.

SELECT
    procedure_scans,
    SUM(cost) AS total_cost
FROM treatment
GROUP BY procedure_scans;

-- Q46. Find average treatment cost by procedure.

SELECT
    procedure_scans,
    AVG(cost) AS average_cost
FROM treatment
GROUP BY procedure_scans;

-- Q47. Count treatments by procedure.

SELECT
    procedure_scans,
    COUNT(*) AS treatment_count
FROM treatment
GROUP BY procedure_scans;


-- Q48. Find total billing amount by payment method.

SELECT
    payment_method,
    SUM(amount) AS total_amount
FROM billing
GROUP BY payment_method;

-- Q49. Find total billing amount by payment status.

SELECT
    payment_status,
    SUM(amount) AS total_amount
FROM billing
GROUP BY payment_status;

-- Q50. Find number of patients by insurance provider.

SELECT
    insurance_provider,
    COUNT(*) AS patient_count
FROM patients
GROUP BY insurance_provider;

-- Q51. Find doctor with the highest number of completed appointments.

SELECT
    doctor_id,
    COUNT(*) AS completed_appointments
FROM appointment
WHERE status = 'Completed'
GROUP BY doctor_id
ORDER BY completed_appointments DESC
LIMIT 1;

-- Q52. Find the most frequently used treatment procedure.

SELECT
    procedure_scans,
    COUNT(*) AS treatment_count
FROM treatment
GROUP BY procedure_scans
ORDER BY treatment_count DESC
LIMIT 1;

-- Q53. Find the most common reason for visiting.

SELECT
    reason_for_visit,
    COUNT(*) AS visit_count
FROM appointment
GROUP BY reason_for_visit
ORDER BY visit_count DESC
LIMIT 1;

-- Q54. Find average treatment cost by appointment status.

SELECT
    a.status,
    AVG(t.cost) AS average_treatment_cost
FROM treatment t
JOIN appointment a
    ON t.appointment_id = a.appointment_id
GROUP BY a.status;


-- Q55. Find total revenue from paid bills.

SELECT
    SUM(amount) AS paid_revenue
FROM billing
WHERE payment_status = 'Paid';

-- Q56. Find total amount from pending bills.

SELECT
    SUM(amount) AS pending_amount
FROM billing
WHERE payment_status = 'Pending';

-- Q57. Find patients who have both appointments and billing records.

SELECT DISTINCT
    p.patient_id,
    p.first_name,
    p.last_name
FROM patients p
JOIN appointment a
    ON p.patient_id = a.patient_id
JOIN billing b
    ON p.patient_id = b.patient_id;
    
-- Q58. Find appointments having treatment but no diagnosis.

SELECT
    t.appointment_id
FROM treatment t
LEFT JOIN diagnosis d
    ON t.appointment_id = d.appointment_id
WHERE d.diagnosis_id IS NULL;

-- Q59. Find appointments having medications.

SELECT DISTINCT
    a.appointment_id
FROM appointment a
JOIN medications m
    ON a.appointment_id = m.appointment_id;
    
-- Q60. Find average doctor experience by department.

SELECT
    dep.Department_name,
    AVG(d.years_experience) AS avg_experience
FROM doctors d
JOIN department dep
    ON d.dept_id = dep.Department_id
GROUP BY dep.Department_name;

-- Advanced level---

-- Q61. Find patients whose total billing is greater than the average patient billing.

SELECT
    patient_id,
    SUM(amount) AS total_billing
FROM billing
GROUP BY patient_id
HAVING SUM(amount) >
(
    SELECT AVG(total_amount)
    FROM
    (
        SELECT
            patient_id,
            SUM(amount) AS total_amount
        FROM billing
        GROUP BY patient_id
    ) x


-- Q62. Find doctors who handled more appointments than the average doctor.

SELECT
    doctor_id,
    COUNT(*) AS appointment_count
FROM appointment
GROUP BY doctor_id
HAVING COUNT(*) >
(
    SELECT AVG(doctor_count)
    FROM
    (
        SELECT
            doctor_id,
            COUNT(*) AS doctor_count
        FROM appointment
        GROUP BY doctor_id
    ) x
);

-- Q63. Find treatments costing more than the average treatment cost.

SELECT *
FROM treatment
WHERE cost >
(
    SELECT AVG(cost)
    FROM treatment
);

-- Q64. Find the most expensive treatment for each procedure.

SELECT
    t.*
FROM treatment t
WHERE t.cost =
(
    SELECT MAX(t2.cost)
    FROM treatment t2
    WHERE t2.procedure_scans = t.procedure_scans
);

-- Q65. Find patients with more than one appointment.

SELECT
    patient_id,
    COUNT(*) AS appointment_count
FROM appointment
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- Q66. Find doctors who handled more than one type of visit reason.

SELECT
    doctor_id,
    COUNT(DISTINCT reason_for_visit) AS reason_count
FROM appointment
GROUP BY doctor_id
HAVING COUNT(DISTINCT reason_for_visit) > 1;

-- Q67. Find patients with both admission and billing records.

SELECT DISTINCT
    p.patient_id,
    p.first_name,
    p.last_name
FROM patients p
JOIN admission ad
    ON p.patient_id = ad.patient_id
JOIN billing b
    ON p.patient_id = b.patient_id;
    
-- Q68. Find admitted patients who have no appointment.

SELECT DISTINCT
    ad.patient_id
FROM admission ad
LEFT JOIN appointment a
    ON ad.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

-- Q69. Find treatments whose cost is greater than the average cost of that same procedure.

SELECT
    t.*
FROM treatment t
WHERE t.cost >
(
    SELECT AVG(t2.cost)
    FROM treatment t2
    WHERE t2.procedure_scans = t.procedure_scans
);

-- Q70. Find department with the highest average doctor experience.

SELECT
    dep.Department_name,
    AVG(d.years_experience) AS avg_experience
FROM doctors d
JOIN department dep
    ON d.dept_id = dep.Department_id
GROUP BY dep.Department_name
ORDER BY avg_experience DESC
LIMIT 1;

-- Window Functions--

-- Q71. Rank doctors by completed appointments.

SELECT
    doctor_id,
    completed_appointments,
    RANK() OVER (
        ORDER BY completed_appointments DESC
    ) AS doctor_rank
FROM
(
    SELECT
        doctor_id,
        COUNT(*) AS completed_appointments
    FROM appointment
    WHERE status = 'Completed'
    GROUP BY doctor_id
) x;

-- Q72. Rank doctors within each department by experience.

SELECT
    doctor_id,
    first_name,
    last_name,
    dept_id,
    years_experience,
    RANK() OVER (
        PARTITION BY dept_id
        ORDER BY years_experience DESC
    ) AS experience_rank
FROM doctors;

-- Q73. Find top 3 doctors by completed appointments.

WITH doctor_stats AS
(
    SELECT
        doctor_id,
        COUNT(*) AS completed_appointments
    FROM appointment
    WHERE status = 'Completed'
    GROUP BY doctor_id
),
ranked AS
(
    SELECT
        *,
        DENSE_RANK() OVER (
            ORDER BY completed_appointments DESC
        ) AS rnk
    FROM doctor_stats
)
SELECT *
FROM ranked
WHERE rnk <= 3;

-- Q74. Find top 3 most expensive treatments.

SELECT *
FROM
(
    SELECT
        t.*,
        DENSE_RANK() OVER (
            ORDER BY cost DESC
        ) AS rnk
    FROM treatment t
) x
WHERE rnk <= 3;

-- Q75. Calculate running treatment cost.

SELECT
    treatment_id,
    treatment_date,
    cost,
    SUM(cost) OVER (
        ORDER BY treatment_date, treatment_id
    ) AS running_total
FROM treatment;

-- Q76. Calculate cumulative billing amount.

SELECT
    bill_id,
    bill_date,
    amount,
    SUM(amount) OVER (
        ORDER BY bill_date, bill_id
    ) AS cumulative_billing
FROM billing;

-- Q77. Number each appointment for every patient.

SELECT
    appointment_id,
    patient_id,
    appointment_date,
    ROW_NUMBER() OVER (
        PARTITION BY patient_id
        ORDER BY appointment_date, appointment_time
    ) AS appointment_number
FROM appointment;

-- Q78. Find each patient's first appointment.

WITH ranked_appointments AS
(
    SELECT
        a.*,
        ROW_NUMBER() OVER (
            PARTITION BY patient_id
            ORDER BY appointment_date, appointment_time
        ) AS rn
    FROM appointment a
)
SELECT *
FROM ranked_appointments
WHERE rn = 1;

-- Q79. Find each patient's latest appointment.

WITH ranked_appointments AS
(
    SELECT
        a.*,
        ROW_NUMBER() OVER (
            PARTITION BY patient_id
            ORDER BY appointment_date DESC, appointment_time DESC
        ) AS rn
    FROM appointment a
)
SELECT *
FROM ranked_appointments
WHERE rn = 1;

-- Q80. Find the second appointment of every patient.

WITH ranked_appointments AS
(
    SELECT
        a.*,
        ROW_NUMBER() OVER (
            PARTITION BY patient_id
            ORDER BY appointment_date, appointment_time
        ) AS rn
    FROM appointment a
)
SELECT *
FROM ranked_appointments
WHERE rn = 2;

-- REAL-TIME BUSINESS ANALYSIS--

-- Q81. Calculate appointment status percentages.

SELECT
    status,
    COUNT(*) AS appointment_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM appointment),
        2
    ) AS percentage
FROM appointment
GROUP BY status;

-- Q82. Calculate no-show rate for each doctor.

SELECT
    doctor_id,
    COUNT(CASE WHEN status = 'No-show' THEN 1 END) AS no_show_count,
    COUNT(*) AS total_appointments,
    ROUND(
        COUNT(CASE WHEN status = 'No-show' THEN 1 END)
        * 100.0 / COUNT(*),
        2
    ) AS no_show_rate
FROM appointment
GROUP BY doctor_id;

-- Q83. Find doctors whose no-show rate is above the hospital average.

WITH doctor_rates AS
(
    SELECT
        doctor_id,
        ROUND(
            COUNT(CASE WHEN status = 'No-show' THEN 1 END)
            * 100.0 / COUNT(*),
            2
        ) AS no_show_rate
    FROM appointment
    GROUP BY doctor_id
)
SELECT *
FROM doctor_rates
WHERE no_show_rate >
(
    SELECT
        COUNT(CASE WHEN status = 'No-show' THEN 1 END)
        * 100.0 / COUNT(*)
    FROM appointment
);

-- Q84. Calculate total billed, paid, pending and failed amounts.

SELECT
    SUM(amount) AS total_billed,
    SUM(CASE
        WHEN payment_status = 'Paid'
        THEN amount ELSE 0
    END) AS paid_amount,
    SUM(CASE
        WHEN payment_status = 'Pending'
        THEN amount ELSE 0
    END) AS pending_amount,
    SUM(CASE
        WHEN payment_status = 'Failed'
        THEN amount ELSE 0
    END) AS failed_amount
FROM billing;

-- Q85. Calculate payment-method contribution to total billing.

SELECT
    payment_method,
    SUM(amount) AS method_amount,
    ROUND(
        SUM(amount) * 100.0 /
        (SELECT SUM(amount) FROM billing),
        2
    ) AS contribution_percentage
FROM billing
GROUP BY payment_method;

-- Q86. Find department generating the highest treatment revenue.

SELECT
    dep.Department_name,
    SUM(t.cost) AS total_treatment_revenue
FROM treatment t
JOIN appointment a
    ON t.appointment_id = a.appointment_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN department dep
    ON d.dept_id = dep.Department_id
GROUP BY dep.Department_name
ORDER BY total_treatment_revenue DESC
LIMIT 1;

-- Q87. Find top 5 patients by total billing.

SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    SUM(b.amount) AS total_billing
FROM patients p
JOIN billing b
    ON p.patient_id = b.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
ORDER BY total_billing DESC
LIMIT 5;

-- Q88. Find patients with multiple appointments but no completed appointment.

SELECT
    patient_id,
    COUNT(*) AS appointment_count
FROM appointment
GROUP BY patient_id
HAVING COUNT(*) > 1
   AND SUM(status = 'Completed') = 0;
   
-- Q89. Calculate average hospital stay.

SELECT
    AVG(
        DATEDIFF(discharge_date, admission_date)
    ) AS average_stay_days
FROM admission
WHERE discharge_date IS NOT NULL;

-- Q90. Create a complete patient-level healthcare summary.

SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,

    COUNT(DISTINCT a.appointment_id) AS total_appointments,

    COUNT(DISTINCT CASE
        WHEN a.status = 'Completed'
        THEN a.appointment_id
    END) AS completed_appointments,

    COUNT(DISTINCT CASE
        WHEN a.status = 'No-show'
        THEN a.appointment_id
    END) AS no_show_appointments,

    COUNT(DISTINCT ad.admission_id) AS total_admissions,

    COALESCE(SUM(DISTINCT t.cost), 0) AS total_treatment_cost,

    COALESCE(SUM(DISTINCT b.amount), 0) AS total_billed_amount,

    COALESCE(SUM(DISTINCT pay.amount), 0) AS total_payments

FROM patients p

LEFT JOIN appointment a
    ON p.patient_id = a.patient_id

LEFT JOIN admission ad
    ON p.patient_id = ad.patient_id

LEFT JOIN treatment t
    ON a.appointment_id = t.appointment_id

LEFT JOIN billing b
    ON p.patient_id = b.patient_id

LEFT JOIN payments pay
    ON b.bill_id = pay.bill_id

GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name;
