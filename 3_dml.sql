-- 1. Register a New User
-- Adds a new user to the users table
INSERT INTO public.users (username, email, password_hash)
VALUES ('newuser123', 'newuser@example.com', 'example_hashed_pw');

-- 2. Update User Profile
UPDATE public.users
SET email = 'updated_email@example.com',
    username = 'updated_username'
WHERE user_id = 5;

-- 3. Create a New Post
INSERT INTO public.posts (user_id, title, content)
VALUES (3, 'My First Blog Post', 'This is the content of my very first blog post!');

-- 4. List All Posts (Newest First)
-- Retrieves all posts ordered by creation_date descending
SELECT 
    p.title, 
    p.content, 
    u.username
FROM public.posts p
JOIN public.users u ON p.user_id = u.user_id
ORDER BY p.creation_date DESC;

-- 5. List All Posts by Popularity (Most Commented First)
SELECT 
    p.title, 
    u.username, 
    COUNT(c.comment_id) AS comment_count
FROM public.posts p
JOIN public.users u ON p.user_id = u.user_id
LEFT JOIN public.comments c ON p.post_id = c.post_id
GROUP BY p.post_id, u.username
ORDER BY comment_count DESC;

-- 6. Delete a Specific Post
-- Deletes a post by its ID (e.g., post_id = 10)
DELETE FROM public.posts
WHERE post_id = 10;

-- 7. Add a New Comment
-- Adds a comment to a specific post by a user
INSERT INTO public.comments (post_id, user_id, comment_content)
VALUES (3, 4, 'This is a comment on post 3 by user 4');

-- 8. Retrieve Comments for a Post
SELECT 
    c.comment_content, 
    c.comment_date, 
    u.username
FROM public.comments c
JOIN public.users u ON c.user_id = u.user_id
WHERE c.post_id = 3
ORDER BY c.comment_date ASC;

-- 9. Delete a Specific Comment
DELETE FROM public.comments
WHERE comment_id = 15;

-- 10. List Posts by a User
-- Retrieves posts written by a specific user (e.g., username = 'bjohnson')
SELECT 
    p.title, 
    p.content, 
    u.username
FROM public.posts p
JOIN public.users u ON p.user_id = u.user_id
WHERE u.username = 'bjohnson';

-- 11. Search Posts by Keyword
-- Finds posts where title or content contains the word 'technology'
SELECT 
    p.title, 
    p.content, 
    u.username
FROM public.posts p
JOIN public.users u ON p.user_id = u.user_id
WHERE p.title ILIKE '%technology%' OR p.content ILIKE '%technology%';

-- 12. List Posts by Category
-- Lists all posts in a specific category (e.g., 'Technology')
SELECT 
    p.title, 
    cat.category_name
FROM public.posts p
JOIN public."postCategories" pc ON p.post_id = pc.post_id
JOIN public.categories cat ON pc.category_id = cat.category_id
WHERE cat.category_name = 'Technology';
