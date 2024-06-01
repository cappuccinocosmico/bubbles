---
sidebar_position: 5
---
# Categories III: Natural Transformations and 2-Categories

:::info[definiton]
A Natural transformation $\mu$ between two functors
$A \xrightarrow{F} B$ and $A \xrightarrow{G} B$, associates every object
$x \in A$ with an arrow in $B$, $\mu_x$ with the following domain and
codomain 
$$
F(x) \xrightarrow{\mu_x} G(X)
$$
such that for every arrow in
$x \xrightarrow{f} y \in A$ then the
$\mu_y \circ F(f) = G(f) \circ \mu_x$ or alternatively the following
diagram commutes. 
$$\begin{tikzcd}
    {F(x)} & {G(x)} \\
    {F(y)} & {G(y)}
    \arrow["{F(f)}"', from=1-1, to=2-1]
    \arrow["{\mu_x}", from=1-1, to=1-2]
    \arrow["{\mu_y}"', from=2-1, to=2-2]
    \arrow["{G(f)}", from=1-2, to=2-2]
\end{tikzcd}$$
:::

:::info[definiton]
A natural isomorphism is a natural transformation $\mu$ where every
morphism $\mu_x$ is a bijection/isomorphism.
:::

:::info[definiton]
Two categories are $A$ and $B$ are equivalent if there exist functors
$A \xrightarrow{F} B$ and $B \xrightarrow{G} A$ such that there is a
natural isomorphism between $F \circ G$ and $A_{id}$ as well as a
natural isomorphism between $G \circ F$ and $B_{id}$ 
<!-- $$\begin{tikzcd}
    & {\mathcal{A}} & {\mathcal{B}} \\
    {\mathcal{B}} & {\mathcal{B}} & {\mathcal{A}} & {\mathcal{A}}
    \arrow["F", curve={height=-6pt}, from=1-2, to=1-3]
    \arrow["G", curve={height=-6pt}, from=1-3, to=1-2]
    \arrow[""{name=0, anchor=center, inner sep=0}, "{G \circ F}", curve={height=-12pt}, from=2-3, to=2-4]
    \arrow[""{name=1, anchor=center, inner sep=0}, "{id_\mathcal{A}}", curve={height=-12pt}, from=2-4, to=2-3]
    \arrow[""{name=2, anchor=center, inner sep=0}, "{F \circ G}", curve={height=-12pt}, from=2-1, to=2-2]
    \arrow[""{name=3, anchor=center, inner sep=0}, "{id_\mathcal{B}}", curve={height=-12pt}, from=2-2, to=2-1]
    \arrow[shorten <=3pt, shorten >=3pt, Rightarrow, 2tail reversed, from=1, to=0]
    \arrow[shorten <=3pt, shorten >=3pt, Rightarrow, 2tail reversed, from=3, to=2]
\end{tikzcd}$$ -->
:::

:::tip[theorem]
All \"categorical\" constructions, any definition of a sets/object by
only referencing their behavior with respect to functions/arrows, (aka
no subsets, no inclusion, no equality on objects) respect equivalence of
categories, the same way all operations in group theory respect
isomorphism of groups and the like.
:::

:::info[definiton]
[]{#def:funccat label="def:funccat"} For any two categories
$\mathcal{A},\mathcal{B}$, we define the category
$\mathcal{B}^\mathcal{A}$ to be the category of functors from
$\mathcal{A}$ to $\mathcal{B}$, where

-   Objects are functors from $\mathcal{A}$ to $\mathcal{B}$

-   Arrows from objects $F$ to $G$ are natural transformations from a
    functor $F$ to a functor $G$

We define

-   For any functor $F$ we define the natural transformation
    $F \xRightarrow{id_F} F$ to be the natural transformation
    associating every object $x \in \mathcal{A}$ with the arrow in
    $\mathcal{B}$ $$\begin{aligned}
                F(x) \xrightarrow[]{id_{F(x)}} F(x)
            
    \end{aligned}$$

-   Given three functors $F,G,H$ between $\mathcal{A}$ and
    $\mathcal{B}$, and natural transformations
    $F \xRightarrow{\alpha} G$ and $G \xRightarrow{\beta} H$. The
    natural transformation $\beta \circ \alpha$ associates every
    $x \in \mathcal{A}$ with the arrow in $\mathcal{B}$ given by:
    $$\begin{tikzcd}
        {F(x)} & {G(x)} & {H(x)}
        \arrow["{\alpha_x}", from=1-1, to=1-2]
        \arrow["{\beta_x}", from=1-2, to=1-3]
        \arrow["{(\beta \circ \alpha)_x=\beta_x \circ \alpha_x}"', curve={height=12pt}, from=1-1, to=1-3]
    \end{tikzcd}$$

Proofs that the definitions for identity and composition exist as
natural transformations and satisfy the rules of a category are in the
exercise solutions.
:::

 

:::info[definiton]
A 2-Category $C$ consists of a collection of objects, a collection of
1-morphisms $Hom_C(a,b)$ for every ordered pair of objects
$a,b \in \mathcal{O}$. And a collection $Hom2(f,g)$ for every ordered
pair of arrows $f,g \in Hom_C(a,b)$

1.  For every object $a$ there exists a 1-morphism $id_a \in Hom(a,a)$

2.  For any 1-morphism $f \in Hom(a,b)$ and $g \in Hom(b,c)$, there
    exists an arrow $g \circ f \in Hom(a,c)$

These 1-morphisms must satisfy the same identity and associativity
properties as a regular category, now for the 2 morphisms

1.  For every 1-morphism $f \in Hom(a,b)$, there exists a 2-morphism
    $id_f \in Hom2(f,f)$

2.  For every three 1 morphisms $f,g,h \in Hom(a,b)$ if there are
    2-morphisms $\alpha \in Hom2(f,g)$ and $\beta \in Hom2(g,h)$, then
    there exists a 2-morphism $\beta \circ \alpha \in Hom2(f,h)$.

And these 2-morphisms must also satisfy the same identity and
associativity properties as a regular category.
:::

Another way of formalizing a 2-category is a regular category where your
HomSets are replaced with HomCategories. Using this we can finally
define the category of categories

:::info[definiton]
The 2-Category $Cat$ is the category where

-   The objects of $Cat$ are small categories (ie, categories with only
    a set of morphisms, to avoid problems with Russel's Paradox.)

-   The 1-morphisms are Functors between categories.

-   The 2-morphisms are natural transformations between functors.
:::

### Exercises

:::note[Exercise]
Suppose $\alpha: F \Rightarrow G$ is a natural isomorphism. Show that
the inverses of the component morphisms define the components of a
natural isomorphism $\alpha^{-1}: G \Rightarrow F$.
:::

:::note[Exercise]
Prove that for any category $\mathcal{A}$ that $\mathcal{A}$ is
equivalent to $sk(\mathcal{A})$
:::

:::warning[Answer]
:::

:::note[Exercise]
Show that for any 2 skeletal categories $A$ and $B$, then an equivalence
between $A$ and $B$ forms an isomorphism from $A$ to $B$
:::

:::warning[Answer]
:::

:::note[Exercise]
Show that for any functor $\mathcal{A} \xrightarrow[]{F} \mathcal{B}$
that the identity natural transformation defined in Definition
[\[def:funccat\]](#def:funccat){reference-type="ref"
reference="def:funccat"} is actually a natural transformation that
satisfies: $$\begin{tikzcd}
    {F(x)} & {F(x)} \\
    {F(y)} & {F(y)}
    \arrow["{F(f)}"', from=1-1, to=2-1]
    \arrow["{\mu_x}", from=1-1, to=1-2]
    \arrow["{\mu_y}"', from=2-1, to=2-2]
    \arrow["{F(f)}", from=1-2, to=2-2]
\end{tikzcd}$$
:::

:::note[Exercise]
Show that for any functors
$\mathcal{A} \xrightarrow[]{F,G,H} \mathcal{B}$, and natural
transformations $F \xRightarrow{\alpha} G$ and $G \xRightarrow{\beta}H$
that the composition natural transformation $\beta \circ \alpha$ defined
in Definition [\[def:funccat\]](#def:funccat){reference-type="ref"
reference="def:funccat"} is actually a natural transformation that
satisfies: 
$$\begin{tikzcd}
    {F(x)} & {F(x)} \\
    {H(y)} & {H(y)}
    \arrow["{F(f)}"', from=1-1, to=2-1]
    \arrow["{\mu_x}", from=1-1, to=1-2]
    \arrow["{\mu_y}"', from=2-1, to=2-2]
    \arrow["{H(f)}", from=1-2, to=2-2]
\end{tikzcd}$$
:::

:::note[Exercise]
Show the category of finite sets $FinSet$ and the category of hereditary
finite sets $V_\omega$ are equivalent as categories.
:::

:::warning[Answer]
We can prove this by showing that there are 2 functors $Y$ and $Y'$, and
a natural isomorphism between $Y'\circ Y \cong FinSet_{id}$ and
$Y \circ Y' \cong (V_\omega)_{id}$ Since every finite set $a$ has a
bijection between it and a natural number $|a|$ like so $$\begin{tikzcd}
        a & {|a|}
        \arrow["{a_*}", curve={height=-6pt}, tail, two heads, from=1-1, to=1-2]
        \arrow["{a_*^{-1}}", curve={height=-6pt}, tail, two heads, from=1-2, to=1-1]
    \end{tikzcd}$$ We can then say our functor $Y(a)= |a|$ and for a
function $a \rightarrow{f} b$ then $Y(f)$ can be defined as
$$\begin{gathered}
        |a| \xrightarrow{a_*^{-1}} a \xrightarrow{f} b \xrightarrow{b_*} |b|\\
        Y(f) = b_* \circ f \circ a_*^{-1}
    
\end{gathered}$$ And we can see that it respects composition
$$\begin{aligned}
        Y(g) \circ Y(f) &= c_* \circ g \circ b_*^{-1} \circ b_* \circ f \circ a_*^{-1}\\
        &= c_* \circ g \circ  f \circ a_*^{-1}\\
        &= Y(g \circ f)
    
\end{aligned}$$ We define $Y'$ using the exact same construction since
every hereditary finite set is also a set, we can associate it with a
natural number all the same. We also know that if $a$ is in the natural
numbers then $a_*$ the identitfy function on $a$ namely $a_{id}$. Notice
that since if $|a|$ is a natural number then, $Y(|a|)=|a|$ and if we
apply $F$ to a function $|a| \xrightarrow{g}|b|$ then
$Y(g)= b_{id} \circ g \circ a_{id}^{-1}=g$, the same goes for $Y'$
applied to any natural number $|a|$ or function between them $g$.

We can now create the natural isomorphism between
$Y'\circ Y \cong FinSet_{id}$. Luckily we already have a candidate at
the ready, where we can associate every element $a$ with a morphism
$a_*$. We now must verify the commutative square saying that
$$\begin{tikzcd}
        {a} & {|a|} \\
        {b} & {|b|}
        \arrow["{f}"', from=1-1, to=2-1]
        \arrow["{a_*}", from=1-1, to=1-2]
        \arrow["{b_*}"', from=2-1, to=2-2]
        \arrow["{F'(F(f))}", from=1-2, to=2-2]
    \end{tikzcd}$$ Alternatively prove that
$b_* \circ f = F'(F(f)) \circ  a_*$. Using that
$F'(F(f))= b_* \circ f \circ a_*^{-1}$, and we can conclude the proof
like so $$\begin{aligned}
        F'(F(f)) \circ  a_* &= b_* \circ f \circ a_*^{-1} \circ a_*\\
        &= b_* \circ f 
    
\end{aligned}$$ Thus $Y'\circ Y \cong FinSet_{id}$. Showing that
$Y \circ Y' \cong (V_\omega)_{id}$ follows the exact same logic just
recasting everything in the domain of hereditary finite sets.
:::
