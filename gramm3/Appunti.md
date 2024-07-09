# Grammatica 3
Il codice è in grado di utilizzare la terza grammatica 

1. StmtsAST. Nel codice fornito, StmtAST rappresenta un insieme di istruzoni, poichè le istruzioni non sono necessariamente funzioni, ha senso che il il metodo codgen() retituisca un valore Value invece che Function.

2. Il metodo codegen() è responsabile della generazione del codice LLVM per l'insieme di istruzioni rappresentato da StmtsAST tuttaviaquesto codice può non corrispondere ad una funzione. Potrebbero essere una sequenza di istruzioni LLVM eseguite nel contesto più ampio del programma.

3. In poche parole il metodo codegen() genera il codice per LLVM per l'insieme di istruzioni generate da StmtsAST, elaborando prima l'espressione Left e poi l'espressione Right, se presente. Se ci sono errori durante la generazione del codice il metodo restituisce un puntatore nullo per indicare errore.