create database Hospital_insights
go

select * from appointments

select* from billing

select * from doctors

select* from patients

select* from treatments

 --Patients by gender---
Select Gender,Count(*) As'Distribution of gender'
From patients
Group by gender

---Count of appointments as status--
Select status,Count(*) As Status_count
From appointments 
Group by status

---Doctor cancellation and no show analysis(KPI)
With doctor_appointments as(
select
doctor_id,
count(*) as total_appointments,
sum(case when status='Completed' then 1 else 0 end) as completed_counts,
sum(case when status='Scheduled' then 1 else 0 end) as scheduled_counts,
sum(case when status='No-show' then 1 else 0 end) as no_show_counts,
sum(case when status='Cancelled' then 1 else 0 end) as cancelled_counts
from appointments
group by doctor_id
)
select
da.doctor_id,
CONCAT(d.first_name,'',d.last_name) as full_name,
total_appointments,
completed_counts,
scheduled_counts,
no_show_counts,
cancelled_counts,
round((cast(completed_counts as float) /total_appointments) *100,2) as completion_rate,
round((cast(scheduled_counts as float) /total_appointments) *100,2) as scheduling_rate,
round((cast(no_show_counts as float) /total_appointments) *100,2) as no_show_rate,
round((cast(cancelled_counts as float) /total_appointments) *100,2) as cancellation_rate
from doctor_appointments as da
join doctors as d
on da.doctor_id=d.doctor_id
order by total_appointments desc

--Status for all the treatments where status is not completed
select
t.treatment_id,
t.treatment_type,
b.payment_method,
b.payment_status
from treatments as t
left join billing as b
on t.treatment_id=b.treatment_id
where b.payment_status in ('pending','failed')

---Doctor experience vs cost--
select
d.doctor_id,
concat(d.first_name,'',d.last_name) as full_name,
d.years_experience,
d.specialization,
round(sum(cast(t.cost as decimal(10,2))),2) as total_revenue,
round(avg(cast(t.cost as decimal(10,2))),2) as avg_revenue
from doctors as d
inner join appointments as a
on d.doctor_id=a.doctor_id
inner join treatments as t
on a.appointment_id=t.appointment_id
where d.years_experience> 20
group by
d.doctor_id,
d.first_name,
d.last_name,
d.years_experience,
d.specialization
order by years_experience desc

--- Revenue on monthly basis--(KPI)
select
month(bill_date) as Month,
format(bill_date,'MMM-yyyy') as MonthYear,
round(sum(cast(amount as decimal(10,2))),2) as Total_revenue
from billing
group by
month(bill_date),
format (bill_date,'MMM-yyyy')
order by Month

---sorting out the month year--
select
month(bill_date) as Month,
format(bill_date,'MMM-yyyy') as MonthYear,
round(sum(cast(amount as decimal(10,2))),2) as Total_revenue
from billing
group by
month(bill_date),
format (bill_date,'MMM-yyyy')
order by Month

--- Appointments per doctor by hospital branch--
select
d.hospital_branch,
round(
cast(count(a.appointment_id)as float)
/count(distinct d.doctor_id),2) as appointments_per_doctor
from appointments as a
inner join doctors as d
on a.doctor_id=d.doctor_id
group by d.hospital_branch

---Revenue by Specalization--
SELECT
    d.specialization,
    ROUND(SUM(CAST(b.amount AS DECIMAL(10,2))),2) AS Revenue
FROM doctors as d
JOIN appointments as a
    ON d.doctor_id = a.doctor_id
JOIN treatments as t
    ON a.appointment_id = t.appointment_id
JOIN billing as b
    ON t.treatment_id = b.treatment_id
GROUP BY d.specialization
ORDER BY Revenue DESC;

--- Patient total revenue value with ranking--
with patient_revenue as(
select
p.patient_id,
concat(p.first_name,' ',p.last_name) as full_name,
round(sum(cast(b.amount as decimal (10,2))),2) as patient_ltr,
count(distinct a.appointment_id) as total_visits
from patients as p
join appointments as a
on p.patient_id=a.patient_id
join billing as b
on a.patient_id=b.patient_id
group by p.patient_id,
p.first_name,
p.last_name
)
select patient_id,
full_name,total_visits,
patient_ltr,
rank()over(order by patient_ltr desc) as revenue_rank
from patient_revenue
order by patient_ltr desc

---Total revenue generated--
select round(sum(amount),2) as total_revenue
from billing

---Top 5 most common treatment types---
select top 5 treatment_type,
count(*) as count_of_treatment
from treatments
group by treatment_type
order by count_of_treatment desc






