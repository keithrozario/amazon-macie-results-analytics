--Macie Job info with result status code and reason
--Replace table_name and jobid values before running

select classificationdetails.result.status.code, 
       classificationdetails.result.status.reason, 
       count(*) as total_count
from <table_name>
where classificationdetails.jobId = '<jobid>'
group by classificationdetails.result.status.code, 
         classificationdetails.result.status.reason;