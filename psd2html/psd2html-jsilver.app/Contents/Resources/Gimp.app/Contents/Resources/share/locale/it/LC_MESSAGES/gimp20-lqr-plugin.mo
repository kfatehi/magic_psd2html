��    o      �  �         `	     a	     n	     {	     �	  
   �	     �	     �	     �	     �	     �	  
   �	  !    
      "
  B   C
  G   �
  C   �
  �        �             6   %     \     v     �  (   �  �   �  �   �  �   B     �                :     M     h     {     �     �  "   �  1   �     �  [     `   ^  ]   �          $     7     <     V  `   l     �     �     �     �     �     �               %  *   6  1   a  6   �     �  j   �     G     X     j     p          �  /   �  >   �          ,  P   @     �     �     �     �     �  �        �     �  ,   �  "   �  	          K   ,  �   x  E      �   F     #  \   >  [   �     �  A     =   M  {   �       �     [   �     A     G  �   N       
   !     ,  4   ;     p     �     �  Y  �               )     >     M  !   Z  "   |     �     �     �     �  ,   �  +     [   ?  ]   �  Y   �  �   S      P!     X!  #   j!  7   �!  '   �!     �!     
"  .   %"  �   T"  �   2#  �   $  %   �$     %  &   /%     V%     o%     �%     �%     �%     �%  +   �%  @   �%     1&  x   K&  z   �&  h   ?'     �'     �'     �'     �'     �'  �   �'  
   �(     �(     �(     �(     �(     �(     �(     �(     �(  (   )  E   :)  G   �)     �)  �   �)     ]*     {*  
   �*     �*     �*     �*  +   �*  T   
+  !   _+     �+  I   �+     �+     �+  !   ,  %   =,     c,  �   �,     -      -  3   :-  +   n-     �-     �-  V   �-  �   .  U   �.    �.     0     20  �   �0  !   51  ^   W1  V   �1  �   2     �2  �   �2  h   �3  	   4  
    4  �   +4  #   	5     -5     95  8   H5     �5  	   �5  %   �5     V   0       3   ,   n   C   F      ]   Z                     X   U      ?   (   M          h   .      7      D   e          W       
              >       2       k   H          `   @   l           8       m   c   6      *   4       S   A              /          _   %   ^          ;   P   +   #   $   [   R       !   )         1   '       "       E                  Y   d   a      G      9   K       b              =   N           i   g          	       J         o       Q   L              T   \      I   5   <   O   f          B   :      -   &   j               %s disc mask %s pres mask %s rigidity mask %s seam map <b>Map</b> <b>Operations control</b> <b>Seams control</b> Advanced Apply Applying changes... Auto size: Colour to use for the first seams Colour to use for the last seams Creates a new transparent layer ready to be used as a discard mask Creates a new transparent layer ready to be used as a preservation mask Creates a new transparent layer ready to be used as a rigidity mask Creates an extra output layer with the seams, for visual inspection of what the plugin did. Use it together with "Output on a new layer", and resize in one direction at a time.
Note that this option is ignored in interactive mode Discard Discard features Drawing seam map... Dump the internal map on a new layer (RGB images only) Error: image type changed Error: invalid image Error: invalid layer Error: number of colour channels changed Extra layers are needed to activate feature discard.
You can create one with the "New" button and paint on it, then press the "Refresh" button.
Note that painting in black has no effect Extra layers are needed to activate feature preservation.
You can create one with the "New" button and paint on it, then press the "Refresh" button.
Note that painting in black has no effect Extra layers are needed to be used as rigidity masks.
You can create one with the "New" button and paint on it, then press the "Refresh" button.
Note that painting in black has no effect Feature discard mask Feature masks Feature preservation mask First seams colour GIMP LiquidRescale Plug-In Gradient function: Height Height: Horizontal first Ignore discard mask when enlarging Increasing this value results in straighter seams Last seams colour Layer to be used as a mask for feature discard.
Use the "Refresh" button to update the list Layer to be used as a mask for feature preservation.
Use the "Refresh" button to update the list Layer to be used as a mask for rigidity settings.
Use the "Refresh" button to update the list Layer: Li_quid rescale... Mask Max enlargement per step: Max transversal step: Maximum displacement along a seam. Increasing this value allows to overcome the 45 degrees bound Mode: Next step at Norm Not enough memory Null Orientation Output Output on a new layer Output the seams Outputs the resulting image on a new layer Overall coefficient for feature discard intensity Overall coefficient for feature preservation intensity Overall rigidity: Paint the mask on the newly created layer, then come back to this dialog and click on the "Refresh" button Parsing layer... Preserve features Range Reference size Rescale order: Reset the internal map Reset width and height to their original values Resize and translate the image canvas to fit the resized layer Resize auxiliary layers Resize image canvas Resize the layers used as features or rigidity masks along with the active layer Resizing height... Resizing width... Scale back to the original size Select behaviour for the mask Select new width and height Select this if you want to transform back the layer after LqR has been performed.
Note that this option is ignored in interactive mode Selected layer Set width and height Set width and height to the last used values Show/hide internal map information Strength: Sum of absolute values Switch to interactive mode. Note that the current settings will be applied. This affects the automatic feature recognition.
It's the function which will be applied to the components of the gradient on each pixel This controls the order of operations if rescaling in both directions This will have the same effect as setting the strenght to 0 in the discard mask when the first rescale step is an image enlargment (which normally is the best choice).
Note that this option is ignored in interactive mode Transversal absolute value Try to set the final height as needed to remove the masked areas.
Only use with simple masks Try to set the final width as needed to remove the masked areas.
Only use with simple masks Use a rigidity mask Use an extra layer to mark areas where seams should be straighter Use an extra layer to preserve selected areas from distortion Use an extra layer to treat selected areas as if they were meaningless (useful to remove parts of the image when shrinking) Vertical first Warning: the discard mask information will be ignored with the current settings.
(If you know what you're doing you can override this behaviour by unchecking the corrensponding option in the "Advanced" tab) When enlarging beyond the value set here the rescaling will be performed in multiple steps. Width Width: You can choose to rescale back to the original size with LqR or standard scaling, or to use standard scaling to reach the previous width or height while preserving the aspect ratio height only (uniform scaling) horizontal liquid rescale scaling which keeps layer features (or removes them) standard scaling vertical width only (uniform scaling) Project-Id-Version: gimp22-lqr-plugin 0.2.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2009-02-06 16:31+0100
PO-Revision-Date: 2008-08-04 03:10+0200
Last-Translator: Carlo Baldassi <carlobaldassi@gmail.com>
Language-Team: Italian <carlobaldassi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 %s (maschera elim.) %s (maschera pres.) %s (maschera rigid.) %s (linee az.) <b>Mappa</b> <b>Controllo delle operazioni</b> <b>Impostazioni linee d'azione</b> Avanzate Applica Sto applicando i cambiamenti... Auto dimensionamento: Colore da usare per le ultime linee d'azione Colore da usare per le prime linee d'azione Crea un nuovo livello trasparente, pronto per essere usato come maschera per l'eliminazione Crea un nuovo livello trasparente, pronto per essere usato come maschera per la preservazione Crea un nuovo livello trasparente, pronto per essere usato come maschera per la rigidità Crea un livello extra con le linee d'azione, in modo da poter controllare cosa ha fatto il plugin. Va usato assieme a "Scrivi su un nuovo livello", e ridimensionando una direzione alla volta.
Nota che questa opzione è ignorata in modalità interattiva Elimina Elimina contenuti Sto disegnando le linee d'azione... Mostra la mappa su un nuovo livello (solo immagini RGB) Errore: il tipo di immagine è cambiato Errore: immagine non valida Errore: livello non valido Errore: il numero di canali colore è cambiato Sono necessari altri livelli per attivare l'eliminazione dei contenuti.
Puoi crearne uno usando il pulsante "Nuova" e dipingendoci sopra, infine premi il pulsante "Aggiorna"
Nota che dipingere in nero non ha alcun effetto Sono necessari altri livelli per attivare la preservazione dei contenuti.
Puoi crearne uno usando il pulsante "Nuova" e dipingendoci sopra, infine premi il pulsante "Aggiorna"
Nota che dipingere in nero non ha alcun effetto Sono necessari altri livelli per attivare la maschera per la rigidità.
Puoi crearne uno usando il pulsante "Nuova" e dipingendoci sopra, infine premi il pulsante "Aggiorna"
Nota che dipingere in nero non ha alcun effetto Maschera per i contenuti da eliminare Maschere per i contenuti Maschera per i contenuti da preservare Colore delle prime linee GIMP LiquidRescale Plug-In Funzione gradiente: Altezza Altezza: Prima in orizzontale Non eliminare i contenuti quando si allarga Aumentando questo valore si ottengono linee d'azione più dritte Colore delle ultime linee Livello da utilizzare come maschera per l'eliminazione dei contenuti.
Usa il pulsante "Aggiorna" per aggiornare la lista Livello da utilizzare come maschera per la preservazione dei contenuti.
Usa il pulsante "Aggiorna" per aggiornare la lista Livello da utilizzare come maschera per la rigidità.
Usa il pulsante "Aggiorna" per aggiornare la lista Livello: Li_quid rescale... Maschera Max ingrand. per passo: Passo trasverso max: Massimo spostamento trasversale lungo una linea d'azione. Aumentare questo valore permette di superare il limite di inclinazione  di 45 gradi. Modalità: Prossimo passo a Norma Memoria insufficiente Zero Orientamento Output Risultato su un nuovo livello Mostra le linee d'azione Disegna il risultato su un nuovo livello Coefficiente globale per l'intensità dell'eliminazione dei contenuti Coefficiente globale per l'intensità della preservazione dei contenuti Rigidità globale Dipingi la maschera sul nuovo livello che è stato creato, poi torna a questa finestra di dialogo e clicca sul pulsante "Aggiorna" Sto analizzando il livello... Preserva contenuti Intervallo Dim. di riferimento Ordine del ridimens.: Reimposta la mappa interna Reimposta le dimensioni ai valori originali Adegua la tela dell'immagine a quella del risultato al termine del ridimensionamento Ridimensiona i livelli ausiliarii Ridimensiona la tela Ridimensiona i livelli utilizzati come maschere assieme al livello attivo Sto riscalando la larghezza... Sto riscalando l'altezza... Riporta alle dimensioni originali Selezionare come trattare la maschera Selezionare le nuove dimensioni Riporta il livello alle dimensioni originali dopo la trasformazione con LqR.
Nota che questa opzione è ignorata in modalità interattiva Livello selzionato Selezionare le dimensioni Imposta le dimensioni ai valori usati l'ulima volta Mostra/nascondi le informazioni sulla mappa Intensità: Somma di valori assoluti Passa alla modalità interattiva. Nota che le impostazioni attuali verranno applicate. Questa opzione influenza il riconoscimento automatico dei contenuti
È la funzione che viene applicata alle componenti del gradiente su ogni pixel Qui si può decidere l'ordine delle operazioni se si riscala in entrambe le direzioni Questa opzione ha lo stesso effetto di porre a zero l'intensità della rimozione dei contenuti quando la riscalatura implica come primo passo un allargamento dell'immagine (che è normalmente il comportamento ottimale).
Nota che questa opzione è ignorata in modalità interattiva Valore assoluto trasverso Cerca di impostare l'altezza finale in modo da eliminare le aree marcate per la rimozione.
Da usare solo con maschere semplici. Cerca di impostare la larghezza finale in modo da eliminare le aree marcate per la rimozione.
Da usare solo con maschere semplici. Usa una maschera per la rigidità Utilizza un livello aggiuntivo per differenziare la rigidità delle diverse aree dell'immagine Utilizza un livello aggiuntivo per specificare le aree da preservare dalla distorsione Utilizza un livello aggiuntivo per specificare le aree da trattare come non significative (utile per rimuovere parti dell'immagine mediante il restringimento) Prima in verticale Attenzione: la maschera per l'eliminazione dei contenuti sarà ignorata con le attuali impostazioni.
(Se sai quello che stai facendo puoi modificare questo comportamento deselezionando l'opzione corrispondente nella linguetta "Avanzate") Quando si ingrandisce oltre il valore impostato qui il ridimensionamento viene effettuato in più passi. Larghezza Larghezza: Si può scegliere di ritornare alle dimensioni originali usando LqR o lo scaling standard, oppure di usare lo scaling standard per raggiungere solo la larghezza o l'altezza originali, mantenendo le proporzioni del livello solo altezza (riscalatura uniforme) orizzontale liquid rescale scala il livello mantenendo i contenuti (o rimuovendoli) scaling standard verticale solo larghezza (riscalatura uniforme) 