# Locales

:::info[definition]
A frame (also sometimes confusingly refered to as a \"locale\") is a
partial order with:

-   All (potentially infinite) joins

-   Finite meets

Note that this implies the existence of upper and lower bounds, since
the lower bound is the meet of zero elements, and the upper bound is the
join of all elements in your frame.
:::

:::info[definition]
A frame homomorphism is an arrow from frames $A \xrightarrow[]{f} B$.
Such that $$\begin{aligned}
        f\left(\bigvee_{\alpha \in I} x_\alpha \right) &= \bigvee_{\alpha \in I} f(x_\alpha) \\
        f\left(\bigwedge_{i=1}^n x_i \right) &= \bigwedge_{i=1}^n f(x_i) \\
    
\end{aligned}$$
:::

:::info[definition]
A topological space $|X|$ is a set with a frame of opens
$\mathcal{O}(X)$, such that $\mathcal{O}(X)$ is a subframe with the same
meets and joins as the partial order $\mathcal{P}(|X|)$ under the subset
relation. (Notice that the lowest bound is $\phi$ and the upper bound is
$X$ since the Frame must have an upper and lower bound and that must
match the bounds of $\mathcal{P}(X)$)
:::

:::info[definition]
A continuous function between topologies $X \xrightarrow[]{f} Y$ is a
function from the sets $|X| \xrightarrow[]{f} |Y|$ such that the
preimage of open sets
$\mathcal{O}(Y) \xrightarrow[]{f^{-1}(\_)} \mathcal{O}(X)$ is a frame
homomorphism.
:::

:::info[definition]
Elements of a topology can be formalized in 2 ways, an element $a$ of
$X$ can be thought of as an element of $a \in |X|$, or alternatively as
a homomorphism from the topological space
$\mathcal{P}(\mathbb{1}) \xrightarrow[]{a} X$, where taking the singular
elment $\star$ in $\mathbb{1}$ then the continuous function equals:
$a(\star) =a \in |X|$
:::

:::info[definition]
A meet irriducible set in topological space $(X, \tau)$ is a set $Y$
such that for any 2 opens $U,V$, then if there exists an element
$x \in \mathbb{X}$ and $U \cap V \subseteq X \setminus \{x\}$, then
either $U \subseteq X \setminus \{x\}$ or
$V \subseteq X \setminus \{x\}$
:::

:::tip[Theorem]
Every hausdoff space is sober.
:::

:::note[Proof]
*Proof.* See Exercises ◻
:::

:::info[definition]
A locale $Y$ \"is\" a frame opens $\mathcal{O}(Y)$, and a continuous
function between locales $X \xrightarrow[]{f} Y$ is exactly a frame
homomorphism $f^*$ from
$\mathcal{O}(Y) \xrightarrow[]{f^*} \mathcal{O}(X)$.
:::

:::info[definition]
Elements of a locale are a continuous function from the locale
$\mathcal{P}(\mathbb{1}) \xrightarrow[]{a} X$. However, to further
motivate this comparision let us remember that from the subspace
classifier chapter that
$\mathcal{P}(1) \cong \Omega^\mathbb{1} \cong \Omega$. Remember, that
one can instead of viewing set inclusion as a primative operator, you
can think of it as a function that takes in a set and an element, and
returns a truth value dependant
:::

:::info[definition]
A locale $L$ is compact if and only if whenever an arbitrary set of open
has a join of the maximal element, there is a finite subset of those
opens that also
:::

:::info[definition]
A locale $X$ is disconnected if there are 2 opens
$U,V \in \mathcal{O}(X)$, such that $U \wedge V = \phi$ and
$U \vee V = X$. (In terms of a topological space $X$, a topological
space is disconnected if there are 2 disjoint open sets, $U,V$ such that
$U \cup V = X$)
:::

:::info[definition]
We define a functor $L$ to be a functor that takes every topological
space, and associates it with the locale representing its frame of
opens, and associates every continuous function with the continuous map
on locale's corresponding to it's preimage map
:::

:::info[definition]
:::

From a classic topology book the topology on the real numbers is often
defined like so

:::danger[Useful Lie]
A subset $U$ of the real line is a member of $\mathcal{O}(\mathbb{R})$
if and only if $U$ can be written as an arbitrary union of open
intervals.
:::

However notice that if you give me any real interval like $(-\pi,\pi)$ I
can write it as an infinite union of rational intervals like so:
$$\begin{aligned}
    U_0 &= (-3,3)\\
    U_1 &= (-3.1,3.1)\\
    U_2 &= (-3.14,3.14)\\
    U_3 &= (-3.141,3.141)\\
    & \vdots\\
    \bigcup_{n=0}^\infty U_n &= (-\pi,\pi)
\end{aligned}$$ Notice that we can actually redefine the real line with
a stronger condition.

:::danger[Useful Lie]
A subset $U$ of the real line is a member of $\mathcal{O}(\mathbb{R})$
if and only if $U$ can be written as an arbitrary union of open
intervals with rational values.
:::

:::tip[Theorem]
The rational numbers under the standard topology are disconnected at
every irrational number.
:::

:::note[Proof]
*Proof.* Consider an irrational number $x$, then consider a monotonic
increasing sequence of rational numbers $v_n \mapsto x$ converging to
$x$. And a monotonic decreasing sequence $w_n \mapsto x$ also converging
to $x$. Then $$\begin{aligned}
        \mathbb{Q} &= ((-\infty,x)\cap \mathbb{Q}) \cup ((x,\infty)\cap \mathbb{Q})\\
        &=\left(\bigcup_{n\in \mathbb{N}} (-\infty,v_n) \right) \cup \left(\bigcup_{n\in \mathbb{N}} (w_n, \infty) \right)
    
\end{aligned}$$ ◻
:::

This definition of the real numbers is taken from toby bartel's page on
the nlab

:::info[definition]
We consider the real line to be a subframe of
$\mathcal{P}(\mathbb{Q} \times \mathbb{Q})$, we say that an element
$X \in \mathcal{P}(\mathbb{Q} \times \mathbb{Q})$ (X can be thought of
as a relation on $\mathbb{Q}$)

To help leverage some existing intuitions about subsets of intervals,
let us say that $(a,b) \in X$ and $(c,d) \in X$. Then we say that
$$\begin{aligned}
        (a,b) \subseteq (c,d) &:= (c \leq a) \wedge (b \leq d)\\ 
        (a,b) \subsetneq (c,d) &:= (c < a) \wedge (b < d)
    
\end{aligned}$$ From here we can say that $X \in \mathcal{O}(X)$ if and
only if it meets the following criterions. For the sake of notational
convinence I have tried to define all the definitions below such that
$a \leq b \leq c \leq d$

1.  If $a \leq b$, then $(b,a) \in X$ (Aka, all rational intervals that
    are empty are contained in $X$)

2.  If $(b,c) \subseteq (a,d)$ and $(a,d) \in X$ then $(b,c) \in X$ (Aka
    inclusion is transitive)

3.  If $(a,c) \in X$ and $(b,d) \in X$ and $b \leq c$ then
    $(a,d) \in X$. (Aka, the union of 2 overlapping intervals is also a
    open interval.)

4.  If there exist $a,d \in \mathbb{Q}$, such that for every
    $(b,c) \subsetneq (a,dd)$ then $(b,c) \in X$, then that implies
    $(a,d) \in X$
:::

### Exercises

:::note[Exercise]
A topological space $(X,\tau)$ is hausdorff if and only if for every
$x,y \in X$, then there exist opens $U,V$ such that $x \in U$ and
$y \in V$ and $U \cap V = \phi$.

Show that every hausdorff space is sober.
:::
