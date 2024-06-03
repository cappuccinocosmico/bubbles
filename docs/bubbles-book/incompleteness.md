---
sidebar_position: 2
title: "Incompleteness and Impossibility Theorems"
---

Our goal of this section we will prove Turing's Halting Problem and
Godel's First and second incompleteness theorem, using 2 assumptions

1.  Any mathematical system capable of arithmetic on the natural numbers
    can simulate a general purpose computer, notably both Turing
    Machines and lambda calculus can be defined using relatively simple
    operations on functions between the natural numbers.

2.  The correctness of any proof can be verified by a computer in a
    finite amount of time. This is relatively easy to see since every
    system of mathematics can be reduced to.

    -   A finite amount of primative objects. (In the case of ZFC, sets
        and logical connectives like: $\forall, \wedge, \neg, \implies$)

    -   A finite amount of gramatical methods for combining previous
        correct statements made of primitive objects to produce new
        correct statements.

    -   A finite list of axioms that guarentee the truth of a list of
        statements.

    Under this framework, a computer can just take any proof (that must
    be finite), and for every symbol in the proof check to make sure
    that the gramatical methods are correct, and then assert that any
    axioms used were true. Since this step is finite, and the proof is
    finite, the method must only take a finite amount of time.

Notably this last component implies that since every single proof is a
list of symbols of finite length, then the set of all mathematical
proofs is countable.

We begin with turing's halting problem.

For the set $Program$ of all computer programs and $Data$ of all data
that could be fed into programs then there is a function $Halt$
described like so: $$\begin{aligned}
    Program \times Data \xrightarrow{Halt} \{0,1\}\end{aligned}$$ where
it returns $0$ if the program halts, and $1$ if the program loops

:::tip[Theorem]
Halt(P,D) is not computable
:::

:::note[Proof]
*Proof.* Let us assume the halting problem does exist as a computable
function, then we can define a function $G(P)$ that will loop if $P(P)$
loops and will not loop if $P(P)$ does not loop. Luckily you can write a
simple function

```python
def G(P):
    return P(P)
```

Now our goal is to define $G^*(P)$ that is defined as the \"opposite\"
of $G(P)$ where it halts whenever the program loops, and loops whenever
the program halts

```python
def G*(P):
    if Halt(P,P)==0:
        while True:
            print("infinite loop")
    else:
        return True
```

Using this we know that $G(P)$ halts if and only if $G^*(P)$ does not
halt, however we have a contradiction since by definition
$G^*(G^*)=G(G^*)$. However they cannot be equal since they have opposite
halting behaviors for every program, therefore we get that the function
$Halt$ used to construct $G^*$ must not exist. ◻
:::

:::tip[Theorem]
For any mathematically consistent system with axioms $\Gamma$ that is
powerful enough to include arithmetic on finite integers then:

1.  There exists a proposition $P$, such that there is no proof of
    $\Gamma \implies P$ or $\Gamma \implies \neg P$.

2.  The proposition \"$\Gamma$ is consistent\" (aka, there is no arrow
    $\Gamma \implies \textbf{False}$) is one such proposition.
:::

First reminder from above that

1.  The set of all proofs are countable

2.  A computer can quickly check if a proof $P$ is a valid proof of a
    proposition $T$

3.  Arithmetic can model the inner workings of a computer.

First we should consider a quick lemma:

:::tip[Lemma]
If a $\Gamma$ system of mathematics contains arithmetic. For every
program $P$ that halts, there is a proof showing that $P$ halts.
:::

:::note[Proof]
*Proof.* Since every turing machine can be represented using basic peano
arithemtic, we can create a oof like so  

1.  Create a simulated turing machine and load the program onto it.

2.  For each step taken by the program, evolve the simulated machine in
    a similar fasion.

3.  Once the program finishes running in the virtual enviornment, you
    can claim it halts in any enviornment.

4.  The fact that the program halts in finite number of steps guarentees
    the proof is finite.

 ◻
:::

Now consider a computer program $S^*$ defined in a similar manner to
$G*$ that takes in a computer program $P$ and does the following:

```python
def S*(P):
    for each x in Proofs:
        if x is a proof that P(P) halts:
            while True:
                print("infinite loop")
        if x is a proof that P(P) does not halt:
            return True
```

:::tip[Lemma]
$(\Gamma \text{ is consistent})$ implies ($S^*(S^*)$ does not halt).

:::

:::note[Proof]
*Proof.* We can show that if $(\Gamma \text{ is consistent})$ is true
then $S^*(S^*)$ must loop, since if $S^*(S^*)$ did halt there would be a
proof $y_H$ showing as such, but then eventually our program would find
$y_H$ in the line (for each x in Proofs:). Since $\Gamma$ is consistent
there can be no other proof that $S^*(S^*)$ does not halt with lower
index then $y_H$ the program to halt first. Since we started with the
assumption that $S^*(S^*)$ halting and arrived at a contradiction then
$S^*(S^*)$ must not halt. ◻
:::

:::note[Proof]
*Proof of Godel 1.* For our statement we aim to show that there are no
proofs for either $\Gamma \implies (S^*(S^*) \text{ halts})$ or
$\Gamma \implies (S^*(S^*) \text{ doesn't halt})$

Since $\Gamma$ is consistent, we know that $S^*(S^*)$ does not halt,
therefore using consistency again we know there can be no proof that it
halts.

We can say that there is no proof that it doesnt halt, since if there
was a proof $y_L$ showing that it loops, then it would halt when the
function iterated over $y_L$ contradicting our previous lemma , and since it is consistent there is no other
proof showing that $S^*(S^*)$ halts. Thus no proof showing $S^*(S^*)$
doesn't halt exists. ◻
:::

:::note[Proof]
*Proof of Godel 2.* To show that there is no proof $X$ in a system
starting from the axioms and proving ts own consistency like so:
$\Gamma \xRightarrow{X} (\Gamma \text{ is consistent})$. Since if there
were, it would be possible to use $X$ with lemma"
reference="lem:const-s"} to construct a proof from $\Gamma$ implying
that $S^*(S^*)$ loops, thus creating a contradiction with Godel 1. Thus
there can be no way that a consistent set of axioms can prove their own
consistency. ◻
:::
