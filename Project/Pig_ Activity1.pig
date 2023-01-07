-- EpisodeIV
episodeIVDialouges = LOAD 'hdfs:///user/Chaithu/episodeIV_dialouges.txt' USING PigStorage('\t') AS (line:chararray);
create_rank = rank episodeIVDialouges;
removeHeader = Filter create_rank by (rank_episodeIVDialouges > 1);
New_input_file = foreach removeHeader Generate line;
Words = FOREACH New_input_file GENERATE FLATTEN(TOKENIZE(line)) AS word;
Groups = GROUP Words BY word;
Counts = FOREACH Groups GENERATE group,COUNT(Words) AS nl;
Results = ORDER Counts by nl DESC;
STORE Results INTO 'hdfs:///user/Chaithu/resultsepisodeIV' USING PigStorage('\t');


-- EpisodeV
episodeVDialouges = LOAD 'hdfs:///user/Chaithu/episodeV_dialouges.txt' USING PigStorage('\t') AS (line:chararray);
create_rank = rank episodeVDialouges;
removeHeader = Filter create_rank by (rank_episodeVDialouges > 1);
New_input_file = foreach removeHeader Generate line;
Words = FOREACH New_input_file GENERATE FLATTEN(TOKENIZE(line)) AS word;
Groups = GROUP Words BY word;
Counts = FOREACH Groups GENERATE group,COUNT(Words) AS nl;
Results = ORDER Counts by nl DESC;
STORE Results INTO 'hdfs:///user/Chaithu/resultsepisodeV_Output' USING PigStorage('\t');


-- EpisodeVI
episodeVIDialouges = LOAD 'hdfs:///user/Chaithu/episodeVI_dialouges.txt' USING PigStorage('\t') AS (line:chararray);
create_rank = rank episodeVIDialouges;
removeHeader = Filter create_rank by (rank_episodeVIDialouges > 1);
New_input_file = foreach removeHeader Generate line;
Words = FOREACH New_input_file GENERATE FLATTEN(TOKENIZE(line)) AS word;
Groups = GROUP Words BY word;
Counts = FOREACH Groups GENERATE group,COUNT(Words) AS nl;
Results = ORDER Counts by nl DESC;
STORE Results INTO 'hdfs:///user/Chaithu/episodeVI_Output' USING PigStorage('\t');


