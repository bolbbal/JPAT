--------------------------------------------------------
--  ファイルを作成しました - 火曜日-11月-05-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence MUSIC_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JPAT"."MUSIC_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence POST_IDX_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JPAT"."POST_IDX_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence POST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JPAT"."POST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPLY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JPAT"."REPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SINGER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JPAT"."SINGER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JPAT"."USERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table MUSIC
--------------------------------------------------------

  CREATE TABLE "JPAT"."MUSIC" 
   (	"POST_IDX" NUMBER(4,0), 
	"MUSIC_IDX" NUMBER, 
	"SINGER_IDX" NUMBER, 
	"MUSIC" VARCHAR2(50 BYTE), 
	"LYRICS" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST
--------------------------------------------------------

  CREATE TABLE "JPAT"."POST" 
   (	"POST_IDX" NUMBER(4,0), 
	"POST_TYPE_IDX" NUMBER DEFAULT 1, 
	"TITLE" VARCHAR2(300 BYTE), 
	"CONTENTS" VARCHAR2(4000 BYTE), 
	"USER_IDX" NUMBER(4,0), 
	"NICKNAME" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(500 BYTE), 
	"IMGURL" VARCHAR2(3000 BYTE), 
	"REGDATE" DATE DEFAULT sysdate, 
	"MODIFYDATE" DATE DEFAULT null, 
	"VIEWCOUNT" NUMBER(4,0) DEFAULT 0, 
	"LIKECOUNT" NUMBER(4,0) DEFAULT 0, 
	"REPLYCOUNT" NUMBER(4,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST_SUGGEST
--------------------------------------------------------

  CREATE TABLE "JPAT"."POST_SUGGEST" 
   (	"POST_TYPE_IDX" NUMBER DEFAULT 2, 
	"POST_IDX" NUMBER, 
	"YOUTUBE_URL" VARCHAR2(1000 BYTE), 
	"THUMNAIL" VARCHAR2(1000 BYTE), 
	"MUSIC" VARCHAR2(50 BYTE), 
	"SINGER" VARCHAR2(50 BYTE), 
	"LYRICS" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST_TYPE
--------------------------------------------------------

  CREATE TABLE "JPAT"."POST_TYPE" 
   (	"POST_TYPE_IDX" NUMBER(2,0), 
	"POST_TYPE" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "JPAT"."REPLY" 
   (	"REPLY_IDX" NUMBER, 
	"POST_IDX" NUMBER, 
	"NICKNAME" VARCHAR2(50 BYTE), 
	"REPLY_PASSWORD" VARCHAR2(500 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"USER_IDX" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SINGER
--------------------------------------------------------

  CREATE TABLE "JPAT"."SINGER" 
   (	"SINGER_IDX" NUMBER, 
	"SINGER" VARCHAR2(50 BYTE), 
	"SINGER_IMG" VARCHAR2(1000 BYTE), 
	"SUGGEST_COUNT" NUMBER DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SINGER_POST_RELATION
--------------------------------------------------------

  CREATE TABLE "JPAT"."SINGER_POST_RELATION" 
   (	"SINGER_IDX" NUMBER, 
	"POST_IDX" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "JPAT"."USERS" 
   (	"USER_IDX" NUMBER(4,0), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"USER_PW" VARCHAR2(500 BYTE), 
	"USER_NICKNAME" VARCHAR2(50 BYTE), 
	"USER_EMAIL" VARCHAR2(100 BYTE), 
	"USER_IMG" VARCHAR2(200 BYTE), 
	"JOINDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into JPAT.MUSIC
SET DEFINE OFF;
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (1,1,1,'晩餐歌','君を泣かすから だから一緒には居れないな<br>君を泣かすから 早く忘れて欲しいんだ<br>人間だからね たまには違うものも食べたいね<br>君を泣かすから そう君を泣かすから<br>でも味気ないんだよね<br>会いたくなんだよね<br>君以外会いたくないんだよね<br>なんて勝手だね<br>大体曖昧なんだよね<br>愛の存在証明なんて<br>君が教えてくれないか<br>何十回の夜を過ごしたって得られぬような<br>愛してるを並べてみて<br>何十回の夜を過ごしたって得られぬような<br>最高のフルコースを頂戴<br>君を泣かすから きっと一生は無理だよね<br>君を泣かすから 胸がとても痛くなんだ<br>人間だからね たまには分かり合えなくなって<br>君を泣かすから また君を泣かすから<br>でも自信がないんだよね<br>変わりたくないんだよね<br>君以外会いたくないんだよね<br>なんて勝手だね<br>大体曖昧だったよね<br>愛の存在証明なんて<br>君がそこに居るのにね<br>何百回の夜を過ごしたって得られぬような<br>愛してるを並べてみて<br>何百回の夜を過ごしたって得られぬような<br>最高のフルコースを頂戴<br>離れないで 傍に居てくれたのは<br>結局君一人だったよね<br>涙のスパイスは君の胸に<br>残ってしまうだろうけど<br>何千回の夜を過ごしたって得られぬような<br>愛してるを並べるから<br>何千回の夜を過ごしたって得られぬような<br>最高のフルコースを<br>何万回の夜を過ごしたって忘れぬような<br>愛してるを並べるから<br>何万回の夜を過ごしたって忘れぬような<br>最高のフルコースを頂戴');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (2,2,1,'サクラキミワタシ','第二ボタンをはずしながら言う<br>「最後だからいいよ」って<br>卒業の日の教室はどこか<br>寂し気な顔をしている<br>時計が巻き戻るなら<br>貴方ともっと話したかった<br>返事はいらないからさ<br>二人のストーリーあげちゃおうよ<br>恋しているんだ サクラキミワタシ<br>春に散る恋だ わかっていたのに<br>恋してしまったの 桜 君 愛し<br>泣いちゃってごめんね<br>黒板とノート ペンが走る音<br>グランドを見つめた<br>方程式じゃ何もわからない<br>答えを探してたんだ<br>急かすようにチャイムが鳴る<br>ここにはもう居られないって<br>時が止まりますように<br>二人のストーリーを夢見てた<br>恋しているんだ サクラキミワタシ<br>春に散る恋だ わかっていたのに<br>恋してしまったの 桜 君 愛し<br>泣いちゃってごめんね<br>振り返る通いなれた道も<br>懐かしくなってしまうんだろう<br>君の事をそんな風にさ<br>思い出したくないのにな<br>恋しているんだ サクラキミワタシ<br>春に置いて行く 恋焦がれた日々<br>永遠に戻れない 桜 君 愛し<br>壊れちゃいそうだよ<br>恋しているんだ サクラキミワタシ<br>春に散る恋だ わかっていたのに<br>恋してしまったの 桜 君 愛し<br>泣いちゃってごめんね');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (4,3,2,'ミズキリ','恋はどんなことでさえも超えていけると<br>思える日が来るだなんて思わなくて<br>住んでる世界が違うのかな<br>なんて君を遠く感じていた<br>だけど今 触れる<br>萎れかけた花に熱を与えたの<br>世界が変わるほどに 奇跡のように<br>あなただけが瞳に映るの<br>眼を閉じれば傍に居るの<br>全ての事を超えていくために<br>ウシロムキは水切りしよう<br>さよならの後 振り返って君が笑う<br>いつまでそこに居るのなんて思いながら<br>出来れば帰りたくはないな<br>なんて君を遠く感じていた<br>手と手が触れ合う<br>もう二度と誰かのこと<br>好きになるなんてないと思ってた 間違いだね<br>あなただけが瞳に映るの<br>眼を閉じれば傍に居るの<br>全ての事を超えていくために<br>ウシロムキは水切りしよう<br>そんな眼しないで 次に会う時の分までキスしよう<br>戸惑いもすれ違いでも 引き裂けやしないよ<br>あなただけが瞳に映るの<br>眼を閉じれば傍に居るの<br>全ての事を超えていくために<br>ウシロムキは水切りしよう');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (5,4,3,'怪獣の花唄','思い出すのは君の歌<br>会話よりも鮮明だ<br>どこに行ってしまったの<br>いつも探すんだよ<br>思い出すのは君の歌<br>歌い笑う顔が鮮明だ<br>君に似合うんだよ<br>ずっと見ていたいよ<br>でも最後に見たいのは<br>きっともう君の夢の中<br>もう一度 また聞かせてくれよ<br>聞きたいんだ<br>もっと騒げ怪獣の歌<br>まだ消えない 夢の歌唱えて<br>君がいつも歌う怪獣の歌<br>まだ消えない 口ずさんでしまうよ<br>思い出すのは 君がいた<br>ギター持ってる 君がいた<br>忘れられないんだよ<br>だから僕が歌うよ<br>でも最後に見たいのは<br>きっともう君の夢の中<br>もう一度 また聞かせてくれよ<br>聞きたいんだ<br>もっと騒げ怪獣の歌<br>まだ消えない 夢の歌唱えて<br>君がいつも歌う怪獣の歌<br>まだ消えない 口ずさんでしまうよ<br>落ちてく過去は鮮明で<br>見せたい未来は繊細で<br>すぎてく日々には鈍感な君へ<br>落ちてく過去は鮮明で<br>見せたい未来は繊細で<br>すぎてく日々には鈍感な君へ<br>ねぇ もっと騒げ怪獣の歌<br>まだ消えない 夢の歌唱えて<br>君がいつも歌う怪獣の歌<br>まだ消えない 口ずさんでしまうよ whoa<br>ねぇ 僕ら 眠れない夜に手を伸ばして<br>眠らない夜をまた伸ばして<br>眠くないまだね<br>そんな日々でいたいのにな<br>懲りずに 眠れない夜に手を伸ばして<br>眠らない夜をまた伸ばして<br>眠くないまだね<br>そんな夜に歌う 怪獣の歌<br>落ちてく過去は鮮明で<br>見せたい未来は繊細で<br>すぎてく日々には鈍感な君へ<br>落ちてく過去は鮮明で<br>見せたい未来は繊細で<br>すぎてく日々には鈍感な君へ');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (9,6,5,'ハッピーエンド','さよならが喉の奥に つっかえてしまって<br>咳をするみたいにありがとうて言ったの<br>次の言葉はどこかと ポケットを探しても<br>見つかるのはあなたを好きな私だけ<br>平気よ大丈夫だよ優しくなれたと思って<br>願いに変わって最後は嘘になって<br>青いまま枯れていく<br>あなたを好きなままで消えてゆく<br>私みたいと手に取って<br>奥にあった想いと一緒に握り潰したの<br>大丈夫 大丈夫<br>今すぐに抱きしめて<br>私がいれば何もいらないと<br>それだけ言ってキスをして<br>なんてね 嘘だよ ごめんね<br>こんな時思い出す事じゃないとは思うんだけど<br>１人にしないよってあれ実は嬉しかったよ<br>あなたが勇気を出して初めて電話をくれた<br>あの夜の私と何が違うんだろう<br>どれだけ離れていてもどんなに会えなくても<br>気持ちが変わらないからここにいるのに<br>青いまま枯れてゆく<br>あなたを好きなままで消えてゆく<br>私をずっと覚えていて<br>なんてね 嘘だよ 元気でいてね<br>泣かない私に少しほっとした顔のあなた<br>相変わらず暢気ね そこも大好きよ<br>気が付けば横にいて<br>別に君のままでいいのになんて<br>勝手に涙拭いたくせに<br>見える全部聴こえる全て<br>色付けたくせに<br>青いまま枯れてゆく<br>あなたを好きなままで消えてゆく<br>私みたいと手に取って<br>奥にあった想いと一緒に握り潰したの<br>大丈夫 大丈夫<br>今すぐに抱きしめて<br>私がいれば何もいらないと<br>そう言ってもう離さないで<br>なんてね 嘘だよ さよなら');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (10,7,6,'CRY BABY','胸ぐらを掴まれて 強烈なパンチを食らってよろけて<br>肩を並べうずくまった<br>予報通りの雨にお前はにやけて<br>「傷口が綺麗になる」なんて嘘をつく<br>いつも口喧嘩さえうまく出来ないくせして<br>冴えない冗談言うなよ<br>あまりのつまらなさに目が潤んだ<br>何度も青アザだらけで涙を 流して 流して<br>不安定な心を肩に預け合いながら 腐り切ったバッドエンドに抗う<br>なぜだろう 喜びよりも心地よい痛み ずっしりと響いて<br>濡れた服に舌打ちしながら 腫れ上がった顔を見合って笑う<br>土砂降りの夜に 誓ったリベンジ<br>胸ぐらを掴み返して 反撃のパンチを繰り出すくらいじゃなきゃ<br>お前の隣には立てないから<br>相手が何であれ日和らない 何度伸されても諦めない<br>忘れるな忘れるなと言い聞かせ続けたのに<br>どうして<br>(やり直して しくじって) どうして<br>(踏み倒して 肩落として) どうして どうして<br>あぁ 傘はいらないから言葉を一つくれないか<br>微温い優しさではなく<br>弱音に侵された胸の奥を抉るような言葉を<br>何度も青アザだらけで涙を 流して 流して<br>不安定な心を肩に預け合いながら 腐り切ったバッドエンドに抗う<br>なぜだろう 喜びよりも心地よい痛み ずっしりと響いて<br>濡れた服に舌打ちしながら 腫れ上がった顔を見合って笑う<br>土砂降りの夜に 囚われの日々に 問いかけるように<br>光った瞳の中で 誓ったリベンジ');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (11,8,7,'STELLAR STELLAR','だって僕は星だから<br>Stellar Stellar<br>きっと君はもう気づいていた<br>僕の心の奥で描いた<br>それが これから話す 陳腐なモノローグさ<br>ずっと言えない言葉があった<br>壊せない壁があったんだ ずっとさ<br>ふっと香り立つ朝の匂いが<br>どうしようもなく憎らしくて<br>部屋の隅で 膝を抱えて震えていた<br>太陽なんていらないから<br>明けないでいて<br>その手を伸ばして 誰かに届くように<br>僕だって君と同じ 特別なんかじゃないから<br>そうさ 僕は夜を歌うよ Stellar Stellar<br>ありったけの輝きで<br>今宵 音楽は ずっと ずっと 止まない<br>そうだ 僕がずっとなりたかったのは<br>待ってるシンデレラじゃないさ<br>迎えに行く王子様だ<br>だって僕は星だから<br>なんて ありふれた話なんだ<br>理想だけ書き連ねていた<br>ノートの隅に眠る ほんのワンシーンだ<br>きっとあの星も泣いてるんだ<br>明日なんて来ないままでいて<br>その手を伸ばして 誰かに届くように<br>本当に大切なものは<br>目に見えないみたいなんだ<br>そうさ 僕は夜を歌うよ Stellar Stellar<br>ありのまま考えないで<br>今宵 音楽はきっときっと止まない<br>そうだ 僕がずっとなりたかったのは<br>あえかなヒロインじゃないさ<br>救いに行くヒーローだ<br>夢見がちなおとぎ話<br>おとぎ話<br>そうさ 僕は夜を歌うよ Stellar Stellar<br>ありったけの輝きで<br>今宵 音楽はずっとずっと止まない<br>そうさ 僕は愛を歌うよ Stellar Stellar<br>世界 宇宙の真ん中で<br>今宵 音楽はきっときっと止まない<br>そうだ 僕がずっとなりたかったのは<br>待ってるシンデレラじゃないさ<br>迎えに行く王子様だ<br>だって僕は星だから<br>そうだ僕は星だった<br>Stellar Stellar');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (12,9,5,'水平線','出来るだけ嘘は無いように<br>どんな時も優しくあれるように<br>人が痛みを感じた時には<br>自分の事のように思えるように<br>正しさを 別の正しさで<br>失くす悲しみにも 出会うけれど<br>水平線が光る朝に あなたの希望が崩れ落ちて<br>風に飛ばされる欠片に 誰かが綺麗と呟いてる<br>悲しい声で歌いながら いつしか海に流れ着いて 光って<br>あなたはそれを見るでしょう<br>自分の背中は 見えないのだから<br>恥ずかしがらず人に 尋ねるといい<br>心は誰にも見えないのだから<br>見えるものよりも大事にするといい<br>毎日が重なる事で<br>会えなくなる人も出来るけれど<br>透き通るほど淡い夜に あなたの夢がひとつ叶って<br>歓声と拍手の中に 誰かの悲鳴が隠れている<br>耐える理由を探しながら いくつも答えを抱えながら 悩んで<br>あなたは自分を知るでしょう<br>誰の心に残る事も 目に焼き付く事もない今日も<br>雑音と足音の奥で 私はここだと叫んでいる<br>水平線が光る朝に あなたの希望が崩れ落ちて<br>風に飛ばされる欠片に 誰かが綺麗と呟いてる<br>悲しい声で歌いながら いつしか海に流れ着いて 光って<br>あなたはそれを見るでしょう<br>あなたはそれを見るでしょう');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (16,10,2,'SHUTTER','君と見るはずだった花火が<br>夜の隙間を埋めてく<br>感傷にひたっちまうから<br>Twitterは閉じた<br>棚の上に置いたカメラも<br>今距離を置きたいくらい<br>僕は今日全て失って<br>一日中泣いていた<br>本当の気持ちは<br>やっぱりわからないけど<br>君のアルバムに居る僕を全部<br>消したんでしょう<br>シャッターが落ちるみたいに<br>君を切り取って恋に落ちて<br>心のアルバムに全部<br>そっとため込んでた<br>だからさ だからさ<br>仕草も匂いも覚えている<br>シャッターを切る時間も<br>君に触れていれば良かった<br>全ての時間を君だけに使えばよかった<br>お決まりのデートコースと<br>お決まりの愛の言葉<br>見栄えの良いものばかりが<br>インスタに残った<br>棚の上に置いたカメラじゃ<br>映せないものが<br>君と僕の間にあって<br>それに気づけなかった<br>今でも気持ちは<br>やっぱりわからないけど<br>君のアルバムに居る僕は全部<br>いらないんでしょう<br>シャッターが落ちるみたいに<br>君を切り取って恋に落ちて<br>壊したくなくて無難に<br>きっとやり過ごしてた<br>だからさ だからさ<br>映りの悪い僕だったろう<br>シャッターを切る時間も<br>君に触れていれば良かった<br>全ての時間を君だけに使えばよかった<br>どんなに綺麗で美しい宝石みたいな思い出も<br>そこに僕が居なきゃ 君が居なきゃ<br>何の意味もないのに<br>シャッターが落ちるみたいに<br>君を切り取って恋に落ちて<br>壊したくなくて無難に<br>きっとやり過ごしてた<br>だからさ だからさ<br>映りの悪い僕だったろう<br>シャッターを切る時間も<br>君に触れていれば良かった<br>シャッターが落ちるみたいに<br>君を切り取って恋に落ちて<br>心のアルバムに全部<br>そっとため込んでた<br>だからさ だからさ<br>仕草も匂いも覚えている<br>シャッターを切る時間も<br>君に触れていれば良かった<br>全ての時間を君だけに使えばよかった');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (17,11,2,'ドライフラワー','多分 私じゃなくていいね<br>余裕のない二人だったし<br>気付けば喧嘩ばっかりしてさ<br>ごめんね<br>ずっと話そうと思ってた<br>きっと私たち合わないね<br>二人きりしかいない部屋でさ<br>貴方ばかり話していたよね<br>もしいつか何処かで会えたら<br>今日の事を笑ってくれるかな<br>理由もちゃんと話せないけれど<br>貴方が眠った後に泣くのは嫌<br>声も顔も不器用なとこも<br>全部全部 嫌いじゃないの<br>ドライフラワーみたい<br>君との日々もきっときっときっときっと<br>色褪せる<br>多分 君じゃなくてよかった<br>もう泣かされることもないし<br>「私ばかり」なんて言葉も<br>なくなった<br>あんなに悲しい別れでも<br>時間がたてば忘れてく<br>新しい人と並ぶ君は<br>ちゃんとうまくやれているのかな<br>もう顔も見たくないからさ<br>変に連絡してこないでほしい<br>都合がいいのは変わってないんだね<br>でも無視できずにまた少し返事<br>声も顔も不器用なとこも<br>多分今も 嫌いじゃないの<br>ドライフラワーみたく<br>時間が経てば<br>きっときっときっときっと色褪せる<br>月灯りに魔物が揺れる<br>きっと私もどうかしてる<br>暗闇に色彩が浮かぶ<br>赤黄藍色が胸の奥<br>ずっと貴方の名前を呼ぶ<br>好きという気持ち<br>また香る<br>声も顔も不器用なとこも<br>全部全部 大嫌いだよ<br>まだ枯れない花を<br>君に添えてさ<br>ずっとずっとずっとずっと<br>抱えてよ ah, ah');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (21,12,8,'愛とか恋とか','月曜日の朝 憂鬱な気持ちも 君と会う日を思い浮かべれば<br>いつもの道に優しい風が吹き 心弾ませ今日が始まるよ<br>昔は聴かなかったあの歌や 映画や香水の匂いでさえも<br>君が好きなものってだけでさ どうして僕も好きなんだろう<br>こんなにも<br>愛とか恋とかの言葉で片付けられないくらいの<br>『愛してる』が溢れ出して 止まらない想い<br>君も同じかな 伝えよう目を見て 今すぐ走った<br>離れないように 離さないから 抱きしめたいよずっと<br>会えない時は思い出をめくって 近くに君を感じて励まされ<br>携帯に映る君からの通知を 開く時間に笑顔になれるよ<br>僕の腕で君が眠る夜も 夢でもいつでも君と過ごしてた<br>目が覚めても夢は醒めないまま 心が君で満ちていく<br>こんなにも<br>愛とか恋とかの言葉で片付けられないくらいの<br>「愛してる」が溢れ出して 止まらない想い<br>守りたい明日も この先訪れる未来を全部<br>預けてほしい 君以外はもう他には何もいらない<br>「なんともないよ」「大丈夫だよ」<br>溢す口癖 僕は気づいてるよ<br>弱くてもいい 泣いてもいいんだよ<br>僕の前で強がらないで<br>愛した理由はさ<br>ありきたりなのかもしれないけど<br>君以外には考えられない<br>愛とか恋とかの言葉で片付けられないくらいの<br>『愛してる』が溢れ出して 止まらない想い<br>君も同じかな 伝えよう目を見て 今すぐ走った<br>離れないように 離さないから 抱きしめたいよずっと');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (24,14,10,'逆夢','あなたが望むなら<br>この胸を射通して<br>頼りの無い僕もいつか<br>何者かに成れたなら<br>訳もなく<br>涙が溢れそうな<br>夜を埋め尽くす<br>輝く夢と成る<br>白い息は頼りなく<br>冬の寒さに溶けて消えた<br>あの日の重ねた手と手の<br>余熱じゃあまりに頼りないの<br>春はいつだって<br>当たり前の様に<br>迎えに来ると<br>そう思っていたあの頃<br>瞼閉じれば<br>夢はいつだって<br>正夢だと信じてたあの頃<br>あなたが望むなら<br>何処迄も飛べるから<br>意気地の無い僕もいつか<br>生きる意味を見つけたなら<br>愛と憎を<br>聢と繋ぎ合わせて<br>一生涯醒めない程の<br>荒んだ夢と成る<br>凍える夜空を<br>二人で抜け出すの<br>あたたかいコートを<br>そっと掛けたなら<br>あなたはいつだって<br>当たり前の様に隣にいると<br>そう思っていたあの頃<br>失くせやしない<br>記憶の雨が古傷へと<br>沁み渡ろうとも<br>あなたが望むなら<br>この胸を射通して<br>頼りの無い僕もいつか<br>何者かに成れたなら<br>訳もなく<br>涙が溢れそうな<br>夜を埋め尽くす<br>輝く夢と成る<br>記憶の海を潜って<br>愛の欠片を拾って<br>あなたの中にずっと<br>眩しい世界をそっと oh yeah<br>この愛が例え呪いのように<br>じんわりとじんわりと<br>この身体蝕んだとしても<br>心の奥底から<br>あなたが溢れ出して<br>求め合って重なり合う<br>その先で僕ら夢と成れ<br>あなたが望むなら<br>この胸を射通して<br>頼りの無い僕もいつか<br>何者かに成れたなら<br>訳もなく<br>涙が溢れそうな<br>夜を埋め尽くす<br>輝く夢と成る<br>正夢でも 逆夢だとしても');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (25,15,6,'PRETENDER','君とのラブストーリー<br>それは予想通り<br>いざ始まればひとり芝居だ<br>ずっとそばにいたって<br>結局ただの観客だ<br>感情のないアイムソーリー<br>それはいつも通り<br>慣れてしまえば悪くはないけど<br>君とのロマンスは人生柄<br>続きはしないことを知った<br>もっと違う設定で<br>もっと違う関係で<br>出会える世界線<br>選べたらよかった<br>もっと違う性格で<br>もっと違う価値観で<br>愛を伝えられたらいいな<br>そう願っても無駄だから<br>グッバイ<br>君の運命のヒトは僕じゃない<br>辛いけど否めない<br>でも離れ難いのさ<br>その髪に触れただけで<br>痛いや いやでも<br>甘いな いやいや<br>グッバイ<br>それじゃ僕にとって君は何？<br>答えは分からない<br>分かりたくもないのさ<br>たったひとつ確かなことがあるとするのならば<br>君は綺麗だ<br>誰かが偉そうに<br>語る恋愛の論理<br>何ひとつとしてピンとこなくて<br>飛行機の窓から見下ろした<br>知らない街の夜景みたいだ<br>もっと違う設定で<br>もっと違う関係で<br>出会える世界線<br>選べたらよかった<br>いたって純な心で<br>叶った恋を抱きしめて<br>好きだとか無責任に言えたらいいな<br>そう願っても虚しいのさ<br>グッバイ<br>繋いだ手の向こうにエンドライン<br>引き伸ばすたびに<br>疼きだす未来には<br>君はいない<br>その事実に Cry<br>そりゃ苦しいよな<br>グッバイ<br>君の運命のヒトは僕じゃない<br>辛いけど否めない<br>でも離れ難いのさ<br>その髪に触れただけで<br>痛いや いやでも<br>甘いな いやいや<br>グッバイ<br>それじゃ僕にとって君は何？<br>答えは分からない<br>分かりたくもないのさ<br>たったひとつ確かなことがあるとするのならば<br>君は綺麗だ<br>それもこれもロマンスの定めなら<br>悪くないよな<br>永遠も約束もないけれど<br>とても綺麗だ');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (28,16,11,'ラブレター','初めまして大好きな音楽へ<br>ずっと考えてたこと<br>どうか聞いてほしくって<br>(伝えたいことがあるんです)<br>ちょっと照れ臭いけれど<br>ずっと想っていたこと<br>こんなお手紙に込めて<br>(届いてくれますように)<br><br>どんな時もあなたの<br>言葉 声を聴いているだけで<br>力が湧いてくるんだ<br><br>ねえ<br>笑っていたいよどんな時も<br>でも辛い暗い痛い日もある<br>けどね<br>あなたに触れるだけで気付けば<br>この世界が色鮮やかになる<br>花が咲くように<br>笑って泣いてどんな時だって<br>選んでいいんだいつでも自由に<br>今日はどんなあなたに出会えるかな<br>この世界が終わるその日まで<br>鳴り続けていて ah-ah<br><br>いつもあなたのことを求めちゃうんだ<br>(踊り出したくなる時も)<br>(爆発しちゃいそうな時も)<br>救われたんだ支えられてきたんだ<br>(心が動かされるんです)<br>(心が満たされていくんです)<br>ねえもっと触れていたいよ<br>ずっとそばにいてほしいよ<br>いつまでも<br>大好きなあなたが<br>響いていますように<br><br>こんなたくさんの気持ち<br>ぎゅっと詰め込んだ想い<br>ちゃんと伝えられたかな ah, mm<br>ちょっとだけ不安だけど<br>きっと届いてくれたよね<br>全部私の素直な言葉だから<br>もしもあなたに出会えてなかったらなんて<br>思うだけで怖いほど大好きなんだ<br><br>受け取ってどうか私の想いを<br>さあ<br>笑って泣いてそんな毎日を<br>歩いていくんだいつもいつまでも<br>辛い暗い痛いことも沢山あるけど<br>この世界はいつでもどこでも音楽で溢れてる<br>目の前のことも将来のことも<br>不安になってどうしたらいいの<br>分かんなくって迷うこともあるけど<br>そんな時もきっとあなたがいてくれれば<br>前を向けるんだ<br><br>こんな気持ちになるのは<br>こんな想いができるのは<br>きっと音楽だけなんだ<br>(変わりなんて一つもないんです)<br>どうか1000年先も<br>どうか鳴り止まないで<br>Ah いつも本当にありがとう');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (61,17,12,'マリゴールド','風の強さがちょっと<br>心を揺さぶりすぎて<br>真面目に見つめた 君が恋しい<br>でんぐり返しの日々<br>可哀想なふりをして<br>だらけてみたけど<br>希望の光は<br>目の前でずっと輝いている 幸せだ<br>麦わらの帽子の君が<br>揺れたマリーゴールドに似てる<br>あれは 空がまだ青い夏のこと<br>懐かしいと笑えたあの日の恋<br>「もう離れないで」と<br>泣きそうな目で見つめる君を<br>雲のような優しさでそっとぎゅっと<br>抱きしめて 抱きしめて 離さない<br>本当の気持ち全部<br>吐き出せるほど強くはない<br>でも不思議なくらいに<br>絶望は見えない<br>目の奥にずっと写るシルエット<br>大好きさ<br>柔らかな肌を寄せあい<br>少し冷たい空気を2人<br>かみしめて歩く 今日という日に 何と<br>名前をつけようかなんて話して<br>ああ アイラブユーの言葉じゃ<br>足りないからとキスして<br>雲がまだ2人の影を残すから<br>いつまでも いつまでも このまま<br>遥か遠い場所にいても<br>繋がっていたいなあ<br>2人の想いが 同じでありますように<br>麦わらの帽子の君が<br>揺れたマリーゴールドに似てる<br>あれは空がまだ青い夏のこと<br>懐かしいと笑えたあの日の恋<br>「もう離れないで」と<br>泣きそうな目で見つめる君を<br>雲のような優しさで そっとぎゅっと<br>抱きしめて 離さない<br>ああ アイラブユーの言葉じゃ<br>足りないからとキスして<br>雲がまだ2人の影を残すから<br>いつまでも いつまでも このまま<br>離さない<br>ああ いつまでも いつまでも 離さない');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (62,18,13,'いつか','坂道を登った先の暗がり 星が綺麗に見えるってさ<br>地べたに寝転んじゃうあたり あぁ君らしいなって思ったり<br>時間を忘れて夢中になった 赤信号は点滅している<br>肌寒くなり始めた季節に 僕らは初めて手を繋いだ 2人の物語<br>2人でひとつの傘を差したり ブランコに乗り星を眺めたり<br>押しボタン式の信号機を いつも君が走って押すくだり<br>仰向けになって見た湖 宙に浮いてるみたいってさ<br>はしゃいでる君とその横でさ もっとはしゃぐ僕なら<br>本当に飛べるような 気がしていた<br>フワフワと夢心地 君の隣<br>君の見る景色を全部<br>僕のものにしてみたかったんだ<br>あぁ 君を忘れられんなぁ<br>ラララララララ ラララララララ<br>ラララララララ ラララララララ<br>ララララララララ<br>当たり前に通ってたあの道 信号機は無くなるみたいです<br>思い出して切なくなる気持ちも いつかは無くなるみたいです<br>そういえば寒い雪降る日の 田和山の無人公園でさ<br>震える体 暗い中いつものように笑いあう 街灯の下で<br>僕の目に映りこんだ君が<br>いつもよりちょっと寂しそうな 気がした<br>今になってさ (今になってさ) 思い出してさ (思い出してさ)<br>後悔じゃ何も解決しないさ<br>忘れられないのは 受け入れられないのは<br>君を思い出にできる程僕は強くはないから<br>僕の見た景色を全部<br>君にも見せてやりたかったんだ<br>あったかいココアを一口<br>いつかまた逢う日までと<br>笑う顔に嘘は見当たらない<br>じゃあね じゃあね<br>またどっか遠くで いつか<br>ラララララララ ラララララララ<br>ラララララララ ラララララララ<br>ラララララララ ラララララララ<br>ラララララララ ラララララララ<br>ラララララララ');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (63,19,11,'あの夢をなぞって','夜の空を飾る綺麗な花<br>街の声をぎゅっと光が包み込む<br>音の無い二人だけの世界で聞こえた言葉は<br>「好きだよ」<br>夢の中で見えた未来のこと<br>夏の夜、君と、並ぶ影が二つ<br>最後の花火が空に昇って消えたら<br>それを合図に<br>いつも通りの朝に いつも通りの君の姿<br>思わず目を逸らしてしまったのは<br>どうやったって忘れられない君の言葉<br>今もずっと響いてるから<br>夜を抜けて夢の先へ<br>辿り着きたい未来へ<br>本当に？あの夢に、本当に？って今も<br>不安になってしまうけどきっと<br>今を抜けて明日の先へ<br>二人だけの場所へ<br>もうちょっと どうか変わらないで<br>もうちょっと 君からの言葉<br>あの未来で待っているよ<br>誰も知らない 二人だけの夜<br>待ち焦がれていた景色と重なる<br>夏の空に未来と今繋がる様に開く花火<br>君とここでほらあの夢をなぞる<br>見上げた空を飾る光が今照らした横顔<br>そうずっとこの景色のために<br>そうきっとほら二つの未来が<br>今重なり合う<br>夜の中で君と二人<br>辿り着いた未来で<br>大丈夫想いはきっと大丈夫伝わる<br>あの日見た夢の先へ<br>今を抜けて明日の先で<br>また出会えた君へ<br>もうちょっと どうか終わらないで<br>もうちょっと ほら最後の花火が今<br>二人を包む<br>音の無い世界に響いた<br>「好きだよ」');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (65,20,14,'春泥棒','高架橋を抜けたら雲の隙間に青が覗いた<br>最近どうも暑いから ただ風が吹くのを待ってた<br>木陰に座る<br>何か頬に付く<br>見上げれば頭上に咲いて散る<br>はらり 僕らもう息も忘れて<br>瞬きさえ億劫<br>さぁ 今日さえ明日過去に変わる<br>ただ風を待つ<br>だから僕らもう声も忘れて<br>さよならさえ億劫<br>ただ花が降るだけ晴れり<br>今 春吹雪<br>次の日も待ち合わせ<br>花見の客も少なくなった<br>春の匂いはもう止む<br>今年も夏が来るのか<br>高架橋を抜けたら道の先に君が覗いた<br>残りはどれだけかな<br>どれだけ春に会えるだろう<br>川沿いの丘 木陰に座る<br>また昨日と変わらず今日も咲く花に<br>僕らもう息も忘れて<br>瞬きさえ億劫<br>花散らせ今吹くこの嵐は<br>まさに春泥棒<br>風に今日ももう時が流れて<br>立つことさえ億劫<br>花の隙間に空 散れり<br>まだ 春吹雪<br>今日も会いに行く<br>木陰に座る<br>溜息を吐く<br>花ももう終わる<br>明日も会いに行く<br>春がもう終わる<br>名残るように時間が散っていく<br>愛を歌えば言葉足らず<br>踏む韻さえ億劫<br>花開いた今を言葉如きが語れるものか<br>はらり 僕らもう声も忘れて<br>瞬きさえ億劫<br>花見は僕らだけ<br>散るなまだ 春吹雪<br>あともう少しだけ<br>もう数えられるだけ<br>あと花二つだけ<br>もう花一つだけ<br>ただ葉が残るだけ はらり<br>今 春仕舞い');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (77,21,2,'かくれんぼ','"いっせーのー" で鳴り響いたスタートの合図<br>なぞった線で結んだ世界<br>色付けていく ここから<br>物心がつく頃 すでに此処にあった<br>僕じゃない誰かの記憶は<br>夕陽とともに蘇る<br>古ぼけた絵本を取り出して<br>落書きの中に1つの答えを見つけた<br>自分の価値に 目を疑って<br>どこまでだって 堕ちていけるの<br>どこか遠くに 消えてしまいたい<br>こんな世界じゃ 僕はいらない<br>カウントダウンは始まっているよ<br>"いっせーのー" で声を上げて<br>聴こえてくるんだ<br>自分の影の長さに気付く<br>もうこんな時間だ<br>一等星が顔を出した<br>届きそうで手を伸ばした<br>次は僕に着いてきなよ<br>どんな暗闇でも<br>(もういいかい? まーだだよ)<br>幕は上がりだした<br>(もういいかい? まーだだよ)<br>色付けていく ここから<br>10年後の僕らはすれ違いばかりで<br>幻想に想いを馳せては<br>"戻れない" そう思いこんだ<br>くたびれた心に追い討ちを<br>あの頃と変わらない夕陽も<br>なんとも思わない<br>自分を信じ 歩いていければ<br>どこまでだって 昇れるのにな<br>カットを跨ぐ その空白に<br>大切なモノ 見落としている<br>見つけられないと泣きわめく君へ<br>"いっせーのー" で声を上げて<br>聴こえてくるんだ<br>自分の影の長さに気付く<br>もうこんな時間だ<br>一等賞で駆け抜ける君<br>くっついていただけの僕でも<br>君の前を歩けるかな?<br>こんな頼りない僕でも<br>宝箱はホコリをかぶったまま<br>無くした鍵はずっと<br>君のポケットの中にあった<br>散らばっていた全てが<br>今ひとつに重なる<br>手を取り 始めよう<br>僕たちの物語<br>一度はいらないと思った<br>今なら胸を張れる気がしたんだ<br>愛おしくて 掛け声はいつも<br>"いっせーのー" で声を上げて<br>"いっせーのー" で声を上げて<br>聴こえてくるんだ<br>自分の影の長さに気付く<br>もうこんな時間だ<br>一等星が顔を出した<br>届きそうで手を伸ばした<br>次は僕に着いてきなよ<br>どんな暗闇でも<br>(もういいかい? まーだだよ)<br>泣きじゃくった声で<br>(もういいかい? まーだだよ)<br>笑う君が見えた<br>(もういいかい? まーだだよ)<br>幕は上がりだした<br>(もういいかい? もういいよ)<br>色付けていく ここから');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (78,22,15,'まちがいさがし','まちがいさがしの間違いの方に<br>生まれてきたような気でいたけど<br>まちがいさがしの正解の方じゃ<br>きっと出会えなかったと思う<br>ふさわしく 笑いあえること<br>何故だろうか 涙がでること<br>君の目が貫いた 僕の胸を真っ直ぐ<br>その日から何もかも 変わり果てた気がした<br>風に飛ばされそうな 深い春の隅で<br>退屈なくらいに何気なく傍にいて<br>間違いだらけの 些細な隙間で<br>くだらない話を くたばるまで<br>正しくありたい あれない 寂しさが<br>何を育んだでしょう<br>一つずつ (一つずつ) 探し当てていこう<br>起きがけの 子供みたいに<br>君の手が触れていた 指を重ね合わせ<br>間違いか正解かだなんてどうでもよかった<br>瞬く間に落っこちた 淡い靄の中で<br>君じゃなきゃいけないと ただ強く思うだけ<br>君の目が貫いた 僕の胸を真っ直ぐ<br>その日から何もかも 変わり果てた気がした<br>風に飛ばされそうな 深い春の隅で<br>誰にも見せない 顔を見せて<br>君の手が触れていた 指を重ね合わせ<br>間違いか正解かだなんてどうでもよかった<br>瞬く間に落っこちた 淡い靄の中で<br>君じゃなきゃいけないと ただ強く思うだけ');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (79,23,16,'変わらないもの','帰り道ふざけて歩いた<br>訳も無く君を怒らせた<br>色んな君の顔を見たかったんだ<br>大きな瞳が 泣きそうな声が<br>今も僕の胸を締め付ける<br>すれ違う人の中で 君を追いかけた<br>変わらないもの 探していた<br>あの日の君を忘れはしない<br>時を越えてく思いがある<br>僕は今すぐ君に会いたい<br>街灯にぶら下げた想い<br>いつも君に渡せなかった<br>夜は僕達を遠ざけていったね<br>見えない心で 嘘ついた声が<br>今も僕の胸に響いている<br>さまよう時の中で 君と恋をした<br>変わらないもの 探していた<br>あの日見つけた知らない場所へ<br>君と二人で行けるのなら<br>僕は何度も生まれ変われる<br>形ないもの 抱きしめてた<br>壊れる音も聞こえないまま<br>君と歩いた同じ道に<br>今も灯りは照らし続ける<br>変わらないもの 探していた<br>あの日の君を忘れはしない<br>時を超えてく思いがある<br>僕は今すぐ君に会いたい<br>僕は今すぐ君に会いたい');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (80,24,11,'もう少しだけ','もう少しだけ もう少しだけ 踏み出せたのなら<br>そう小さな優しさを  分け合えたのなら<br>ありふれた一日が  素敵な日になっていくほら<br>そうやって何度でも  喜びはめぐる<br>慌ただしく過ぎる朝に<br>いつも通り過ぎる朝に<br>頼まれたお使いと予定を照らす<br>君が教えてくれた <br>あてにしてない占いの言葉<br>「いつもしないこと」をだって<br>そんなことを頭の隅に置いたまま<br>いつもの今日へ<br>もう少しだけ もう少しだけ 踏み出せたのなら<br>もう少しだけ あと少しだけ 優しくなれたのなら<br>ありふれた一日も 素敵な日になっていくような<br>そんな気がしたんだ 今喜びはめぐる<br>暗いニュースが流れる朝に<br>気持ちが沈んでいく朝に<br>自分は「いらない」存在？なんて考える朝に<br>あなたのことを思い出したんだ<br>あなたに会いたくなったんだ<br>久しぶりに会いに行くよ 今すぐに<br>待ちに待ったそんな朝に<br>想いを馳せる日の朝に<br>いつもよりも早く家を出る<br>ふいに触れた誰かの優しさが<br>私の優しさに変わったんだ<br>ほら喜びはめぐる<br>もう少しだけ もう少しだけ 踏み出せたことが<br>もう少しだけ ほんの少しだけ 優しくなれたことが<br>ありふれた一日も 特別な一日にほら<br>変えてくれたんだきっと 今日も<br>あなたから私へと 想いが伝わる<br>そう僕から君にほら 喜びが広がる<br>ありふれた毎日から 踏み出した優しさが今<br>誰かに届いてきっと めぐり続けるよずっと<br>あぁ、どこまでも<br>今日もどこかであなたが<br>今を生きるあなたがただ<br>小さな幸せを 見つけられますように');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (81,25,17,'カタオモイ','例えば 君の 顔に昔より<br>シワが 増えても それでも良いんだ<br>僕が ギターを 思うように 弾けなくなっても<br>心の歌は君で溢れているよ<br>高い声も 出せずに 思い通り歌えない<br>それでも頷きながら一緒に歌ってくれるかな<br>割れんばかりの拍手も 響き渡る歓声もいらない<br>君だけ わかってよ わかってよ<br>Darlin'' 夢が叶ったの<br>お似合いの言葉が見つからないよ<br>Darlin'' 夢が叶ったの<br>「愛してる」<br>たった一度の たった一人の<br>生まれてきた幸せ味わってるんだよ<br>今日がメインディッシュで 終わりの日には<br>甘酸っぱいデザートを食べるの<br>山も谷も全部フルコースで<br>気がきくような言葉はいらない<br>素晴らしい特別もいらない<br>ただずっと ずっとそばに 置いておいてよ<br>僕の想いは歳をとると 増えてくばっかだ<br>好きだよ<br>わかってよ わかってよ<br>ねえ darlin'' 夢が叶ったの<br>お似合いの言葉が見つからないよ<br>Darlin'' 夢が叶ったの<br>愛が溢れていく<br>君が僕を忘れてしまっても<br>ちょっとつらいけど それでもいいから<br>僕より先に どこか遠くに<br>旅立つことは絶対 許さないから<br>生まれ変わったとしても<br>出会い方が最悪でも<br>また僕は君に恋するんだよ<br>僕の心は 君にいつも片思い<br>好きだよ<br>わかってよ わかってよ わかってよ<br>Darlin'' 夢が叶ったの<br>お似合いの言葉が見つからないよ<br>Darlin'' 夢が叶ったの<br>ねえ darlin''「愛してる」');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (82,26,18,'猫','夕焼けが燃えてこの街ごと<br>飲み込んでしまいそうな今日に<br>僕は君を手放してしまった<br>明日が不安だ とても嫌だ<br>だからこの僕も一緒に<br>飲み込んでしまえよ夕焼け<br>だけどもそうはいかないよな<br>明日ってウザいほど来るよな<br>眠たい夜になんだか笑っちゃう<br>家まで帰ろう 1人で帰ろう<br>昨日のことなど 幻だと思おう<br>君の顔なんて忘れてやるさ<br>馬鹿馬鹿しいだろ、そうだろ<br>君がいなくなった日々も<br>このどうしようもない気だるさも<br>心と体が喧嘩して<br>頼りない僕は寝転んで<br>猫になったんだよな 君は<br>いつかフラッと現れてくれ<br>何気ない毎日を君色に染めておくれよ<br>夕焼けが燃えてこの街ごと<br>飲み込んでしまいそうな今日に<br>僕は君を手放してしまった<br>若すぎる僕らはまた1から<br>出会うことは可能なのかな<br>願うだけ無駄ならもうダメだ<br>家までつくのがこんなにも嫌だ<br>歩くスピードは<br>君が隣にいる時のまんま<br>想い出巡らせ<br>がんじがらめのため息ばっか<br>馬鹿にしろよ、笑えよ<br>君がいなくなった日々は<br>面白いくらいにつまらない<br>全力で忘れようとするけど<br>全身で君を求めてる<br>猫になったんだよな君は<br>いつかまたあの声を聞かせてよ<br>矛盾ばっかで無茶苦茶な僕を<br>慰めてほしい<br>君がいなくなった日々も<br>このどうしようもない気だるさも<br>心と体が喧嘩して<br>頼りない僕は寝転んで<br>猫になったんだよな君は<br>いつかフラッと現れてくれ<br>何気ない毎日を君色に染めておくれよ<br>君がもし捨て猫だったら<br>この腕の中で抱きしめるよ<br>ケガしてるならその傷拭うし<br>精一杯の温もりをあげる<br>会いたいんだ忘れられない<br>猫になってでも現れてほしい<br>いつか君がフラッと現れて<br>僕はまた、幸せで');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (83,27,19,'フィナーレ','君はほんとにわかってないよ<br>例えばハッピーエンドより<br>甘くて豪華なデザートより<br>君がいいんだよ<br>ふたつの傘より相合い傘<br>ちょっと冷たいけど<br>「愛するための」<br>代償ならいくらでもどうぞ<br>ただずっと側にいたい<br>ねえ ダーリン<br>Oh 星屑もない<br>ふたりぼっちの世界でずっと<br>最後の花火をあげて<br>フィナーレを飾って<br>奇跡の降る恋に落ちて<br>ダーリン もう離さないで<br>味気ない世界も悪くないね<br>どんなに恋をしたって 出逢えないよきっと<br>終りのない幸せにキスをしよ<br>いつか今日を忘れても君がいいんだよ<br>天気雨の日<br>いい合いっこして はじめて目があった<br>ずっと覚えとくよ<br>Oh, woo yeah, oh, woo<br>Oh oh<br>ねえ ダーリン<br>Oh 星屑もない<br>ふたりぼっちの世界でずっと<br>最後の花火をあげて<br>フィナーレを誓って<br>奇跡の降る恋に落ちて<br>ダーリン もう離さないで<br>素っ気ない世界も悪くないね<br>どんなに恋をしたって忘れられないの<br>終りのない幸せにキスをしよ<br>Wow, wow, ah yeah<br>Wow, wow, ah yeah<br>Wow, wow, ah yeah<br>Wow, wow<br>味気ないね<br>でもそれがね ふたりの幸せ');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (84,28,6,'115万キロのフィルム','これから歌う曲の内容は僕の頭の中のこと<br>主演はもちろん君で 僕は助演で監督でカメラマン<br>目の奥にあるフィルムで作る映画の話さ ah<br>くだらないなと笑ったんなら掴みはそれで万事OK!<br>呆れていないでちょっと待って<br>きっと気に入ってもらえると思うな<br>ここまでのダイジェストを少しだけ見せるよ<br>初めて喧嘩した夜の涙<br>個人的に胸が痛むけれど<br>そのまま見続けよう<br>ごめんねと言って仲直りして手を握って<br>ほら ここで君が笑うシーンが見どころなんだからさ ah<br>写真にも映せやしないとても些細なその仕草に<br>どんな暗いストーリーも覆す瞬間が溢れてる<br>どれかひとつを切り取って<br>サムネイルにしようとりあえず今の所は<br>きっと10年後くらいにはキャストが増えたりもするんだろう<br>今でも余裕なんてないのにこんな安月給じゃもうキャパオーバー!<br>きっと情けないところも山ほど見せるだろう<br>苗字がひとつになった日も<br>何ひとつ代わり映えのない日も<br>愛しい日々尊い日々<br>逃さないように忘れないように焼き付けていくよ<br>今 目を細めて恥じらいあって永遠を願った僕たちを<br>すれ違いや憂鬱な展開が引き裂こうとしたその時には<br>僕がうるさいくらいの声量でこの歌何度も歌うよ<br>だからどうかそばにいて<br>エンドロールなんてもん作りたくもないから yeah<br>クランクアップがいつなのか僕らには決められない<br>だから風に吹かれていこう (風に吹かれていこう)<br>フィルムは用意したよ (フィルムは用意したよ)<br>一生分の長さを ざっと115万キロ<br>ほら ここで君が笑うシーンが見どころなんだからさ ah<br>写真にも映せやしないとても些細なその仕草に<br>どんな暗いストーリーも覆す瞬間が溢れてる<br>どれかひとつを切り取って サムネイルにしよう<br>さあ これから生まれる名場面を探しにいこうよ<br>酸いも甘いも寄り添って<br>一緒に味わおうフィルムがなくなるまで<br>撮影を続けようこの命ある限り');
Insert into JPAT.MUSIC (POST_IDX,MUSIC_IDX,SINGER_IDX,MUSIC,LYRICS) values (87,29,1,'愛の賞味期限','どうか最後に会いに来てくれないか<br>言葉だけじゃもう何も埋まらないんだ<br>泣き顔でも笑顔でもいい<br>君に会いたい<br><br>こんな日が来ると思わなかったんだ<br>君の傍に居られなくてごめんね<br>せめて星に願いを<br><br>悲しまないで居て　前を見て<br>振り返らないで<br>僕の居ない街で　当たり前に<br>恋をして笑って<br>待ち合わせは星街の駅で<br>君が忘れていても<br><br>どうも最後らしく振舞えないんだ<br>涙ひとつくらい流すと思ったんだ<br>上手く隠せているだろうか　<br>バレていないかな<br><br>まるでひとつみたいに<br>想っていたいんだ<br>離れてても過ごしたあの時間は<br>嘘じゃないとわかってる<br><br>悲しまないで居て　前を見て<br>振り返らないで<br>僕が泣いている　理由なんて<br>知らないで笑って<br>待ち合わせは星街の駅で<br>いつか会える日まで<br><br>思い出なんてやっかいなものを<br>抱えてまでどこに行きたいの<br>辿り着く場所は同じだと<br>信じているから<br><br>悲しまないで居て　前を見て<br>振り返らないで<br>僕の居ない街で　当たり前に<br>恋をして笑って<br>待ち合わせは星街の駅で<br>君が忘れていても<br><br>悲しまないで居て　前を見て<br>振り返らないで<br>僕が泣いている　理由なんて<br>気付かなくていいよ<br>待ち合わせは星街の駅で<br>いつか笑えるように');
REM INSERTING into JPAT.POST
SET DEFINE OFF;
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (1,2,'好きな歌','大好きな歌です',2,'奏','285da275d9a82a3f64eeef8615785eff6373e2325a9a5fc9b983b16da577fb',null,to_date('24-10-30','RR-MM-DD'),null,20,4,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (2,2,'tukiの歌','いいと思う',4,'ラミィ','40232ac470357befd8a437c4a2fbed473f678d51e7eae5eed0e69da7ea21',null,to_date('24-10-30','RR-MM-DD'),null,12,2,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (3,1,'君たちが好きな歌はどのか？','お勧めください',null,'ロロ','55574e5393af81786b4a44393a564ee676a7717d7c4f5a87eb62f6aced3135f0',null,to_date('24-10-30','RR-MM-DD'),null,31,11,1);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (4,2,'この歌を聞いたことがある？','今日初めて聞いた歌のでいいと思って持ってきた',5,'ペコラ','504583fd8b4f5585f8b36a47417fc17953aab39371eca26ca4ac6d77a8e6bd',null,to_date('24-10-30','RR-MM-DD'),null,19,7,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (5,2,'私の最推しね','この歌を初めて聞いた後vaundyを好きになった',null,'vaundyが好き','d7fced76167287f9ab928ec66d76fee9fd2bb26465841cefb6336dc3d3bb40',null,to_date('24-10-30','RR-MM-DD'),null,26,18,1);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (34,1,'ライブで聞きたい！最高の日本のバンド曲','ライブで盛り上がるようなバンドの名曲を知りたいです。みなさんのおすすめを教えてください！',36,'いろは','8953febbf8b73bc2c0412a9533212d480a4888bb8a69bdf91b43f854a1ac48',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (9,2,'映画を見た時に泣いた歌','悲しい映画だった',3,'マリン','c4b569a7b1dd12ff8ce1c102b4f34845d1539b43ac241c99b149e899742db24',null,to_date('24-10-30','RR-MM-DD'),null,10,7,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (10,2,'疲れる時に聞く歌','何もできると思いになる',null,'おまえら','55574e5393af81786b4a44393a564ee676a7717d7c4f5a87eb62f6aced3135f0',null,to_date('24-10-30','RR-MM-DD'),null,17,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (11,2,'綺麗な声だと思っている歌','大好きだよ',10,'すいせい','ae1efe1521d755c694d6d1601e287dfb9414d7d8d05835d103b3bba1ceab585',null,to_date('24-10-30','RR-MM-DD'),null,10,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (12,2,'疲れた時慰めてもらった歌','みんな頑張れ',2,'奏','285da275d9a82a3f64eeef8615785eff6373e2325a9a5fc9b983b16da577fb',null,to_date('24-10-30','RR-MM-DD'),null,14,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (14,1,'自身がよかったと思った歌をお勧めください','どのような歌手もいい',12,'はあと','c660e8582f17c6c332be21cc7a13693b79471bb89dbe288a21f74c40f1fdb33b',null,to_date('24-10-30','RR-MM-DD'),null,10,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (15,1,'今、聞くべき日本の名曲は？','最近心に響く日本の歌を探しています。皆さんのお気に入りを教えてください！',null,'サクラ','55574e5393af81786b4a44393a564ee676a7717d7c4f5a87eb62f6aced3135f0',null,to_date('24-10-30','RR-MM-DD'),null,6,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (16,2,'私が一番好きな歌','優里のshutterだよ',16,'あやめ','c88290ab4720e377a2e0fb3cf021aeb829b03c34f2ab1de1db3df1aab8cec952',null,to_date('24-10-30','RR-MM-DD'),null,11,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (17,2,'私も優里が好きだよ','特にドライフラワーが好きなんだよ',17,'ちょこ','566923af326777c97547bd27cf8ff20d2d85cc5506c33bc9c726ba5b1d208e',null,to_date('24-10-30','RR-MM-DD'),null,46,5,1);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (18,1,'あなたの一番好きなアニソンは？','アニメソングで特に好きな曲があればぜひ教えてください！どんなアニメの曲でもOKです。',6,'そら','7cb11a818c552f4c7e82c5efb28ad48481b6187a31d978dfd31edd62a8da98e',null,to_date('24-10-31','RR-MM-DD'),null,15,5,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (19,1,'この秋にぴったりの日本のバラードを教えて！','秋に合うしっとりとしたバラードを探しています。みんなのおすすめを教えてください。',8,'AZKi','3aa9e5835d1209dd7a8b59cb3476e68a1423c9dfa969e9c12581b5e8b1b19f',null,to_date('24-10-31','RR-MM-DD'),null,5,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (20,1,'元気が出る日本のポップソング','落ち込んだ時に聞いて元気が出るようなポップな曲を知りたいです。皆さんのイチオシは何ですか？',9,'みこ','b8e55aa3b5ca9f262f8bcc7c05947a26fdee2da6da2a5b7ea546fbff8e1054',null,to_date('24-10-31','RR-MM-DD'),null,1,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (21,2,'novalbrightの曲もいい','大好き',13,'フブキ','fa6f496a39803fc19cfcf6939e97d679cbd5cecf9efaf767519844c4ed0a6',null,to_date('24-10-31','RR-MM-DD'),null,8,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (25,2,'Pretender','OFFICIAL髭男DISMの歌',11,'アキ','9c83da4a1fe14f061a64dd5caf8bae5f07b4b942f32582c6e7858c6cc82bbc9',null,to_date('24-10-31','RR-MM-DD'),to_date('24-10-31','RR-MM-DD'),45,7,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (23,1,'懐かしい90年代の日本のヒットソングを探しています！','90年代の日本の名曲やヒット曲が聞きたいです。懐かしい曲があれば教えてください！',null,'ロロ','993d35c4c9cede728c3b9327fc772f369dd8ca9cbeffb5f8763324acf1167e4',null,to_date('24-10-31','RR-MM-DD'),null,10,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (24,2,'めっちゃ高い歌','難しい',11,'アキ','9c83da4a1fe14f061a64dd5caf8bae5f07b4b942f32582c6e7858c6cc82bbc9',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (26,1,'泣ける歌を教えて！','思わず涙が出てしまうような歌を知りたいです。皆さんの「泣ける歌」おすすめをぜひ！',18,'スバル','22f53f4e78454117f668ac554dbe14676873b0f7ca364e8f6056452cbed4e',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (27,1,'おすすめのロックバンドを教えてください！','日本のロックが大好きです。特に熱いバンドやおすすめの曲があれば教えてください。',null,'ああ','a3d9b31336a4705fd761bd9f32da3da76ea8ef4052bc839e60b44f137db52b2b',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (28,2,'ドキドキな歌','私もドキドキになりたいよ',16,'あやめ','c88290ab4720e377a2e0fb3cf021aeb829b03c34f2ab1de1db3df1aab8cec952',null,to_date('24-10-31','RR-MM-DD'),null,39,5,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (29,1,'夜にゆっくり聞きたい日本の曲','夜に聞くと落ち着く曲を探しています。みなさんの「夜にぴったりな曲」を教えてください。',15,'シオン','1c768068c1db483cc556a6d2fbc0a681312863c642fa8d11455241b5df932',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (30,1,'最新のJ-POPヒット曲、これがおすすめ！','最近話題のJ-POPで、特におすすめの曲はありますか？新しい発見をしたいです。',14,'まつり','d479fadf0c96735c15eb057f132f4c78619fdd69284f4bd41ebc9e367fe338',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (31,1,'ボーカロイド曲で特に好きなものは？','ボカロが好きな人に聞きたいです！お気に入りのボカロ曲や人気のあるものを教えてください！',null,'ロロ','50539671e78194727ee7d8afbe95a2f7555dbc3db2b82302eaed8ae55d84a67',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (32,1,'カラオケで盛り上がる日本の曲を教えて！','友達とカラオケで歌うと盛り上がる曲を知りたいです。みなさんのおすすめは何ですか？',null,'ロロ','cc8aba39ea8cc2dc3a213e796c2f93b604f2a54433e283696b208392443e',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (33,1,'恋愛ソングのおすすめは？','恋愛について歌った日本の名曲が聞きたいです。心に染みるようなラブソングがあれば教えてください！',5,'ペコラ','504583fd8b4f5585f8b36a47417fc17953aab39371eca26ca4ac6d77a8e6bd',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (35,1,'勉強や作業中にぴったりの日本の曲','作業や勉強をしている時に集中できる曲を探しています。皆さんの「作業BGM」に合う曲を教えてください！',35,'クロヱ','e812cf1b91b1758e7917b97bb6a1763dbc6fde63e6b8f102527684777719',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (36,1,'ゆったりとした気分にぴったりな日本の歌は？','ゆっくりとした気分になりたい時に聞くと良い曲があれば教えてください。',34,'こより','9a606778d3bba56dadc2bff55dd363f654249a5a34e661ae5a2708925923e',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (37,1,'夢や希望について歌った日本の名曲は？','前向きな気持ちになれる、夢や希望についての歌を知りたいです。ぜひおすすめを教えてください！',33,'ルイ','c35e631aedec24fee6d164aeac22c3b429bce8258afd96eeabc97b78acc8f',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (38,1,'アイドルソングで今一番ホットな曲は？','最近のアイドルソングで話題の曲やおすすめを知りたいです。皆さんのおすすめを教えてください！',32,'ラプラス','2a3af0b4a77de736294377ad329d3af3b4dd2734a295a9edd962dcc4e4a7b0',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (39,1,'雨の日にぴったりな日本の曲','雨の日に聞くと落ち着くような曲や、しっとりとした雰囲気の曲を探しています。',31,'ポルカ','65da26c39b7d7cfdf69c02e456d4ff2b87e5a496c1abdb4b1170cc6a65',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (40,1,'勇気が出る日本のアーティストの歌','つらい時に勇気をくれるような日本のアーティストの歌が聞きたいです。皆さんの応援ソングを教えてください！',30,'ぼたん','42508e6d430153c9a653284912264ffbf17f211ceb15951d6d6ae261ad285',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (41,1,'昭和の名曲を知りたい！','昭和時代の名曲や定番曲が聞きたいです。懐かしい昭和の歌でおすすめがあれば教えてください！',29,'ねね','d2cd30ea7a46671e6fa8d3f891c743ced8e143819b0e05e4d5b496424a89b56',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (42,1,'落ち込んだ時に聞きたい癒しの曲','気分が落ち込んでいる時に元気が出るような癒しの曲を教えてください。心が落ち着く曲を探しています！',28,'ルーナ','b3a964c2a8299dff444f2ab5d6e86061e71a7ab232d5932762fafda760eb6ff3',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (43,1,'日本のヒップホップでおすすめの曲は？','日本のヒップホップシーンが好きです！特におすすめの曲やアーティストがいたらぜひ教えてください。',27,'トワ','ea9bbe78db2e54c9943bdb3c4acf4cd5a7c2641398a447532454438a832d3cb',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (44,1,'おすすめのサマーソングを教えて！','夏にぴったりの爽やかな曲を探しています。みなさんが夏になると聞きたくなる曲は何ですか？',26,'わため','c1deb0b2616f92a4f81e76d539627d635deb604a209daa1914267a52f547cb4',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (45,1,'夜のドライブにぴったりな日本の曲','夜にドライブする時に聞くと最高な曲があれば教えてください。お気に入りのドライブソングをシェアしましょう！',25,'かなた','b28cf7bdac442831174e063375f5083bb462069772722d9f5c538e6b7637932',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (46,1,'邦ロックで注目のアーティストは？','日本のロックバンドやアーティストで今注目している人はいますか？おすすめの楽曲も合わせて教えてください！',24,'ノエル','9a5a56f18e22ea1c70ca91e6aba27d9af099d48a81f4b93eb243bea7aab66d96',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (47,1,'最新のアイドルソングでお気に入りは？','最近デビューしたアイドルや人気のアイドルソングでおすすめの曲はありますか？注目の曲を教えてください！',23,'フレア','90148ef276244e8af1d287b63e3be4a07b7c7cbb1521b9718b6d12ab1c3f',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (48,1,'ピアノメインの曲でおすすめは？','ピアノがメインで使われている日本の曲で、特におすすめのものがあれば教えてください！',21,'おかゆ','76a99de61e2f85b7bdafede9c46392ded5416c72d37d95fd71545dbf7070',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (49,1,'一度聞いたら忘れられないキャッチーな日本の曲','頭から離れなくなるようなキャッチーな日本の曲を探しています。皆さんのおすすめを教えてください！',20,'ミオ','9f56a7c3df7741c7614c576bb3689d5edbe787cef5db31b1f40a36fb3a21ffb',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (50,1,'秋に聞きたくなる曲ってありますか？','秋の季節にぴったりの曲を探しています。みなさんのお気に入りの秋ソングを教えてください！',22,'ころね','fffa7c189e519e75d8ae1fbb3bc7764c8d39da51f5293124c8ede68d16b59d',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (51,1,'アコースティックな感じの曲を教えてください！','アコースティックな雰囲気の曲で、日本のアーティストのおすすめがあればぜひ教えてください。',2,'奏','285da275d9a82a3f64eeef8615785eff6373e2325a9a5fc9b983b16da577fb',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (52,1,'春の気分にぴったりな日本の曲','桜が咲く季節にぴったりの曲を探しています。皆さんの「春に聴きたい曲」を教えてください！',3,'マリン','c4b569a7b1dd12ff8ce1c102b4f34845d1539b43ac241c99b149e899742db24',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (53,1,'気分を盛り上げるダンスソングは？','踊りたくなるようなノリの良いダンスソングを探しています。日本の曲でおすすめがあれば教えてください！',4,'ラミィ','40232ac470357befd8a437c4a2fbed473f678d51e7eae5eed0e69da7ea21',null,to_date('24-10-31','RR-MM-DD'),null,0,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (54,1,'ラップがかっこいい日本の曲は？','かっこいいラップが入った日本の曲があれば知りたいです。皆さんのお気に入りを教えてください！',5,'ペコラ','504583fd8b4f5585f8b36a47417fc17953aab39371eca26ca4ac6d77a8e6bd',null,to_date('24-10-31','RR-MM-DD'),null,16,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (55,1,'友達と楽しむのにぴったりな日本の歌','友達と一緒に楽しめるような曲を探しています。みなさんのおすすめを教えてください！',6,'そら','7cb11a818c552f4c7e82c5efb28ad48481b6187a31d978dfd31edd62a8da98e',null,to_date('24-10-31','RR-MM-DD'),null,13,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (56,1,'美しい歌詞に感動する日本の曲','歌詞が美しくて心に響く日本の曲を教えてください。感動した歌詞があればぜひシェアしてください。<br><br>',7,'ロボ子さん','d12e38b27a3a48aa0e064db84727b3dbae13acd2ec3729c602bb87c9f8c',null,to_date('24-10-31','RR-MM-DD'),null,1,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (57,1,'雨の日にぴったりの癒しソング','雨の日にリラックスできるような癒しソングを探しています。皆さんのおすすめは何ですか？',8,'AZKi','3aa9e5835d1209dd7a8b59cb3476e68a1423c9dfa969e9c12581b5e8b1b19f',null,to_date('24-10-31','RR-MM-DD'),null,13,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (58,1,'失恋の痛みを癒してくれる曲','失恋した時に聴きたい、心の支えになるような曲があれば教えてください。',9,'みこ','b8e55aa3b5ca9f262f8bcc7c05947a26fdee2da6da2a5b7ea546fbff8e1054',null,to_date('24-10-31','RR-MM-DD'),null,18,2,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (59,1,'ノスタルジックな気分になれる日本の曲','昔を思い出させてくれるようなノスタルジックな曲を探しています。皆さんの思い出の曲は何ですか？',36,'いろは','8953febbf8b73bc2c0412a9533212d480a4888bb8a69bdf91b43f854a1ac48',null,to_date('24-10-31','RR-MM-DD'),null,8,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (60,1,'夜の一人時間に聴きたい静かな曲','夜、一人でゆっくりとした時間を過ごすときに聴きたい静かな曲を知りたいです。<br><br>',35,'クロヱ','e812cf1b91b1758e7917b97bb6a1763dbc6fde63e6b8f102527684777719',null,to_date('24-10-31','RR-MM-DD'),null,31,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (61,2,'あいみょんの歌の中で最高だと思う','マリゴールドです',35,'クロヱ','e812cf1b91b1758e7917b97bb6a1763dbc6fde63e6b8f102527684777719',null,to_date('24-10-31','RR-MM-DD'),null,51,6,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (62,2,'一つおすすめ','Saucy Dogの歌',34,'こより','9a606778d3bba56dadc2bff55dd363f654249a5a34e661ae5a2708925923e',null,to_date('24-10-31','RR-MM-DD'),null,21,7,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (63,2,'yoasobi好き？','私が好き',33,'ルイ','c35e631aedec24fee6d164aeac22c3b429bce8258afd96eeabc97b78acc8f',null,to_date('24-10-31','RR-MM-DD'),null,18,2,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (64,1,'日本のレゲエやスカでおすすめの曲','日本のレゲエやスカで聴いたことのあるおすすめの曲を教えてください！新しいジャンルを楽しみたいです。',32,'ラプラス','2a3af0b4a77de736294377ad329d3af3b4dd2734a295a9edd962dcc4e4a7b0',null,to_date('24-10-31','RR-MM-DD'),null,26,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (65,2,'私が好きな歌手','ヨルシカだよ',31,'ポルカ','65da26c39b7d7cfdf69c02e456d4ff2b87e5a496c1abdb4b1170cc6a65',null,to_date('24-10-31','RR-MM-DD'),null,23,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (66,1,'旅行中に聴きたい日本の曲は？','旅行中や移動中にぴったりの日本の曲を探しています。皆さんが旅の間によく聴く曲を教えてください！',30,'ぼたん','42508e6d430153c9a653284912264ffbf17f211ceb15951d6d6ae261ad285',null,to_date('24-10-31','RR-MM-DD'),null,16,1,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (67,1,'夏祭りに聴きたい日本の伝統音楽や夏歌','夏祭りやお祭りの雰囲気を感じられる日本の曲や伝統音楽があれば教えてください！',29,'ねね','d2cd30ea7a46671e6fa8d3f891c743ced8e143819b0e05e4d5b496424a89b56',null,to_date('24-10-31','RR-MM-DD'),null,20,4,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (68,1,'気分をリフレッシュするための日本の曲は？','ストレス解消や気分転換にぴったりな曲を知りたいです。皆さんの「リフレッシュソング」は何ですか？',28,'ルーナ','b3a964c2a8299dff444f2ab5d6e86061e71a7ab232d5932762fafda760eb6ff3',null,to_date('24-10-31','RR-MM-DD'),null,9,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (69,1,'朝の通勤・通学に元気が出る曲','朝の通勤や通学時に気分が上がるような元気な曲を教えてください。皆さんの朝の定番曲は？',27,'トワ','ea9bbe78db2e54c9943bdb3c4acf4cd5a7c2641398a447532454438a832d3cb',null,to_date('24-10-31','RR-MM-DD'),null,19,2,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (70,1,'最近ハマっている日本のインディーズソング','インディーズシーンでおすすめの曲があればぜひ教えてください！新しいアーティストも歓迎です。',26,'わため','c1deb0b2616f92a4f81e76d539627d635deb604a209daa1914267a52f547cb4',null,to_date('24-10-31','RR-MM-DD'),null,30,3,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (71,1,'家でゆったり過ごすときに聴きたい曲','家でリラックスしながら聴けるゆったりした日本の曲があれば教えてください！',25,'かなた','b28cf7bdac442831174e063375f5083bb462069772722d9f5c538e6b7637932',null,to_date('24-10-31','RR-MM-DD'),null,13,4,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (72,1,'夕日の中で聴きたいエモい日本の曲','夕方の静かな時間に聴くと心に響くような曲を探しています。皆さんのおすすめを教えてください！',24,'ノエル','9a5a56f18e22ea1c70ca91e6aba27d9af099d48a81f4b93eb243bea7aab66d96',null,to_date('24-10-31','RR-MM-DD'),null,32,5,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (73,1,'日本のポエトリーリーディングや詩的な曲は？','詩のような歌詞が印象的な日本の曲があれば教えてください。深い言葉が込められた曲を知りたいです。',23,'フレア','90148ef276244e8af1d287b63e3be4a07b7c7cbb1521b9718b6d12ab1c3f',null,to_date('24-10-31','RR-MM-DD'),null,16,5,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (77,2,'優里の歌','大好きだよ',20,'ミオ','9f56a7c3df7741c7614c576bb3689d5edbe787cef5db31b1f40a36fb3a21ffb',null,to_date('24-10-31','RR-MM-DD'),null,29,11,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (75,1,'時代を超えて愛される昭和歌謡の名曲','いつまでも聴き続けたい昭和歌謡の名曲があれば教えてください！懐かしい名曲を共有しましょう。',21,'おかゆ','76a99de61e2f85b7bdafede9c46392ded5416c72d37d95fd71545dbf7070',null,to_date('24-10-31','RR-MM-DD'),null,18,2,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (76,1,'アートな世界観を感じる日本の音楽','独特な世界観やアート性が高い曲を探しています。クリエイティブな日本の音楽でおすすめがあれば教えてください！',22,'ころね','fffa7c189e519e75d8ae1fbb3bc7764c8d39da51f5293124c8ede68d16b59d',null,to_date('24-10-31','RR-MM-DD'),null,14,4,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (78,2,'菅田将暉の歌','好きだよ',18,'スバル','22f53f4e78454117f668ac554dbe14676873b0f7ca364e8f6056452cbed4e',null,to_date('24-10-31','RR-MM-DD'),null,23,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (79,2,'時をかける少女の代表的な歌','感動的だった',17,'ちょこ','566923af326777c97547bd27cf8ff20d2d85cc5506c33bc9c726ba5b1d208e',null,to_date('24-10-31','RR-MM-DD'),null,35,2,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (80,2,'YOASOBIの歌だよ','大好き',16,'あやめ','c88290ab4720e377a2e0fb3cf021aeb829b03c34f2ab1de1db3df1aab8cec952',null,to_date('24-10-31','RR-MM-DD'),null,19,8,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (81,2,'Aimerの歌','好きだよ',15,'シオン','1c768068c1db483cc556a6d2fbc0a681312863c642fa8d11455241b5df932',null,to_date('24-10-31','RR-MM-DD'),null,28,2,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (82,2,'DISH//のTFKもいい','恋に落ちた',14,'まつり','d479fadf0c96735c15eb057f132f4c78619fdd69284f4bd41ebc9e367fe338',null,to_date('24-10-31','RR-MM-DD'),null,24,3,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (83,2,'eillの歌だよ','大好き',null,'ころねすき','d4f380ca86f35c0c7943377e6e285479c12434de6288ba10c7ca1ac9ecd',null,to_date('24-10-31','RR-MM-DD'),null,24,6,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (84,2,'Official髭男dism - 115万キロのフィルム','大好きな曲です',2,'奏','285da275d9a82a3f64eeef8615785eff6373e2325a9a5fc9b983b16da577fb',null,to_date('24-10-31','RR-MM-DD'),null,120,14,2);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (87,2,'tuki.の最新曲です','やはりtuki.だと思います',43,'test','15de9264f8dc5af3a46b87c459c6b74f9a3bb607dbd1db49b8e1af2a3abb4',null,to_date('24-11-04','RR-MM-DD'),to_date('24-11-04','RR-MM-DD'),7,0,0);
Insert into JPAT.POST (POST_IDX,POST_TYPE_IDX,TITLE,CONTENTS,USER_IDX,NICKNAME,PASSWORD,IMGURL,REGDATE,MODIFYDATE,VIEWCOUNT,LIKECOUNT,REPLYCOUNT) values (89,1,'not login user test','not login user contents',null,'not login user','1df0d09c27de107954bf4ddf92d78533b5e3f3f4f3eff01a5f157a74c26938','KakaoTalk_20241104_140918093_7381a48a-c634-426f-bf5a-b2562c3bbe18.jpg',to_date('24-11-04','RR-MM-DD'),null,2,0,0);
REM INSERTING into JPAT.POST_SUGGEST
SET DEFINE OFF;
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,1,'https://www.youtube.com/embed/oZpYEEcvu5I','https://img.youtube.com/vi/oZpYEEcvu5I/mqdefault.jpg','晩餐歌','TUKI.','君を泣かすから だから一緒には居れないな<br>君を泣かすから 早く忘れて欲しいんだ<br>人間だからね たまには違うものも食べたいね<br>君を泣かすから そう君を泣かすから<br>でも味気ないんだよね<br>会いたくなんだよね<br>君以外会いたくないんだよね<br>なんて勝手だね<br>大体曖昧なんだよね<br>愛の存在証明なんて<br>君が教えてくれないか<br>何十回の夜を過ごしたって得られぬような<br>愛してるを並べてみて<br>何十回の夜を過ごしたって得られぬような<br>最高のフルコースを頂戴<br>君を泣かすから きっと一生は無理だよね<br>君を泣かすから 胸がとても痛くなんだ<br>人間だからね たまには分かり合えなくなって<br>君を泣かすから また君を泣かすから<br>でも自信がないんだよね<br>変わりたくないんだよね<br>君以外会いたくないんだよね<br>なんて勝手だね<br>大体曖昧だったよね<br>愛の存在証明なんて<br>君がそこに居るのにね<br>何百回の夜を過ごしたって得られぬような<br>愛してるを並べてみて<br>何百回の夜を過ごしたって得られぬような<br>最高のフルコースを頂戴<br>離れないで 傍に居てくれたのは<br>結局君一人だったよね<br>涙のスパイスは君の胸に<br>残ってしまうだろうけど<br>何千回の夜を過ごしたって得られぬような<br>愛してるを並べるから<br>何千回の夜を過ごしたって得られぬような<br>最高のフルコースを<br>何万回の夜を過ごしたって忘れぬような<br>愛してるを並べるから<br>何万回の夜を過ごしたって忘れぬような<br>最高のフルコースを頂戴');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,2,'https://www.youtube.com/embed/rpVvPAFaoqM','https://img.youtube.com/vi/rpVvPAFaoqM/mqdefault.jpg','サクラキミワタシ','TUKI.','第二ボタンをはずしながら言う<br>「最後だからいいよ」って<br>卒業の日の教室はどこか<br>寂し気な顔をしている<br>時計が巻き戻るなら<br>貴方ともっと話したかった<br>返事はいらないからさ<br>二人のストーリーあげちゃおうよ<br>恋しているんだ サクラキミワタシ<br>春に散る恋だ わかっていたのに<br>恋してしまったの 桜 君 愛し<br>泣いちゃってごめんね<br>黒板とノート ペンが走る音<br>グランドを見つめた<br>方程式じゃ何もわからない<br>答えを探してたんだ<br>急かすようにチャイムが鳴る<br>ここにはもう居られないって<br>時が止まりますように<br>二人のストーリーを夢見てた<br>恋しているんだ サクラキミワタシ<br>春に散る恋だ わかっていたのに<br>恋してしまったの 桜 君 愛し<br>泣いちゃってごめんね<br>振り返る通いなれた道も<br>懐かしくなってしまうんだろう<br>君の事をそんな風にさ<br>思い出したくないのにな<br>恋しているんだ サクラキミワタシ<br>春に置いて行く 恋焦がれた日々<br>永遠に戻れない 桜 君 愛し<br>壊れちゃいそうだよ<br>恋しているんだ サクラキミワタシ<br>春に散る恋だ わかっていたのに<br>恋してしまったの 桜 君 愛し<br>泣いちゃってごめんね');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,4,'https://www.youtube.com/embed/XdquKj6ucEI','https://img.youtube.com/vi/XdquKj6ucEI/mqdefault.jpg','ミズキリ','優里','恋はどんなことでさえも超えていけると<br>思える日が来るだなんて思わなくて<br>住んでる世界が違うのかな<br>なんて君を遠く感じていた<br>だけど今 触れる<br>萎れかけた花に熱を与えたの<br>世界が変わるほどに 奇跡のように<br>あなただけが瞳に映るの<br>眼を閉じれば傍に居るの<br>全ての事を超えていくために<br>ウシロムキは水切りしよう<br>さよならの後 振り返って君が笑う<br>いつまでそこに居るのなんて思いながら<br>出来れば帰りたくはないな<br>なんて君を遠く感じていた<br>手と手が触れ合う<br>もう二度と誰かのこと<br>好きになるなんてないと思ってた 間違いだね<br>あなただけが瞳に映るの<br>眼を閉じれば傍に居るの<br>全ての事を超えていくために<br>ウシロムキは水切りしよう<br>そんな眼しないで 次に会う時の分までキスしよう<br>戸惑いもすれ違いでも 引き裂けやしないよ<br>あなただけが瞳に映るの<br>眼を閉じれば傍に居るの<br>全ての事を超えていくために<br>ウシロムキは水切りしよう');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,5,'https://www.youtube.com/embed/UM9XNpgrqVk','https://img.youtube.com/vi/UM9XNpgrqVk/mqdefault.jpg','怪獣の花唄','VAUNDY','思い出すのは君の歌<br>会話よりも鮮明だ<br>どこに行ってしまったの<br>いつも探すんだよ<br>思い出すのは君の歌<br>歌い笑う顔が鮮明だ<br>君に似合うんだよ<br>ずっと見ていたいよ<br>でも最後に見たいのは<br>きっともう君の夢の中<br>もう一度 また聞かせてくれよ<br>聞きたいんだ<br>もっと騒げ怪獣の歌<br>まだ消えない 夢の歌唱えて<br>君がいつも歌う怪獣の歌<br>まだ消えない 口ずさんでしまうよ<br>思い出すのは 君がいた<br>ギター持ってる 君がいた<br>忘れられないんだよ<br>だから僕が歌うよ<br>でも最後に見たいのは<br>きっともう君の夢の中<br>もう一度 また聞かせてくれよ<br>聞きたいんだ<br>もっと騒げ怪獣の歌<br>まだ消えない 夢の歌唱えて<br>君がいつも歌う怪獣の歌<br>まだ消えない 口ずさんでしまうよ<br>落ちてく過去は鮮明で<br>見せたい未来は繊細で<br>すぎてく日々には鈍感な君へ<br>落ちてく過去は鮮明で<br>見せたい未来は繊細で<br>すぎてく日々には鈍感な君へ<br>ねぇ もっと騒げ怪獣の歌<br>まだ消えない 夢の歌唱えて<br>君がいつも歌う怪獣の歌<br>まだ消えない 口ずさんでしまうよ whoa<br>ねぇ 僕ら 眠れない夜に手を伸ばして<br>眠らない夜をまた伸ばして<br>眠くないまだね<br>そんな日々でいたいのにな<br>懲りずに 眠れない夜に手を伸ばして<br>眠らない夜をまた伸ばして<br>眠くないまだね<br>そんな夜に歌う 怪獣の歌<br>落ちてく過去は鮮明で<br>見せたい未来は繊細で<br>すぎてく日々には鈍感な君へ<br>落ちてく過去は鮮明で<br>見せたい未来は繊細で<br>すぎてく日々には鈍感な君へ');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,9,'https://www.youtube.com/embed/T8y_RsF4TSw','https://img.youtube.com/vi/T8y_RsF4TSw/mqdefault.jpg','ハッピーエンド','BACK NUMBER','さよならが喉の奥に つっかえてしまって<br>咳をするみたいにありがとうて言ったの<br>次の言葉はどこかと ポケットを探しても<br>見つかるのはあなたを好きな私だけ<br>平気よ大丈夫だよ優しくなれたと思って<br>願いに変わって最後は嘘になって<br>青いまま枯れていく<br>あなたを好きなままで消えてゆく<br>私みたいと手に取って<br>奥にあった想いと一緒に握り潰したの<br>大丈夫 大丈夫<br>今すぐに抱きしめて<br>私がいれば何もいらないと<br>それだけ言ってキスをして<br>なんてね 嘘だよ ごめんね<br>こんな時思い出す事じゃないとは思うんだけど<br>１人にしないよってあれ実は嬉しかったよ<br>あなたが勇気を出して初めて電話をくれた<br>あの夜の私と何が違うんだろう<br>どれだけ離れていてもどんなに会えなくても<br>気持ちが変わらないからここにいるのに<br>青いまま枯れてゆく<br>あなたを好きなままで消えてゆく<br>私をずっと覚えていて<br>なんてね 嘘だよ 元気でいてね<br>泣かない私に少しほっとした顔のあなた<br>相変わらず暢気ね そこも大好きよ<br>気が付けば横にいて<br>別に君のままでいいのになんて<br>勝手に涙拭いたくせに<br>見える全部聴こえる全て<br>色付けたくせに<br>青いまま枯れてゆく<br>あなたを好きなままで消えてゆく<br>私みたいと手に取って<br>奥にあった想いと一緒に握り潰したの<br>大丈夫 大丈夫<br>今すぐに抱きしめて<br>私がいれば何もいらないと<br>そう言ってもう離さないで<br>なんてね 嘘だよ さよなら');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,10,'https://www.youtube.com/embed/O1bhZgkC4Gw','https://img.youtube.com/vi/O1bhZgkC4Gw/mqdefault.jpg','CRY BABY','OFFICIAL髭男DISM','胸ぐらを掴まれて 強烈なパンチを食らってよろけて<br>肩を並べうずくまった<br>予報通りの雨にお前はにやけて<br>「傷口が綺麗になる」なんて嘘をつく<br>いつも口喧嘩さえうまく出来ないくせして<br>冴えない冗談言うなよ<br>あまりのつまらなさに目が潤んだ<br>何度も青アザだらけで涙を 流して 流して<br>不安定な心を肩に預け合いながら 腐り切ったバッドエンドに抗う<br>なぜだろう 喜びよりも心地よい痛み ずっしりと響いて<br>濡れた服に舌打ちしながら 腫れ上がった顔を見合って笑う<br>土砂降りの夜に 誓ったリベンジ<br>胸ぐらを掴み返して 反撃のパンチを繰り出すくらいじゃなきゃ<br>お前の隣には立てないから<br>相手が何であれ日和らない 何度伸されても諦めない<br>忘れるな忘れるなと言い聞かせ続けたのに<br>どうして<br>(やり直して しくじって) どうして<br>(踏み倒して 肩落として) どうして どうして<br>あぁ 傘はいらないから言葉を一つくれないか<br>微温い優しさではなく<br>弱音に侵された胸の奥を抉るような言葉を<br>何度も青アザだらけで涙を 流して 流して<br>不安定な心を肩に預け合いながら 腐り切ったバッドエンドに抗う<br>なぜだろう 喜びよりも心地よい痛み ずっしりと響いて<br>濡れた服に舌打ちしながら 腫れ上がった顔を見合って笑う<br>土砂降りの夜に 囚われの日々に 問いかけるように<br>光った瞳の中で 誓ったリベンジ');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,11,'https://www.youtube.com/embed/a51VH9BYzZA','https://img.youtube.com/vi/a51VH9BYzZA/mqdefault.jpg','STELLAR STELLAR','星街すいせい','だって僕は星だから<br>Stellar Stellar<br>きっと君はもう気づいていた<br>僕の心の奥で描いた<br>それが これから話す 陳腐なモノローグさ<br>ずっと言えない言葉があった<br>壊せない壁があったんだ ずっとさ<br>ふっと香り立つ朝の匂いが<br>どうしようもなく憎らしくて<br>部屋の隅で 膝を抱えて震えていた<br>太陽なんていらないから<br>明けないでいて<br>その手を伸ばして 誰かに届くように<br>僕だって君と同じ 特別なんかじゃないから<br>そうさ 僕は夜を歌うよ Stellar Stellar<br>ありったけの輝きで<br>今宵 音楽は ずっと ずっと 止まない<br>そうだ 僕がずっとなりたかったのは<br>待ってるシンデレラじゃないさ<br>迎えに行く王子様だ<br>だって僕は星だから<br>なんて ありふれた話なんだ<br>理想だけ書き連ねていた<br>ノートの隅に眠る ほんのワンシーンだ<br>きっとあの星も泣いてるんだ<br>明日なんて来ないままでいて<br>その手を伸ばして 誰かに届くように<br>本当に大切なものは<br>目に見えないみたいなんだ<br>そうさ 僕は夜を歌うよ Stellar Stellar<br>ありのまま考えないで<br>今宵 音楽はきっときっと止まない<br>そうだ 僕がずっとなりたかったのは<br>あえかなヒロインじゃないさ<br>救いに行くヒーローだ<br>夢見がちなおとぎ話<br>おとぎ話<br>そうさ 僕は夜を歌うよ Stellar Stellar<br>ありったけの輝きで<br>今宵 音楽はずっとずっと止まない<br>そうさ 僕は愛を歌うよ Stellar Stellar<br>世界 宇宙の真ん中で<br>今宵 音楽はきっときっと止まない<br>そうだ 僕がずっとなりたかったのは<br>待ってるシンデレラじゃないさ<br>迎えに行く王子様だ<br>だって僕は星だから<br>そうだ僕は星だった<br>Stellar Stellar');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,12,'https://www.youtube.com/embed/iqEr3P78fz8','https://img.youtube.com/vi/iqEr3P78fz8/mqdefault.jpg','水平線','BACK NUMBER','出来るだけ嘘は無いように<br>どんな時も優しくあれるように<br>人が痛みを感じた時には<br>自分の事のように思えるように<br>正しさを 別の正しさで<br>失くす悲しみにも 出会うけれど<br>水平線が光る朝に あなたの希望が崩れ落ちて<br>風に飛ばされる欠片に 誰かが綺麗と呟いてる<br>悲しい声で歌いながら いつしか海に流れ着いて 光って<br>あなたはそれを見るでしょう<br>自分の背中は 見えないのだから<br>恥ずかしがらず人に 尋ねるといい<br>心は誰にも見えないのだから<br>見えるものよりも大事にするといい<br>毎日が重なる事で<br>会えなくなる人も出来るけれど<br>透き通るほど淡い夜に あなたの夢がひとつ叶って<br>歓声と拍手の中に 誰かの悲鳴が隠れている<br>耐える理由を探しながら いくつも答えを抱えながら 悩んで<br>あなたは自分を知るでしょう<br>誰の心に残る事も 目に焼き付く事もない今日も<br>雑音と足音の奥で 私はここだと叫んでいる<br>水平線が光る朝に あなたの希望が崩れ落ちて<br>風に飛ばされる欠片に 誰かが綺麗と呟いてる<br>悲しい声で歌いながら いつしか海に流れ着いて 光って<br>あなたはそれを見るでしょう<br>あなたはそれを見るでしょう');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,16,'https://www.youtube.com/embed/EZ5RGA2UULE','https://img.youtube.com/vi/EZ5RGA2UULE/mqdefault.jpg','SHUTTER','優里','君と見るはずだった花火が<br>夜の隙間を埋めてく<br>感傷にひたっちまうから<br>Twitterは閉じた<br>棚の上に置いたカメラも<br>今距離を置きたいくらい<br>僕は今日全て失って<br>一日中泣いていた<br>本当の気持ちは<br>やっぱりわからないけど<br>君のアルバムに居る僕を全部<br>消したんでしょう<br>シャッターが落ちるみたいに<br>君を切り取って恋に落ちて<br>心のアルバムに全部<br>そっとため込んでた<br>だからさ だからさ<br>仕草も匂いも覚えている<br>シャッターを切る時間も<br>君に触れていれば良かった<br>全ての時間を君だけに使えばよかった<br>お決まりのデートコースと<br>お決まりの愛の言葉<br>見栄えの良いものばかりが<br>インスタに残った<br>棚の上に置いたカメラじゃ<br>映せないものが<br>君と僕の間にあって<br>それに気づけなかった<br>今でも気持ちは<br>やっぱりわからないけど<br>君のアルバムに居る僕は全部<br>いらないんでしょう<br>シャッターが落ちるみたいに<br>君を切り取って恋に落ちて<br>壊したくなくて無難に<br>きっとやり過ごしてた<br>だからさ だからさ<br>映りの悪い僕だったろう<br>シャッターを切る時間も<br>君に触れていれば良かった<br>全ての時間を君だけに使えばよかった<br>どんなに綺麗で美しい宝石みたいな思い出も<br>そこに僕が居なきゃ 君が居なきゃ<br>何の意味もないのに<br>シャッターが落ちるみたいに<br>君を切り取って恋に落ちて<br>壊したくなくて無難に<br>きっとやり過ごしてた<br>だからさ だからさ<br>映りの悪い僕だったろう<br>シャッターを切る時間も<br>君に触れていれば良かった<br>シャッターが落ちるみたいに<br>君を切り取って恋に落ちて<br>心のアルバムに全部<br>そっとため込んでた<br>だからさ だからさ<br>仕草も匂いも覚えている<br>シャッターを切る時間も<br>君に触れていれば良かった<br>全ての時間を君だけに使えばよかった');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,17,'https://www.youtube.com/embed/kzZ6KXDM1RI','https://img.youtube.com/vi/kzZ6KXDM1RI/mqdefault.jpg','ドライフラワー','優里','多分 私じゃなくていいね<br>余裕のない二人だったし<br>気付けば喧嘩ばっかりしてさ<br>ごめんね<br>ずっと話そうと思ってた<br>きっと私たち合わないね<br>二人きりしかいない部屋でさ<br>貴方ばかり話していたよね<br>もしいつか何処かで会えたら<br>今日の事を笑ってくれるかな<br>理由もちゃんと話せないけれど<br>貴方が眠った後に泣くのは嫌<br>声も顔も不器用なとこも<br>全部全部 嫌いじゃないの<br>ドライフラワーみたい<br>君との日々もきっときっときっときっと<br>色褪せる<br>多分 君じゃなくてよかった<br>もう泣かされることもないし<br>「私ばかり」なんて言葉も<br>なくなった<br>あんなに悲しい別れでも<br>時間がたてば忘れてく<br>新しい人と並ぶ君は<br>ちゃんとうまくやれているのかな<br>もう顔も見たくないからさ<br>変に連絡してこないでほしい<br>都合がいいのは変わってないんだね<br>でも無視できずにまた少し返事<br>声も顔も不器用なとこも<br>多分今も 嫌いじゃないの<br>ドライフラワーみたく<br>時間が経てば<br>きっときっときっときっと色褪せる<br>月灯りに魔物が揺れる<br>きっと私もどうかしてる<br>暗闇に色彩が浮かぶ<br>赤黄藍色が胸の奥<br>ずっと貴方の名前を呼ぶ<br>好きという気持ち<br>また香る<br>声も顔も不器用なとこも<br>全部全部 大嫌いだよ<br>まだ枯れない花を<br>君に添えてさ<br>ずっとずっとずっとずっと<br>抱えてよ ah, ah');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,21,'https://www.youtube.com/embed/Q5JytNgQzqk','https://img.youtube.com/vi/Q5JytNgQzqk/mqdefault.jpg','愛とか恋とか','NOVELBRIGHT','月曜日の朝 憂鬱な気持ちも 君と会う日を思い浮かべれば<br>いつもの道に優しい風が吹き 心弾ませ今日が始まるよ<br>昔は聴かなかったあの歌や 映画や香水の匂いでさえも<br>君が好きなものってだけでさ どうして僕も好きなんだろう<br>こんなにも<br>愛とか恋とかの言葉で片付けられないくらいの<br>『愛してる』が溢れ出して 止まらない想い<br>君も同じかな 伝えよう目を見て 今すぐ走った<br>離れないように 離さないから 抱きしめたいよずっと<br>会えない時は思い出をめくって 近くに君を感じて励まされ<br>携帯に映る君からの通知を 開く時間に笑顔になれるよ<br>僕の腕で君が眠る夜も 夢でもいつでも君と過ごしてた<br>目が覚めても夢は醒めないまま 心が君で満ちていく<br>こんなにも<br>愛とか恋とかの言葉で片付けられないくらいの<br>「愛してる」が溢れ出して 止まらない想い<br>守りたい明日も この先訪れる未来を全部<br>預けてほしい 君以外はもう他には何もいらない<br>「なんともないよ」「大丈夫だよ」<br>溢す口癖 僕は気づいてるよ<br>弱くてもいい 泣いてもいいんだよ<br>僕の前で強がらないで<br>愛した理由はさ<br>ありきたりなのかもしれないけど<br>君以外には考えられない<br>愛とか恋とかの言葉で片付けられないくらいの<br>『愛してる』が溢れ出して 止まらない想い<br>君も同じかな 伝えよう目を見て 今すぐ走った<br>離れないように 離さないから 抱きしめたいよずっと');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,24,'https://www.youtube.com/embed/M6gcoDN9jBc','https://img.youtube.com/vi/M6gcoDN9jBc/mqdefault.jpg','逆夢','KING GNU','あなたが望むなら<br>この胸を射通して<br>頼りの無い僕もいつか<br>何者かに成れたなら<br>訳もなく<br>涙が溢れそうな<br>夜を埋め尽くす<br>輝く夢と成る<br>白い息は頼りなく<br>冬の寒さに溶けて消えた<br>あの日の重ねた手と手の<br>余熱じゃあまりに頼りないの<br>春はいつだって<br>当たり前の様に<br>迎えに来ると<br>そう思っていたあの頃<br>瞼閉じれば<br>夢はいつだって<br>正夢だと信じてたあの頃<br>あなたが望むなら<br>何処迄も飛べるから<br>意気地の無い僕もいつか<br>生きる意味を見つけたなら<br>愛と憎を<br>聢と繋ぎ合わせて<br>一生涯醒めない程の<br>荒んだ夢と成る<br>凍える夜空を<br>二人で抜け出すの<br>あたたかいコートを<br>そっと掛けたなら<br>あなたはいつだって<br>当たり前の様に隣にいると<br>そう思っていたあの頃<br>失くせやしない<br>記憶の雨が古傷へと<br>沁み渡ろうとも<br>あなたが望むなら<br>この胸を射通して<br>頼りの無い僕もいつか<br>何者かに成れたなら<br>訳もなく<br>涙が溢れそうな<br>夜を埋め尽くす<br>輝く夢と成る<br>記憶の海を潜って<br>愛の欠片を拾って<br>あなたの中にずっと<br>眩しい世界をそっと oh yeah<br>この愛が例え呪いのように<br>じんわりとじんわりと<br>この身体蝕んだとしても<br>心の奥底から<br>あなたが溢れ出して<br>求め合って重なり合う<br>その先で僕ら夢と成れ<br>あなたが望むなら<br>この胸を射通して<br>頼りの無い僕もいつか<br>何者かに成れたなら<br>訳もなく<br>涙が溢れそうな<br>夜を埋め尽くす<br>輝く夢と成る<br>正夢でも 逆夢だとしても');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,25,'https://www.youtube.com/embed/TQ8WlA2GXbk','https://img.youtube.com/vi/TQ8WlA2GXbk/mqdefault.jpg','PRETENDER','OFFICIAL髭男DISM','君とのラブストーリー<br>それは予想通り<br>いざ始まればひとり芝居だ<br>ずっとそばにいたって<br>結局ただの観客だ<br>感情のないアイムソーリー<br>それはいつも通り<br>慣れてしまえば悪くはないけど<br>君とのロマンスは人生柄<br>続きはしないことを知った<br>もっと違う設定で<br>もっと違う関係で<br>出会える世界線<br>選べたらよかった<br>もっと違う性格で<br>もっと違う価値観で<br>愛を伝えられたらいいな<br>そう願っても無駄だから<br>グッバイ<br>君の運命のヒトは僕じゃない<br>辛いけど否めない<br>でも離れ難いのさ<br>その髪に触れただけで<br>痛いや いやでも<br>甘いな いやいや<br>グッバイ<br>それじゃ僕にとって君は何？<br>答えは分からない<br>分かりたくもないのさ<br>たったひとつ確かなことがあるとするのならば<br>君は綺麗だ<br>誰かが偉そうに<br>語る恋愛の論理<br>何ひとつとしてピンとこなくて<br>飛行機の窓から見下ろした<br>知らない街の夜景みたいだ<br>もっと違う設定で<br>もっと違う関係で<br>出会える世界線<br>選べたらよかった<br>いたって純な心で<br>叶った恋を抱きしめて<br>好きだとか無責任に言えたらいいな<br>そう願っても虚しいのさ<br>グッバイ<br>繋いだ手の向こうにエンドライン<br>引き伸ばすたびに<br>疼きだす未来には<br>君はいない<br>その事実に Cry<br>そりゃ苦しいよな<br>グッバイ<br>君の運命のヒトは僕じゃない<br>辛いけど否めない<br>でも離れ難いのさ<br>その髪に触れただけで<br>痛いや いやでも<br>甘いな いやいや<br>グッバイ<br>それじゃ僕にとって君は何？<br>答えは分からない<br>分かりたくもないのさ<br>たったひとつ確かなことがあるとするのならば<br>君は綺麗だ<br>それもこれもロマンスの定めなら<br>悪くないよな<br>永遠も約束もないけれど<br>とても綺麗だ');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,28,'https://www.youtube.com/embed/mnta9Pp2LqA','https://img.youtube.com/vi/mnta9Pp2LqA/mqdefault.jpg','ラブレター','YOASOBI','初めまして大好きな音楽へ<br>ずっと考えてたこと<br>どうか聞いてほしくって<br>(伝えたいことがあるんです)<br>ちょっと照れ臭いけれど<br>ずっと想っていたこと<br>こんなお手紙に込めて<br>(届いてくれますように)<br><br>どんな時もあなたの<br>言葉 声を聴いているだけで<br>力が湧いてくるんだ<br><br>ねえ<br>笑っていたいよどんな時も<br>でも辛い暗い痛い日もある<br>けどね<br>あなたに触れるだけで気付けば<br>この世界が色鮮やかになる<br>花が咲くように<br>笑って泣いてどんな時だって<br>選んでいいんだいつでも自由に<br>今日はどんなあなたに出会えるかな<br>この世界が終わるその日まで<br>鳴り続けていて ah-ah<br><br>いつもあなたのことを求めちゃうんだ<br>(踊り出したくなる時も)<br>(爆発しちゃいそうな時も)<br>救われたんだ支えられてきたんだ<br>(心が動かされるんです)<br>(心が満たされていくんです)<br>ねえもっと触れていたいよ<br>ずっとそばにいてほしいよ<br>いつまでも<br>大好きなあなたが<br>響いていますように<br><br>こんなたくさんの気持ち<br>ぎゅっと詰め込んだ想い<br>ちゃんと伝えられたかな ah, mm<br>ちょっとだけ不安だけど<br>きっと届いてくれたよね<br>全部私の素直な言葉だから<br>もしもあなたに出会えてなかったらなんて<br>思うだけで怖いほど大好きなんだ<br><br>受け取ってどうか私の想いを<br>さあ<br>笑って泣いてそんな毎日を<br>歩いていくんだいつもいつまでも<br>辛い暗い痛いことも沢山あるけど<br>この世界はいつでもどこでも音楽で溢れてる<br>目の前のことも将来のことも<br>不安になってどうしたらいいの<br>分かんなくって迷うこともあるけど<br>そんな時もきっとあなたがいてくれれば<br>前を向けるんだ<br><br>こんな気持ちになるのは<br>こんな想いができるのは<br>きっと音楽だけなんだ<br>(変わりなんて一つもないんです)<br>どうか1000年先も<br>どうか鳴り止まないで<br>Ah いつも本当にありがとう');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,61,'https://www.youtube.com/embed/0xSiBpUdW4E','https://img.youtube.com/vi/0xSiBpUdW4E/mqdefault.jpg','マリゴールド','あいみょん','風の強さがちょっと<br>心を揺さぶりすぎて<br>真面目に見つめた 君が恋しい<br>でんぐり返しの日々<br>可哀想なふりをして<br>だらけてみたけど<br>希望の光は<br>目の前でずっと輝いている 幸せだ<br>麦わらの帽子の君が<br>揺れたマリーゴールドに似てる<br>あれは 空がまだ青い夏のこと<br>懐かしいと笑えたあの日の恋<br>「もう離れないで」と<br>泣きそうな目で見つめる君を<br>雲のような優しさでそっとぎゅっと<br>抱きしめて 抱きしめて 離さない<br>本当の気持ち全部<br>吐き出せるほど強くはない<br>でも不思議なくらいに<br>絶望は見えない<br>目の奥にずっと写るシルエット<br>大好きさ<br>柔らかな肌を寄せあい<br>少し冷たい空気を2人<br>かみしめて歩く 今日という日に 何と<br>名前をつけようかなんて話して<br>ああ アイラブユーの言葉じゃ<br>足りないからとキスして<br>雲がまだ2人の影を残すから<br>いつまでも いつまでも このまま<br>遥か遠い場所にいても<br>繋がっていたいなあ<br>2人の想いが 同じでありますように<br>麦わらの帽子の君が<br>揺れたマリーゴールドに似てる<br>あれは空がまだ青い夏のこと<br>懐かしいと笑えたあの日の恋<br>「もう離れないで」と<br>泣きそうな目で見つめる君を<br>雲のような優しさで そっとぎゅっと<br>抱きしめて 離さない<br>ああ アイラブユーの言葉じゃ<br>足りないからとキスして<br>雲がまだ2人の影を残すから<br>いつまでも いつまでも このまま<br>離さない<br>ああ いつまでも いつまでも 離さない');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,62,'https://www.youtube.com/embed/agQ23NdBROY','https://img.youtube.com/vi/agQ23NdBROY/mqdefault.jpg','いつか','SAUCY DOG','坂道を登った先の暗がり 星が綺麗に見えるってさ<br>地べたに寝転んじゃうあたり あぁ君らしいなって思ったり<br>時間を忘れて夢中になった 赤信号は点滅している<br>肌寒くなり始めた季節に 僕らは初めて手を繋いだ 2人の物語<br>2人でひとつの傘を差したり ブランコに乗り星を眺めたり<br>押しボタン式の信号機を いつも君が走って押すくだり<br>仰向けになって見た湖 宙に浮いてるみたいってさ<br>はしゃいでる君とその横でさ もっとはしゃぐ僕なら<br>本当に飛べるような 気がしていた<br>フワフワと夢心地 君の隣<br>君の見る景色を全部<br>僕のものにしてみたかったんだ<br>あぁ 君を忘れられんなぁ<br>ラララララララ ラララララララ<br>ラララララララ ラララララララ<br>ララララララララ<br>当たり前に通ってたあの道 信号機は無くなるみたいです<br>思い出して切なくなる気持ちも いつかは無くなるみたいです<br>そういえば寒い雪降る日の 田和山の無人公園でさ<br>震える体 暗い中いつものように笑いあう 街灯の下で<br>僕の目に映りこんだ君が<br>いつもよりちょっと寂しそうな 気がした<br>今になってさ (今になってさ) 思い出してさ (思い出してさ)<br>後悔じゃ何も解決しないさ<br>忘れられないのは 受け入れられないのは<br>君を思い出にできる程僕は強くはないから<br>僕の見た景色を全部<br>君にも見せてやりたかったんだ<br>あったかいココアを一口<br>いつかまた逢う日までと<br>笑う顔に嘘は見当たらない<br>じゃあね じゃあね<br>またどっか遠くで いつか<br>ラララララララ ラララララララ<br>ラララララララ ラララララララ<br>ラララララララ ラララララララ<br>ラララララララ ラララララララ<br>ラララララララ');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,63,'https://www.youtube.com/embed/sAuEeM_6zpk','https://img.youtube.com/vi/sAuEeM_6zpk/mqdefault.jpg','あの夢をなぞって','YOASOBI','夜の空を飾る綺麗な花<br>街の声をぎゅっと光が包み込む<br>音の無い二人だけの世界で聞こえた言葉は<br>「好きだよ」<br>夢の中で見えた未来のこと<br>夏の夜、君と、並ぶ影が二つ<br>最後の花火が空に昇って消えたら<br>それを合図に<br>いつも通りの朝に いつも通りの君の姿<br>思わず目を逸らしてしまったのは<br>どうやったって忘れられない君の言葉<br>今もずっと響いてるから<br>夜を抜けて夢の先へ<br>辿り着きたい未来へ<br>本当に？あの夢に、本当に？って今も<br>不安になってしまうけどきっと<br>今を抜けて明日の先へ<br>二人だけの場所へ<br>もうちょっと どうか変わらないで<br>もうちょっと 君からの言葉<br>あの未来で待っているよ<br>誰も知らない 二人だけの夜<br>待ち焦がれていた景色と重なる<br>夏の空に未来と今繋がる様に開く花火<br>君とここでほらあの夢をなぞる<br>見上げた空を飾る光が今照らした横顔<br>そうずっとこの景色のために<br>そうきっとほら二つの未来が<br>今重なり合う<br>夜の中で君と二人<br>辿り着いた未来で<br>大丈夫想いはきっと大丈夫伝わる<br>あの日見た夢の先へ<br>今を抜けて明日の先で<br>また出会えた君へ<br>もうちょっと どうか終わらないで<br>もうちょっと ほら最後の花火が今<br>二人を包む<br>音の無い世界に響いた<br>「好きだよ」');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,65,'https://www.youtube.com/embed/Sw1Flgub9s8','https://img.youtube.com/vi/Sw1Flgub9s8/mqdefault.jpg','春泥棒','ヨルシカ','高架橋を抜けたら雲の隙間に青が覗いた<br>最近どうも暑いから ただ風が吹くのを待ってた<br>木陰に座る<br>何か頬に付く<br>見上げれば頭上に咲いて散る<br>はらり 僕らもう息も忘れて<br>瞬きさえ億劫<br>さぁ 今日さえ明日過去に変わる<br>ただ風を待つ<br>だから僕らもう声も忘れて<br>さよならさえ億劫<br>ただ花が降るだけ晴れり<br>今 春吹雪<br>次の日も待ち合わせ<br>花見の客も少なくなった<br>春の匂いはもう止む<br>今年も夏が来るのか<br>高架橋を抜けたら道の先に君が覗いた<br>残りはどれだけかな<br>どれだけ春に会えるだろう<br>川沿いの丘 木陰に座る<br>また昨日と変わらず今日も咲く花に<br>僕らもう息も忘れて<br>瞬きさえ億劫<br>花散らせ今吹くこの嵐は<br>まさに春泥棒<br>風に今日ももう時が流れて<br>立つことさえ億劫<br>花の隙間に空 散れり<br>まだ 春吹雪<br>今日も会いに行く<br>木陰に座る<br>溜息を吐く<br>花ももう終わる<br>明日も会いに行く<br>春がもう終わる<br>名残るように時間が散っていく<br>愛を歌えば言葉足らず<br>踏む韻さえ億劫<br>花開いた今を言葉如きが語れるものか<br>はらり 僕らもう声も忘れて<br>瞬きさえ億劫<br>花見は僕らだけ<br>散るなまだ 春吹雪<br>あともう少しだけ<br>もう数えられるだけ<br>あと花二つだけ<br>もう花一つだけ<br>ただ葉が残るだけ はらり<br>今 春仕舞い');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,77,'https://www.youtube.com/embed/vJPEWnklpFs','https://img.youtube.com/vi/vJPEWnklpFs/mqdefault.jpg','かくれんぼ','優里','"いっせーのー" で鳴り響いたスタートの合図<br>なぞった線で結んだ世界<br>色付けていく ここから<br>物心がつく頃 すでに此処にあった<br>僕じゃない誰かの記憶は<br>夕陽とともに蘇る<br>古ぼけた絵本を取り出して<br>落書きの中に1つの答えを見つけた<br>自分の価値に 目を疑って<br>どこまでだって 堕ちていけるの<br>どこか遠くに 消えてしまいたい<br>こんな世界じゃ 僕はいらない<br>カウントダウンは始まっているよ<br>"いっせーのー" で声を上げて<br>聴こえてくるんだ<br>自分の影の長さに気付く<br>もうこんな時間だ<br>一等星が顔を出した<br>届きそうで手を伸ばした<br>次は僕に着いてきなよ<br>どんな暗闇でも<br>(もういいかい? まーだだよ)<br>幕は上がりだした<br>(もういいかい? まーだだよ)<br>色付けていく ここから<br>10年後の僕らはすれ違いばかりで<br>幻想に想いを馳せては<br>"戻れない" そう思いこんだ<br>くたびれた心に追い討ちを<br>あの頃と変わらない夕陽も<br>なんとも思わない<br>自分を信じ 歩いていければ<br>どこまでだって 昇れるのにな<br>カットを跨ぐ その空白に<br>大切なモノ 見落としている<br>見つけられないと泣きわめく君へ<br>"いっせーのー" で声を上げて<br>聴こえてくるんだ<br>自分の影の長さに気付く<br>もうこんな時間だ<br>一等賞で駆け抜ける君<br>くっついていただけの僕でも<br>君の前を歩けるかな?<br>こんな頼りない僕でも<br>宝箱はホコリをかぶったまま<br>無くした鍵はずっと<br>君のポケットの中にあった<br>散らばっていた全てが<br>今ひとつに重なる<br>手を取り 始めよう<br>僕たちの物語<br>一度はいらないと思った<br>今なら胸を張れる気がしたんだ<br>愛おしくて 掛け声はいつも<br>"いっせーのー" で声を上げて<br>"いっせーのー" で声を上げて<br>聴こえてくるんだ<br>自分の影の長さに気付く<br>もうこんな時間だ<br>一等星が顔を出した<br>届きそうで手を伸ばした<br>次は僕に着いてきなよ<br>どんな暗闇でも<br>(もういいかい? まーだだよ)<br>泣きじゃくった声で<br>(もういいかい? まーだだよ)<br>笑う君が見えた<br>(もういいかい? まーだだよ)<br>幕は上がりだした<br>(もういいかい? もういいよ)<br>色付けていく ここから');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,78,'https://www.youtube.com/embed/7940nuwCEYA','https://img.youtube.com/vi/7940nuwCEYA/mqdefault.jpg','まちがいさがし','菅田将暉','まちがいさがしの間違いの方に<br>生まれてきたような気でいたけど<br>まちがいさがしの正解の方じゃ<br>きっと出会えなかったと思う<br>ふさわしく 笑いあえること<br>何故だろうか 涙がでること<br>君の目が貫いた 僕の胸を真っ直ぐ<br>その日から何もかも 変わり果てた気がした<br>風に飛ばされそうな 深い春の隅で<br>退屈なくらいに何気なく傍にいて<br>間違いだらけの 些細な隙間で<br>くだらない話を くたばるまで<br>正しくありたい あれない 寂しさが<br>何を育んだでしょう<br>一つずつ (一つずつ) 探し当てていこう<br>起きがけの 子供みたいに<br>君の手が触れていた 指を重ね合わせ<br>間違いか正解かだなんてどうでもよかった<br>瞬く間に落っこちた 淡い靄の中で<br>君じゃなきゃいけないと ただ強く思うだけ<br>君の目が貫いた 僕の胸を真っ直ぐ<br>その日から何もかも 変わり果てた気がした<br>風に飛ばされそうな 深い春の隅で<br>誰にも見せない 顔を見せて<br>君の手が触れていた 指を重ね合わせ<br>間違いか正解かだなんてどうでもよかった<br>瞬く間に落っこちた 淡い靄の中で<br>君じゃなきゃいけないと ただ強く思うだけ');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,79,'https://www.youtube.com/embed/Lq2-HHP04jM','https://img.youtube.com/vi/Lq2-HHP04jM/mqdefault.jpg','変わらないもの','奥華子','帰り道ふざけて歩いた<br>訳も無く君を怒らせた<br>色んな君の顔を見たかったんだ<br>大きな瞳が 泣きそうな声が<br>今も僕の胸を締め付ける<br>すれ違う人の中で 君を追いかけた<br>変わらないもの 探していた<br>あの日の君を忘れはしない<br>時を越えてく思いがある<br>僕は今すぐ君に会いたい<br>街灯にぶら下げた想い<br>いつも君に渡せなかった<br>夜は僕達を遠ざけていったね<br>見えない心で 嘘ついた声が<br>今も僕の胸に響いている<br>さまよう時の中で 君と恋をした<br>変わらないもの 探していた<br>あの日見つけた知らない場所へ<br>君と二人で行けるのなら<br>僕は何度も生まれ変われる<br>形ないもの 抱きしめてた<br>壊れる音も聞こえないまま<br>君と歩いた同じ道に<br>今も灯りは照らし続ける<br>変わらないもの 探していた<br>あの日の君を忘れはしない<br>時を超えてく思いがある<br>僕は今すぐ君に会いたい<br>僕は今すぐ君に会いたい');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,80,'https://www.youtube.com/embed/K1Tz2yNmamI','https://img.youtube.com/vi/K1Tz2yNmamI/mqdefault.jpg','もう少しだけ','YOASOBI','もう少しだけ もう少しだけ 踏み出せたのなら<br>そう小さな優しさを  分け合えたのなら<br>ありふれた一日が  素敵な日になっていくほら<br>そうやって何度でも  喜びはめぐる<br>慌ただしく過ぎる朝に<br>いつも通り過ぎる朝に<br>頼まれたお使いと予定を照らす<br>君が教えてくれた <br>あてにしてない占いの言葉<br>「いつもしないこと」をだって<br>そんなことを頭の隅に置いたまま<br>いつもの今日へ<br>もう少しだけ もう少しだけ 踏み出せたのなら<br>もう少しだけ あと少しだけ 優しくなれたのなら<br>ありふれた一日も 素敵な日になっていくような<br>そんな気がしたんだ 今喜びはめぐる<br>暗いニュースが流れる朝に<br>気持ちが沈んでいく朝に<br>自分は「いらない」存在？なんて考える朝に<br>あなたのことを思い出したんだ<br>あなたに会いたくなったんだ<br>久しぶりに会いに行くよ 今すぐに<br>待ちに待ったそんな朝に<br>想いを馳せる日の朝に<br>いつもよりも早く家を出る<br>ふいに触れた誰かの優しさが<br>私の優しさに変わったんだ<br>ほら喜びはめぐる<br>もう少しだけ もう少しだけ 踏み出せたことが<br>もう少しだけ ほんの少しだけ 優しくなれたことが<br>ありふれた一日も 特別な一日にほら<br>変えてくれたんだきっと 今日も<br>あなたから私へと 想いが伝わる<br>そう僕から君にほら 喜びが広がる<br>ありふれた毎日から 踏み出した優しさが今<br>誰かに届いてきっと めぐり続けるよずっと<br>あぁ、どこまでも<br>今日もどこかであなたが<br>今を生きるあなたがただ<br>小さな幸せを 見つけられますように');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,81,'https://www.youtube.com/embed/kxs9Su_mbpU','https://img.youtube.com/vi/kxs9Su_mbpU/mqdefault.jpg','カタオモイ','AIMER','例えば 君の 顔に昔より<br>シワが 増えても それでも良いんだ<br>僕が ギターを 思うように 弾けなくなっても<br>心の歌は君で溢れているよ<br>高い声も 出せずに 思い通り歌えない<br>それでも頷きながら一緒に歌ってくれるかな<br>割れんばかりの拍手も 響き渡る歓声もいらない<br>君だけ わかってよ わかってよ<br>Darlin'' 夢が叶ったの<br>お似合いの言葉が見つからないよ<br>Darlin'' 夢が叶ったの<br>「愛してる」<br>たった一度の たった一人の<br>生まれてきた幸せ味わってるんだよ<br>今日がメインディッシュで 終わりの日には<br>甘酸っぱいデザートを食べるの<br>山も谷も全部フルコースで<br>気がきくような言葉はいらない<br>素晴らしい特別もいらない<br>ただずっと ずっとそばに 置いておいてよ<br>僕の想いは歳をとると 増えてくばっかだ<br>好きだよ<br>わかってよ わかってよ<br>ねえ darlin'' 夢が叶ったの<br>お似合いの言葉が見つからないよ<br>Darlin'' 夢が叶ったの<br>愛が溢れていく<br>君が僕を忘れてしまっても<br>ちょっとつらいけど それでもいいから<br>僕より先に どこか遠くに<br>旅立つことは絶対 許さないから<br>生まれ変わったとしても<br>出会い方が最悪でも<br>また僕は君に恋するんだよ<br>僕の心は 君にいつも片思い<br>好きだよ<br>わかってよ わかってよ わかってよ<br>Darlin'' 夢が叶ったの<br>お似合いの言葉が見つからないよ<br>Darlin'' 夢が叶ったの<br>ねえ darlin''「愛してる」');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,82,'https://www.youtube.com/embed/gsT6eKsnT0M','https://img.youtube.com/vi/gsT6eKsnT0M/mqdefault.jpg','猫','DISH//','夕焼けが燃えてこの街ごと<br>飲み込んでしまいそうな今日に<br>僕は君を手放してしまった<br>明日が不安だ とても嫌だ<br>だからこの僕も一緒に<br>飲み込んでしまえよ夕焼け<br>だけどもそうはいかないよな<br>明日ってウザいほど来るよな<br>眠たい夜になんだか笑っちゃう<br>家まで帰ろう 1人で帰ろう<br>昨日のことなど 幻だと思おう<br>君の顔なんて忘れてやるさ<br>馬鹿馬鹿しいだろ、そうだろ<br>君がいなくなった日々も<br>このどうしようもない気だるさも<br>心と体が喧嘩して<br>頼りない僕は寝転んで<br>猫になったんだよな 君は<br>いつかフラッと現れてくれ<br>何気ない毎日を君色に染めておくれよ<br>夕焼けが燃えてこの街ごと<br>飲み込んでしまいそうな今日に<br>僕は君を手放してしまった<br>若すぎる僕らはまた1から<br>出会うことは可能なのかな<br>願うだけ無駄ならもうダメだ<br>家までつくのがこんなにも嫌だ<br>歩くスピードは<br>君が隣にいる時のまんま<br>想い出巡らせ<br>がんじがらめのため息ばっか<br>馬鹿にしろよ、笑えよ<br>君がいなくなった日々は<br>面白いくらいにつまらない<br>全力で忘れようとするけど<br>全身で君を求めてる<br>猫になったんだよな君は<br>いつかまたあの声を聞かせてよ<br>矛盾ばっかで無茶苦茶な僕を<br>慰めてほしい<br>君がいなくなった日々も<br>このどうしようもない気だるさも<br>心と体が喧嘩して<br>頼りない僕は寝転んで<br>猫になったんだよな君は<br>いつかフラッと現れてくれ<br>何気ない毎日を君色に染めておくれよ<br>君がもし捨て猫だったら<br>この腕の中で抱きしめるよ<br>ケガしてるならその傷拭うし<br>精一杯の温もりをあげる<br>会いたいんだ忘れられない<br>猫になってでも現れてほしい<br>いつか君がフラッと現れて<br>僕はまた、幸せで');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,83,'https://www.youtube.com/embed/1lYb9nLO_FY','https://img.youtube.com/vi/1lYb9nLO_FY/mqdefault.jpg','フィナーレ','EILL','君はほんとにわかってないよ<br>例えばハッピーエンドより<br>甘くて豪華なデザートより<br>君がいいんだよ<br>ふたつの傘より相合い傘<br>ちょっと冷たいけど<br>「愛するための」<br>代償ならいくらでもどうぞ<br>ただずっと側にいたい<br>ねえ ダーリン<br>Oh 星屑もない<br>ふたりぼっちの世界でずっと<br>最後の花火をあげて<br>フィナーレを飾って<br>奇跡の降る恋に落ちて<br>ダーリン もう離さないで<br>味気ない世界も悪くないね<br>どんなに恋をしたって 出逢えないよきっと<br>終りのない幸せにキスをしよ<br>いつか今日を忘れても君がいいんだよ<br>天気雨の日<br>いい合いっこして はじめて目があった<br>ずっと覚えとくよ<br>Oh, woo yeah, oh, woo<br>Oh oh<br>ねえ ダーリン<br>Oh 星屑もない<br>ふたりぼっちの世界でずっと<br>最後の花火をあげて<br>フィナーレを誓って<br>奇跡の降る恋に落ちて<br>ダーリン もう離さないで<br>素っ気ない世界も悪くないね<br>どんなに恋をしたって忘れられないの<br>終りのない幸せにキスをしよ<br>Wow, wow, ah yeah<br>Wow, wow, ah yeah<br>Wow, wow, ah yeah<br>Wow, wow<br>味気ないね<br>でもそれがね ふたりの幸せ');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,84,'https://www.youtube.com/embed/ReCnlwVZj1M','https://img.youtube.com/vi/ReCnlwVZj1M/mqdefault.jpg','115万キロのフィルム','OFFICIAL髭男DISM','これから歌う曲の内容は僕の頭の中のこと<br>主演はもちろん君で 僕は助演で監督でカメラマン<br>目の奥にあるフィルムで作る映画の話さ ah<br>くだらないなと笑ったんなら掴みはそれで万事OK!<br>呆れていないでちょっと待って<br>きっと気に入ってもらえると思うな<br>ここまでのダイジェストを少しだけ見せるよ<br>初めて喧嘩した夜の涙<br>個人的に胸が痛むけれど<br>そのまま見続けよう<br>ごめんねと言って仲直りして手を握って<br>ほら ここで君が笑うシーンが見どころなんだからさ ah<br>写真にも映せやしないとても些細なその仕草に<br>どんな暗いストーリーも覆す瞬間が溢れてる<br>どれかひとつを切り取って<br>サムネイルにしようとりあえず今の所は<br>きっと10年後くらいにはキャストが増えたりもするんだろう<br>今でも余裕なんてないのにこんな安月給じゃもうキャパオーバー!<br>きっと情けないところも山ほど見せるだろう<br>苗字がひとつになった日も<br>何ひとつ代わり映えのない日も<br>愛しい日々尊い日々<br>逃さないように忘れないように焼き付けていくよ<br>今 目を細めて恥じらいあって永遠を願った僕たちを<br>すれ違いや憂鬱な展開が引き裂こうとしたその時には<br>僕がうるさいくらいの声量でこの歌何度も歌うよ<br>だからどうかそばにいて<br>エンドロールなんてもん作りたくもないから yeah<br>クランクアップがいつなのか僕らには決められない<br>だから風に吹かれていこう (風に吹かれていこう)<br>フィルムは用意したよ (フィルムは用意したよ)<br>一生分の長さを ざっと115万キロ<br>ほら ここで君が笑うシーンが見どころなんだからさ ah<br>写真にも映せやしないとても些細なその仕草に<br>どんな暗いストーリーも覆す瞬間が溢れてる<br>どれかひとつを切り取って サムネイルにしよう<br>さあ これから生まれる名場面を探しにいこうよ<br>酸いも甘いも寄り添って<br>一緒に味わおうフィルムがなくなるまで<br>撮影を続けようこの命ある限り');
Insert into JPAT.POST_SUGGEST (POST_TYPE_IDX,POST_IDX,YOUTUBE_URL,THUMNAIL,MUSIC,SINGER,LYRICS) values (2,87,'https://www.youtube.com/embed/nmeccuUXs4Q','https://img.youtube.com/vi/nmeccuUXs4Q/mqdefault.jpg','愛の賞味期限','TUKI.','どうか最後に会いに来てくれないか<br>言葉だけじゃもう何も埋まらないんだ<br>泣き顔でも笑顔でもいい<br>君に会いたい<br><br>こんな日が来ると思わなかったんだ<br>君の傍に居られなくてごめんね<br>せめて星に願いを<br><br>悲しまないで居て　前を見て<br>振り返らないで<br>僕の居ない街で　当たり前に<br>恋をして笑って<br>待ち合わせは星街の駅で<br>君が忘れていても<br><br>どうも最後らしく振舞えないんだ<br>涙ひとつくらい流すと思ったんだ<br>上手く隠せているだろうか　<br>バレていないかな<br><br>まるでひとつみたいに<br>想っていたいんだ<br>離れてても過ごしたあの時間は<br>嘘じゃないとわかってる<br><br>悲しまないで居て　前を見て<br>振り返らないで<br>僕が泣いている　理由なんて<br>知らないで笑って<br>待ち合わせは星街の駅で<br>いつか会える日まで<br><br>思い出なんてやっかいなものを<br>抱えてまでどこに行きたいの<br>辿り着く場所は同じだと<br>信じているから<br><br>悲しまないで居て　前を見て<br>振り返らないで<br>僕の居ない街で　当たり前に<br>恋をして笑って<br>待ち合わせは星街の駅で<br>君が忘れていても<br><br>悲しまないで居て　前を見て<br>振り返らないで<br>僕が泣いている　理由なんて<br>気付かなくていいよ<br>待ち合わせは星街の駅で<br>いつか笑えるように');
REM INSERTING into JPAT.POST_TYPE
SET DEFINE OFF;
Insert into JPAT.POST_TYPE (POST_TYPE_IDX,POST_TYPE) values (2,'お勧め');
Insert into JPAT.POST_TYPE (POST_TYPE_IDX,POST_TYPE) values (1,'一般');
REM INSERTING into JPAT.REPLY
SET DEFINE OFF;
Insert into JPAT.REPLY (REPLY_IDX,POST_IDX,NICKNAME,REPLY_PASSWORD,COMMENTS,REGDATE,USER_IDX) values (1,3,'奏','285da275d9a82a3f64eeef8615785eff6373e2325a9a5fc9b983b16da577fb','僕はtukiの歌が好きだよ！',to_date('24-10-30','RR-MM-DD'),2);
Insert into JPAT.REPLY (REPLY_IDX,POST_IDX,NICKNAME,REPLY_PASSWORD,COMMENTS,REGDATE,USER_IDX) values (2,5,'とも','4e980b76d53459470dcd1f288430603e3fcc461dd7d199d1828fc9281b19','すごいですよ！',to_date('24-10-31','RR-MM-DD'),19);
Insert into JPAT.REPLY (REPLY_IDX,POST_IDX,NICKNAME,REPLY_PASSWORD,COMMENTS,REGDATE,USER_IDX) values (3,17,'とも','4e980b76d53459470dcd1f288430603e3fcc461dd7d199d1828fc9281b19','おおおおっ',to_date('24-10-31','RR-MM-DD'),19);
Insert into JPAT.REPLY (REPLY_IDX,POST_IDX,NICKNAME,REPLY_PASSWORD,COMMENTS,REGDATE,USER_IDX) values (4,84,'ロロ','92ed166bc2dfb4820c8cf1e17fbe88b7e441ca934b8d692b29786c532cbcf3','おおおおおおおっ',to_date('24-10-31','RR-MM-DD'),null);
Insert into JPAT.REPLY (REPLY_IDX,POST_IDX,NICKNAME,REPLY_PASSWORD,COMMENTS,REGDATE,USER_IDX) values (5,84,'マリン','c4b569a7b1dd12ff8ce1c102b4f34845d1539b43ac241c99b149e899742db24','私も大好き！！！！',to_date('24-10-31','RR-MM-DD'),3);
REM INSERTING into JPAT.SINGER
SET DEFINE OFF;
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (1,'TUKI.','tuki_4d81ea25-3e8e-4ce5-9411-287351809607.jpg',3);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (2,'優里','yuuri_1083bd05-29ab-484e-9df8-6dfc849c2754.jpg',4);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (3,'VAUNDY','vaundy_21c69ff1-f1a6-4e4e-a2a4-1ae32ea0dd22.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (4,'TEST',null,0);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (5,'BACK NUMBER','backnumber_fdc9c52c-e1cb-40f8-a5e8-1099a5675cf2.jpg',2);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (6,'OFFICIAL髭男DISM','higedan_cce2460d-04ef-4d66-84b6-dcbf5073b516.jpg',3);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (7,'星街すいせい','suisei_a07ab917-715e-40c1-a09e-5900a0458f29.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (8,'NOVELBRIGHT','novelbright_b99732e1-b38c-4377-a0af-d257758f9373.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (9,'手描きMAD',null,0);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (10,'KING GNU','kinggnu_6261c5e5-755d-4d31-b3df-8f9284dd0b00.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (11,'YOASOBI','yoasobi_8c048927-5b11-4e5d-a665-77bf7d381bc4.jpg',3);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (12,'あいみょん','aimyon_727b99ca-e179-4956-a44c-d0a7055fabbf.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (13,'SAUCY DOG','saucydog_d0ace964-58f4-491c-b996-342581e828f6.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (14,'ヨルシカ','yorushika_fe8733a3-f7f7-4b25-a77d-92a6ab9f88c5.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (15,'菅田将暉','sudamasaki_fceccba1-64b7-483f-9823-ae4f96a89fac.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (16,'奥華子','okuhanako_453331e3-da02-4d20-b7ac-c6b9be157e94.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (17,'AIMER','aimer_f3dc96cc-ca64-4eac-85d0-d419e0aba6f6.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (18,'DISH//','dish_9a0f9bf5-6835-41da-b2eb-b43694439a7e.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (19,'EILL','eill_4132f907-1947-4488-9ea9-ae453417e0f2.jpg',1);
Insert into JPAT.SINGER (SINGER_IDX,SINGER,SINGER_IMG,SUGGEST_COUNT) values (20,'管理職','cat_be5f447e-bf07-4ec6-b9a1-0c11625d6d5b.jpg',0);
REM INSERTING into JPAT.SINGER_POST_RELATION
SET DEFINE OFF;
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (1,1);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (1,2);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (1,87);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (2,4);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (2,16);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (2,17);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (2,77);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (3,5);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (5,9);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (5,12);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (6,10);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (6,25);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (6,84);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (7,11);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (8,21);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (10,24);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (11,28);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (11,63);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (11,80);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (12,61);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (13,62);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (14,65);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (15,78);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (16,79);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (17,81);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (18,82);
Insert into JPAT.SINGER_POST_RELATION (SINGER_IDX,POST_IDX) values (19,83);
REM INSERTING into JPAT.USERS
SET DEFINE OFF;
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (1,'admin','15de9264f8dc5af3a46b87c459c6b74f9a3bb607dbd1db49b8e1af2a3abb4','admin','cyw9007@naver.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (2,'kanade','285da275d9a82a3f64eeef8615785eff6373e2325a9a5fc9b983b16da577fb','奏','dyddnr25@gmail.com','kanade_1245293f-4f27-4f00-a91b-b1026a540732.png',to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (3,'marin','c4b569a7b1dd12ff8ce1c102b4f34845d1539b43ac241c99b149e899742db24','マリン','akdjhf@gmail.com','marin_f71b2e74-a32f-412d-929c-14392a5c9b2e.png',to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (4,'lamy','40232ac470357befd8a437c4a2fbed473f678d51e7eae5eed0e69da7ea21','ラミィ','hagdfhkadf@gmail.com','lamy_8b07c8ff-a331-4510-be7b-f50d14132197.png',to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (5,'pekora','504583fd8b4f5585f8b36a47417fc17953aab39371eca26ca4ac6d77a8e6bd','ペコラ','peko9875489@gmail.con','pekora_47f6ca9a-d32a-4f61-94e5-36f407270366.png',to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (6,'sora','7cb11a818c552f4c7e82c5efb28ad48481b6187a31d978dfd31edd62a8da98e','そら','ajdhfjadf788@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (7,'roboco','d12e38b27a3a48aa0e064db84727b3dbae13acd2ec3729c602bb87c9f8c','ロボ子さん','roboco7adyfa@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (8,'azki','3aa9e5835d1209dd7a8b59cb3476e68a1423c9dfa969e9c12581b5e8b1b19f','AZKi','AZKiiuhadf78@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (9,'miko','b8e55aa3b5ca9f262f8bcc7c05947a26fdee2da6da2a5b7ea546fbff8e1054','みこ','miko982745adf@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (10,'suisei','ae1efe1521d755c694d6d1601e287dfb9414d7d8d05835d103b3bba1ceab585','すいせい','suisei9485724ajdhkf@gmail.com','suisei_31b56704-43a7-4869-9dcc-3de2b2ec1dfe.png',to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (11,'aki','9c83da4a1fe14f061a64dd5caf8bae5f07b4b942f32582c6e7858c6cc82bbc9','アキ','aki94785@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (12,'haato','c660e8582f17c6c332be21cc7a13693b79471bb89dbe288a21f74c40f1fdb33b','はあと','haato023793@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (13,'fubuki','fa6f496a39803fc19cfcf6939e97d679cbd5cecf9efaf767519844c4ed0a6','フブキ','fubuki893668723@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (14,'matsuri','d479fadf0c96735c15eb057f132f4c78619fdd69284f4bd41ebc9e367fe338','まつり','matsuri49875@gmail.com','matsuri_b27b0a66-7e07-44fb-8627-e74eceb2d9b3.png',to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (15,'shion','1c768068c1db483cc556a6d2fbc0a681312863c642fa8d11455241b5df932','シオン','shion764584@gmail.com','shion_4afdf915-1556-4e77-ae6f-3e48f02e1d97.png',to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (16,'ayame','c88290ab4720e377a2e0fb3cf021aeb829b03c34f2ab1de1db3df1aab8cec952','あやめ','ayame987458764@gmail.com','ayame_2cc7785b-efa3-4846-9416-55a0e782dab9.png',to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (17,'choco','566923af326777c97547bd27cf8ff20d2d85cc5506c33bc9c726ba5b1d208e','ちょこ','choco946578@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (18,'subaru','22f53f4e78454117f668ac554dbe14676873b0f7ca364e8f6056452cbed4e','スバル','subaru6532798@gmail.com',null,to_date('24-10-30','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (22,'korone','fffa7c189e519e75d8ae1fbb3bc7764c8d39da51f5293124c8ede68d16b59d','ころね','korone8495794@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (20,'mio','9f56a7c3df7741c7614c576bb3689d5edbe787cef5db31b1f40a36fb3a21ffb','ミオ','mio78246578@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (21,'okayu','76a99de61e2f85b7bdafede9c46392ded5416c72d37d95fd71545dbf7070','おかゆ','okayu817457@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (23,'flare','90148ef276244e8af1d287b63e3be4a07b7c7cbb1521b9718b6d12ab1c3f','フレア','flare40572@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (24,'noel','9a5a56f18e22ea1c70ca91e6aba27d9af099d48a81f4b93eb243bea7aab66d96','ノエル','noeru465784@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (25,'kanata','b28cf7bdac442831174e063375f5083bb462069772722d9f5c538e6b7637932','かなた','kanata9847574@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (26,'watame','c1deb0b2616f92a4f81e76d539627d635deb604a209daa1914267a52f547cb4','わため','watame02389@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (27,'towa','ea9bbe78db2e54c9943bdb3c4acf4cd5a7c2641398a447532454438a832d3cb','トワ','towa4985794@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (28,'luna','b3a964c2a8299dff444f2ab5d6e86061e71a7ab232d5932762fafda760eb6ff3','ルーナ','luna037489374@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (29,'nene','d2cd30ea7a46671e6fa8d3f891c743ced8e143819b0e05e4d5b496424a89b56','ねね','nene98475298@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (30,'botan','42508e6d430153c9a653284912264ffbf17f211ceb15951d6d6ae261ad285','ぼたん','botan3946934@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (31,'polka','65da26c39b7d7cfdf69c02e456d4ff2b87e5a496c1abdb4b1170cc6a65','ポルカ','polka278398273@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (32,'laplus','2a3af0b4a77de736294377ad329d3af3b4dd2734a295a9edd962dcc4e4a7b0','ラプラス','laplus475987@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (33,'lui','c35e631aedec24fee6d164aeac22c3b429bce8258afd96eeabc97b78acc8f','ルイ','lui498745@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (34,'koyori','9a606778d3bba56dadc2bff55dd363f654249a5a34e661ae5a2708925923e','こより','koyori945677836@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (35,'chloe','e812cf1b91b1758e7917b97bb6a1763dbc6fde63e6b8f102527684777719','クロヱ','chloe0374983@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (36,'iroha','8953febbf8b73bc2c0412a9533212d480a4888bb8a69bdf91b43f854a1ac48','いろは','iroha983563@gmail.com',null,to_date('24-10-31','RR-MM-DD'));
Insert into JPAT.USERS (USER_IDX,USER_ID,USER_PW,USER_NICKNAME,USER_EMAIL,USER_IMG,JOINDATE) values (43,'test','15de9264f8dc5af3a46b87c459c6b74f9a3bb607dbd1db49b8e1af2a3abb4','test','hgosu0525@gmail.com','cat_63498bac-c3be-4be9-b0e7-8e334682f4e2.jpg',to_date('24-11-04','RR-MM-DD'));
--------------------------------------------------------
--  DDL for Index MUSIC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."MUSIC_PK" ON "JPAT"."MUSIC" ("MUSIC_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index POST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."POST_PK" ON "JPAT"."POST" ("POST_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index POST_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."POST_TYPE_PK" ON "JPAT"."POST_TYPE" ("POST_TYPE_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."REPLY_PK" ON "JPAT"."REPLY" ("REPLY_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SINGER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SINGER_PK" ON "JPAT"."SINGER" ("SINGER_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SPR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SPR_PK" ON "JPAT"."SINGER_POST_RELATION" ("SINGER_IDX", "POST_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010210
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SYS_C0010210" ON "JPAT"."USERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010211
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SYS_C0010211" ON "JPAT"."USERS" ("USER_NICKNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010212
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SYS_C0010212" ON "JPAT"."USERS" ("USER_EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."USER_PK" ON "JPAT"."USERS" ("USER_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MUSIC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."MUSIC_PK" ON "JPAT"."MUSIC" ("MUSIC_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index POST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."POST_PK" ON "JPAT"."POST" ("POST_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index POST_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."POST_TYPE_PK" ON "JPAT"."POST_TYPE" ("POST_TYPE_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."REPLY_PK" ON "JPAT"."REPLY" ("REPLY_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SINGER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SINGER_PK" ON "JPAT"."SINGER" ("SINGER_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SPR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SPR_PK" ON "JPAT"."SINGER_POST_RELATION" ("SINGER_IDX", "POST_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."USER_PK" ON "JPAT"."USERS" ("USER_IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010210
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SYS_C0010210" ON "JPAT"."USERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010211
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SYS_C0010211" ON "JPAT"."USERS" ("USER_NICKNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010212
--------------------------------------------------------

  CREATE UNIQUE INDEX "JPAT"."SYS_C0010212" ON "JPAT"."USERS" ("USER_EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table MUSIC
--------------------------------------------------------

  ALTER TABLE "JPAT"."MUSIC" ADD CONSTRAINT "MUSIC_PK" PRIMARY KEY ("MUSIC_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."MUSIC" MODIFY ("LYRICS" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."MUSIC" MODIFY ("MUSIC" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."MUSIC" MODIFY ("SINGER_IDX" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."MUSIC" MODIFY ("MUSIC_IDX" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."MUSIC" MODIFY ("POST_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JPAT"."POST" ADD CONSTRAINT "POST_PK" PRIMARY KEY ("POST_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."POST" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST" MODIFY ("CONTENTS" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST" MODIFY ("POST_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POST_SUGGEST
--------------------------------------------------------

  ALTER TABLE "JPAT"."POST_SUGGEST" MODIFY ("LYRICS" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST_SUGGEST" MODIFY ("SINGER" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST_SUGGEST" MODIFY ("MUSIC" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST_SUGGEST" MODIFY ("THUMNAIL" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST_SUGGEST" MODIFY ("YOUTUBE_URL" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST_SUGGEST" MODIFY ("POST_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POST_TYPE
--------------------------------------------------------

  ALTER TABLE "JPAT"."POST_TYPE" ADD CONSTRAINT "POST_TYPE_PK" PRIMARY KEY ("POST_TYPE_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."POST_TYPE" MODIFY ("POST_TYPE" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."POST_TYPE" MODIFY ("POST_TYPE_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "JPAT"."REPLY" ADD CONSTRAINT "REPLY_PK" PRIMARY KEY ("REPLY_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."REPLY" MODIFY ("COMMENTS" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."REPLY" MODIFY ("REPLY_PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."REPLY" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."REPLY" MODIFY ("POST_IDX" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."REPLY" MODIFY ("REPLY_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SINGER
--------------------------------------------------------

  ALTER TABLE "JPAT"."SINGER" ADD CONSTRAINT "SINGER_PK" PRIMARY KEY ("SINGER_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."SINGER" MODIFY ("SUGGEST_COUNT" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."SINGER" MODIFY ("SINGER" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."SINGER" MODIFY ("SINGER_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SINGER_POST_RELATION
--------------------------------------------------------

  ALTER TABLE "JPAT"."SINGER_POST_RELATION" ADD CONSTRAINT "SPR_PK" PRIMARY KEY ("SINGER_IDX", "POST_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."SINGER_POST_RELATION" MODIFY ("POST_IDX" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."SINGER_POST_RELATION" MODIFY ("SINGER_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "JPAT"."USERS" ADD UNIQUE ("USER_EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."USERS" ADD UNIQUE ("USER_NICKNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."USERS" ADD UNIQUE ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."USERS" ADD CONSTRAINT "USER_PK" PRIMARY KEY ("USER_IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JPAT"."USERS" MODIFY ("USER_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."USERS" MODIFY ("USER_NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."USERS" MODIFY ("USER_PW" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."USERS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "JPAT"."USERS" MODIFY ("USER_IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table MUSIC
--------------------------------------------------------

  ALTER TABLE "JPAT"."MUSIC" ADD CONSTRAINT "MUSIC_FK1" FOREIGN KEY ("SINGER_IDX")
	  REFERENCES "JPAT"."SINGER" ("SINGER_IDX") ENABLE;
  ALTER TABLE "JPAT"."MUSIC" ADD CONSTRAINT "MUSIC_FK2" FOREIGN KEY ("POST_IDX")
	  REFERENCES "JPAT"."POST" ("POST_IDX") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JPAT"."POST" ADD CONSTRAINT "POST_FK1" FOREIGN KEY ("POST_TYPE_IDX")
	  REFERENCES "JPAT"."POST_TYPE" ("POST_TYPE_IDX") ENABLE;
  ALTER TABLE "JPAT"."POST" ADD CONSTRAINT "POST_FK2" FOREIGN KEY ("USER_IDX")
	  REFERENCES "JPAT"."USERS" ("USER_IDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POST_SUGGEST
--------------------------------------------------------

  ALTER TABLE "JPAT"."POST_SUGGEST" ADD CONSTRAINT "POST_SUGGEST_FK1" FOREIGN KEY ("POST_IDX")
	  REFERENCES "JPAT"."POST" ("POST_IDX") ON DELETE CASCADE ENABLE;
  ALTER TABLE "JPAT"."POST_SUGGEST" ADD CONSTRAINT "POST_SUGGEST_FK2" FOREIGN KEY ("POST_TYPE_IDX")
	  REFERENCES "JPAT"."POST_TYPE" ("POST_TYPE_IDX") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "JPAT"."REPLY" ADD CONSTRAINT "REPLY_FK" FOREIGN KEY ("POST_IDX")
	  REFERENCES "JPAT"."POST" ("POST_IDX") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SINGER_POST_RELATION
--------------------------------------------------------

  ALTER TABLE "JPAT"."SINGER_POST_RELATION" ADD CONSTRAINT "SPR_FK1" FOREIGN KEY ("SINGER_IDX")
	  REFERENCES "JPAT"."SINGER" ("SINGER_IDX") ENABLE;
  ALTER TABLE "JPAT"."SINGER_POST_RELATION" ADD CONSTRAINT "SPR_FK2" FOREIGN KEY ("POST_IDX")
	  REFERENCES "JPAT"."POST" ("POST_IDX") ON DELETE CASCADE ENABLE;
