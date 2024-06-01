::: definition
A well order on a set $X$ is a partial order on $X$ where every subset
of $X$ has a least element.
:::

Here are some fun facts about ordinals

1.  The class of all ordinals is well ordered under set inclusion
    $(\in)$

2.  An ordinal is the set of all ordinals strictly less than it. (The
    first ordinal is the empty set.)

3.  Any set with a well order is order isomorphic to exactly 1 ordinal.

::: theorem
For any set $\alpha$, consider the ordinal $\omega_\alpha$ to be the
smallest ordinal with cardinality $|\alpha|$. Then $\omega_\alpha$ is
order isomorphic to $\omega_\alpha \times \omega_\alpha$ under the
following order
$$(x, y)<(w, z) \Longleftrightarrow\left\{\begin{array}{l}
\max \{x, y\}<\max \{w, z\} \\
\max \{x, y\}=\max \{w, z\} \wedge x<w \\
\max \{x, y\}=\max \{w, z\} \wedge x=w \wedge y<z
\end{array}\right.$$
:::

::: proof
*Proof.* Firstly, it is obvious that $k$ is at most of the order type of
$K \times K$ since the order type of $k$ can be simply be written as
$\alpha \mapsto(\alpha, \alpha)$. The other direction we prove by
induction on $\alpha$ that for the initial ordinal $\omega_\alpha$ it is
true: $\omega_\alpha=\omega_\alpha \times \omega_\alpha$.

Fact: If $\delta<\omega_\alpha$ (where $\omega_\alpha$ is the
$\alpha$-th initial ordinal) then $|\delta|<N_\alpha$.

The claim is true for $\omega_0=\omega$ since for any $k$ the set
$\{(n, m) \mid(n, m)<(k, k)\}$ is finite. Therefore the order type of
$\omega \times \omega$ is the supremum of
$\left\{k_n \mid n \in \omega\right\}$ and $k_n$ are finite. Simply put,
the order type is $\omega$.

Now assume (by contradiction) $\alpha$ was the least ordinal such that
$\omega_\alpha$ was a counterexample to this claim, i.e. $\omega_\alpha$
is strictly less than the order type of
$\omega_\alpha \times \omega_\alpha$.

Let $(\gamma, \beta)<\omega_\alpha \times \omega_\alpha$ be the pair of
ordinals such that the order type of
$\{(\xi, \zeta) \mid(\xi, \zeta)<(\gamma, \beta)\}$ is $\omega_\alpha$.
Take $\delta$ such that $\omega_\alpha>\delta>\max \{\gamma, \beta\}$
then $(\gamma, \beta)<(\delta, \delta)$ and in particular
$\{(\xi, \zeta) \mid(\xi, \zeta)<(\delta, \delta)\}$ has cardinality of
at least $\omega_\alpha$, as it extends a well order of the type
$\omega_\alpha$.

However, $\delta<\omega_\alpha$ by the fact above it is of smaller
cardinality, and thus that set has the cardinality
$|\delta| \times|\delta|=|\delta|<\omega_\alpha$ by our induction
assumption. Hence, a contradiction. ◻
:::

Let us overview the theorem of Zermelo, namely if the axiom of choice
holds then $K=K^2$ for every infinite K.

This is fairly simple, by the canonical well ordering of pairs. Consider
$\alpha \times \beta$, this can be well ordered as ordinal
multiplication (that is $\beta$ copies of $\alpha$, i.e. lexicographical
ordering), or it can be ordered as following:

This is a well-ordering (can you see why?). Now we will prove that
$K \times K$ has the same order type as $K$, this is a proof that the
two sets have the same cardinality, since similar order types induce a
bijection.
