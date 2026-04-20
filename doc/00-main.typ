#import "@preview/touying:0.7.1": *
#import "@preview/colorful-boxes:1.4.3": *
#import "@preview/tdtr:0.5.4": *

#import themes.metropolis: *

#show: metropolis-theme.with(
    aspect-ratio: "16-9",
    config-info(
        title: [Prolog],
        subtitle: [Un langage mature mais sous-estimé pour de l’IA symbolique !],
        author: [Frédéric Cabestre & *Didier Plaindoux*],
        date: datetime.today(),
    ),
)

// #set text(font:"iosevka")
// #show math.equation: set text(font: "iosevka")

#set heading(numbering: none)
#show math.frac: it => $display(it)$
#show link: underline

#title-slide()

#include "10-presentation-auteurs.typ"
#include "20-ia.typ"
#include "25-convention.typ"

= Principe: Le filtrage de motifs

#include "30-filtrage.typ"

= Fondations: L'unification

#include "40-unification.typ"

= Fondations: La logique du premier order

#include "50-logique-1er-order.typ"
#include "60-clauses-de-horn.typ"

= Programmation Logique

#include "70-prolog-auteurs.typ"
#include "80-prolog-syntaxe.typ"
#include "90-prolog-resolution.typ"

= Prolog : Extensions

#include "100-prolog-extensions.typ"
#include "110-prolog-contrainte.typ"

= Prolog en action !

#include "120-prolog-en-action.typ"

#include "130-conclusion.typ"

#title-slide()