!(register-module! ../../ACT-R_Agent)


!(import! &self ACT-R_Agent:knowledge:Knowledge)
!(import! &self ACT-R_Agent:engine:forward_chain)


;; Test case 
!(fcc (space) (fromNumber 4) (: FACT1 (something is moving))) ;; 

!(fcc (space) (fromNumber 6) (: FACT4 (Ethiopia is country)))

!(fcc (space) (fromNumber 6) (: FACT7 (sun is shining)))

!(fcc (space) (fromNumber 6) (: FACT9 (soil is dry)))


;;expected output(e.g (: ((R5 FACT10) ((R4 FACT9) ((R3 FACT7) FACT8))) (you should water plants)))
!(fcc (space) (fromNumber 6) (: FACT10 (you have water)))


