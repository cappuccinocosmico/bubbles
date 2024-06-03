# Yoneda's Lemma and Presheaves

Yoneda's lemma often takes 2 forms, the first form begins like so

:::info[definition]
For a category $\mathcal{C}$ every object in $c \in C$ gives rise to a
functor $Hom(c,\_)$ from $C \xrightarrow[]{Hom(c,\_)} Set$. Such that
for every $x \in C$ maps $x$ to the hom set $Hom(c,x)$ and for every
function $x \xrightarrow[]{f} y$ induces a map
$Hom(c,x) \xrightarrow{f \circ \_} Hom(c,y)$ that takes an arrow and
composes it with $f$ like so: $$\begin{tikzcd}
    c & x & y
    \arrow["f", from=1-2, to=1-3]
    \arrow["{\_}", from=1-1, to=1-2]
    \arrow["{f \circ \_}"', curve={height=16pt}, from=1-1, to=1-3]
\end{tikzcd}$$ Giving us the following functor: $$\begin{tikzcd}
    x & \mapsto & {Hom(c,x)} \\
    y & \mapsto & {Hom(c,y)}
    \arrow["f", from=1-1, to=2-1]
    \arrow["{f \circ \_}", from=1-3, to=2-3]
\end{tikzcd}$$ Dually for every object $c$ we also have the functor
$Hom(\_,c)$ giving us a functor from
$\mathcal{C}^{op} \xrightarrow[]{Hom(_,c)} Set$
:::

:::tip[Theorem]
Pick a category $\mathcal{C}$ and a functor $F$ between
$\mathcal{C} \xrightarrow[]{F} Set$. Using the definition above an
element $c \in \mathcal{C}$ also defines a functor
$\mathcal{C} \xrightarrow[]{Hom(_,c)} Set$. Notice that these functors
are now parallel and we can define natural transformations from
$Hom(c,\_))$ to $F$ $$\begin{tikzcd}
    {\mathcal{C}} && Set
    \arrow[""{name=0, anchor=center, inner sep=0}, "{Hom(c,\_)}", curve={height=-12pt}, from=1-1, to=1-3]
    \arrow[""{name=1, anchor=center, inner sep=0}, "F"', curve={height=12pt}, from=1-1, to=1-3]
    \arrow[shorten <=3pt, shorten >=3pt, Rightarrow, from=0, to=1]
\end{tikzcd}$$ Yoneda's lemma states that the cardinally of the set of
all natural transformations between $Hom(c,\_)$ and $F$ is the same
cardinality as the set $F(c)$.

Furthermore there is a well defined isomorphism between the 2 sets
$$\begin{aligned}
    Hom(Hom(c,\_),F) \cong F(c)
\end{aligned}$$ Defined by $Hom(Hom(c,\_),F) \xrightarrow[]{\Psi} F(c)$.
Remember that for any natural $\alpha$ between $Hom(Hom)$
:::

:::info[definition]
Another way to think about the Hom functor is as a map between the
category $\mathcal{C}^{op} \times  \mathcal{C} \xrightarrow{Hom} Set$.
(Remember product categories consist of pairs of objects $(a,b)$ one
from each category, and have arrows that are pairs of arrows between
objects $(a,b) \xrightarrow[]{(f,g)} (c,d)$).

In particular $Hom$ takes the pair $(a^{op},b)$ to the set $Hom(a,b)$.
And for every arrow $(a^{op},b) \xrightarrow[]{(f^{op},g)} (c^{op},d)$,
should induce an arrow from $Hom(a,b)$ to $Hom(c,d)$. Using the fact
that $a^{op} \xrightarrow[]{f^{op}} c^{op}$ is just an arrow
$c \xrightarrow[]{f} a$. Given an abitrary morphism from $a$ to $b$ we
can create a morphism from $c$ to $d$ by composing $f$ and $g$ on both
sides like so: $$\begin{tikzcd}
    a & b \\
    c & d
    \arrow["{\_}", from=1-1, to=1-2]
    \arrow["{g \circ \_ \circ f}"', from=2-1, to=2-2]
    \arrow["f", from=2-1, to=1-1]
    \arrow["g", from=1-2, to=2-2]
\end{tikzcd}$$ Note that using the fact that product categories and
functor categories form exponentials in $Cat$ we can say the functor
$\mathcal{C}^{op} \times  \mathcal{C} \xrightarrow{Hom} Set$ gives rise
to two other functors using the exponential property: $$\begin{gathered}
        \mathcal{C} \xrightarrow{Yo} Set^{\mathcal{C}^{op}}\\
        \mathcal{C}^{op} \xrightarrow{Yo^{op}} Set^{\mathcal{C}}
    
\end{gathered}$$ The first functor is called the \"Yoneda Embedding\"
:::

:::info[definition]
A functor $A \xrightarrow{F} B$ defines a map between
$Hom(a_1,a_2) \xrightarrow[]{f^\* } Hom(f(a_1),f(a_2))$ for all pairs
$a_1,a_2 \in A$. Then $F$ is:

-   Faithful if for all
    $Hom(a_1,a_2) \xrightarrow[]{f^*} Hom(f(a_1),f(a_2))$, $f^*$ is
    surjective.

-   Full if for all
    $Hom(a_1,a_2) \xrightarrow[]{f^*} Hom(f(a_1),f(a_2))$, $f^*$ is
    injective.

-   Full and faithful if for all
    $Hom(a_1,a_2) \xrightarrow[]{f^*} Hom(f(a_1),f(a_2))$, $f^*$ is a
    bijection.
:::

Using all this we can write a different often more convinent form of the
yoneda lemma:

:::tip[Theorem]
The functors $$\begin{gathered}
        \mathcal{C} \xrightarrow{Yo} Set^{\mathcal{C}^{op}}\\
        \mathcal{C}^{op} \xrightarrow{Yo^{op}} Set^{\mathcal{C}}
    
\end{gathered}$$ are full and faithful.
:::

These enable us to further talk about what exactly these things are

:::info[definition]
A presheaf of a category $C$, is the category $Set^{C^{op}}$
:::

:::info[definition]
A presheaf of a category $C$ ($Set^{C^{op}}$) is the \"free
cocompletion\" of the category $C$. The \"free cocompletion\" can be
conceptualized as \"freely adjoining colimits to C\" What this means is
that given:

1.  For any category $D$ with all colimits.

2.  And a functor $C \xrightarrow{F} D$

Then there is a unique functor $\bar{F}$ from
$Set^{C^{op}} \xrightarrow[]{\bar{F}} D$ that:

1.  Preserves colimits.

2.  Preserves the following commutative diagram:

$$\begin{tikzcd}
    C & {Set^{C^{op}}} & D
    \arrow["Yo", from=1-1, to=1-2]
    \arrow["{\bar{F}}", from=1-2, to=1-3]
    \arrow["F"', curve={height=12pt}, from=1-1, to=1-3]
\end{tikzcd}$$
:::

Also crucially for our understanding of topos theory.

:::tip[Theorem]
For a small $C$, $Set^C$ is a topos.
:::

### Exercises {#exercises .unnumbered}

:::note[Exercise]
Prove that given a Full Functor $A \xrightarrow[]{F} B$. Then for any 2
elements $x,y \in A$ if $F(x) \cong F(y)$, then $x \cong y$
:::

:::note[Exercise]
Prove Yoneda Consequence #1, namely if for all $x \in \mathcal{C}$ if
$Hom(x,a) \cong Hom(x,b)$ then $a \cong b$. (Use the definition of a
yoneda embedding)
:::
