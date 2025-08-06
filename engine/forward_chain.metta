; 10 ACT-R style production rules
; !(register-module! ../../ACT-R_Agent)

; !(import! &self ACT-R_Agent:knowledge:knowledge)
; !(import! &self ACT-R_Agent:rules:procedurally_knowledge)

         ;; Number of iteration to get full chaining from atomspace
(: fromNumber (-> Number Atom))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))


         ;; Deductive chaining (ACT-R style cycle)
(= (syn $kb $_ (: $prf $ccln))
   (match $kb (: $prf $ccln) (: $prf $ccln)))

(= (syn $kb (S $k) (: ($prfabs $prfarg) $ccln))
   (let* (
     ((: $prfabs (-> $prms $ccln)) (syn $kb $k (: $prfabs (-> $prms $ccln))))
     ((: $prfarg $prms) (syn $kb $k (: $prfarg $prms))))
     (: ($prfabs $prfarg) $ccln)))

         ;; Backward chaining (optional)
(= (bc $kb $_ (: $prf $ccln))
   (match $kb (: $prf $ccln) (: $prf $ccln)))

(= (bc $kb (S $k) (: ($prfabs $prfarg) $ccln))
   (let* (
     ((: $prfabs (-> $prms $ccln)) (bc $kb $k (: $prfabs (-> $prms $ccln))))
     ((: $prfarg $prms) (bc $kb $k (: $prfarg $prms))))
     (: ($prfabs $prfarg) $ccln)))

;; Forward chaining (optional)
(: fcc (-> $a Nat $b $b))

(= (fcc $kb $_ (: $prf $prms)) (: $prf $prms))

(= (fcc $kb (S $k) (: $prfarg $prms))
   (let (: $prfabs (-> $prms $ccln)) (bc $kb $k (: $prfabs (-> $prms $ccln)))
     (fcc $kb $k (: ($prfabs $prfarg) $ccln))))

(= (fcc $kb (S $k) (: $prfabs (-> $prms $ccln)))
   (let (: $prfarg $prms) (bc $kb $k (: $prfarg $prms))
     (fcc $kb $k (: ($prfabs $prfarg) $ccln))))



