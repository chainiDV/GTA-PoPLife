

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_mecano','Mecanico',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_mecano','Mecanico',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('mecano','Mecanico')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('mecano',0,'recrue','Recluta',12,'{}','{}'),
  ('mecano',1,'novice','Novato',24,'{}','{}'),
  ('mecano',2,'experimente','Experimentado',36,'{}','{}'),
  ('mecano',3,'chief','Manitas',48,'{}','{}'),
  ('mecano',4,'boss','Jefe',0,'{}','{}')
;

INSERT INTO `items` (name, label) VALUES
  ('gazbottle', 'Bidon de gasolina'),
  ('fixtool', 'Herramientas de reparacion'),
  ('carotool', 'Herramientas de carroceria'),
  ('blowpipe', 'Soplete'),
  ('fixkit', 'Kit de reparacion'),
  ('carokit', 'Kit de carroceria')
;
