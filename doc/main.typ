#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import "@preview/tdtr:0.5.4": *

#import themes.metropolis: *

#show: metropolis-theme.with(
    aspect-ratio: "16-9",
    config-info(
        title: [Prolog],
        subtitle: [Un langage mature mais sous-estimé pour de l’IA symbolique !],
        author: [Frédéric Cabestre & Didier Plaindoux],
        date: datetime.today(),
    ),
)

#set text(font:"iosevka")
// #show math.equation: set text(font: "iosevka")

#set heading(numbering: none)
#show math.frac: it => $display(it)$
#show link: underline

#title-slide()

#include "01-presentation-auteurs.typ"
#include "02-ia.typ"

= Fondations

#include "03-filtrage.typ"
#include "04-unification.typ"
#include "05-logique-1er-order.typ"
#include "06-clauses-de-horn.typ"

= Programmation Logique

#include "07-prolog-auteurs.typ"
#include "08-prolog-syntaxe.typ"
#include "09-prolog-extensions.typ"
#include "10-prolog-resolution.typ"
#include "11-prolog-en-action.typ"
