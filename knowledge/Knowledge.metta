
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

!(add-atom &kb (: FACT11 (birds are singing)))
!(add-atom &kb (: FACT12 (birds_sound is morning_alarm)))

!(add-atom &kb (: FACT13 (Today is Thursday)))
!(add-atom &kb (: FACT14 (Thursday has Task_presentation)))
;; ===== Facts (end) =====


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
                         
!(add-atom (space) (: R8 
                        ( ->(birds are singing)
                        (-> (birds_sound is morning_alarm)
                            (i should wake_up)  ))))
!(add-atom (space) (: R9 ( -> (Today is Thursday)     
                              (-> (Thursday has Task_presentation) 
                                   (i Come to Mexico Office)))))
!(add-atom (space) (: R10 ( -> (Now four oclock)
                                (-> (i come to Mexico Office)
                                    (I should Start Presentation)))))