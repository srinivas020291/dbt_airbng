with reviews as (
    select * from {{ ref('stg_reviews') }}
),
listing as (
    select * from {{ ref('stg_listings') }}
)
select l.listing_id,
        l.name,
        count(r.Reviewer_name) as review_count,
        count(case when r.sentiment='POSITIVE' then 1 end) as positive_review_count,
        count(case when r.sentiment='NEGATIVE' then 1 end) as negative_review_count,    
        count(case when r.sentiment='NEUTRAL' then 1 end) as neutral_review_count
from listing l
left join reviews r
on l.listing_id = r.Listing_id
where l.listing_id is not null
  and l.name is not null
  and r.Reviewer_name is not null
group by l.listing_id, l.name
order by l.listing_id

