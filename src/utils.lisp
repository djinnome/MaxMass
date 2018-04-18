(defun get-uniprot-of-protein (protein)
  (loop for dblink in (get-slot-values protein 'dblinks)
	when (fequal (car dblink) 'uniprot)
	return (cadr dblink)))
(defun blattner-to-uniprot (filename)
  (tofile filename
	  (format t "Blattner	Uniprot~%")
	  (loop for gene in (get-class-all-instances '|Genes|)
		when (and (get-slot-value gene 'product)
			  (get-uniprot-of-protein (get-slot-value gene 'product)))
		do (format t "~A	~A~%"
			   (get-slot-value gene 'accession-1)
			   (get-uniprot-of-protein (get-slot-value gene 'product))))))
		
