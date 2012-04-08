��             +         �  9   �  �     �   �  X   �  �     �   �  �  �  �   c  N   	  �   c	  �   <
  �   �
    �  �   �  �   [  �   �    �  �   �  /  �    �    �  �   �  �   u  �   �  �   �  �   �  j   	  �   t  �   b  |   �  �   c  �  a  E   �    1  '  I  q   q  �   �  J  �  :  �   �   /#  h   $    x$  �   �%  �   e&  B  @'  �   �(  �   n)  �   2*  J  +  �   S,  e  L-  /  �.  �  �/  �   i1  �   72  �   �2    �3  �   �4  �   �5  9  06  �   j7  �   8  6  �8               
                                                                                                   	                              <big>Welcome to the GNU Image Manipulation Program!</big> <tt>Ctrl</tt>-click with the Bucket Fill tool to have it use the background color instead of the foreground color. Similarly, <tt>Ctrl</tt>-clicking with the eyedropper tool sets the background color instead of the foreground color. <tt>Ctrl</tt>-clicking on the layer mask's preview in the Layers dialog toggles the effect of the layer mask. <tt>Alt</tt>-clicking on the layer mask's preview in the Layers dialog toggles viewing the mask directly. <tt>Ctrl</tt>-drag with the Rotate tool will constrain the rotation to 15 degree angles. <tt>Shift</tt>-click on the eye icon in the Layers dialog to hide all layers but that one. <tt>Shift</tt>-click again to show all layers. A floating selection must be anchored to a new layer or to the last active layer before doing other operations on the image. Click on the &quot;New Layer&quot; or the &quot;Anchor Layer&quot; button in the Layers dialog, or use the menus to do the same. After you enabled &quot;Dynamic Keyboard Shortcuts&quot; in the Preferences dialog, you can reassign shortcut keys. Do so by bringing up the menu, selecting a menu item, and pressing the desired key combination. If &quot;Save Keyboard Shortcuts&quot; is enabled, the key bindings are saved when you exit GIMP. You should probably disable &quot;Dynamic Keyboard Shortcuts&quot; afterwards, to prevent accidentally assigning/reassigning shortcuts. Click and drag on a ruler to place a guide on an image. All dragged selections will snap to the guides. You can remove guides by dragging them off the image with the Move tool. GIMP allows you to undo most changes to the image, so feel free to experiment. GIMP supports gzip compression on the fly. Just add <tt>.gz</tt> (or <tt>.bz2</tt>, if you have bzip2 installed) to the filename and your image will be saved compressed. Of course loading compressed images works too. GIMP uses layers to let you organize your image. Think of them as a stack of slides or filters, such that looking through them you see a composite of their contents. If a layer's name in the Layers dialog is displayed in <b>bold</b>, this layer doesn't have an alpha-channel. You can add an alpha-channel using Layer→Transparency→Add Alpha Channel. If some of your scanned photos do not look colorful enough, you can easily improve their tonal range with the &quot;Auto&quot; button in the Levels tool (Colors→Levels). If there are any color casts, you can correct them with the Curves tool (Colors→Curves). If you stroke a path (Edit→Stroke Path), the paint tools can be used with their current settings. You can use the Paintbrush in gradient mode or even the Eraser or the Smudge tool. If your screen is too cluttered, you can press <tt>Tab</tt> in an image window to toggle the visibility of the toolbox and other dialogs. Most plug-ins work on the current layer of the current image. In some cases, you will have to merge all layers (Image→Flatten Image) if you want the plug-in to work on the whole image. Not all effects can be applied to all kinds of images. This is indicated by a grayed-out menu-entry. You may need to change the image mode to RGB (Image→Mode→RGB), add an alpha-channel (Layer→Transparency→Add Alpha Channel) or flatten it (Image→Flatten Image). Pressing and holding the <tt>Shift</tt> key before making a selection allows you to add to the current selection instead of replacing it. Using <tt>Ctrl</tt> before making a selection subtracts from the current one. To create a circle-shaped selection, hold <tt>Shift</tt> while doing an ellipse select. To place a circle precisely, drag horizontal and vertical guides tangent to the circle you want to select, place your cursor at the intersection of the guides, and the resulting selection will just touch the guides. When you save an image to work on it again later, try using XCF, GIMP's native file format (use the file extension <tt>.xcf</tt>). This preserves the layers and every aspect of your work-in-progress. Once a project is completed, you can save it as JPEG, PNG, GIF, ... You can adjust or move a selection by using <tt>Alt</tt>-drag. If this makes the window move, your window manager uses the <tt>Alt</tt> key already. Most window managers can be configured to ignore the <tt>Alt</tt> key or to use the <tt>Super</tt> key (or "Windows logo") instead. You can create and edit complex selections using the Path tool. The Paths dialog allows you to work on multiple paths and to convert them to selections. You can drag a layer from the Layers dialog and drop it onto the toolbox. This will create a new image containing only that layer. You can drag and drop many things in GIMP. For example, dragging a color from the toolbox or from a color palette and dropping it into an image will fill the current selection with that color. You can draw simple squares or circles using Edit→Stroke Selection. It strokes the edge of your current selection. More complex shapes can be drawn using the Path tool or with Filters→Render→Gfig. You can get context-sensitive help for most of GIMP's features by pressing the F1 key at any time. This also works inside the menus. You can perform many layer operations by right-clicking on the text label of a layer in the Layers dialog. You can save a selection to a channel (Select→Save to Channel) and then modify this channel with any paint tools. Using the buttons in the Channels dialog, you can toggle the visibility of this new channel or convert it to a selection. You can use <tt>Ctrl</tt>-<tt>Tab</tt> to cycle through all layers in an image (if your window manager doesn't trap those keys...). You can use the middle mouse button to pan around the image (or optionally hold <tt>Spacebar</tt> while you move the mouse). You can use the paint tools to change the selection. Click on the &quot;Quick Mask&quot; button at the bottom left of an image window. Change your selection by painting in the image and click on the button again to convert it back to a normal selection. Project-Id-Version: gimp-tips.HEAD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2007-09-07 15:37+0200
PO-Revision-Date: 2007-09-07 15:25+0200
Last-Translator: Stéphane Raimbault <stephane.raimbault@gmail.com>
Language-Team: GNOME French Team <gnomefr@traduc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 <big>Bienvenue sur le « GNU Image Manipulation Program » !</big> Un <tt>Ctrl</tt> + clic avec l'outil de remplissage et il utilisera la couleur d'arrière-plan au lieu de la couleur de premier-plan. De façon similaire, un <tt>Ctrl</tt> + clic avec l'outil pipette capturera la couleur d'arrière-plan au lieu de la couleur de premier-plan. Un <tt>Ctrl</tt> + clic sur l'aperçu d'un masque de calque dans la boîte de dialogue des calques active/désactive l'effet du masque de calque. Un <tt>Alt</tt> + clic sur l'aperçu d'un masque de calque dans la boîte de dialogue des calques active/désactive l'affichage direct du masque. Un <tt>Ctrl</tt> + glissé avec l'outil rotation contraindra la rotation à des angles multiples de 15 degrés. <tt>Majuscule</tt> + clic sur l'icône œil dans la boîte de dialogue des calques pour masquer tous les calques sauf celui-là. <tt>Majuscule</tt>-clic à nouveau pour afficher tous les calques. Une sélection flottante doit être ancrée comme un nouveau calque ou au dernier calque actif avant de procéder à de nouvelles opérations sur l'image. Cliquez sur les boutons &laquo; Nouveau calque &raquo; ou &laquo; Ancrer le calque &raquo; dans la boîte de dialogue des calques, ou utilisez le menu pour faire de même. Après avoir activé les &laquo; raccourcis claviers dynamiques &raquo; dans la boîte de dialogue des préférences, vous pouvez réassigner les raccourcis clavier. Faites cela en affichant le menu, sélectionnez un élément du menu, et pressez sur la combinaison de touche désirée. Si &laquo; enregistrer à la sortie les raccourcis clavier &raquo; est activé, Ils sont enregistrés lorsque vous quittez GIMP. Vous devriez après cela désactiver les &laquo; raccourcis claviers dynamiques &raquo; pour éviter de réassigner accidentellement un raccourci clavier. Cliquez sur une règle et glissez la pour placer un guide sur l'image. Toutes les constructions de sélection vont accrocher aux guides. Vous pouvez enlever les guides en les glissant hors de l'image avec l'outil déplacer. GIMP peut annuler presque tous les changements faits dans l'image, n'hésitez donc pas à expérimenter. GIMP prend en charge la compression gzip à la volée. Ajoutez simplement l'extension <tt>.gz</tt> (ou <tt>.bz2</tt> si bzip2 est installé) au nom de fichier et votre image sera compressée et sauvegardée. Bien sûr le chargement d'images compressées fonctionne également. GIMP utilise des calques pour vous aider à organiser votre image. Pensez à une pile de calques ou de transparents, de telle façon qu'en regardant à travers eux vous verriez une image composée de leurs contenus. Si un nom de calque dans la boîte de dialogue des calques est affiché en <b>gras</b>, ce calque n'a pas de canal alpha. Vous pouvez ajouter un canal alpha en utilisant Calques→Transparence→Ajouter un canal alpha. Si quelques unes de vos photos numérisées ne semblent pas assez colorées, vous pouvez facilement améliorer leur coloration avec le bouton &laquo; Auto &raquo; dans les outils de niveaux (Couleurs→Niveaux). S'il y a une couleur dominante quelconque vous pouvez la corriger avec l'outil courbes (Couleurs→Courbes). Si vous tracez un chemin (Édition→Tracer un chemin), un outil courant de peinture avec ses réglages courants peut être utilisé. Vous pouvez utilisez le pinceau en mode dégradé ou même la gomme ou l'outil éclaircir/assombrir. Si votre écran est trop encombré, vous pouvez appuyer sur la touche <tt>Tabulation</tt> dans une fenêtre d'image pour afficher ou masquer la boîte à outils et les autres boîtes de dialogue. La plupart des filtres travaillent sur le calque courant de l'image actuelle. Parfois vous aurez à fusionner tous les calques (Image→Aplatir l'image) si vous souhaitez que le filtre agisse sur l'image entière. Tous les effets ne peuvent pas être appliqués sur tous les types d'images. Ceci est signalé par une entrée de menu grisée. Vous pourriez donc avoir besoin de changer le mode de l'image en RVB (Image→Mode→RVB), ajouter un canal alpha (Calque→Transparence→Ajouter un canal alpha) ou l'aplatir (Image→Aplatir l'image). Presser et maintenir la touche <tt>Majuscule</tt> avant de faire une sélection vous permet de l'ajouter à la sélection actuelle au lieu de la remplacer. Utiliser <tt>Ctrl</tt> avant de faire une sélection la soustrait de la sélection actuelle. Pour créer un cercle parfait maintenez la touche <tt>Majuscule</tt> tandis que vous faites une sélection elliptique. Pour placer un cercle précisément, mettez en place des guides verticaux et horizontaux tangents au cercle que vous voulez faire, placez votre curseur à l'intersection des guides et la sélection résultante coïncidera avec les guides. Quand vous enregistrez une image pour la retravailler plus tard, essayez le format XCF qui est le format natif de GIMP (extension <tt>.xcf</tt>). Ceci conserve les calques et tous les aspects de votre travail en cours. Une fois qu'un projet est terminé, vous pouvez l'enregistrer en JPEG, PNG, GIF, ... Vous pouvez ajuster ou déplacer une sélection en utilisant <tt>Alt</tt> glissé. Si cette action provoque un déplacement de la fenêtre c'est que votre gestionnaire de fenêtres utilise déjà la touche <tt>Alt</tt>. La plupart des gestionnaires de fenêtres peuvent être configurés pour ignorer la touche <tt>Alt</tt> ou utiliser la touche <tt>Logo</tt> (ou logo Windows) à la place. Vous pouvez créer et éditer des sélections complexes en utilisant l'outil chemin. La boîte de dialogue des chemins vous permet de travailler sur de multiples chemins et de les convertir en sélections. Vous pouvez glisser un calque depuis la boîte de dialogue des calques et la mettre dans la boîte d'outils. Ceci créera une nouvelle image contenant uniquement ce calque. Vous pouvez glisser et déposer beaucoup de choses dans GIMP. Par exemple, glisser une couleur depuis la boîte à outils ou depuis une palette de couleurs et la mettre dans une image va remplir l'image ou la sélection actuelle avec cette couleur. Vous pouvez dessiner de simples carrés ou cercles en utilisant Édition→Tracer la sélection. Il trace les contours de votre sélection actuelle. Des figures géométriques plus complexes sont réalisables avec l'outil chemin ou avec Filtres→Rendu→Figures géométriques. Vous pouvez obtenir une aide contextuelle pour la majorité des fonctionnalités de GIMP en pressant à tout moment la touche F1. Cette aide est aussi disponible dans les menus. Vous pouvez réaliser de nombreuses opérations en faisant un clic-droit sur le titre d'un calque dans la boîte de dialogue des calques. Vous pouvez enregistrer une sélection dans un canal (Sélection→Enregistrer dans un canal) puis la modifier avec n'importe quel outil de dessin. En utilisant les boutons de la boîte de dialogue des canaux, vous pouvez activer/désactiver la visibilité de ce nouveau canal ou le convertir vers une sélection. Vous pouvez utiliser <tt>Ctrl</tt> + <tt>Tabulation</tt> pour naviguer au travers des calques d'une image (si votre environnement ne capture pas ces touches...). Vous pouvez utiliser le bouton du milieu de la souris pour vous déplacer dans l'image (ou optionnellement maintenir <tt>la barre d'espace</tt> tandis que vous déplacez la souris). Vous pouvez utiliser les outils de dessin pour changer la sélection. Cliquez sur le bouton &laquo; Masquage rapide &raquo; dans le coin bas gauche de la fenêtre d'image. Changez votre sélection en dessinant dans l'image et cliquez à nouveau sur le bouton pour la reconvertir comme une sélection normale. 