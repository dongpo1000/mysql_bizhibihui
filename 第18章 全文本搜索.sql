# 第18章 全文本搜索

# 进行全文本搜索
SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit');

SELECT note_text
FROM productnotes
WHERE note_text LIKE '%rabbit%';

SELECT note_text, MATCH(note_text) AGAINST('rabbit') AS ranks
FROM productnotes;

# 查询扩展
SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('anvils');

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('anvils' WITH QUERY EXPANSION) ;

# 布尔文本搜索
SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST ('heavy' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('heavy -rope*' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('+rabbit +bait' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('rabbit bait' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('"rabbit bait"' IN BOOLEAN MODE);

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('>rabbit <carrot' IN BOOLEAN MODE); 

SELECT note_text
FROM productnotes
WHERE MATCH(note_text) AGAINST('+safe +(<combination)' IN BOOLEAN MODE);