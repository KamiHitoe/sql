
# エロゲーマーのためのSQL

批評空間はまだまだ検索性を向上できる！と考えた有志の会

## 目次

1. テーブル一覧の確認
2. 基本文法のおさらい
3. ブランド別エ□ゲソングランキングSQLの作成


## 1. テーブル一覧の確認

まず批評空間のDBに登録されているテーブル一覧を確認していきましょう。

```sql
SELECT tablename, tableowner
    FROM pg_tables
    WHERE tableowner <> 'postgres';
```

批評空間が使っているDBMSはPostgreSQLで、上記のコードはpg_tablesというpostgreのシステムカタログから、テーブル名とそのオーナーを表示するものとなっています。
tableownerがpostgresとなっているものは管理用のテーブルなので除外しています。
結果の一部を以下に表示します。


```
tablename	tableowner
userreview_lastrun	ap2
homepagelist	ap2
arrangement	ap2
books_favorite	ap2
povgroups_lastrun	ap2
sections_access_log	ap2
sections_create_image_list	ap2
sections_arrangement	ap2
users_profile	ap2
login_log	ap2
sections_tag	ap2
sections_access_log	ap2
users	ap2
sections_create_image_list	ap2
login_log	ap2
sections_tag	ap2
amazon_data	ap2
sections_access_log	ap2
sections_create_image_list	ap2
author	ap2
genre	ap2
item	ap2
```

## 2. 基本文法のおさらい

では、適当なテーブルに対してSQLを実行してみましょう。
まず、ブランド情報が記載されたbrandlistというテーブルに対して上位5件を取得してみましょう。
検索上位から検索数を指定するには**LIMIT**を使います。
また、SELECT * というのは、全部の列を取得するという意味になります。

```sql
SELECT *
    FROM brandlist
    LIMIT 5;
```

結果
```
id	brandname	brandfurigana	makername	makerfurigana	url	checked	kind	lost	directlink	median	http_response_code	twitter	twitter_data_widget_id	notes	erogetrailers	cien
5843	Renyl	レニル				f	CIRCLE	f	t	65					18410	
59	xyz	エクシーズ	有限会社グランブルー	グランブルー			CORPORATION	t	t	60					1692	
67	emu	エミュー					CORPORATION	t	f	61					517	
69	eLia	エリア	株式会社テイジイエル	テイジイエル			CORPORATION	t	t	29					524	
70	elf	エルフ	株式会社エルフ	エルフ			CORPORATION	t	t	78	200				161	
```

うーん、あまり馴染みのないブランドが多かったですかね。

では、取得する行を指定してみましょう。
brandnameが'feng'の行を取得します。
行に条件を指定するには、**WHERE**を使います。

```sql
SELECT *
    FROM brandlist
    WHERE brandname = 'feng';
```

```
id	brandname	brandfurigana	makername	makerfurigana	url	checked	kind	lost	directlink	median	http_response_code	twitter	twitter_data_widget_id	notes	erogetrailers	cien
702	feng	フォン			http://www.feng.jp/		CORPORATION	t	f	73	200	ueeeeeee	320167016461910018		31	
```

fengね。フォンって読むんですけど、めちゃめちゃ良い曲多いんすわぁ
堀江晶太さんの作曲楽曲が多いんすけど、良いっすわぁ…………

では、そんなfengが提供しているゲームを表示していきましょう。

ゲームの情報が格納されているテーブルはgamelistなので、今度はそちらにSQLを叩いてみましょう。

```sql
SELECT *
    FROM gamelist
    LIMIT 5;
```

```
id	gamename	furigana	sellday	brandname	median	stdev	creater	kansouurl	checked	hanbaisuu	average2	median2	count2	comike	shoukai	model	checked2	erogame	galge	elfics	banner_url	admin_checked	max2	min2	gyutto_enc	gyutto_id	dmm	dmm_genre	dmm_genre_2	erogametokuten	total_play_time_median	time_before_understanding_fun_median	dlsite_id	dlsite_domain	the_number_of_uid_which_input_pov	the_number_of_uid_which_input_play	total_pov_enrollment_of_a	total_pov_enrollment_of_b	total_pov_enrollment_of_c	trial_url	trial_h	http_response_code	okazu	axis_of_soft_or_hard	trial_url_update_time	genre	twitter	erogetrailers	tourokubi	digiket	dmm_sample_image_count	dlsite_sample_image_count	gyutto_sample_image_count	digiket_sample_image_count	twitter_search	tgfrontier	gamemeter	twitter_data_widget_id	twitter_data_widget_id_before	twitter_data_widget_id_official	masterup	masterup_tourokubi	steam	dlsite_rental	dmm_subsc	surugaya_1	surugaya_2	surugaya_1_back_image	surugaya_2_back_image	count_all	playrack
8672	灰音アフター	ハイネアフター	2006-12-14	1164	40	11			t		44		5			PC	t	t					60	30			1134tpd5001	mono	pcgame						0	6						200			0001-01-01 00:00:00			0			0	-1	-1	-1		0								f		0	0	f	f	11	3567
5484	ポケットラブ	ポケットラブ	1997-07-18	619	51	22			t		48		4			GBA(GB)	t	f					70	20											0	4									0001-01-01 00:00:00			0			-1	-1	-1	-1		0								f		0	0	f	f	7	0
18252	家畜姉妹	カチクシマイ	2013-02-07	3833					t				0			PC	t	t								100277							RJ110838	maniax									t	-1	0001-01-01 00:00:00			0	2013-02-09	ITM0078075	-1	3	-1	3		0								f		0	0	f	f	1	8308
15031	マカダム	マカダム	1985-08-01	3148					t				0			PC	f	t																	0	0	0	0	0						0001-01-01 00:00:00			0			-1	-1	-1	-1		0								f		126000318	0	f	f	1	12398
18310	手紙 [NScripter版]	テガミ	2007-01-15	3848	60	3			t		62		3		https://www.freem.ne.jp/win/game/1158	PC	f	f					65	60											0	3									0001-01-01 00:00:00			0	2013-02-22		-1	-1	-1	-1		0								f		0	0	f	f	3	10747
```

ゲーム名やブランド名、ユーザ得点の中央値、標準偏差などが載ってますね。
さて、brandnameというのがbrandのidっぽいので、brandlistとgamelistは**結合**できますね。
結合はSQLにおいてとても大切な操作なので是非マスターしましょう。

それでは、ブランド名からbrandlistとgamelistを結合させて、該当するブランドが出しているゲーム情報を取得していきましょう。

```sql
SELECT g.id, g.gamename
    FROM gamelist as g
    INNER JOIN brandlist as b ON g.brandname = b.id
    WHERE b.brandname = 'feng';
```

```
id	gamename
25497	ずっと前から女子でした
8806	あかね色に染まる坂
20228	彼女のセイイキ
12642	星空へ架かる橋
21641	妹のセイイキ
17429	夢と色でできている
4531	魔法少女Twin☆kle
16239	星空へ架かる橋AA
23630	学校のセイイキ
17288	ちいさな彼女の小夜曲
7163	青空の見える丘
2166	knot ～絆の魔法～
3099	White Princess
```

うん。彼女のセイイキね。彼女のセイイキなんだよなぁ…………

彼女のセイイキはOP, EDともに神曲なんですが、今回はOPの「冬に咲く華」のユーザ得点を見ていきたいと思います。

```sql
SELECT u_m.tokuten as score, uid
    FROM usermusic_tokuten as u_m
    INNER JOIN musiclist as m ON m.id = u_m.music
    WHERE m.name = '冬に咲く華';
```

```
score	uid
100	kidos
85	ihave
100	lifefinish
150	aiko1122
70	カラス
100	elfin8
200	hiro8712
80	ryuya
200	sooh
95	9wa263
150	sakuratouru
95	nezumo
120	ootachi877
```

結果の一部ですがこんな感じになりました。
ここで注意したいのが、批評空間は100点満点で採点を実施していますが、100点～200点のものは100点として内部的に点数計算している点なんですね。

なので、「冬に咲く華」の点数の平均値を算出したい場合は、100点以上のものを100点に変換する必要があります。

そこで、必要なのが**CASE式**です。Rubyなどの言語にあるCASE文と発送は同じく条件分岐を表現しますが、SQLのCASE式は処理を分岐するというよりも、今回のように値を変換するようなイメージです。

では、CASE式を用いて「冬に咲く華」の平均値を算出します。

```sql
SELECT AVG(tokuten) as avg
    FROM (
        SELECT
            CASE WHEN tokuten >= 100 THEN 100
                ELSE tokuten END
            FROM usermusic_tokuten as u_m
            INNER JOIN musiclist as m ON m.id = u_m.music
            WHERE m.name = '冬に咲く華'
    ) as sub;
```

```
avg
95.2419354838709677
```

高ぇ…………
さすが、~~曲ゲー~~

FROMの中にある()は**サブクエリ**と呼ばれるもので、最初のSELECT文はサブクエリが返したテーブルに対してクエリを実行します。

AVG()は平均値を算出する**集約関数**で、集約関数というだけあってレコード結果を集約します。

## 3. ブランド別エ□ゲソングランキングSQLの作成

さあ、役者は揃いました。

それでは本題のブランド別エ□ゲソングランキングを作っていきましょう。
ここまで叩いてきたSQLをまとめるだけなので、分解して理解すればそこまで難しくはないと思います。

追加で学ぶ必要があるのは**GROUP BY**と**HAVING**で、GROUP BYというのは同じ行を集約する命令です。
HAVINGというのは、GROUP BYで集約したテーブルに対して行うWHEREです。


```sql
SELECT ROUND(AVG(score), 1) as avg
    , COUNT(score) as count
    , game_name
    , music_name
    FROM (SELECT
            CASE WHEN score >= 100 THEN 100
                ELSE score END
            , game_name
            , music_name
            FROM (
                SELECT g_m.music as music_id
                    , m.name as music_name
                    , g.gamename as game_name
                    , u_m.tokuten as score
                    FROM game_music as g_m
                    INNER JOIN gamelist as g ON g.id = g_m.game
                    INNER JOIN brandlist as b ON b.id = g.brandname
                    INNER JOIN musiclist as m ON m.id = g_m.music
                    INNER JOIN usermusic_tokuten as u_m ON u_m.music = g_m.music
                    WHERE b.brandname LIKE '%feng%') as d1
    ) as d2
    GROUP BY game_name, music_name
    HAVING COUNT(score) > 3
    ORDER BY ROUND(AVG(score), 1) DESC;
```

```
avg	count	game_name	music_name
98.3	44	夢と色でできている	夢と色でできている
97.5	65	ちいさな彼女の小夜曲	キスのひとつで
97.4	25	夢と色でできている	これくらいで
96.2	53	ちいさな彼女の小夜曲	マリンブルーに沿って
96.2	59	彼女のセイイキ	夜明けのベルが鳴る
95.2	62	彼女のセイイキ	冬に咲く華
94.8	20	星空へ架かる橋AA	星空のいま
94.5	10	星空へ架かる橋AA	4SEASONs
94.3	53	妹のセイイキ	ホントノトコロ
93.8	16	星空へ架かる橋	星空へ架かる橋
93.4	22	学校のセイイキ	片想いのメロディを
93.3	9	青空の見える丘	さかみち
93.0	5	星空へ架かる橋	広がる星空の下で
92.0	5	ずっと前から女子でした	友愛進化論
91.9	18	学校のセイイキ	JUMPING TO DAYS!
90.5	10	あかね色に染まる坂	あかね色に染まる坂
90.0	30	妹のセイイキ	Because of
86.9	18	青空の見える丘	青空の見える丘で
84.4	16	あかね色に染まる坂	せつなさのグラデイション
```

はい、出た！

それでは、聴いてください。
藍月なくるで**「これくらいで」**

https://www.youtube.com/watch?v=j4kWHA4ABSM&ab_channel=BrandonTrieu


さて、神曲を聴いていただいたところで次は歌手別のランキングを取得していきましょう。
ブランド別とほぼ変わらないので、もう解説は不要かと思います。

```sql
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
                    WHERE c.name LIKE '%夢乃ゆき%') as d1
    ) as d2
    GROUP BY music_name
    HAVING COUNT(score) > 3
    ORDER BY ROUND(AVG(score), 1) DESC;
```

```
avg	count	music_name
100.0	4	虹色の愛
99.2	97	BWLAUTE BEIRRD
99.1	22	With Tomorrow
97.7	109	THE APPLE IS CAST!
97.6	31	Minority
96.1	41	First Love
95.9	46	Change The World
95.5	38	sign
95.0	8	僕らの記憶
94.7	33	ラストタイム
94.2	6	First Time
94.0	5	アイを識らない。
93.8	4	シアワセバニラ
93.4	19	Activity
93.1	8	二つの光
92.8	20	Missing
92.2	18	妄烈ハニー
81.7	12	全部君のせいだ
```

はい、出た！
はい、出ました、**「With Tomorrow」**
最高です。

最高という言葉は、この曲を形容するためだけに生まれたんじゃないかと思います。拝みましょう。

https://www.youtube.com/watch?v=FdbVwUhtBmY&ab_channel=BluePandoli

## おわりに

さて、初心者向けのSQL記事と見せかけた巧妙なエ□ゲソング布教記事だったわけですが、いかがだったでしょうか？

これを機にエ□ゲソングにハマったエンジニアの皆さまは、[批評空間](https://erogamescape.dyndns.org/~ap2/ero/toukei_kaiseki/)の方でエ□ゲのレビューやSQLのユーザ投稿をお待ちしておりますので是非。



