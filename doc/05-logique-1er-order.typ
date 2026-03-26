#import "@preview/touying:0.6.2": *

== Logique du premier ordre

// #image("assets/prédicats/Frege.jpg")

La logique du premier ordre à été proposée par #link("https://fr.wikipedia.org/wiki/Gottlob_Frege")[Gottlob Frege],
un logicien de la fin du XIX#super[e] siècle. C'est un système formel, c'est à dire un langage dont la syntaxe et la
sémantique sont définis rigoureusement. Son objectif est de décrire des énoncé de mathématique (mais aussi de
philosophie, de linguistique) et de pouvoir raisonner dessus.

Ce langage introduit toute une famille de symboles:
- des connecteurs logiques ($not$, $and$, $or$, $=>$, ...)
- des quantificateurs ($forall$, $exists$)
- des variables, prenant leurs valeur sur un domaine d'interprétation, qui sont quantifiables ($X$, $Y$, ...).
- des prédicats, qui décrivent des relations de vérité entre éléments du domaine, qui ne sont pas quantifiables
  ($"pere"$, $"plusGrand"$, ...). C'est parce qu'on ne peut pas quantifier sur les prédicats qu'on qualifie cette
  logique de « premier ordre ». Il existe des logiques d'ordre supérieur bien sur, mais ce n'est pas notre sujet ici.

On suivra ici la convention de notation de *Prolog* : les variables commencent par une majuscule et les prédicats par
des minuscules.

Ce qui permet d'écrire des expressions de la forme :

$ forall X (exists Y "mere"(Y , X) and exists Z "pere"(Z, X)) $

exprimant le fait que toute personne à une mère et un père biologique.
