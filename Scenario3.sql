/*3. What are top 3 values of total invoice?*/

select * from invoice
order by total desc
limit 3
