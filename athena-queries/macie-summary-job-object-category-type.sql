--Macie job info showing job, object, data category, detection count and number of occurances

select classificationdetails.jobId, 
       resourcesaffected.s3object.key, 
       sensitive_data.category, 
       detections_data.type, 
       cast(detections_data.count as INT) total_detections
from scotward_macie_data_discovery, 
     unnest(classificationdetails.result.sensitiveData) as t(sensitive_data),
     unnest(sensitive_data.detections) as t(detections_data)
where classificationdetails.result.sensitiveData is not null
and resourcesaffected.s3object.embeddedfiledetails is null
order by total_detections desc