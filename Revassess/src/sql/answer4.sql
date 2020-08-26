SELECT study_set_id FROM study_set JOIN app_user ON (app_user.user_id =4);
SELECT * FROM study_set_card;

SELECT * FROM study_set 
JOIN app_user ON (app_user.user_id=5) ;

SELECT name FROM category JOIN flashcard.question, flashcard.answer 
ON (flashcard.flashcard_id =
select(study_set_card.flashcard_id)

SELECT flashcard_id FROM study_set_card;
SELECT * FROM study_set_card;

SELECT flashcard_id FROM study_set_card where study_set_id =
(SELECT study_set_id FROM study_set WHERE owner_id =4);

SELECT category.name, flashcard.question, flashcard.answer, app_user.username
FROM category, flashcard, study_set_card, study_set, app_user
ON app_user.user_id = 4;
