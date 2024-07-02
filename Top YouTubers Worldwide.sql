select * from youtuber;

-- 01. Find the top 10 YouTubers with the highest number of subscribers --
with cte as (
select Channel_Name ,
dense_rank() over(order by Subscribers desc) as rnk
from youtuber
)
select Channel_Name 
from cte
where rnk between 1 and 10;

-- 02. Calculate the average number of likes and comments per video for each category.round the average into 2 decimel points.

select Category, 
round(Avg(Average_Likes),2) as average_view, 
round(avg(Average_Comments),2) as average_comments
from youtuber
group by Category
order by Category;

-- 03 -- now the analyst wants to know which 5 country have the highest viewers so --Identify the top 5 countries with the highest average number of views

select country
from youtuber
group by country 
order by count(Average_Views) desc
limit 5;


-- 04 -- Find the distribution of content types among YouTubers in each category.return category total youtubers and their type of content.

select Category,
Content_type,
count(Channel_Name) as Total_youtubers
from youtuber
group by Category, Content_Type
order by Category, Total_youtubers desc;


-- 05 find out the 3 top category with the rate of highest engagement rate. here highest engagement rate means (likes + comments) / subscriber. round the result into 2 decimel points.

SELECT Category,
    round(AVG((Average_Likes + Average_Comments) / Subscribers),2) AS Engagement_Rate_Per_Subscriber
FROM youtuber
GROUP BY Category
ORDER BY Engagement_Rate_Per_Subscriber DESC
LIMIT 3;

-- 06. -- Find the top 5 categories with the highest average number of subscribers
select Category, count(Subscribers) as total_subscribers
from youtuber
group by Category
order by count(Subscribers) desc
limit 5;


-- 07.Calculate the total number of subscribers in each country

select Country, count(Subscribers)as total_sbscribers
from youtuber
group by country
order by total_sbscribers desc;


-- 08 -- Which three YouTube channel have the highest engagement rate, calculated by combining the number of likes and comments they receive per video?
SELECT Channel_Name,
    round(AVG((Average_Likes + Average_Comments) / Average_Views),2) AS highest_Engagement_Rate
FROM youtuber
GROUP BY Channel_Name
ORDER BY highest_Engagement_Rate DESC
LIMIT 3;

-- 09 -- What is the average number of views per subscriber for each YouTube category. round the result into 3 decimel points.
select Category,
round(Avg(Average_Views/Subscribers),3) as Avg_Views_Per_Subscriber
from youtuber
group by category;

-- 10 -- Calculate the total number of subscribers and average views for each country in the "Animation" category

Select round(sum(Subscribers),2) as Total_Subscribers,
round(sum(Average_Views),2) as total_views
from youtuber
where Category = 'Animation';

-- 11 -- Determine the total number of YouTubers in each category

select Category, count(Channel_Name) as no_of_youtubers
from youtuber
group by Category
order by no_of_youtubers desc;

-- 12 -- Find the average number of subscribers for YouTubers in the "Daily vlogs" category from each country

select Avg(Subscribers) as average_subscribers
from youtuber
where Category = 'Daily vlogs';

-- 13-- Calculate the total number of subscribers for YouTubers whose average views are greater than 5 million:

select Channel_Name,sum(Subscribers) as total_subscribers
from youtuber
where Average_Views > '5.0 M'
group by Channel_Name
order by total_subscribers desc;


-- 14 -- Identify the top 3 countries with the highest average number of subscribers per video.

select Country,
round(Avg(Subscribers/Average_views),2) as Avg_Subscribers_Per_Video
from youtuber
group by Country
order by Avg_Subscribers_Per_Video desc
limit 3;

















