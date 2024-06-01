# Logic

::: theorem
For any two objects $a,b\in \mathbb{X}$ then $$\begin{aligned}
        a \rightsquigarrow b \text{ if and only if } \forall x \in \mathbb{X} \quad  x \rightsquigarrow a \implies x \rightsquigarrow b 
    
\end{aligned}$$
:::

::: proof
*Proof.* ($\Rightarrow$) Suppose $a \rightsquigarrow b$ and suppose that
for some $x \in \mathbb{X}$, $x \rightsquigarrow a$. Then
$x \rightsquigarrow b$ by transitivity.

$(\Leftarrow)$ Suppose that $\forall x \in \mathbb{X}$,
$x \rightsquigarrow a \implies x \rightsquigarrow b$. By reflexivity,
$a \rightsquigarrow a$. Thus, $a \rightsquigarrow b$ by hypothesis. ◻
:::

::: definition
A lattice is a partial order, where every 2 elements
$a,b \in \mathbb{X}$ have a well defined infimim and supremum (called a
join and meet respectively), defined to have the following properties

The meet of $a$ and $b$, denoted by $a \land b$, is an element of
$\mathbb{X}$ such that:

1.  $a \land b \rightsquigarrow a$

2.  $a \land b \rightsquigarrow b$

3.  For any $c \in \mathbb{X}$, if $c \rightsquigarrow a$ and
    $c \rightsquigarrow b$, then $c \rightsquigarrow a \land b$

In other words, $a \land b$ is the greatest lower bound of $a$ and $b$.

The join of $a$ and $b$, denoted by $a \lor b$, is defined the exact
same way but all the arrows are reversed, namely it is an element of
$\mathbb{X}$ such that:

1.  $a \rightsquigarrow a \lor b$

2.  $b \rightsquigarrow a \lor b$

3.  For any $c \in \mathbb{X}$, if $a \rightsquigarrow c$ and
    $b \rightsquigarrow c$, then $a \lor b \rightsquigarrow c$

In other words, $a \lor b$ is the least upper bound of $a$ and $b$.

These rules can be captured visually with the following commutative
diagrams. $$\begin{tikzcd}
    & c &&& c \\
    a & {a \vee b} & b & a & {a\wedge b} & b
    \arrow[squiggly, from=2-1, to=2-2]
    \arrow[squiggly, from=2-3, to=2-2]
    \arrow[squiggly, from=2-1, to=1-2]
    \arrow[squiggly, from=2-3, to=1-2]
    \arrow[dotted, from=2-2, to=1-2]
    \arrow[dashed, from=1-5, to=2-5]
    \arrow[squiggly, from=2-5, to=2-4]
    \arrow[squiggly, from=2-5, to=2-6]
    \arrow[squiggly, from=1-5, to=2-6]
    \arrow[squiggly, from=1-5, to=2-4]
\end{tikzcd}$$
:::

::: definition
A complete lattice is a lattice (aka a preorder with upper and lower
bounds) with the additional property that there exist global upper and
lower bounds like so.

1.  An upper bound $\textbf{False}$ such that for all $a \in \mathbb{X}$
    then $\textbf{False} \rightsquigarrow a$

2.  An lower bound $\textbf{True}$ such that for all $a \in \mathbb{X}$
    then $a \rightsquigarrow \textbf{True}$

(Jeremy could you throw in the definitions of these you wrote down in
your notes, thanks!!!)
:::

::: definition
A heyting algebra is a complete lattice such that for any two objects
$a,b$ there exists an object $(a \implies b)$, (also written as $b^a$
for reasons that are more understandable in cat theory), that satisfies
the following

1.  For all $a,b$ the following holds
    $(a \implies b) \wedge a \rightsquigarrow b$

2.  For any $c$ if $a \wedge c \rightsquigarrow b$, then
    $c \rightsquigarrow (a \implies b)$.

We define $\neg a := (a \implies \textbf{False})$.
:::

::: adefinition
A boolean algebra is a heyting algebra $\mathbb{X}$ where for all
$a \in \mathbb{X}$ then $$\begin{aligned}
        a \vee \neg a \cong \textbf{True}.
    
\end{aligned}$$
:::

::: theorem
A proposition $P$ holds in IPL (Classical logic without the law of
excluded middle) if and only if $\textbf{Truth} \rightsquigarrow P$ in
every heyting algebra. (Assuming you interpret joins and meets as their
appropriate logical operators).
:::

Interestingly the same theorem is both false and improvable in classical
logic due to issues with godel's incompleteness theorem

## Exercises

::: Exercise
In any Heyting Algebra show that
$a \wedge \neg a \rightsquigarrow \textbf{False}$
:::

::: Answer
::: proof
*Proof.* Consider that $a \land \lnot a$ is equivalent to
$a \land (a \implies \textbf{False})$ by definition of $\lnot a$. By
modus ponens, we conclude $\textbf{False}$. ◻
:::
:::

::: Exercise
In any Heyting Algebra show that $a \cong (\textbf{Truth} \implies a)$
:::

::: Exercise
In any Heyting Algebra show that $a \rightsquigarrow b$ if and only if
$\textbf{Truth} \rightsquigarrow (a \implies b)$
:::

::: Exercise
In any Heyting Algebra show that:

::: tasks
$a \vee \textbf{False} \cong a$ $a \wedge \textbf{True} \cong a$
:::
:::

::: Exercise
Show that in any Heyting Algebra that
$(a \implies b) \rightsquigarrow (\neg b \implies \neg a)$
:::

::: Answer
We aim to show that given $b \implies \textbf{False}$ and the
implication $a \implies b$, then $a \implies \textbf{False}$. We begin
with writing this out in full and using the uncurrying properties of
implications $$\begin{aligned}
         (b \implies \textbf{False}) &\implies (a \implies \textbf{False})\\
         (b \implies \textbf{False}) \wedge a &\implies \textbf{False}
    
\end{aligned}$$ Now we can introduce our hypothesis $a \implies b$ to
transform a simple composition since
$a \implies b \implies \textbf{False}$ then $a \implies \textbf{False}$
and we are done.
:::

::: Exercise
::: tasks
In any Heyting Algebra show that
$\neg a \vee b \rightsquigarrow a \implies b$ Prove that in a boolean
algebra under the alternative definition that
$(a \implies b) \rightsquigarrow \neg a \vee b$
:::
:::

::: Answer
::: tasks
Consider that under distributivity we have $$\begin{aligned}
            a \wedge (\neg a \vee b) &\cong (a \wedge \neg a) \vee (a \wedge b)\\
            &\cong \textbf{False} \vee (a \wedge b)\\
            &\cong a \wedge b \rightsquigarrow b
        
\end{aligned}$$ By the definition of $a \implies b$ we have
$\neg a \vee b \rightsquigarrow a \implies b$
:::
:::

::: Exercise
Show that in any Heyting Algebra that $\neg( \neg (A \wedge \neg A))$
holds.
:::

::: Answer
To show that $\neg( \neg (A \wedge \neg A))$ is true, we first assume
that $\neg( A \wedge \neg A)$ is false and try to arrive at a
contradiction, namely by showing $A \wedge \neg A$ creating a
contradiction by [\[ex\]](#ex){reference-type="ref" reference="ex"}

Let us attempt to prove $\neg A$, to do this we first assume $A$ is true
and arrive at a contradiction, if $A$ is true then $A \wedge \neq A$ is
true, arriving at a contradiction since we are assuming
$\neg( A \wedge \neg A)$. Therefore $\neg A$ is true under the
assumption $\neg( A \wedge \neg A)$, however
$\neg A \implies A \wedge \neq A$, thus creating a contradiction with
$\neg( A \wedge \neg A)$. Thus showing that
$\neg( \neg (A \wedge \neg A))$ is true.
:::

::: Exercise
::: tasks
Show that in any Heyting Algebra $a \rightsquigarrow \neg(\neg a)$ Show
that in any Heyting Algebra
$\neg a \rightsquigarrow \neg (\neg (\neg a))$
:::
:::

::: Answer
::: proof
*Proof.* To prove $a \implies \neg(\neg a)$ we should assume $\neg a$
and aim for a contradiction. However since we know that $a$ is true,
then $a \wedge \not a$ gives us a contradiction. Thus
$a \implies \neg(\neg a)$. ◻
:::

::: proof
*Proof.* By definition we have that
$\neg (\neg(\neg a))= (\neg(\neg a)) \rightsquigarrow \textbf{False}$ ◻
:::
:::
