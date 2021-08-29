SELECT ROUND(AVG(score), 1) as avg
    , COUNT(score) as count
    , music_name
    FROM (SELECT
            CASE WHEN score >= 100 THEN 100
                ELSE score END
            , music_name
            FROM (
                SELECT g_m.music as music_id
                    , m.name as music_name
                    , u_m.tokuten as score
                    FROM game_music as g_m
                    INNER JOIN gamelist as g ON g.id = g_m.game
                    INNER JOIN brandlist as b ON b.id = g.brandname
                    INNER JOIN musiclist as m ON m.id = g_m.music
                    INNER JOIN usermusic_tokuten as u_m ON u_m.music = g_m.music
                    WHERE b.brandname LIKE '%feng%') as d1
    ) as d2
    GROUP BY music_name
    HAVING COUNT(score) > 3
    ORDER BY ROUND(AVG(score), 1) DESC;

SELECT g_m.music as music_id
    , m.name as music_name
    , g.gamename as game_name
    FROM game_music as g_m
    INNER JOIN gamelist as g ON g.id = g_m.game
    INNER JOIN brandlist as b ON b.id = g.brandname
    INNER JOIN musiclist as m ON m.id = g_m.music
    WHERE b.brandname LIKE '%feng%'

-- 任意のmusic_idに対して平均値を返すクエリ
SELECT avg(tokuten)
    FROM (SELECT
            CASE WHEN tokuten >= 100 THEN 100
                ELSE tokuten END
            FROM usermusic_tokuten
            WHERE music = 7) as sub

-- for music_ids in game_ids
SELECT g_m.music as music_id
    , m.name as music_name
    , g.gamename as game_name
    FROM game_music as g_m
    INNER JOIN gamelist as g ON g.id = g_m.game
    INNER JOIN brandlist as b ON b.id = g.brandname
    INNER JOIN musiclist as m ON m.id = g_m.music
    WHERE b.brandname LIKE '%feng%'

-- 任意のgame_idに対してmusic_idを返すクエリ -> 3
SELECT music as music_id
    FROM game_music as g_m
    WHERE game = 20228

-- 任意のbrand_idに対してgame_idを返すクエリ -> 2
SELECT id as game_id
    FROM gamelist as g
    WHERE brandname = 702

-- 任意の歌手名からbrand_idを返すクエリ -> 1
SELECT id as brand_id
    FROM brandlist as b
    WHERE name LIKE '%feng%'

実行計画
brand_id from brandlist
702
game_id from gamelist where brandname = 702
20228
music_id from game_music where game = 20228
7, 8
score from usermusic_tokuten where music = 7


