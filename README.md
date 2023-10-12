# Translate Hokkien
- The goal of this project is to create quality ML Hokkien Translations.
- This project contains tools to help translate and evaluate English, Hokkien (POJ), and Hokkien (Hanzi). 
- This project focuses on Text-to-Text translations. 
- *(Hokkien is also known as Minnan, Taiwanese, Hoklo, Southern Min, and iso 639-3: NAN.)*

## Updates
### 2023-10-12
- Management: Formatted the downstream 'ML_TESTSET_EVALUATIONS_AVERAGE' table as a dbt Model, as part of the pipeline.
### 2023-10-11
- Management: Reformatted the data as SQLITE3, and initialized a DBT Project from it.
### 2023-10-10
- ![Data Models](https://github.com/whiai/translate-hokkien/blob/969de0244f372df7bfde60c52fb5fc50d373ab56/images/20231010-data-models.png?raw=true)
- Reference Texts
	- Gathered some reference text from Wikipedia (GFDL license) and Omniglot (Non-Commercial license)
	- Cleaned up reference texts
	- Generated some reference English translations from Minnan Wikipedia (POJ). Generated by taking the "median text" from GPT4 translations. This is not necessarily accurate, but serves as a basis.
- Candidate Texts
	- Generated some EN→NAN translations (via GPT4 and GPT3.5)
- Evaluations
	- Generated several evaluations based on BLEU
 	- ![Evaluations](https://raw.githubusercontent.com/whiai/translate-hokkien/main/images/20231010-evaluations.png)	

- **Conclusions and Next Steps**
	- Results: The BLEU scores for these evaluations are quite bad, with only unigram scores showing any non-zero results. Things to try to improve this:
		- A more lenient POJ Tokenizer that tokenizes by Syllable rather than Word. This is because word-separation isn't always consistent.
		- A more lenient POJ Tokenizer that ignores diacritics. This is because current POJ sources can be inconsistent.
		- Using Hanzi as a base script before any POJ conversions, for early translation models.
		- Using Mandarin Chinese as an intermediary.
		- Consider the use of Tâi-lô (as a Hanzi→Tâi-lô converter currently exists, but not a Hanzi→POJ one). And how Tâi-lô effects some of the source data.
		- Refer to romanized words, like "Hanzi", as "Hàn-jī / Hàn-lī" in any LLM  prompts. Using Hokkien scripts may slightly bias the LLM towards more accurate Hokkien vocabulary, grammar, and script writing.
	- Pipeline: These were all generated in spreadsheets. In future, they should be better automated as part of a data pipeline.
