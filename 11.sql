/* Q11: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

with Customer_with_country as
(
	select customer.customer_id, first_name, last_name, billing_country, sum(total) as total_spending, 
	ROW_NUMBER() over(PARTITION BY billing_country ORDER BY sum(total) desc) as RowNo
	from invoice
	join customer on customer.customer_id = invoice.customer_id
	group by 1,2,3,4
	order by 4 asc, 5 desc
)
select * from Customer_with_country where RowNo <= 1