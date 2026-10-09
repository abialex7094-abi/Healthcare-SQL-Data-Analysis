
-- TABLE VERIFICATION OF NULL VALUES --

SELECT COUNT(*) AS total_patients 
 FROM patients;

SELECT COUNT(DISTINCT patient_id) AS unique_patient_ids 
 FROM patients;

SELECT COUNT(*) AS missing_patient_ids
 FROM patients
WHERE patient_id IS NULL OR patient_id = '';

SELECT DISTINCT a.patient_id
FROM (
    SELECT patient_id FROM appointment
    UNION
    SELECT patient_id FROM billing
    UNION
    SELECT patient_id FROM admission
) a
LEFT JOIN patients p ON p.patient_id = a.patient_id
WHERE p.patient_id IS NULL;

-- CHECKING MISMATCHING IDS  AND CREATING FOREIGN KEYS WITH OTHER TABLES--

SELECT patient_id
FROM appointment
WHERE patient_id NOT IN (
    SELECT patient_id FROM patients
);

SELECT patient_id
FROM billing
WHERE patient_id NOT IN (
    SELECT patient_id FROM patients
);

SELECT patient_id
FROM admission
WHERE patient_id NOT IN (
    SELECT patient_id FROM patients
);

ALTER TABLE appointment
ADD CONSTRAINT fk_appointment_patient
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);

SELECT doctor_id
FROM appointment
WHERE doctor_id NOT IN (
    SELECT doctor_id
    FROM doctors
);

ALTER TABLE appointment
ADD CONSTRAINT fk_appointment_doctor
FOREIGN KEY (doctor_id)
REFERENCES doctors(doctor_id);

SELECT appointment_id
FROM treatment
WHERE appointment_id NOT IN (
    SELECT appointment_id
    FROM appointment
);

ALTER TABLE treatment
ADD CONSTRAINT fk_treatment_appointment
FOREIGN KEY (appointment_id)
REFERENCES appointment(appointment_id);


SELECT patient_id
FROM billing
WHERE patient_id NOT IN (
    SELECT patient_id
    FROM patients
);

SELECT treatment_id
FROM billing
WHERE treatment_id NOT IN (
    SELECT treatment_id
    FROM treatment
);

ALTER TABLE billing
ADD CONSTRAINT fk_billing_patient
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);

ALTER TABLE billing
ADD CONSTRAINT fk_billing_treatment
FOREIGN KEY (treatment_id)
REFERENCES treatment(treatment_id);

SELECT appointment_id
FROM medications
WHERE appointment_id NOT IN (
    SELECT appointment_id
    FROM appointment
);

ALTER TABLE medications
ADD CONSTRAINT fk_medications_appointment
FOREIGN KEY (appointment_id)
REFERENCES appointment(appointment_id);

ALTER TABLE medications
ADD CONSTRAINT uq_medications_medication_id
UNIQUE (medication_id);

SELECT appointment_id
FROM diagnosis
WHERE appointment_id NOT IN (
    SELECT appointment_id
    FROM appointment
);

ALTER TABLE diagnosis
ADD CONSTRAINT fk_diagnosis_appointment
FOREIGN KEY (appointment_id)
REFERENCES appointment(appointment_id);

SELECT patient_id
FROM admission
WHERE patient_id NOT IN (
    SELECT patient_id
    FROM patients
);

ALTER TABLE admission
ADD CONSTRAINT fk_admission_patient
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);

SELECT appointment_id
FROM payments
WHERE appointment_id NOT IN (
    SELECT appointment_id
    FROM appointment
);

SELECT bill_id
FROM payments
WHERE bill_id NOT IN (
    SELECT bill_id
    FROM billing
);

ALTER TABLE payments
ADD CONSTRAINT fk_payments_billing
FOREIGN KEY (bill_id)
REFERENCES billing(bill_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payments_appointment
FOREIGN KEY (appointment_id)
REFERENCES appointment(appointment_id);

-- Final Verification of Table Structures and Constraints--


-- VERIFICATION --

DESCRIBE doctors;
DESCRIBE appointment;
DESCRIBE treatment;
DESCRIBE billing;
DESCRIBE medications;
DESCRIBE prescription;
DESCRIBE diagnosis;
DESCRIBE admission;
DESCRIBE payments;

SHOW CREATE TABLE medications;
SHOW CREATE TABLE appointment;
SHOW CREATE TABLE admission;
SHOW CREATE TABLE billing;
SHOW CREATE TABLE diagnosis;

-- DATA VALIDATION --

SELECT 'patients' AS table_name, COUNT(*) AS record_count FROM patients
UNION ALL
SELECT 'doctors', COUNT(*) FROM doctors
UNION ALL
SELECT 'appointments', COUNT(*) FROM appointment
UNION ALL
SELECT 'billing', COUNT(*) FROM billing
UNION ALL
SELECT 'treatment', COUNT(*) FROM treatment
UNION ALL
SELECT 'department', COUNT(*) FROM department
UNION ALL
SELECT 'diagnosis', COUNT(*) FROM diagnosis
UNION ALL
SELECT 'medications', COUNT(*) FROM medications
UNION ALL
SELECT 'prescription', COUNT(*) FROM prescription
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'admission', COUNT(*) FROM admission;

-- CHECKING NULL VALUES --

SELECT
    COUNT(*) AS total_rows,
    SUM(patient_id IS NULL) AS patient_id_nulls,
    SUM(first_name IS NULL) AS first_name_nulls,
    SUM(last_name IS NULL) AS last_name_nulls,
    SUM(gender IS NULL) AS gender_nulls,
    SUM(Contact_number IS NULL) AS contact_number_nulls,
    SUM(email IS NULL) AS email_nulls,
    SUM(address IS NULL) AS address_nulls,
    SUM(insurance_number IS NULL) AS insurance_number_nulls,
    SUM(insurance_provider IS NULL) AS insurance_provider_nulls,
    SUM(registration_date IS NULL) AS registration_date_nulls
FROM patients;

SELECT
    patient_id,
    COUNT(*) AS occurrence_count
FROM patients
GROUP BY patient_id
HAVING COUNT(*) > 1;

SELECT a.patient_id
FROM appointment a
LEFT JOIN patients p
    ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT a.doctor_id
FROM appointment a
LEFT JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE d.doctor_id IS NULL;

SELECT a.patient_id
FROM admission a
LEFT JOIN patients p
    ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT b.patient_id
FROM billing b
LEFT JOIN patients p
    ON b.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT b.treatment_id
FROM billing b
LEFT JOIN treatment t
    ON b.treatment_id = t.treatment_id
WHERE t.treatment_id IS NULL;

