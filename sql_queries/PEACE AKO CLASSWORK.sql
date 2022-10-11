
---- first question-------------------
select "account_name",  sum("total_amount") "total_amount"
from
(select a.name "account_name", o.occurred_at, o.total_amt_usd "total_amount"
from accounts a
join orders_tables o
on a.id = o.account_id
where o.occurred_at between ('2015-01-01') and ('2016-12-31')) as "table_one"
group by "account_name"
order by "total_amount" desc;

--second question--
select count(channel) "direct_sales"
from web_events
where channel = 'direct' and occurred_at  between ('2015-01-01') and ('2016-12-31');

--third question--

select "channel", sum("total") "sum_total"
from
(select w.channel "channel", o.occurred_at, o.total_amt_usd "total"
from orders_tables o
join web_events w
on o.account_id = w.account_id
where o.occurred_at between ('2015-01-01') and ('2016-12-31')) as table_one
group by "channel"
order by "sum_total" desc;