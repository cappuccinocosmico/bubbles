# Categories II:Skeletons, Functors and Equivalences

:::info[definition]*
A Category $C$ is skeletal if 2 objects $a,b$ are isomorphic then
$a =b$, aka $a \cong b \iff a =b$
:::

:::info[definition]*
A Skeleton of a Category $\mathcal{C}$ ($sk(\mathcal{C})$) is a skeletal
category constructed like so:

1.  Taking all objects in $\mathcal{C}$ and defining an equivalence
    relation on objects defined by 2 isomorphisms on those objects.

2.  Create a set $Obj(sk(\mathcal{C}))$ of representatives from each
    equivalence/isomorphism class.

3.  Construct the category $sk(\mathcal{C}$, where the objects are the
    representatives from the equivalence classes, and all the arrows
    between members of $Obj(sk(\mathcal{C}))$ are inherited from
    $\mathcal{C}$
:::

:::info[example]
A skeleton of $FinSet$ is the category $\mathbb{N}$, where the objects
are the natural numbers constructed with peano arithmetic
$(\phi, \{\phi \}, \{\phi,\{\phi\}\})$, and the arrows are standard set
functions.
:::

:::info[definition]*
A Functor $F$ between two categories $A$ and $B$ maps every object
$x \in \mathcal{O}(A)$ to an object $F(x) \in \mathcal{O}(B)$, and maps
every arrow $x \xrightarrow{f} y$ to an arrow
$F(x) \xrightarrow{F(f)} F(y)$ in $B$ in a way that preserves the domain
and codomain. Such that

-   $F(g \circ f)= F(g) \circ F(y)$

-   $F(id_a)=id_{F(a)}$

(You can think of them as the homomorphisms of categories)
:::

:::info[definition]*
For every category $A$ there is a functor $id_A: A \Rightarrow A$ that
for every object $x \in A$ then $id_A(x)=x$ and every function
$x \xrightarrow[]{f} y$ then $id_A(f)=f$

Categories $A$ and $B$ are isomorphic if there is a functor
$F: A \Rightarrow B$ and an inverse functor $F^{-1}: B \Rightarrow A$
such that $F \circ F^{-1}=id_B$ and $F^{-1}\circ F = id_A$
:::

::: adefinition
2 Categories $A$ and $B$ are equivalent if and only if $sk(A)$ is
isomorphic to $sk(B)$
:::

:::tip[Theorem]
Any construction on categories is going to respect the equivalence of
categories.
:::

## Exercises

:::note[Exercise]
Show that functors preserve isomorphisms.

:::note[Proof]
*Proof.* Suppose that between categories $A$ and $B$ there exists a
functor $F: A \rightarrow B$ suppose that for $x,y \in A$ there exists
an isomorphism $f: x \rightarrow y$ with inverse $g: y \rightarrow x$.
Then for arrows $F(f): F(x) \rightarrow F(y)$ and
$F(g): F(y) \rightarrow F(x)$, it is the case that

$$\begin{aligned}
       F(f)\circ F(g) &= F(f\circ g) \quad \text{ def functor} \\ &= F(id_y) \quad \text{ def isomorphism } \\
        &= id_{F(y)} \quad \text{ def functor}.
    
\end{aligned}$$

Likewise,

$$\begin{aligned}
       F(g)\circ F(f) &= F(g\circ f) \quad \text{ def functor} \\ &= F(id_x) \quad \text{ def isomorphism } \\
        &= id_{F(x)} \quad \text{ def functor} 
    
\end{aligned}$$ ◻
:::

Since $F(f)\circ F(g) = id_{F(y)}$ and $F(g)\circ F(f) = id_{F(x)}$ it
follows by def. isomorphism that $F(x) \cong F(y)$.
:::

:::danger[Answer]
Consider a functor $F: \mathrm{C} \rightarrow \mathrm{D}$ and an
isomorphism $f: x \rightarrow y$ in $\mathrm{C}$ with inverse
$g: y \rightarrow x$. Applying the two functoriality axioms:
$$F(g) \circ F(f)=F(g \circ f)=F\left(id_x\right)=id_{F x} .$$ Thus,
$F (y) \xrightarrow{F (g)} F x$ is a left inverse to
$F x \xrightarrow{F (g)} F y$. Exchanging the roles of $f$ and $g$ (or
arguing by duality) shows that $F g$ is also a right inverse.
:::

:::note[Exercise]
Try to construct a functor from Set (The category of sets) into Grp (The
category of Groups) that will map a set to some group, where the
elements of the set will correspond to the generators of the group.
(This will involve picking a group that will allow its generators to be
arbitrarily shuffled around). Hint[^1]
:::

:::note[Exercise]
Consider a group $z$ inside the category of groups (or more generally an
object $z$ inside any category $\mathcal{C}$). Let us define a functor
$Hom(z,\_): \mathcal{C} \rightarrow Set$, that maps an object
$x \in \mathcal{C}$ to the set of homomorphisms/arrows from $z$ to $x$.
And for every homomorphism/arrow $x \xrightarrow[]{f} y$. Corresponds to
a function taking every homomorphism/arrow from $z \xrightarrow[]{g} x$
and mapping it to the arrow $z \xrightarrow[]{f \circ g} y$ like so:
$$\begin{tikzcd}
    z \\
    x & y
    \arrow["g"', from=1-1, to=2-1]
    \arrow["{f \circ g}", from=1-1, to=2-2]
    \arrow["f"', from=2-1, to=2-2]
\end{tikzcd}$$ Show that this functor satisfies the properties of
functors namely $Hom(z,\_)(id_x)= id_{Hom(z,\_)(x)}$ and
$Hom(z,\_)(f \circ g) =Hom(z,\_)(f)  \circ Hom(z,\_)(g)$

:::note[Proof]
*Proof.* ◻
:::
:::

[^1]: The biggest issue is coming up with a group without any structure
    aside from its generators, consider a group with generators
    $\{a,b,c,d\}$ where any string of
    $\{a,a^{-1},b,b^{-1},c,c^{-1},d,d^{-1}\}$, like $abcd^{-1}adb^{-1}$
    is a valid group element, where composition is given by
    concatenation and then canceling inverses that are next to each
    other.
