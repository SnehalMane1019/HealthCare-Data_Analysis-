use etlhive;
SELECT * FROM etlhive.healthcare;
-- 1. Retrieve the names of all patients in thedatabase.
select Name from healthcare;
-- 2. List the unique medical conditions present in the dataset.
select distinct(Medical_Condition) from healthcare;
-- 3. Find the total number of doctors in the healthcare system.
select count(Doctor) from healthcare;
select count(distinct(Doctor)) from healthcare;
-- 4. Retrieve the details of all female patients.
select * from healthcare where gender='Female';
-- 5. what is the average age of patients in the database.
select avg(age) from healthcare;
-- 6. Identify the patients who have more than one medical condition.
select count(distinct Medical_Condition) as condition_count,name
from healthcare group by Name having condition_count>1;
-- 7. List the names of all doctors.
select distinct(doctor) from healthcare;
-- 8.Identify the most common medical condition among patients.
select max(Medical_Condition) from healthcare;
select Medical_Condition,count(*) as medicalCount from healthcare
group by Medical_Condition 
order by medicalCount limit 1;
-- 9.Find the patients who are older than 60 years and have diabetes.
select * from healthcare where age>60 and Medical_Condition='diabetes';
-- 10.Calculate the total revenue generated by the healthcare system.
select sum(Billing_Amount)as Revenue from healthcare;
-- 11.Find the doctor with the oldest patient.
SELECT name, MAX(age) AS max_patient_age
FROM healthcare
GROUP BY name
ORDER BY max_patient_age DESC
LIMIT 1;
-- 12.Calculate the average duration of medical visits.
Select avg(DATEDIFF(Discharge_Date, Date_of_Admission)) AS avg_duration from healthcare;
-- 13.Give the names of patients whose name starts with A.
select name from healthcare where name like 'a%';
-- 14.How many male and female patients are there in dataset.
select count(gender),gender from healthcare group by gender;
-- 15.how many patients are normal.
select count(Test_Results),Test_Results from healthcare where Test_Results='normal';
-- 16.how many patients are abnormal or Inconclusive.
select count(Test_Results),Test_Results from healthcare group by Test_Results;
-- 17.how many patients of blood group AB+ are there of age above 52.
select count(Blood_Type),Blood_Type from healthcare where Blood_Type='AB+' and age>52;
-- 18. how many patients have paid the bill above 24890.
select count(Billing_Amount) from healthcare where Billing_Amount>24890;
-- 19. what are the names of patients having Asthma.
select name,Medical_Condition from healthcare where Medical_Condition='Asthma';
-- 20. how many patients have cancer.
select count(Medical_Condition),Medical_Condition from healthcare where Medical_Condition='cancer';
-- 21. what are the names and blood groups of patients admitted to room no. 292.
select name,Blood_Type,Room_Number from healthcare where Room_Number=292;
-- 22. how many males have Arthritis.
select count(gender),Medical_Condition,gender from healthcare where Medical_Condition='Arthritis'  and gender='male';
-- 23. How many patients were admitted to Harris and Sons hospital.
select count(Hospital) from healthcare where Hospital='Harris and Sons';
-- 24. what are the names of patients whose Insurance Provider are Cigna.
select name,Insurance_Provider from healthcare  where Insurance_Provider='Cigna';
-- 25. Name the Medical Condition having patients whose ages is greater than average age.
select name,age,Medical_Condition from healthcare where age>(select avg(age) from healthcare); 