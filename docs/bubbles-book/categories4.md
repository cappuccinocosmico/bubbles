# $\infty$-Categories

This if formalized in the definition of an $n$-category

::: definition
The case of an $n$-category is defined inductively like so:

1.  A 0-Category is a Set

2.  A $n$-Category consists of a collection of objects, and between
    every ordered pair of objects $\mathcal{A},\mathcal{B}$ there is an
    $n-1$-category $Hom(\mathcal{A},\mathcal{B})$. Such that

    -   There is a unique object in $Hom(\mathcal{A},\mathcal{A})$
        called $id_\mathcal{A}$

    -   There is a map between
        $Ob(Hom(\mathcal{A},\mathcal{B})) \times Ob(Hom(\mathcal{B},\mathcal{C})) \xrightarrow{\circ} Ob(Hom(\mathcal{A},\mathcal{C}))$

    These arrows must satisfy certain properties namely:
:::
