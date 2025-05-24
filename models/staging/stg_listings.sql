select ID as Listing_id,
        Listing_url,
        initcap(Name) as Name,
        upper(room_type) as room_type,
        minimum_nights,
        host_id,
        replace(price, '$')::int as price,
        created_at,
        updated_at
from  {{ source('raw','raw_listings') }}