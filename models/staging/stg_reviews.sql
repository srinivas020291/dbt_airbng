select Listing_id,
        Date::date as date,
        Reviewer_name,
        initcap(Comments) as Comments,
        upper(sentiment) as sentiment
from {{ source('raw','raw_reviews') }}
