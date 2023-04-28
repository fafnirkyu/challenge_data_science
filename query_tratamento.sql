CREATE TABLE dados AS
SELECT 
m.person_id AS pessoa_id,
m.person_age AS idade,
m.person_income AS renda,
CASE WHEN m.person_home_ownership = 'Rent' THEN 'Aluguel'
	 WHEN m.person_home_ownership = 'Own'  THEN	'Própria'
     WHEN m.person_home_ownership = 'Mortgage' THEN 'Hipotecada'
     WHEN m.person_home_ownership = 'Other' THEN 'Outro'
     ELSE m.person_home_ownership
     END AS situacao_moradia,
person_emp_length AS tempo_trabalhado,
e.loan_id AS emprestimo_id,
#Tradução 
CASE WHEN e.loan_intent = 'Homeimprovement' THEN 'Melhoramento do lar'
	 WHEN e.loan_intent = 'Venture' THEN 'Negócio'
     WHEN e.loan_intent = 'Personal' THEN 'Pessoal'
     WHEN e.loan_intent = 'Medical' THEN 'Médico'
     WHEN e.loan_intent = 'Education' THEN 'Educação'
     WHEN e.loan_intent = 'Debtconsolidation' THEN 'Quitação de dividas'
     ELSE e.loan_intent 
     END AS motivo_emprestimo,
e.loan_grade AS score,
e.loan_amnt AS valor_emprestimo,
e.loan_int_rate AS taxa_juros,
e.loan_status AS inadimplente,
e.loan_percent_income AS razao_renda_emprestimo,
h.cb_id AS historico_id,
h.cb_person_default_on_file AS devedor,
h.cb_person_cred_hist_length AS tempo_historico_credito
    
     
FROM dados_mutuarios AS m
INNER JOIN ids id ON m.person_id = id.person_id
iNNER JOIN emprestimos e ON e.loan_id = id.loan_id
INNER JOIN historicos_banco h on h.cb_id = id.cb_id

WHERE m.person_id != ''
	AND m.person_age IS NOT NULL
    AND m.person_age <= '100'
	AND m.person_income IS NOT NULL
	AND m.person_home_ownership != ''
	AND m.person_emp_length IS NOT NULL
    AND e.loan_intent != ''
	AND e.loan_grade != ''
    AND e.loan_amnt IS NOT NULL
	AND e.loan_int_rate IS NOT NULL	
	AND e.loan_status IS NOT NULL
	AND e.loan_percent_income IS NOT NULL
	AND h.cb_person_default_on_file != ''
	AND h.cb_person_cred_hist_length IS NOT NULL;
	
ALTER TABLE dados MODIFY COLUMN tempo_trabalhado INT;

