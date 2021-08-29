SELECT ROUND(AVG(score), 1) as avg
    , COUNT(score) as count
    , music_name
    FROM (SELECT
            CASE WHEN score >= 100 THEN 100
                ELSE score END
            , music_name
            FROM (
                SELECT c_m.music as music_id
                    , m.name as music_name
                    , u_m.tokuten as score
                    FROM singer as c_m
                    INNER JOIN createrlist as c ON c_m.creater = c.id
                    INNER JOIN musiclist as m ON m.id = c_m.music
                    INNER JOIN usermusic_tokuten as u_m ON u_m.music = m.id
                    WHERE c.name = '美郷あき') as d1
    ) as d2
    GROUP BY music_name
    ORDER BY ROUND(AVG(score), 1) DESC;

-- 任意のmusic_idに対して平均値を返すクエリ
SELECT avg(tokuten)
    FROM (SELECT
            CASE WHEN tokuten >= 100 THEN 100
                ELSE tokuten END
            FROM usermusic_tokuten
            WHERE music = 555) as sub



-- 3のmusic_idごとにscoreを付与
SELECT c_m.music as music_id
    , m.name as music_name
    , u_m.tokuten as score
    FROM singer as c_m
    INNER JOIN createrlist as c ON c_m.creater = c.id
    INNER JOIN musiclist as m ON m.id = c_m.music
    INNER JOIN usermusic_tokuten as u_m ON u_m.music = m.id
    WHERE c.name = '美郷あき'

-- 1, 2のINNER JOINとmusic_name -> 3
SELECT c_m.music as music_id
    , m.name as music_name
    FROM singer as c_m
    INNER JOIN createrlist as c ON c_m.creater = c.id
    INNER JOIN musiclist as m ON m.id = c_m.music
    WHERE c.name = '美郷あき'

-- 任意のcreater_idに対してmusic_idを返すクエリ -> 2
SELECT music as music_id
    FROM singer as c_m
    WHERE creater = 12413

-- 任意の歌手名からcreater_idを返すクエリ -> 1
SELECT id as creater_id
    FROM createrlist as c
    WHERE name = '美郷あき'


-- 美郷あきさんの曲のランキングが知りたい

misato_aki: 12413 from createrlist
DESIRE: 555 from musiclist
from usermusic_tokuten


usermusic_tokuten
    music_id
    user_id
    score

musiclist
    music_id
    music_name

gamelist
    game_id
    game_name
    game_median
    brand_name

game_music
    music_id
    game_id
    category

singer(music_creater)
    music_id
    creater_id

createrlist
    creater_id
    creater_name

