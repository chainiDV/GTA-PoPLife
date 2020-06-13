
INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_banker','Banquero',1),
  ('bank_savings','Banquero2',0)
;

INSERT INTO `jobs` (name, label) VALUES
  ('banker','Banquero')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('banker',0,'advisor','Casillero',10,'{}','{}'),
  ('banker',1,'banker','Banquero',20,'{}','{}'),
  ('banker',2,'business_banker','Banquero de confianza',30,'{}','{}'),
  ('banker',3,'trader','Mercante',40,'{}','{}'),
  ('banker',4,'boss','Jefe',0,'{}','{}')
;
