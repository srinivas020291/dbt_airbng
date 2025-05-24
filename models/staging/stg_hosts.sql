select ID,
        Name,
        case
            when is_superhost = 't' then true
            else false
        end as is_superhost,
        created_at,
        updated_at
from  {{ source('raw','raw_hosts') }}
