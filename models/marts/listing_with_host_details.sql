with listing as (
    select * from {{ ref('stg_listings')}}
),
hosts as(
    select * from  {{ ref('stg_hosts')}}    
)
select l.Listing_id,
       l.Name,
       l.minimum_nights,
       l.host_id,
       l.price,
       l.created_at as listing_created_at,
       l.updated_at as listing_updated_at,
       h.Name as host_name,
       h.is_superhost,
       h.created_at as host_created_at,
       h.updated_at as host_updated_at
from listing l
left join hosts h
on l.host_id = h.ID
where l.Listing_id is not null
  and h.ID is not null
  and l.Listing_url is not null
  and l.Name is not null
  and l.room_type is not null
  and l.minimum_nights is not null
  and l.price is not null