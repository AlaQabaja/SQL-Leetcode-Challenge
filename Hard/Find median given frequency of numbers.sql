-- Question 107
-- The Numbers table keeps the value of number and its frequency.

-- +----------+-------------+
-- |  Number  |  Frequency  |
-- +----------+-------------|
-- |  0       |  7          |
-- |  1       |  1          |
-- |  2       |  3          |
-- |  3       |  1          |
-- +----------+-------------+
-- In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

-- +--------+
-- | median |
-- +--------|
-- | 0.0000 |
-- +--------+
-- Write a query to find the median of all numbers and name the result as median.

-- Solution
with t1 as(
select *,
sum(frequency) over(order by number) as cum_sum, (sum(frequency) over())/2 as middle
from numbers)
select avg(number) as median
from t1
where middle between (cum_sum - frequency) and cum_sum


--t1
-- +----------+-------------+
-- |  Number  |  Frequency  |Cum_Sum |Middel | Filter (cum_sum - frequency)
-- +----------+-------------|        |
-- |  0       |  7          |7       | 6     | 0
-- |  1       |  1          |8       | 6     | 7
-- |  2       |  3          |11      | 6     | 8
-- |  3       |  1          |12      | 6     | 11
-- +----------+-------------+
