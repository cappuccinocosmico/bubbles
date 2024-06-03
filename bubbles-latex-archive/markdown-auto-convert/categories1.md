# Categories I: Categories and their Examples

## Definitions

:::info[definition]*
A Category $C$ consists of a class of objects $\mathcal{O}$, and a set
of arrows $Hom_C(a,b)$ for every ordered pair of objects
$a,b \in \mathcal{O}$. There exist certain arrows

1.  For every object $a$ there exists an arrow $id_a \in Hom_C(a,a)$

2.  For any arrow $f \in Hom_C(a,b)$ and $g \in Hom_C(b,c)$, there
    exists an arrow $g \circ f \in Hom_C(a,c)$

These arrows must satisfy certain properties namely:

1.  For any morphism $a \xrightarrow{f} b$ then
    $b_{id} \circ f = f = f \circ id_a$. (ie, the identity arrow must
    behave like an identity function or map on sets or any other
    mathematical object.) $$\begin{tikzcd}
                a & a & b & b
                \arrow["{id_a}", from=1-1, to=1-2]
                \arrow["f", from=1-2, to=1-3]
                \arrow["{b_{id}}", from=1-3, to=1-4]
                \arrow["f"', curve={height=12pt}, from=1-1, to=1-3]
                \arrow["f"', curve={height=12pt}, from=1-2, to=1-4]
            \end{tikzcd}$$

2.  For any $f \in Hom_C(a,b)$, $g \in Hom_C(b,c)$ and
    $h \in Hom_C(b,c)$, then $h \circ(g \circ f)=(h \circ g) \circ f$
    (ie, composition of arrows must be associative like functions or
    maps on sets or any other mathematical object.) $$\begin{tikzcd}
                a & b & c & d
                \arrow["f", from=1-1, to=1-2]
                \arrow["g", from=1-2, to=1-3]
                \arrow["h", from=1-3, to=1-4]
                \arrow["{g \circ f}"', curve={height=12pt}, from=1-1, to=1-3]
                \arrow["{h\circ g}"', curve={height=12pt}, from=1-2, to=1-4]
                \arrow["{h \circ g \circ f}", curve={height=-24pt}, from=1-1, to=1-4]
            \end{tikzcd}$$
:::

:::info[definition]*
Two objects $a,b$ in a category $\mathcal{C}$ are isomorphic if and only
if there exists an arrow $a \xrightarrow[]{f} b$ and an arrow
$b \xrightarrow[]{f^{-1}} a$ such that $f \circ f^{-1} = id_b$ and
$f^{-1} \circ f = id_a$. (This is often written as $a \cong b$)
:::

:::info[definition]
A Monomorphism in a category $\mathcal{C}$ is an arrow $x$ from
$a \xrightarrow[]{x} b$, such that for every $c$ and arrows
$c \xrightarrow[]{f} a$ and $c \xrightarrow[]{g} a$. $$\begin{tikzcd}
    c & a & b
    \arrow["f", shift left, from=1-1, to=1-2]
    \arrow["g"', shift right, from=1-1, to=1-2]
    \arrow["x", from=1-2, to=1-3]
\end{tikzcd}$$

Then $x \circ f = x \circ g$ if and only if $f=g$. These are important
enough that if $f$ is a monomorphism it is drawn like: $$\begin{tikzcd}
    a & b
    \arrow["x", tail, from=1-1, to=1-2]
\end{tikzcd}$$
:::

:::info[definition]
This is just the dual of a monomorphism, namely an arrow
$a \xrightarrow[]{x} b$, such that for every $b \xrightarrow[]{f} c$ and
$b \xrightarrow[]{g} c$. $$\begin{tikzcd}
    a & b & c
    \arrow["x", two heads, from=1-1, to=1-2]
    \arrow["f", shift left, from=1-2, to=1-3]
    \arrow["g"', shift right, from=1-2, to=1-3]
\end{tikzcd}$$ Then $f \circ x = g \circ x$ if and only if $f=g$.
:::

We can think of monomorphisms as categorical generalization of an
\"injective function\". (And likewise epimorphisms as categorical
generalizations of a \"surjective function\").

:::info[definition]*
A preorder $\mathbb{X}$ is a set with a relation $a \rightsquigarrow b$,
that satisfies

1.  For all $a \in \mathbb{X}$ then $a \rightsquigarrow a$.

2.  If $a \rightsquigarrow b$ and $b \rightsquigarrow c$, then
    $a \rightsquigarrow c$

We say that $a \cong b$ if and only if $a \rightsquigarrow b$ and
$b \rightsquigarrow a$
:::

:::info[definition]*
A partial order is a preorder where $a \cong b$ if and only if $a=b$
:::

:::info[definition]*
A Preorder is either

-   A category with the special property that for any 2 arrows between
    identical objects, $a \xrightarrow{f} b$ and $a \xrightarrow{g} b$,
    then $g=f$.

-   A category where there is either one or zero arrows between any two
    objects. (This is referred to as a category \"enriched\" over
    $\{\mathbb{0},\mathbb{1}\}$, a exact definition is given later.)
:::

## Exercises

:::note[Exercise]
Is a partial order just a skeletal preorder?

Short answer, yes. I will take a look at each of the three definitions
of preorder given above. First is the set theoretic one, where a
preorder $P$ on a set $\mathbb{X}$ is a set
$P \subseteq \mathbb{X} \times \mathbb{X}$ s.t
$((a,b) \in P \land (b,c) \in P)\Rightarrow (a,c) \in P$ and
$\forall a (a \in \mathbb{X} \Rightarrow (a,a) \in P)$. We may write
$a \rightsquigarrow b$ whenever $(a,b) \in P$.

Furthermore, if for $a,b \in \mathbb{X}$ it is the case that
$(a \rightsquigarrow b) \land (b \rightsquigarrow a)$ then we write
$a \cong b$.

A partial order $P'$ on a set $\mathbb{X}$ is a preorder with the
additional property that for all
$a,b \in \mathbb{X},  a\cong b \iff a = b$.[^1] This makes our ears perk
up, as a skeltal category $C$ is a category in which two objects are
isomorphic iff they're equal.
:::

:::note[Exercise]
1.  Show that $id_a$ is unique, aka if there are two arrows
    $a \xrightarrow[]{f} a$ and $a \xrightarrow[]{g} a$ where both
    satisfy the properties of the identity arrow, namely:
    $$\begin{tikzcd}
                a && b \\
                a & b & a & a
                \arrow["x", from=2-2, to=2-1]
                \arrow["{id_a}", from=2-1, to=1-1]
                \arrow["x"', from=2-2, to=1-1]
                \arrow["{id_a}", from=2-4, to=2-3]
                \arrow["y"', from=2-4, to=1-3]
                \arrow["y", from=2-3, to=1-3]
            \end{tikzcd}$$ Show that $f=g$

2.  Assuming that there exists some arrow $a \xrightarrow[]{y} a$ such
    that $F(y)=id_{F(a)}$ show that $F(id_a)=id_{F(a)}$ using only the
    fact that $F(f \circ g)= F(f) \circ F(g)$.
:::

:::danger[Answer]
1.  Consider our two arrows $f,g$ that satisfy the properties of an
    identity arrow. Now using the fact that $f$ is an identity arrow we
    have $f \circ g=g$, and since $g$ is an identity arrow we have
    $f \circ g =f$. Therefore $g=f$

2.  Consider that $$\begin{aligned}
                F(y \circ id_a) &= F(y)\\
                F(y \circ id_a) &= id_{F(a)}\\
                F(y) \circ F(id_a) &= id_{F(a)}\\
                id_{F(a)} \circ F(id_a) &= id_{F(a)}\\
                F(id_a) &= id_{F(a)}
            
    \end{aligned}$$
:::

:::note[Exercise]
Prove that if an arrow is an isomorphism it is also a monomorphism and
an epimorphism.

:::note[Proof]
*Proof.* Let $\mathcal{C}$ be a category and suppose that
$a,b, \text{ and }c$ are objects in $\mathcal{C}$. Let $x \in Hom(a,b)$
be an isomorphism and suppose that $f,g \in Hom(b,c)$ for some object
$c$ like so

$$\begin{tikzcd}
            a && b && c
            \arrow["g"', shift right=2, from=1-3, to=1-5]
            \arrow["f", shift left=2, from=1-3, to=1-5]
            \arrow["x", from=1-1, to=1-3]
        \end{tikzcd}$$

I aim to show that $x$ is an epimorphism. Toward this end, suppose that
$f \circ x = g\circ x$ and note that since $x$ is an isomorphism there
exists an arrow $x^{-1} \in Hom(b,a)$[^2] such that
$x^{-1} \circ x = id_a$ and $x \circ x^{-1} = id_b$. Now,

$$\begin{aligned}
        f \circ x &= g\circ x \\
        f \circ x \circ x^{-1} &= g \circ x \circ x^{-1} \\
        f \circ id_b &= g\circ id_b \quad  \\ 
        f &= g \quad 
        
\end{aligned}$$

Conversely, if $f = g$ then

$$\begin{aligned}
        f \circ id_b &= g\circ id_b \quad  \\ 
        f \circ x \circ x^{-1} &= g \circ x \circ x^{-1}\quad  \\ 
        f \circ x \circ x^{-1} \circ x &= g \circ x \circ x^{-1} \circ x \\
        f \circ x \circ id_a &= g\circ x \circ id_a  \\
        f \circ x &= g\circ x 
        
\end{aligned}$$

Hence, $x$ is an epimorphism.

To see that $x$ a monomorphism, suppose that $k, l \in Hom(c,a)$ like so

$$\begin{tikzcd}
           c && a && b
           \arrow["l"', shift right=2, from=1-1, to=1-3]
           \arrow["k", shift left=2, from=1-1, to=1-3]
           \arrow["x", from=1-3, to=1-5]
        \end{tikzcd}$$

and suppose that that $x\circ k = x \circ l$. Then

$$\begin{aligned}
        x^{-1} \circ x\circ k &=  x^{-1} \circ x\circ l \\ 
        id_a \circ k &= id_a \circ l \\
        k &= l
        
\end{aligned}$$

Conversely, if $k = l$ then

$$\begin{aligned}
        id_a \circ k & = id_a \circ l \\
        x^{-1} \circ x \circ k & = x^{-1} \circ x \circ l \\
        x \circ x^{-1} \circ x \circ k & = x\circ x^{-1} \circ x \circ l \\
        id_b \circ x \circ k & = id_b \circ x \circ l \\
        x \circ k & =  x \circ l
        
\end{aligned}$$

Hence, $x$ is monic. ◻
:::
:::

[^1]: I will assume that the meaning of '=' will vary depending upon the
    context.

[^2]: Is it always the case that arrows in a category comprise a set? -
    Jeremy
