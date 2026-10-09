create database healthcare_portfolio
use healthcare_portfolio

CREATE TABLE patients (
    patient_id VARCHAR(10) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    Contact_number VARCHAR(20),
    address VARCHAR(255),
    registration_date DATE,
    insurance_provider VARCHAR(100),
    insurance_number VARCHAR(50),
    email VARCHAR(150),
    PRIMARY KEY (patient_id)
);

CREATE TABLE Doctors (
    doctor_id VARCHAR(10) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    years_experience INT,
    hospital_branch VARCHAR(100),
    email VARCHAR(100),
    dept_id VARCHAR(10),

    PRIMARY KEY (doctor_id)
);


CREATE TABLE Department (
    department_id VARCHAR(10) NOT NULL,
    department_name VARCHAR(100),
    hod_name VARCHAR(100),
    hod_doctor_id VARCHAR(10),

    PRIMARY KEY (department_id)
);

CREATE TABLE Appointment (
    appointment_id VARCHAR(10),
    patient_id VARCHAR(10),
    doctor_id VARCHAR(10),
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit VARCHAR(100),
    status VARCHAR(30),

    PRIMARY KEY (appointment_id)
);

CREATE TABLE Treatment (
    treatment_id VARCHAR(10),
    appointment_id VARCHAR(10),
    procedure_scans VARCHAR(100),
    description VARCHAR(255),
    cost DECIMAL(10,2),
    treatment_date DATE,

    PRIMARY KEY (treatment_id)
);

CREATE TABLE Billing (
    bill_id VARCHAR(10),
    patient_id VARCHAR(10),
    treatment_id VARCHAR(10),
    bill_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(30),

    PRIMARY KEY (bill_id)
);

CREATE TABLE Prescription (
    prescription_id VARCHAR(20),
    medication_id VARCHAR(10),
    medication_name VARCHAR(100),
    dose VARCHAR(50),
    frequency INT,
    instructions VARCHAR(255),

    PRIMARY KEY (prescription_id),

    UNIQUE (medication_id)
);

CREATE TABLE Medications (
    appointment_id VARCHAR(10),
    medication_id VARCHAR(10),
    medication_name VARCHAR(100),

    PRIMARY KEY (appointment_id, medication_id)
);

CREATE TABLE Diagnosis (
    diagnosis_id VARCHAR(10),
    appointment_id VARCHAR(10),
    procedure_scans VARCHAR(100),
    suggested_diagnosis VARCHAR(255),

    PRIMARY KEY (diagnosis_id)
);

CREATE TABLE Admission (
    admission_id VARCHAR(10),
    patient_id VARCHAR(10),
    admission_date DATE,
    discharge_date DATE,
    followup_date DATE,

    PRIMARY KEY (admission_id)
);

CREATE TABLE Payments (
    payment_id VARCHAR(10) NOT NULL,
    appointment_id VARCHAR(10),
    bill_id VARCHAR(10),
    payment_date DATE,
    amount DECIMAL(10,2),
    method VARCHAR(50),
    status VARCHAR(30),

    PRIMARY KEY (payment_id)
);

