::: center
**The Weak Fundamental Philosophy of Category Theory**

The connections between things are more intresting then the things
themselves.

**The Strong Fundamental Philosophy of Category Theory**

Everything intresting about an object is captured in the way it
interacts with other objects. []{#phil:cattheory label="phil:cattheory"}
:::

This philosophy is borne out in the many ways that category theory
chooses to analyze many different areas of mathematics

# What is Category Theory About?

When asking what a mathematical field is about, in general the answer
can alwasy be phrased as \"$\mathfrak{X}$ Theory is about the study of
$\mathfrak{X}$ and maps between $\mathfrak{X}$'s\". In this sense one
could define category theory similarly

::: lie
Category Theory is the study of categories and how the properties of
categories are preserved by functors (maps betwen categories) and
natural transformations.
:::

This is a perfectly accurate description of what category theory is,
however its also unhelpful since it doesn't serve as a motivation, for
example when asking a group theoriest \"What is group theory?\" there
are two potential answers that you could get, namely:

::: lie
Group theory is the study of sets $X$ with a function
$X \times X \xrightarrow[]{\star} X$ with certain properties, and
functions between them that preserve $\star$
:::

or alternatively

::: lie
Group theory is the mathematical study of symmetry
:::

This definition has a bunch of downsides, namely it is factually
incorrect (There are tons of groups that seem to have absolutely no
relation with symmetry, for example what object has symmetries of the
homological algebra of 3 abelian groups in a short exact sequence?
$0 \rightarrow A \rightarrow B \rightarrow C \rightarrow 0$), but more
importantly it is likely to be unhelpful for a student first learning
about them in an abstract algebra course since the broader connections
that make the definition true are not understandable until you know the
basics of group theory.

However it is also a very helpful definition since it conveys a large
amount of information about why we study groups and where the
applications of group theory tend to show up. So alternative definitions
can still be helpful for recruitment.

::: lie
Category theory is the study of \"objects\" that behave like sets, and
\"morphisms\" that behave like functions.
:::

This is a relatively good definition, especially since it can be a good
way of understanding some concepts in cat theory related to functional
programming and alternative foundations of math with topos theory. But
also doesnt

::: lie
Category theory is a framework for transfering concepts between domains.
:::

(Misses cat systems theory and topos theory)

::: lie
Category theory is a formalization of human cognition with composition
as the fundamental concept.
:::

Ultimately the author feels like the fact that category theory is
particularly hard to pin down with an exact conceptual definition is a
testament to its power. Few other fields in mathematics (Group Theory,
Number Theory, Set Theory,Topology) have a similar amount of
philosophical questions. Leading us to the author's favorite definition
of cat theory

::: lie
Category theory is a zone of disputed territory in the forever war
between mathematics and philosophy.
:::

(Vauge enough it means nothing) Leading to the closest

# Commutative Diagrams

It is a tradition in mathematics to ocasionaly include diagrams to help
visualize concepts. Consider if we have 2 functions $f: A \rightarrow B$
and $g:B \rightarrow C$, then we can draw them, and their compositon
like so:

$$\begin{tikzcd}
    A & B & C
    \arrow["{f(x)}", from=1-1, to=1-2]
    \arrow["{g(x)}", from=1-2, to=1-3]
    \arrow["{g(f(x))}"', curve={height=12pt}, from=1-1, to=1-3]
\end{tikzcd}$$

Furthermore, it is often more convinent to define functions using
diagrams. Consider four functions $f: A \rightarrow B$,
$g: B \rightarrow D$, $h: A \rightarrow C$ and $j: C \rightarrow D$.
Such that $g(f(x))=j(h(x))$. If you are just reading this on a page, it
can appear hard to parse, but we can simply express it using the diagram
below:

$$\begin{tikzcd}
    A & B \\
    C & D
    \arrow["f", from=1-1, to=1-2]
    \arrow["g", from=1-2, to=2-2]
    \arrow["h"', from=1-1, to=2-1]
    \arrow["j"', from=2-1, to=2-2]
\end{tikzcd}$$

The astute reader might be wondering how this diagram captures the
equality $g(f(x))=j(h(x))$. Well it is where the commutative part of t

::: definition
A **Commutative Diagram** is a diagram where any two paths between
points are identical.
:::

Good books include

Lawvere's Conceptual mathematics: [@lawvere_conceptual_nodate]

Spivak's Category Theory for the Sciences: [@spivak_category_2014]

Both of these books cover stuff relatively intuitively first building on
a base intuition of sets and functions between sets,

Emily Riehl's Book: [@riehl_category_2016]

Good other books that cover specific parts of category theory, but are
probably not super appropriate for a first introduction:

Really good general book: [@fong_invitation_2019]

Toposes and How to Construct them: [@johnstone_sketches_2002]

Infitesmal Calculus: [@bell_primer_2008] [@lavendhomme_basic_1996]

## Note on Composition Notation

During the invention of modern mathematical notation, given some
function $f$ from a set $A$ to a set $B$, like so:
$A \xrightarrow[]{f} B$, given some $x \in A$, we write the output of
$x$ after an application of $f$ as $f(x)$, furthermore if we have a
function $B \xrightarrow[]{g}C$, then if we apply $g$ to $f(x)$ we would
write this as $g(f(x))$. Under this notation it seems awfuly nice and
convient to write the composition of functions as $g \circ f$, such that
$$\begin{aligned}
    g(f(x)) = (g \circ f)(x)
\end{aligned}$$ This looks really nice with a conventional notation,
however

> There is almost a law of the universe that dicates that solutions that
> are
>
> 1.  The first thing you think of
>
> 2.  Seem Sensible
>
> 3.  And are easy to implement
>
> are often terrible, ineffective solutions that once implemented will
> be a drag on civilization forever. -- CGP Grey

Namely when you try to actually draw out diagrams with this using the
standard notation of traveling from right to left you end up with
$$\begin{tikzcd}
    A & B & C
    \arrow["{f}", from=1-1, to=1-2]
    \arrow["{g}", from=1-2, to=1-3]
    \arrow["{g\circ f}"', curve={height=12pt}, from=1-1, to=1-3]
\end{tikzcd}$$ There is a bunch of proposed notation to fix this
starting in the 20th century when people began seeing this as a problem,
either writing $f$ followed by $g$ as $fg$ using the same notation for
functions/arrows as group multiplication, under the proposal reverse
polish notation
(<https://en.wikipedia.org/wiki/Reverse_Polish_notation>), however since
some authors use regular polsih notation, letting $gf = g \circ f$
instead of $fg = f \circ g$. Thus it has sometimes become modern
practice to define a different composition operator $\gg$, where
$g \circ f = f \gg g$, or alternatively $$\begin{tikzcd}
    A & B & C
    \arrow["{f}", from=1-1, to=1-2]
    \arrow["{g}", from=1-2, to=1-3]
    \arrow["{f \gg g}"', curve={height=12pt}, from=1-1, to=1-3]
\end{tikzcd}$$ This also has the advantage of being easy to write with a
regular US keyboard. However since draft 1 of this book is being
presented to someone with a heavy conventional mathematics background we
will use the $\circ$ notation, later versions with a CS focus will
likely use the $\gg$ notation.

(The author hypothesieses that one reason commutative diagrams have
become really prevalent in cat theory is to clear up this ambiguity and
disfunctional notation.)
