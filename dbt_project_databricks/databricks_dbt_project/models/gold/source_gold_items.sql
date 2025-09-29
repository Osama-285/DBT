WITH dedup_query AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY updateDate DESC) as deduplicattion_id
    FROM
        {{ source('source','items')}}

)
SELECT
    id,name,category,updateDate
FROM
    dedup_query
WHERE 
    deduplicattion_id = 1