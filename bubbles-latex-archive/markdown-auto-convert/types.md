# Types

Write notes on what it means for proofs to be equal

:::tip[Theorem]
In a category $\mathcal{C}$ two objects $a,b$ are isomorphic if and only
if for every object $x \in \mathcal{C}$ then $$\begin{aligned}
        a \cong b \text{ if and only if } Hom(a,x) \cong Hom(b,x) 
    
\end{aligned}$$ Aka $Hom(a,x)$ and $Hom(b,x)$ have the same cardinality
alternatively going the other direction: $$\begin{aligned}
        a \cong b \text{ if and only if } Hom(x,a) \cong Hom(x,b)
    
\end{aligned}$$ This can be proved by applying yoneda's lemma to the
opposite category.
:::

:::danger[Useful Lie]
The category $Lean$ consists of:

1.  Objects being propositions/types in the Lean programming language

2.  Arrows between objects $A \rightarrow B$ are \"unique\" proofs that
    take in an instance of a hypothesis, $hyp :: A$ and construct a
    instance of type $B$.

With composition given by inlining proofs, and identity proofs given by
'rfl' or 'exact hyp'.
:::

:::info[definition]
A terminal object in a category $\mathcal{C}$ is an object $\mathbb{1}$
such that for every object $x \in \mathcal{C}$ there is exactly one
arrow from $x \rightarrow \mathbb{1}$
:::

:::info[example]
The terminal object in Lean is the trivially true proposition
**True**.[^1]
:::

:::info[definition]
A terminal object in a category $\mathcal{C}$ is an object $\mathbb{0}$
such that for every object $x \in \mathcal{C}$ there is exactly one
arrow from $\mathbb{0} \rightarrow x$
:::

:::info[example]
The initial object in Lean is the false proposition **False**.[^2]
:::

:::info[definition]
A Product of objects $a,b$ in a category, written as $a \times b$, is an
object with 2 arrows $fst: a\times b \rightarrow a$ and
$snd: a \times b \rightarrow b$. Such that for any $c \in \mathcal{C}$
and any pair of arrows $X_{fst}: c \rightarrow a$ and
$X_{snd}: c \rightarrow b$, there exists a unique arrow
$X: c \rightarrow a \times b$ such that $$\begin{aligned}
        X_{fst}&= X \circ fst\\
        X_{snd}&= X \circ snd
    
\end{aligned}$$ Described using a commutative diagram like so:
$$\begin{tikzcd}
        & c \\
        a & {a\times b} & b
        \arrow["{fst}", from=2-2, to=2-1]
        \arrow["{snd}"', from=2-2, to=2-3]
        \arrow["{\langle f,g \rangle}"{description}, from=1-2, to=2-2]
        \arrow["f"', from=1-2, to=2-1]
        \arrow["g", from=1-2, to=2-3]
    \end{tikzcd}$$ Alternatively looking at from the perspective of
yoneda's lemma, we have that the product $a \times b$ is the unique
object such that for every object $c \in \mathcal{C}$ $$\begin{aligned}
        |Hom(c, a \times b)|= |Hom(c,a)| \times |Hom(c,b)|
    
\end{aligned}$$
:::

:::info[example]
Fill in the logical tactics for making and eliminating $a \wedge b$ in
lean and throw them here and show how they match up exactly with the
categorical definition
:::

When using this notation of $X = \langle X_{fst}, X_{snd}\rangle$ is
common in the space.

This opens us up to the proof method called \"diagram chasing\" that
will be important skill for the following exercises

:::tip[Theorem]
In any category the product is associative,
$A \times (B \times C) \cong (A \times B)\times C$
:::

:::note[Proof]
*Proof.* Turns out this is fucking hard - Nicole

I'll give it a shot - Jeremy

Recall that by yoneda's lemma two objects $a, b$ in a category $C$ are
isomorphic iff $Hom(a,x) \cong Hom(b,x)$.

we have that the product $a \times b$ is the unique object such that for
every object $x \in \mathcal{C}$ $$\begin{aligned}
        |Hom(x, a \times b)|= |Hom(x,a)| \times |Hom(x,b)|
    
\end{aligned}$$

This means that
$|Hom(x,A \times(  B \times C)| = |Hom(x,A)| \times |Hom(x,B \times C)| = |Hom(x,A)| \times|Hom(x, B)| \times |Hom(x,C)|$
and
$|Hom(x, (A \times B)\times C)| = |Hom(x, A \times B)|\times|Hom(x, C)| = |Hom(x,A)|\times|Hom(x, B)|\times|Hom(x, C)|$

So by yoneda's lemma the products are isomorphic.

That for any $x \in C$ then $$\begin{aligned}
       |Hom(x, (a\times b)\times c) | = |Hom(x, a \times (b\times c))|
   
\end{aligned}$$ and by yoneda's lemma
$(a \times b)\times c = a \times (b \times c)$ ◻
:::

:::info[definition]
A Sum of objects $a,b$ in a category, written as $a + b$, is an object
with 2 arrows $left: a \rightarrow a+b$ and $right: b \rightarrow a+b$.
Such that for any $c \in \mathcal{C}$ and any pair of proofs
$X_{left}: a \rightarrow c$ and $X_{right}: b \rightarrow c$, there
exists a unique proof $X: a+b \rightarrow c$ such that $$\begin{aligned}
        X_{left}&= left \circ X\\
        X_{right}&= right \circ X
    
\end{aligned}$$ $$\begin{tikzcd}
    & c \\
    a & {a+ b} & b
    \arrow["right"', from=2-1, to=2-2]
    \arrow["left", from=2-3, to=2-2]
    \arrow["{{( f,g )}}"{description}, from=2-2, to=1-2]
    \arrow["f", from=2-1, to=1-2]
    \arrow["g"', from=2-3, to=1-2]
\end{tikzcd}$$ Alternatively looking at from the perspective of yoneda's
lemma, we have that the product $a + b$ is the unique object such that
for every object $c \in \mathcal{C}$ $$\begin{aligned}
        |Hom(a + b,c)|= |Hom(a,c)| \times |Hom(b,c)|
    
\end{aligned}$$
:::

:::info[example]
Fill in the logical tactics for making and eliminating $a \vee b$ in
lean and throw them here and show how they match up exactly with the
categorical definition. (Specifically note the 'left' and 'right'
tactics, and the fact that (or) can only be proved using the cases
tactic breaking it into 2 proofs)
:::

Note that in mathematics it seems that proofs of statements like the
following contradict this

:::tip[Lemma]
Either $e+\pi$ or $e \cdot \pi$ is trancendental. (In classical logic)
:::

:::note[Proof]
*Proof.* We first assume that $e + \pi$ and $e \cdot \pi$ are algebraic
and strive for a contradiction. If they both are algebraic, then since
any polynomial with algebraic coefficients must have algebraic roots
this polynomial must have algebraic roots: $$\begin{aligned}
        x^2-2(e+\pi)+e\cdot \pi &= (x-e)(x-\pi)
    
\end{aligned}$$ But $e$ and $\pi$ are trancendental thus creating a
contradiction. ◻
:::

So what went wrong here, reminder that the proposition ($x$ is
trancendental) is definitionally equal to
$\neg (x \text{ algebraic})=\neg (x \text{ is the root of a polynomial with rational coefficents})$.
So reminder the structure of our proof goes like

$$\begin{aligned}
    (e+\pi \text{ alebraic}) \wedge (e \cdot \pi \text{ algebraic}) \rightarrow \textbf{False}= \neg((e+\pi \text{ alebraic}) \wedge (e \cdot \pi \text{ algebraic})
\end{aligned}$$) but notice we need to use the law of excluded middle to
get to
$\neg(e+\pi \text{ alebraic}) \wedge \neg (e \cdot \pi \text{ algebraic})$
since de-morgan's laws for propositions require the law of excluded
middle.

:::info[definition]
A Sum of objects $a,b$ in a category, written as $b^a$ or
$a \Rightarrow b$, is an object with one special arrow
$eval: b^a \times a \rightarrow b$ such that for every object $c$, and
arrow $X: c \times a \rightarrow b$, there exists a unique arrow
$\lambda_X:c \rightarrow b^a$. Such that when considering the arrow
$c \times a \xrightarrow{\langle \lambda_X, id_a \rangle} b^a \times a$,
$$\begin{aligned}
        X&= eval \circ \langle \lambda_X, id_a \rangle
    
\end{aligned}$$ $$\begin{tikzcd}
    c & {c\times a} \\
    {b^a} & {b^a \times a} & b
    \arrow["X", from=1-2, to=2-3]
    \arrow["{\lambda_X}"', dashed, from=1-1, to=2-1]
    \arrow["{\langle \lambda_X, id_a \rangle}"{description}, dotted, from=1-2, to=2-2]
    \arrow["eval"', from=2-2, to=2-3]
\end{tikzcd}$$ Another way of stating this is that for any $c$ in our
category we want the following hom-sets to be equivalent
$$\begin{aligned}
        \hom(a\times c, b) \cong \hom(c, b^a)
    
\end{aligned}$$ This is conceptually equivalent to saying that the
exponential function of $a,b,c$ should respect
$b^{a \times c }= (b^a)^c$
:::

:::info[example]
Implications, with intro being equivalent to eval.
:::

:::info[definition]
A Category $\mathcal{C}$ is Cartesian if and only if it has

1.  A Terminal Object

2.  All Products

(Under some definitions it needs constructions called equalizers that
have not been relevant to course materials so far.)
:::

:::info[definition]
A Category $\mathcal{C}$ is Cartesian Closed if and only if it has

1.  A Terminal Object

2.  All Products

3.  All Exponentials
:::

:::info[example]
The following categories are cartesian closed:

1.  The category $Set$, and the category of finite sets $FinSet$

2.  The category of abelian groups $Ab$

3.  The singleton category $\mathbb{1}$ with 1 object and an identity
    morphism

4.  The category of \"nice\" topological spaces $CGWH$

In addition the following categories are cartesian without being closed
(aka, they dont have exponentials)

1.  The category $Grp$ of groups and group homomorphisms.

2.  The category $Vect_\mathbb{F}$ of vector spaces over a field
    $\mathbb{F}$ and linear transformations.

3.  The category $Ring$ of rings and ring homomorphisms.

4.  The category $Top$ of topological spaces and continuous functions.

5.  The category $Rel$[^3] of sets and relations between sets.

(All of the examples listed here also have all sums/coproducts.)
:::

(Stolen from Nlab)

:::danger[Useful Lie]
The basic ideas of the internal logic induced by a given category
$\mathcal{C}$ are:

1.  the objects $A$ of $\mathcal{C}$ are regarded as collections of
    things of a given type $A$

2.  the morphisms $A\to B$ of $\mathcal{C}$ are regarded as terms of
    type $B$ containing a free variable of type $A$ (i.e. in a context
    $x:A$)

3.  a subobject $\phi \hookrightarrow A$ is regarded as a proposition
    (predicate): by thinking of it as the sub-collection of all those
    things of type $A$ for which the statement $\phi$ is true

    1.  the maximal subobject is hence the proposition that is always
        true; this is the logical object of truth
        $\textbf{True} \hookrightarrow A$

    2.  the minimal subobject is hence the proposition that is always
        false; this is the logical object of falsity
        $\textbf{False} \hookrightarrow A$

    3.  one proposition implication\|implies another if as subobjects of
        $A$ they are connected by a morphism in the poset of subobjects:
        $\phi \Rightarrow \psi$ means $\phi \hookrightarrow \psi$

4.  Logical operations are implemented by universal constructions on
    subobjects.

    1.  the conjunction and is the product of subobjects (their meet)

    2.  the conjunction or is the Sum of subobjects (their join)

and so on.
:::

### Exercises

:::note[Exercise]
Consider for a category $\mathcal{C}$ the category $Op(\mathcal{C})$
where every arrow in $\mathcal{C}$ is reversed, show that

1.  The object $\mathbb{1} \in \mathcal{C}$ corresponds to
    $\mathbb{0}\in Op(\mathcal{C})$

    :::note[Proof]
    *Proof.* The terminal object $\mathbb{1} \in \mathcal{(C)}$
    satisfies that for all $x \in (\mathcal{C})$, there is exactly one
    arrow from $x \rightarrow \mathbb{1}$. This means that in for all
    $x \in Op (\mathcal{C})$, there is exactly one arrow from
    $\mathbb{1} \rightarrow x$; i.e., $\mathbb{1}$ (terminal object) in
    $(\mathcal{C})$ is $\mathbb{0}$ (initial) in $Op(\mathcal{C})$. ◻
    :::

2.  The object $a \times b \in (\mathcal{C})$ corresponds to
    $a+b \in Op(\mathcal{(C)})$

    :::note[Proof]
    *Proof.* One way of solving this is to look at the diagrams that
    define product/sum and note they are identical except that the
    arrows go in the opposite direction. To nail the definitions into my
    brain I will also prove why this is true from the non-diagram defs
    of product/ sum.

    Suppose that $a \times b$ is a product in a category $\mathcal{C}$.
    Then There exist arrows $fst: a\times b \rightarrow a$ and
    $snd: a\times b \rightarrow b$ such that for any object $c$ in
    $\mathcal{C}$ and any arrows $X_{fst}: c \rightarrow a$ and
    $X_{snd}: c \rightarrow b$ there is a unique arrow
    $X: c \rightarrow a \times b$ satisfying

    $$X_{fst} = fst \circ X \text{ and } X_{snd} = snd \circ X$$

    Note this gives me exactly the forllowing commutative diagram:

    Notice this means that in $Op(\mathcal{C})$, given the same object
    $a \times b$ there exist arrows $fst: a \rightarrow a\times b$ and
    $snd: b \rightarrow a\times b$ such that for any object $c$ in
    $Op(\mathcal{C})$ and any arrows $X_{fst}: a \rightarrow c$ and
    $X_{snd}: a \rightarrow c$ there is a unique arrow
    $X: a \times b \rightarrow c$ with

    $$X_{fst} = X \circ fst \text{ and } X_{snd} = X \circ snd \quad \quad (\text{As composition will necessarily switch directions in $Op(\mathcal{C})$}).$$

    Note that this paragraph style description corresponds exactly to
    the following commutative diagram, which defines **sum:**

    \*\*Note: wont compile when I use quiver\*\*\*

    This means that $a\times b$ is $a + b$ in $Op(\mathcal{C})$

    $$\begin{tikzcd}
                    & c \\
                    b & {a \times b} & b
                    \arrow["snd", from=2-3, to=2-2]
                    \arrow["fst"', from=2-1, to=2-2]
                    \arrow["X"', from=2-2, to=1-2]
                    \arrow["{X_{fst}}", from=2-1, to=1-2]
                    \arrow["{X_{snd}}"', from=2-3, to=1-2]
                \end{tikzcd}$$ ◻
    :::
:::

:::note[Exercise]
If a category has 2 terminal objects $\mathbb{1}_x$ and $\mathbb{1}_y$
prove that $\mathbb{1}_x \cong \mathbb{1}_y$

:::note[Proof]
*Proof.* By def. terminal object there exists exactly one arrow
$f: \mathbb{1}_x \rightarrow \mathbb{1}_y$ and exactly one arrow
$g: \mathbb{1}_y \rightarrow \mathbb{1}_x$. Note also that by the
category axioms $\mathbb{1_{x}}$ and $\mathbb{1_{y}}$ have identities
$id_{\mathbb{1}_x}$ and $id_{\mathbb{1}_y}$. Also by the definition of
terminal object, no other arrows besides these identities belong to
$Hom(\mathbb{1}_x, \mathbb{1}_x)$ or $Hom(\mathbb{1}_y, \mathbb{1}_y)$.
Hence, since $g\circ f \in Hom(\mathbb{1}_x, \mathbb{1}_x)$ and
$f\circ g \in Hom(\mathbb{1}_y, \mathbb{1}_y)$, it follows that
$g \circ f = id_{\mathbb{1}_x}$ and $g \circ f = id_{\mathbb{1}_y}$.

Thus, $\mathbb{1}_x \cong \mathbb{1}_y$. ◻
:::

The proposition is also a consequece of yonedas lemma since
$Hom(\mathbb{1_{x}}, c)$ and $Hom(\mathbb{1_{y}}, c)$ will be
equinumerous for any object $c$ in the category. (In particular
$|Hom(\mathbb{1_{y}}, c)| = |Hom(\mathbb{1_{x}}, c)| = 1$ )
:::

:::note[Exercise]
Show that for any 2 objects $a,b$ if there are two objects
$(a\times b)_x$ and $(a \times b)_y$ that satisfy the definition of a
product, show that $(a \times b)_x \cong (a \times b)_y$.
:::

:::danger[Answer]
There are two proofs for this, one using yoneda's lemma and one not
using yonedas lemma

:::note[Proof]
*Proof w/ Yoneda.* Consider that 2 objects $(a \times b)_x$ and
$(a \times b)_y$ are isomorphic if and only if for every object $c$ then
the cardinality of the homesets
$|Hom(c, (a\times b)_x)|=|Hom(c, (a\times b)_y)|$ are equal, however by
the definition of the product we have that the set of arrows
$Hom(c, (a\times b)_x)$ exactly consists of a pair of arrows from
$Hom(c,a)$ and $Hom(c,b)$ or alternatively $$\begin{aligned}
            |Hom(c, (a\times b)_x)| = |Hom(c,a)| \times |Hom(c,b)|=|Hom(c, (a\times b)_y)|
        
\end{aligned}$$ So by yoneda's lemma they are isomorphic. ◻
:::

:::note[Proof]
*Proof w/o Yoneda.* Consider that for this to be the case the following
ommutative diagrams must always be satisfied for both $(a\times b)x$ and
$(a \times b)_y$ by their definition as products.

$$\begin{tikzcd}
    & c \\
    a & {(a\times b)_x} & b
    \arrow["{fst_x}", from=2-2, to=2-1]
    \arrow["{snd_x}"', from=2-2, to=2-3]
    \arrow["{\langle f,g \rangle}_x"{description}, from=1-2, to=2-2]
    \arrow["f"', from=1-2, to=2-1]
    \arrow["g", from=1-2, to=2-3]
\end{tikzcd}$$ Now we must show that for any product $(a\times b)_x$
then $\langle fst_x , snd_x \rangle_x =id_{(a\times b)x}$. Remember by
definition of $\langle f,g\rangle_x$ we have $$\begin{aligned}
    fst_x \circ \langle f,g\rangle_x &= f\\
    snd_x \circ \langle f,g\rangle_x &= g
\end{aligned}$$ We know that every arrow
$(a\times b)_x \rightarrow (a \times b)_x$ can be decomposed this way.
However remember the identity arrow always satisfies $$\begin{aligned}
    fst_x \circ id_{(a\times b)x} &= fst_x\\
    snd_x \circ id_{(a\times b)x} &= snd_x 
\end{aligned}$$ But by definition of $\langle f ,g \rangle _x$ the only
arrow that satisfies this must be $\langle fst_x, snd_x \rangle$ so
therefore $\langle fst_x , snd_x \rangle_x =id_{(a\times b)_x}$

Now to complete our proof we consider the following commutative diagram
$$\begin{tikzcd}
    && {(a\times b)_y} \\
    \\
    a && {(a \times b)_x} && b \\
    \\
    && {(a \times b)_y}
    \arrow["{fst_y}"', from=1-3, to=3-1]
    \arrow["{snd_y}", from=1-3, to=3-5]
    \arrow["{\langle fst_y,snd_y \rangle_x}"{description}, from=1-3, to=3-3]
    \arrow["{fst_x}"{description}, from=3-3, to=3-1]
    \arrow["{snd_x}"{description}, from=3-3, to=3-5]
    \arrow["{\langle fst_x, fst_x \rangle _y}"{description}, from=3-3, to=5-3]
    \arrow["{snd_y}"', from=5-3, to=3-5]
    \arrow["{fst_y}", from=5-3, to=3-1]
\end{tikzcd}$$ Notice at the end we have that $$\begin{aligned}
    \langle fst_x, fst_x \rangle _y \circ \langle fst_y,snd_y \rangle_x \circ fst_y = fst_y\\
    \langle fst_x, fst_x \rangle _y \circ \langle fst_y,snd_y \rangle_x \circ snd_y = snd_y
\end{aligned}$$ Therefore we have

$$\begin{aligned}
    \langle fst_x, fst_x \rangle _y \circ \langle fst_y,snd_y \rangle_x = \langle fst_y,snd_y \rangle_y
\end{aligned}$$

However from earlier we know that
$\langle fst_y,snd_y \rangle_y = id_{(a \times b)_y}$. Thus we have an
arrow
$(a \times b)_y \xrightarrow[]{\langle fst_y,snd_y \rangle_x} (a \times b)_x$
and an arrow
$(a \times b)_x \xrightarrow[]{\langle fst_x,snd_x \rangle_y} (a \times b)_y$,
such that their composition is the identity element. (An argument
substituting $x$ for $y$ proves that the other direction is the
identity). Thus we have shown that
$(a \times b)_y \cong (a \times b)_x$ ◻
:::
:::

:::note[Exercise]
Show that: $\mathbb{1} \times a \cong a$

:::note[Proof]
*Proof.* Consider that by the def of product the following diagram
commutes, meaning that any two paths between objects are equal (i.e.,
the arrows formed via composition that correspond to these "paths" are
equal).

$$\begin{tikzcd}
    & b \\
    1 & {\mathbb{1} \times a} & a
    \arrow["f"{description}, from=2-2, to=2-3]
    \arrow["g"{description}, from=2-2, to=2-1]
    \arrow["{x_f}"', from=2-3, to=1-2]
    \arrow["{x_g}", from=2-1, to=1-2]
    \arrow["x"{description}, dotted, from=1-2, to=2-2]
\end{tikzcd}$$

Cconsider the arrows $f: \mathbb{1} \times a \rightarrow a$ and
$x\circ x_f\circ id_a: a \rightarrow \mathbb{1} \times a$. Now since the
diagram commutes we have that
$(x\circ x_f\circ id_a) \circ f = id_{\mathbb{1} \times a}$. Similarly,
$f \circ (x\circ x_f\circ id_a) = id_{a}$. Hence,
$\mathbb{1} \times a \cong a$. ◻
:::
:::

:::danger[Answer]
Consider the following diagram $$\begin{tikzcd}
    & a \\
    \mathbb1 & {\mathbb1\times a} & a
    \arrow["{id_a}", from=1-2, to=2-3]
    \arrow["{!}"', from=1-2, to=2-1]
    \arrow["fst", from=2-2, to=2-1]
    \arrow["snd"', from=2-2, to=2-3]
    \arrow["{\langle !,id_a\rangle}"{description}, from=1-2, to=2-2]
\end{tikzcd}$$

Since it is commutative we have that
$\langle !,id_a\rangle \gg snd = id_a$. We now want to show that
$snd \gg \langle !, id_a \rangle = id_{\mathbb{1}\times a}$. This can be
done using the uniqueness of the arrow $!$ since $\langle !,id_a\rangle$
is the only arrow in $Hom(a,\mathbb{1} \times a)$ such that
$\langle !,id_a\rangle \gg snd = id_a$
:::

:::note[Exercise]
Use the last 4 exercises to argue using the opposite category that

1.  For any initial objects $\mathbb{0}_x$ and $\mathbb{0}_y$ prove that
    $\mathbb{0}_x \cong \mathbb{0}_y$

    :::note[Proof]
    *Proof.* Note that if two objects $a,b \in \mathcal{C}$ are
    isomorphic then their corresponding objects in $Op(\mathcal{C})$
    will be isomorphic. To see, this, note that if $a$ and $b$ are
    isomorphic there exist arrows $f: a\rightarrow b$ and
    $f^{-1}: b \rightarrow a$ such that for any arrow
    $g: a \rightarrow b$ the following obtains:[^4]

    $$\begin{tikzcd}
                a & a & b & b
                \arrow["{f^{-1}\circ f}"', curve={height=6pt}, from=1-1, to=1-2]
                \arrow["g"', curve={height=6pt}, from=1-2, to=1-3]
                \arrow["{f\circ f^{-1}}"', curve={height=6pt}, from=1-3, to=1-4]
                \arrow["g", curve={height=-6pt}, from=1-1, to=1-3]
                \arrow["g", curve={height=-6pt}, from=1-2, to=1-4]
            \end{tikzcd}$$

    It follows that for the corresponding objects $a_o$ and $b_o$ in
    $Op(\mathcal{C})$ the same arrows reverse direction so that the
    following holds:

    $$\begin{tikzcd}
                    {a_o} & {a_o} & {b_o} & {b_o}
                    \arrow["{f^{-1}\circ f}", curve={height=-6pt}, from=1-2, to=1-1]
                    \arrow["g", curve={height=-6pt}, from=1-3, to=1-2]
                    \arrow["{f\circ f^{-1}}", curve={height=-6pt}, from=1-4, to=1-3]
                    \arrow["g"', curve={height=6pt}, from=1-3, to=1-1]
                    \arrow["g"', curve={height=6pt}, from=1-4, to=1-2]
                \end{tikzcd}$$

    That is, $f^{-1}\circ f = id_{a_{o}}$ and
    $f \circ f^{-1} = id_{b_{o}}$; i.e., $a_o \cong b_o$

    We know that $\mathbb{1}_x$ and $\mathbb{1}_y$ in $\mathcal{C}$
    correspond to $\mathbb{0}_x \text{ and } \mathbb{0}_y$ by exercise
    4.1. Since $\mathbb{1}_x \cong \mathbb{1}_y$ by exercise 4.2 it
    follows that $\mathbb{0}_x \cong \mathbb{0}_x$. ◻
    :::

2.  For any 2 objects $a,b$ if there are two objects $(a\times b)_x$ and
    $(a \times b)_y$ that satisfy the definition of a product, show that
    $(a + b)_x \cong (a + b)_y$.

    :::note[Proof]
    *Proof.* By exercise 4.1 $(a\times b)_x$ and $(a \times b)_y$ in
    $\mathcal{C}$ correspond to $(a+ b)_x$ and $(a + b)_y$ in
    $Op(\mathcal{C})$. Since $(a\times b)_x \cong (a\times b)_y$ by
    exercise 4.3, then by the argument from part a) that if two objects
    in a category are isomorphic, then so are their corresponding
    objects in the opposite category, it follows that
    $(a + b)_x \cong (a + b)_y$. ◻
    :::

3.  $\mathbb{0} + a_o \cong a_o$

    :::note[Proof]
    *Proof.* Since by exercise 4.4, we have that
    $\mathbb{1} \times a \cong a$ in $\mathcal{C}$, and we already know
    that $a$ in $\mathcal{C}$ corresponds to $a_o$ in $Op(\mathcal{C})$,
    we just need show that $\mathbb{1} \times a$ corresponds to
    $\mathbb{0} + a_o$ is the opposite category (as if two objects in a
    category are isomorphic then so are their corresponding objects in
    the opposite category). Since terminal objects correspond initial
    objects in the opposite category and products correspond to sums in
    the opposite category, then the former obtains. ◻
    :::
:::

:::note[Exercise]
In the category $Set$, given a set $G$, and 3 functions
$G \times G \xrightarrow[]{\star} G$, $\mathbb{1} \xrightarrow[]{e} G$
and $G \xrightarrow[]{inv} G$, what do the following commutative
diagrams define? $$\begin{tikzcd}
    {G \times G \times G} && {G \times G} \\
    {G\times G} && G
    \arrow["{\star \times id_G }"', from=1-1, to=2-1]
    \arrow["{id_G \times  \star}", from=1-1, to=1-3]
    \arrow["\star"', from=2-1, to=2-3]
    \arrow["\star", from=1-3, to=2-3]
\end{tikzcd}$$

I believe this diagram shows the associativity of the binary operation
$\star$. It says that given $a, b, c \in G$, then
$(a,b,c)\xmapsto{\star \times id_G} ((a \star b), c) \xmapsto{\star} (a\star b) \star c$
and
$(a,b,c) \xmapsto{id_G \times \star} (a,(b\star c)) \xmapsto{\star} a \star (b\star c)$.
Since the diagram commutes, this means that the functions
$(\star \times id_G) \circ \star \text{ and } (id_G \times \star)\circ \star$
are equal; meaning their outputs are the same; i.e.,
$(a\star b) \star c =  a \star (b\star c)$.

Great job -- Nicole $$\begin{tikzcd}
    {G\times G} & {1\times G} \\
    {G \times \mathbb{1}} & G
    \arrow["fst"', from=2-1, to=2-2]
    \arrow["{{ id_G \times  e }}", from=2-1, to=1-1]
    \arrow["\star"{description}, from=1-1, to=2-2]
    \arrow["snd", from=1-2, to=2-2]
    \arrow["{e \times id_G}"', from=1-2, to=1-1]
\end{tikzcd}$$

I believe that this diagram corresponds to the commutativity (not what
that word means, commutativity means $a \star b = b \star a$) of the
binary operation $\star$.

Note that in $Set$ $\mathbb{1}$ must belong to the class of singletons,
say $\mathbb{1} = \{x\}$ for some set $x$. Let $a,b \in G$. The diagram
commutes so that the functions $\star\circ (id_G \times e)$ and
$\star\circ (e \times id_G)$ are equal[^5]; i.e., they have the same
outputs. Since

This diagram is a bit confusing I might rework it at some point --Nicole

Specifically since for the definition of the group requires a 2 way
inverse, namely 1\*a=a\*1=a. So this is why this diagram has 2 sides
that seem like they are kinda seperate, there might be a way to rework
this.

$$(a, x) \xmapsto{id_G \times \star} (a,b) \xmapsto{\star} a\star b$$

and

$$(x, a) \xmapsto{e \times id_G} (b,a) \xmapsto {\star} b\star a$$

we have that $a\star b = b\star a$.

$$\begin{tikzcd}
    G && {G \times G} \\
    & {\mathbb{1}} \\
    {G \times G} && G
    \arrow["{{\left \langle inv,id_g \right \rangle}}"', from=1-1, to=3-1]
    \arrow["{{\left \langle id_g, inv \right \rangle}}", from=1-1, to=1-3]
    \arrow["e"{description}, from=2-2, to=3-3]
    \arrow["\star"', from=3-1, to=3-3]
    \arrow["\star", from=1-3, to=3-3]
    \arrow["{!}"{description}, from=1-1, to=2-2]
\end{tikzcd}$$
:::

:::note[Exercise]
Consider in the category of sets, the function that takes in 2 natural
numbers and adds them: $$\begin{aligned}
        \mathbb{N} \times \mathbb{N} \xrightarrow[]{+} \mathbb{N}
    
\end{aligned}$$ By the definition of the exponential we have that there
exists this arrow $\lambda_+$ mapping every natural number, to a
function from naturals to naturals $$\begin{aligned}
        \mathbb{N} \xrightarrow[]{\lambda_+} \mathbb{N}^\mathbb{N}
    
\end{aligned}$$ Create a hypothesis for what the function $\lambda_+$
actually does, and give a rationale for why you think it behaves that
way. (Follow your nose with the definition of the exponential.)
:::

:::danger[Answer]
Consider the def of the exponential object $\mathbb{N}^{\mathbb{N}}$ and
its relation to the object $\mathbb{N}$ in $Set$ (diagram on the left).
Consider also the diagram on the right which shows what happens to
elements in the sets that the arrows on the left operate between (aka
note that below $m,n \in \mathbb{N}$ and
$f \in \mathbb{N}^{\mathbb{N}}$). $$\begin{tikzcd}
    {\mathbb{N}} && {\mathbb{N} \times \mathbb{N}} &&&& {(n, m)} \\
    \\
    {\mathbb{N}^{\mathbb{N}}} && {\mathbb{N}^{\mathbb{N}} \times \mathbb{N}} && {\mathbb{N}} && {(f, m)} && {f(m) = n + m}
    \arrow["{\lambda_+\times id_{\mathbb{N}}}"{description}, dotted, from=1-3, to=3-3]
    \arrow["{\lambda_+}", dashed, from=1-1, to=3-1]
    \arrow["eval"', from=3-3, to=3-5]
    \arrow["{+}", from=1-3, to=3-5]
    \arrow["{\lambda_+\times id_{\mathbb{N}}}"{description}, dashed, maps to, from=1-7, to=3-7]
    \arrow["{+}", maps to, from=1-7, to=3-9]
    \arrow["eval"', maps to, from=3-7, to=3-9]
\end{tikzcd}$$

So $\lambda_+$ maps a number to some function
$f: \mathbb{N}\rightarrow\mathbb{N}$. The question is, which $f$? in
order for the diagram to commute I think we should have something like
$n \xmapsto{\lambda_+} f$ where $f$ is given by $f(m) = n + m$. In other
words $\lambda_+ : \mathbb{N} \rightarrow \mathbb{N}^{\mathbb{N}}$
should be given by such that for $m \in \mathbb{N}$ then
$(\lambda_+(n))(m) = n + m$.

correct!!! -- Nicole
:::

:::note[Exercise]
Show that $\mathbb{1}^a\cong \mathbb{1}$
:::

:::note[Exercise]
Show that $a^\mathbb{1}\cong a$
:::

:::note[Exercise]
Prove $$\begin{aligned}
        a^{b \times c} \cong (a^b)^c
    
\end{aligned}$$
:::

:::note[Exercise]
Using Yoneda's lemma prove in any distributive category, aka one where
$(a+b)\times c \cong a\times c + b \times c$ we have $$\begin{aligned}
        a^{b+c} \cong a^b \times a^c
    
\end{aligned}$$
:::

:::danger[Answer]
:::note[Proof]
*Proof.* Consider that by definition of the exponential we have that
$$\begin{aligned}
            |Hom(x,a^{b+c})| &= |Hom(x \times (b+c),a)|\\
             &= |Hom(x\times b+d \times c,a)| \quad \text{(Distributivity)}\\
             &= |Hom(x\times b,a)| \times |Hom(x \times c,a)| \quad \text{(Def of Sum)}\\
             &= |Hom(x,a^b)| \times |Hom(x,a^c)| \quad \text{(Def of Exp)}\\
             &= |Hom(x,a^b \times a^c)| \quad \text{(Def of Product)}
        
\end{aligned}$$ So by yoneda's lemma we have
$a^{b+c} \cong a^b \times a^c$ ◻
:::
:::

[^1]: I think it would help me to go over this notion that anything
    entails the trivially true proposition - I am realizing that this is
    a concept I have not quite parsed. Also, it would help to relate
    this idea to the natural number game - presumably, since the game is
    written in Lean, it makes use of the trivially true proposition, but
    I'm having trouble thinking of where. Is this what's going on when I
    use metods like 'rfl' or 'exact' to complete a goal?

[^2]: I am realizing this is also not entirely clear to me. Here I think
    of the principle of explosion in ordinary logic. From the
    proposition $p \land \lnot p$ I aim to prove any proposition $q$:

    $$\begin{aligned}
        & (1)\: p\land \lnot p \\
        & (2)\: p \quad \text{ simplification, 1}\\
        & (3)\: p \lor q \quad \text{ addition, 2} \\
        & (4)\: \lnot p  \quad \text{ simplification , 1} \\
        & (5)\: q \quad \text{ disjunctive syllogism, 3 and 4}
    \end{aligned}$$ I guess my question is, is the notion that **False**
    entails anything an axiom or a theorem? It it related to the
    principle of explosion in standard logic? As there are many possible
    contradictions, does this mean that the initial object is not
    unique?

[^3]: At least the 1 category view of $Rel$

[^4]: It occurse to me that I have been reading composition right to
    left. In category theory is this standard, or should I be reading
    composition left to right?

[^5]: I am re-reading this and thinking to myself that they have
    different domains, so can't be equal. So would it be incorrect to
    say the functions are equal? - Jeremy

    Eh kinda, the unfortunate thing about this commutative diagram is
    that you can split it into two equations saying that
