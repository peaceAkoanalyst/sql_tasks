select "account_name", sum("total") as "sum_total", "day_of_week"
from
(select "account_name", "total", "date", "weekday",
case when "weekday" = 0 then 'Sunday'
     when "weekday" = 1 then 'Monday'
	 when "weekday" = 2 then 'Tuesday'
	 when "weekday" = 3 then 'Wednesday'
	 when "weekday" = 4 then 'Thursday'
	 when "weekday" = 5 then 'Friday'
	 else 'Saturday' end as "day_of_week"
from
(select "account_name", "total", "date", extract(dow from "date") "weekday"
from
(select a.name "account_name", o.total_amt_usd "total", o.occurred_at "date"
from "accounts" a 
join "orders_tables" o
on a.id = o.account_id) as table_one) as table_two)as table_three
where "day_of_week" = 'Saturday'
group by "account_name", "day_of_week"
order by "sum_total" desc;
