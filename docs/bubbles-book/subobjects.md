# Subobjects

This is mainly helpful because it can help us generalize the concept of
a subset to other categories, remember that for any subset $A \subset B$
we can define an injective function from $A \rightarrow B$.

::: definition
In a category $C$, a subobject $\varphi$ of $a$ is a monomorphism going
from some object into $a$ $$\begin{tikzcd}
    \text{dom}(\varphi) & a
    \arrow["\varphi", tail, from=1-1, to=1-2]
\end{tikzcd}$$
:::

::: example
A subset is a subobject in the category $Set$, a subgroup is a subobject
in the category $Grp$, a subspace is a subobject in the category
$Vect_\mathbb{R}$
:::

Notice that without subobjects it is impossible to quantify most
mathematical objects, the set of even natural numbers
$\mathbb{N} \xhookrightarrow{f} \mathbb{N}$. [^1] Where we define
$f(n)=2n$.

This also lets us talk generally about propositions on objects
generally, where for any object $a$ the part of $a$ satisfying some
proposition $P$ must be a subobject of $a$.

::: definition
A subobject classifier in a category $\mathcal{C}$ is an object $\Omega$
along with a \"Truth\" arrow
$\mathbb{1} \xrightarrow{\textbf{Truth}} \Omega$. Such that for every
monomorphism $b \xhookrightarrow{\varphi} a$, then their exists a
classification arrow $a \xrightarrow{\Chi_{\varphi}} \Omega$ such that
the following diagram commutes: $$\begin{tikzcd}
    b & {\mathbb{1}} \\
    a & \Omega
    \arrow["\varphi"', tail, from=1-1, to=2-1]
    \arrow["{!}", from=1-1, to=1-2]
    \arrow["{\textbf{Truth}}", from=1-2, to=2-2]
    \arrow["{\chi_{\varphi}}"', from=2-1, to=2-2]
\end{tikzcd}$$ and that when you fix $\chi_{\varphi}$ if you have
another object $c$ with an arrow $c \xrightarrow[]{f} a$, such that
$\chi_{\varphi} \circ f = \textbf{Truth} \circ \text{ }!$ , then there
is a unique function $g$ that makes this diagram commmute
$$\begin{tikzcd}
    c \\
    & b & {\mathbb{1}} \\
    & a & \Omega
    \arrow["\varphi"', tail, from=2-2, to=3-2]
    \arrow["{!}", from=2-2, to=2-3]
    \arrow["{\textbf{Truth}}", from=2-3, to=3-3]
    \arrow["{\chi_{\varphi}}"', from=3-2, to=3-3]
    \arrow["{!}", curve={height=-12pt}, from=1-1, to=2-3]
    \arrow["f"', curve={height=12pt}, from=1-1, to=3-2]
    \arrow["g"{description}, dashed, from=1-1, to=2-2]
\end{tikzcd}$$ (The top diagram can be thoguht of as a way of
associating every monomorphism/subobject of $a$ with an element of
$Hom(a,\Omega)$, and the bottom diagram a way of associating every
element of $Hom(a,\Omega)$ with a monomorphism/subobject)
:::

This definition looks really terse and that is an accurate assessment

> (The subobject classifier) is like a superdense nugget from outer
> space, and through scientific explorations in the latter half of the
> 20th century, we have found that it brings super powers to whichever
> categories possess it. -- David Spivak

This is really useful since it allows us to quantify all subobjects or
propositions depending on your interpretation as a single mathematical
object $Hom(a, \Omega)$, this is especially useful in a cartesian closed
category, where we can think of $\Omega^a$ as the internal object
representing all subobjects of $a$.

::: definition
A Topos is a category with

1.  A terminal object and all products[^2]

2.  All exponentials

3.  A subobject classifier
:::

::: example
$Set$, $FinSet$, $Set^\mathbb{2}, DirGraph$, and depending on your
definition $Cat$ are examples of a topos.
:::

Following the example about the subobject giving a category superpowers,
the following properties hold in any topos:

::: theorem
Every topos obeys the following rules and properties:

1.  Has all sums (or in general all finite colimits)

2.  Sums and Product distribute nicely
    $(a + b) \times c = a \times c + b \times c$

3.  Every epi-monomorphism is an isomorphism

4.  Every morphism has epi mono factorizations, (essentially the
    categorical generalization of images) $$\begin{tikzcd}
                a && b \\
                & {im(f)}
                \arrow["f", from=1-1, to=1-3]
                \arrow[two heads, from=1-1, to=2-2]
                \arrow[tail, from=2-2, to=1-3]
            \end{tikzcd}$$

5.  Every preorder of subobjects forms a heyting algebra.

6.  Every slice is cartesian closed

7.  Is regular and exact (Still figuring out what this means.)
:::

This gives us a method of actually implementing most of the axioms of
set theory namely:

Axiom of separation

Axiom of pairing

Axiom of union

Axiom of power set

These similar versions of these axioms can be used in any topos.

At this point we are almost at the point of fully modeling set theory
inside of category theory:

::: definition
In any category $\mathcal{C}$ a natural numbers object is an object
$\mathbb{N}$ combined with two arrows
$\mathbb{N} \xrightarrow[]{succ} \mathbb{N}$ and
$\mathbb{1} \xrightarrow[]{0} \mathbb{N}$ such that for any arrows
$A \xrightarrow{f} A$, there exists an arrow
$\mathbb{N} \xrightarrow{\sigma_f} A$ such that this diagram commutes:
$$\begin{tikzcd}
    {\mathbb{1}} & {\mathbb{N}} & {\mathbb{N}} \\
    & A & A
    \arrow["0", from=1-1, to=1-2]
    \arrow["g"', from=1-1, to=2-2]
    \arrow["f"', from=2-2, to=2-3]
    \arrow["succ", from=1-2, to=1-3]
    \arrow["{\sigma_f}", from=1-2, to=2-2]
    \arrow["{\sigma_f}", from=1-3, to=2-3]
\end{tikzcd}$$ You can think of this as a general way of expressing the
fact that $\mathbb{N}$ is the smallest inductive set/object.
:::

::: theorem
Any category $\mathcal{C}$ that satisfies the following, has an internal
logic identical to that of $Set$

1.  $\mathcal{C}$ is a topos.

2.  $\mathcal{C}$ has a natural numbers object.

3.  $\mathcal{C}$ is \"Well Pointed\" (A categorical version of LEM and
    or the axiom of extensionality)

4.  For any epimorphism $a \xtwoheadrightarrow{f} b$, there exists an
    arrow $b \xrightarrow{\sigma} a$ such that $\sigma \circ f = id_a$.
    (Categorical version of the Axiom of Choice)
:::

::: definition
For any category $\mathcal{C}$ an element $e$ of an object $x$ is an
arrow from $\mathbb{1}$ into $x$: $$\begin{aligned}
        \mathbb{1} \xrightarrow[]{e} x
    
\end{aligned}$$
:::

::: definition
A category is well pointed if for any 2 arrows $f,g$ with domain
$a \rightrightarrows b$, then $f=g$ if and only if for every element
$\mathbb{1} \xrightarrow{x} a$. $f \circ x = g \circ x$
:::

Notice this can be thought of as a version of the law of excluded
middle, consider the set of real numbers $$\begin{aligned}
    \{x \in \mathbb{R} | x>0 \vee x \leq 0\} \subseteq \mathbb{R}
\end{aligned}$$ in a logic with the law of excluded middle we cannot
prove inclusion the other way and thus it is a strict subset, however
thinking about this from the perspective of elements we can see that
there arent any elements of $\mathbb{R}$ that arent also in
$\{x \in \mathbb{R} | x>0 \vee x \leq 0\}$, thus from the perspective of
classical logic these \"setlike\" objects seem to have spacial
properties that we would typically associate with topological spaces or
manifolds.

::: theorem
Assuming the law of excluded middle holds in your meta theory, in any
well pointed topos has boolean logic, aka
$\Omega \cong \mathbb{1}+\mathbb{1}$
:::

::: proof
*Proof.* This seems hard and a good exercise for me personally -
Nicole ◻
:::

### Exercises

::: Exercise
::: tasks
In the category $Top$ of topological spaces and continuous functions.
Show that \"injective continuous functions\" are monomorphisms. And that
\"surjective continuous functions\" are epimorphisms. Read about
<https://en.wikipedia.org/wiki/Space-filling_curve#History> for an
example of an arrow that is both a monomorphism and an epimorphism but
does not have a continuous inverse and is thus not an isomorphism.
:::
:::

::: Exercise
Decode the following commutative diagrams

$$\begin{tikzcd}
    & {\mathbb{N}\times \mathbb{N}} \\
    {\mathbb{N}} & {\mathbb{N}}
    \arrow["{+}", from=1-2, to=2-2]
    \arrow["fst"', from=2-1, to=2-2]
    \arrow["{\langle id_\mathbb{N},0 \rangle}", from=2-1, to=1-2]
\end{tikzcd}$$ $$\begin{tikzcd}
    {\mathbb{N}\times \mathbb{N}} & {\mathbb{N}} \\
    {\mathbb{N}\times \mathbb{N}} & {\mathbb{N}}
    \arrow["{+}"', from=2-1, to=2-2]
    \arrow["succ"', from=2-2, to=1-2]
    \arrow["{ id_\mathbb{N} \times  succ }", from=2-1, to=1-1]
    \arrow["{+}", from=1-1, to=1-2]
\end{tikzcd}$$
:::

::: Exercise
Decode the following commutative diagram

$$\begin{tikzcd}
    {\mathbb{N}\times{\mathbb{N}}} & {\mathbb{N} \times \mathbb{N}} \\
    {\mathbb{N}\times \mathbb{1}} & {\mathbb{N}}
    \arrow["fst"', from=2-1, to=2-2]
    \arrow["{*}", from=1-2, to=2-2]
    \arrow["{id_\mathbb{N} \times 0 }", from=2-1, to=1-1]
    \arrow["{id_\mathbb{N} \times succ }", from=1-1, to=1-2]
\end{tikzcd}$$
:::

[^1]: I cant figure out how to get the fancy tail working, so I am using
    a hook temporarially

[^2]: And also equalizers
