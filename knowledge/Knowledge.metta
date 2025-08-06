
;; Create AtomSpace
!(bind! &kb (new-space))

;; AtomSpace Bind with `space` named function
(= (space) &kb) 

;; Declarative Knowledge base

!(add-atom &kb (: FACT1 (something is moving)))
!(add-atom &kb (: FACT2 (man can move)))
!(add-atom &kb (: FACT3 (i driving car)))

!(add-atom &kb (: FACT4 (Ethiopia is country)))
!(add-atom &kb (: FACT5 (Ethiopia peoples_are black)))
!(add-atom &kb (: FACT6 (Africa countrys_are poor)))

!(add-atom &kb (: FACT7 (sun is shining)))
!(add-atom &kb (: FACT8 (farmer remove weeding)))
!(add-atom &kb (: FACT9 (soil is dry)))
!(add-atom &kb (: FACT10 (you have water)))

;; ===== Facts (10) =====
; !(add-atom &kb (: FACT2 (plants need light)))
; !(add-atom &kb (: FACT4 (plants need water)))
; !(add-atom &kb (: FACT5 (toolshed is open)))
; !(add-atom &kb (: FACT6 (watering can is inside)))
; !(add-atom &kb (: FACT8 (birds are singing)))
; !(add-atom &kb (: FACT9 (morning has started)))
; !(add-atom &kb (: FACT10 (plants are growing)))



            ;; Procedurally knowledge base to use rules
!(add-atom (space) (: R1 
                     (-> (Ethiopia is country)
                        (-> (Ethiopia peoples_are black)
                              (Ethiopia one_of Africas_country)))))
!(add-atom (space) (: R2 
                     (-> (Africa countrys_are poor)
                        (-> (Ethiopia one_of Africas_country)
                              (Ethiopia is poor)))))

!(add-atom (space) (: R3 (-> (sun is shining)
                           (->(farmer remove weeding)
                            (plants grow well)))))

!(add-atom (space) (: R4 (-> (soil is dry) 
                                 (-> (plants grow well)
                                       (plants need water)))))

!(add-atom (space) (: R5 (-> (you have water) 
                        (-> (plants need water) 
                             (you should water plants)))))

!(add-atom (space) (: R6
                (->(i see man)
                    (->(i driving car)
                        (car should stop)))))


!(add-atom (space) (: R7
                (-> (something is moving)
                     (-> ( man can move)
                             (i see man)))))
                         

