# Calculus

::: definition
An element $d$ in $\mathcal{R}$ is said to be a square-infinitesmal if
$d^2=0$
:::

::: lemma
You cant divide by square-infinitesmals.
:::

::: proof
*Proof.* If the number $(\frac{1}{d})$ did exist, it would cause
significant problems, since $$\begin{aligned}
    1^2 &=\left(d \cdot \frac{1}{d}\right)^2\\
    1&=d^2\cdot \left(\frac{1}{d}\right)\left(\frac{1}{d}\right)\\
    1&=0\cdot \left(\frac{1}{d}\right)^2\\
    1&=0
  
\end{aligned}$$ Since $1\neq 0$ then $\frac{1}{d}$ must not exist. ◻
:::

::: definition
An element $a \in \mathcal{R}$ is invertible if there is a $b$ such that
$a\cdot b =1$
:::

::: axiom
[]{#a:kl1 label="a:kl1"} For any function
$f: \mathcal{R}\mapsto \mathcal{R}$, then there exists a unique
$k \in \mathcal{R}$, such that for all $d^2=0$ $$f(d)=f(0)+d\cdot k$$
:::

::: corollary
Axiom [\[a:kl1\]](#a:kl1){reference-type="ref" reference="a:kl1"} is
equivalent to saying that function $f$ from
$\mathcal{R}\mapsto \mathcal{R}$ is infinetly differentiable.
:::

::: proof
*Proof.* As seen in Definition
[\[def:derivative\]](#def:derivative){reference-type="ref"
reference="def:derivative"}, the axiom is equivalent to saying that
every function is differentiable at zero. To show that $f(x)$ is
differentiable at any value $a$, we can define another function
$g(x)=f(x-a)$, since $g'(0)=f'(a)$, we know that $f(x)$ is
differentiable at any value.

Since we now have a well defined function $f'(x)$, the reasoning above
tells us that it is also differentiable everywhere, you can repeat this
process for $f'',f'''$ showing that $f$ is infinitely differentiable. ◻
:::

::: lemma
If $0$ is the only square infinitesmal then the only number in
$\mathcal{R}$ is $0$
:::

::: proof
*Proof.* Consider the identity function $f(x)=x$. Via the Kock-Lawvere
axiom, there is a unique number $k$ such that for any $d^2=0$ we have
$$\begin{aligned}
    f(d)=f(0)+k\cdot d
  
\end{aligned}$$ But since the only infintesimal $d^2=0$ is zero, we have
that there is a unique $k$ such that: $$\begin{aligned}
    f(0)&=f(0)+0\cdot k\\
    0&=0\cdot k
  
\end{aligned}$$ Since any number times $0$ is $0$ but the solution must
be unique this implies that $\mathcal{R}$ can only have one element,
namely $0$. ◻
:::

::: theorem
For any 2 real numbers $a,b$ if for all $d^2=0$ we have $da=db$ then
$a=b$
:::

::: proof
*Proof.* Consider the function $f(x)=a\cdot x$ by
[\[a:kl1\]](#a:kl1){reference-type="autoref" reference="a:kl1"} we know
for the function there is a unique value of $k$ such that
$f(d)=f(0)+k\cdot d$. But since we know that $f(d)=a\cdot d$, then the
equation $a\cdot d = k \cdot d$ can only have one solution, then any
other solution $b$ must equal $a$ ◻
:::

::: corollary
If $d_1$ and $d_2$ are square-infinitesmals, then in general $d_1+d_1$
is not a square-infinitesmal.
:::

::: proof
*Proof.* We shall show that if $(d_1+d_2)^2=0$ for all $d_1$ and $d_2$.
This implies that the only square infinitesmal is 0. $$\begin{aligned}
    0&=(d_1+d_2)^2\\
    0&=d_1^2+2d_1d_2+d_2^2\\
    0&=d_1d_2\\
    0\cdot d_1&=d_1 \cdot d_2
  
\end{aligned}$$ But we can apply the cancellation rule to get that
$d_2=0$ and in reverse to get $d_1=0$. ◻
:::

::: lemma
If $a$ is invertible and $d^2=0$ then $(a+d)$ is invertible.
:::

::: proof
*Proof.* To prove that $a+d$ there exists a $y$ such that $y(a+d)=1$
$$\begin{aligned}
    y(a+d)&=1\\
    y(a+d)(a-d)&=a-d\\
    y(a^2-d^2)&=a-d\\
    ya^2&=a-d\\
    y&=\frac{a-d}{a^2}
  
\end{aligned}$$ ◻
:::

## Inequalities for the Reals with Infinitesimals

Many readers will be familiar with the classic rules for the order
operation $\leq$, but we havent extended it to the reals with
infinitesmals.

::: definition
For any ordering of a field, the following rules apply:

1.  If $a \leq b$ then for any $c \leq d$ we have $a+c \leq b+d$

2.  For any $0 \leq c$, then if $a \leq b$ we have that $ac \leq bc$

3.  For any $a,b$ then $a \leq b$ or $b \leq a$ (or both).
:::

::: theorem
If $d^2=0$ then $0 \leq d \leq 0$
:::

::: proof
*Proof.* Using part 3 of the criterion, we know that either $d\leq 0$ or
$0\leq d$. Since we aim to show both are true, we will break this proof
into 2 parts

$(0 \leq d \Rightarrow d \leq 0)$: Starting off if $d\geq 0$, then we
can apply our second rule to say that $d \leq d^2$. Since $d^2=0$, we
have that $0 \leq d \leq 0$

$(d \leq 0 \Rightarrow 0 \leq d)$: If $d \leq 0$, then subtracting $d$
gives us that $0 \leq -d$. By the rule above we have that
$0 \leq -d \leq 0$. Adding $d$ to each side gives us
$0 \leq d \leq 0$. ◻
:::

Notice this breaks one of the conventional rules of ordering in the
reals, namely that if $a \leq b$ and $b\leq a$ that implies that $a=b$.

Intervals are defined in the exact same way for the reals

::: definition
An element $x\in [a,b]$ if $a \leq x \leq b$
:::

From here a more intuitive definition of a general infinitesmal can be
arrived at:

::: definition
An element $d^*$ is a general infinitesmal if $d \in [0,0]$
:::

## Derivatives

::: definition
For any function $f(x)$ the derivative $f'(x)$ is the unique funtion
such that for any $d^2=0$ then
$$f(x+d)=f(x)+d\cdot f'(x)$$[]{#def:derivative label="def:derivative"}
:::

::: theorem
The derivative of $f(g(x))$ is $g'(x)f'(g(x))$
:::

::: proof
*Proof.* Using our definitions we can attempt to expand $f(g(x+d))$ for
$d^2=0$ like before using the definition of the derivative of $f$ and
$g$ $$\begin{aligned}
    f(g(x+d))&=f(g(x)+d\cdot g'(x))
  
\end{aligned}$$ The second component is an infinitesmal element with a
square of zero since $(d \cdot g'(x))^2=d^2 g'(x)^2=0$. Therefore we can
use the definition of the derivative again $$\begin{aligned}
    f(g(x+d))&=f(g(x)+d\cdot g'(x)) \\
    &=f(g(x))+f'(g(x)) \left(d\cdot g'(x)\right)\\
    f(g(x+d))&=f(g(x))+d\left(g'(x)\cdot f'(g(x))\right)
  
\end{aligned}$$ ◻
:::

::: theorem
The derivative of $f(x)\cdot g(x)$ is $f'(x)\cdot g(x)+f(x)\cdot g'(x)$
:::

::: proof
*Proof.* Let us use the definition of the derivative twice for each
component $$\begin{aligned}
    (f\times g)(x+d) &= f(x+d)\cdot g(x+d)\\
     &=\left(f(x)+df'(x)\right)\left(g(x)+dg'(x)\right)\\
    &=f(x)g(x)+df'(x)g(x)+df(x)g'(x)+d^2f'(x)g'(x)\\
    &=f(x)g(x)+d\left(f'(x)g(x)+f(x)g'(x)\right)+0\cdot f'(x)g'(x)\\
    (f\times g)(x+d)&=(f\times g)(x)+d\left(f'(x)g(x)+f(x)g'(x)\right) 
  
\end{aligned}$$ ◻
:::

::: theorem
If every output of $f(x)$ is invertible, the derivative of
$\frac{g(x)}{f(x)}$ is $\frac{g'(x)f(x)-g(x)f'(x)}{f(x)^2}$
:::

::: proof
*Proof.* Since $a-d$ is invertible if $a$ is invertible, then it is
possible to multiply by $\frac{a+d}{a+d}$, this shall be useful in the
second step. $$\begin{aligned}
    \frac{g(x+d)}{f(x+d)}&=\frac{g(x)+dg'(x)}{f(x)+df'(x)}\\
    &=\frac{g(x)+dg'(x)}{f(x)+df'(x)}\cdot\frac{f(x)-df'(x)}{f(x)-df'(x)} \\
    &=\frac{(g(x)+dg'(x))(f(x)-df'(x))}{f(x)^2-d^2f'(x)^2}\\
    &=\frac{g(x)f(x)+df(x)g'(x)-dg(x)f'(x)-d^2f'(x)g'(x)}{f(x)^2-0\cdot f'(x)^2}\\
    &=\frac{g(x)f(x)+df(x)g'(x)-dg(x)f'(x)}{f(x)^2}\\
    &=\frac{g(x)}{f(x)}+d\left(\frac{f(x)g'(x)-g(x)f'(x)}{f(x)^2}\right)
  
\end{aligned}$$ ◻
:::

::: theorem
The derivative of $x^n$ is $n*x^{n-1}$
:::

::: proof
*Proof.* Using induction we know that the derivative of $f(x)=x$ is $1$
since $f(x+d)=x+1 \cdot d$. Thus with our inductive hypothesis saying
that $(x^{n-1})'=(n-1)x^{n-2}$, or stating it with the definition of the
derivative $$(x+d)^{n-1}=x^{n-1}+d\cdot (n-1)x^{n-2}$$ We can
algebraicly expand out $(x+d)^n$ like so: $$\begin{aligned}
    (x+d)^n&=(x+d)(x+d)^{n-1}\\
    &=(x+d)\left(x^{n-1}+d\cdot (n-1)x^{n-1}\right)\\
    &=x^n+d\cdot x^{n-1}+d\cdot x(n-1)x^{n-2}+d^2 (n-1)x^{n-2}\\
    &=x^n+d\cdot x^{n-1}+d\cdot (n-1)x^{n-1}+0\cdot(n-1)x^{n-2}\\
    &=x^n+d\cdot nx^{n-1}
  
\end{aligned}$$ ◻
:::

::: theorem
If there exist 3 functions $f,g,h$ such that $h(x)g(x)=f(x)$, then if
there exists an $a$ such that $f(a)=g(a)=0$, then $h(a)g'(a)=f'(a)$.
(Most textbooks express this using fractions like so
$h(x)=\frac{f(x)}{g(x)}$ and $h(a)=\frac{f'(a)}{g'(a)}$)
:::

::: proof
*Proof.* Notice that since $h(x)$ can be written as a quotent, the
following identity must always hold, plugging in the value $(a+d)$ where
$d^2=0$ lets us use the definition of the derivative to simplify things.
$$\begin{aligned}
    h(a+d)g(a+d)&=f(a+d)\\
    (h(a)+dh'(a))(g(a)+dg'(a))&=f(a)+df'(a)\\
    (h(a)+dh'(a))(0+dg'(a))&=0+df'(a)\\
    h(a)dg'(a)+d^2h'(a)g'(a)&=0+df'(a)\\
    d(h(a)g'(a))&=d(f'(a))
  
\end{aligned}$$ Thus since the last equation is true for any
infinitesmal, then $h(a)g'(a)=f'(a)$. ◻
:::

# Integrals

::: axiom
Every function $f$ there exists a function $g$ such that $g'=f$.
(Oftentimes $g$ will be written as $\int f$)
:::

::: theorem
:::

::: theorem
The integral of $\int (f \cdot g')$ is given by $fg - \int (f' g)$
:::

::: theorem
[]{#thm:taylor label="thm:taylor"} For any function $f$ we have that
$$f(x)=\sum_{k=0}^n \frac{f^{(k)}(a)}{k!}(x-a)^k + \int_a^x f^{(n+1)}(t)\frac{(x-t)^{n}}{n!}dt$$
:::

# Exponentials 

::: definition
A function $f(x)$ is **multiplicative-exponential** if, for any numbers
where $a+b=c+d$ then $f(a) \cdot f(b)=f(c)\cdot f(d)$
:::

::: definition
A function $f(x)$ is **derivational-exponential** if there exists a $k$
such that $f'(x)=k\cdot f(x)$
:::

::: theorem
Multiplicative Exponential functions are Derivational Exponential
Functions
:::

::: proof
*Proof.* Via the definition of the derivative we have that where $d^2=0$
$$f(x+d)=f(x)+d\cdot f'(x)$$ But since $0+(x+d)=x+d$ and $f$ is
exponential we have that $$f(x+d)=\frac{f(x)f(d)}{f(0)}$$ And via the
definition of the derivative at zero $f(d)=f(0)+d f'(0)$ we can expand
like so to say that $$\begin{aligned}
    f(x+d)&=\frac{f(x)f(d)}{f(0)}\\
    f(x+d)&=\frac{f(x)(f(0)+d f'(0))}{f(0)}\\
    f(x+d)&=f(x)+d\left( f(x)\cdot\frac{f'(0)}{f(0)}\right)\\
  
\end{aligned}$$ ◻
:::

Thus $f(x)$ is proportional to its own derivative.

::: theorem
For any $c \in [a,b]$ then there exists a value $z \in [f(a),f(b)]$ such
that $z=f(c)$
:::

::: proof
*Proof.* Almost certainly impossible with current axioms. Might be
provable using the axiom that $f'0$ implies that $f$ is constant. ◻
:::

::: theorem
For any numbers $a,b$ and a function $f$. There exists a $c \in [a,b]$
such that $$f'(c)=\frac{f(a)-f(b)}{a-b}$$
:::

::: proof
*Proof.* Using the fundamental theorem of calculus we have that
$$\begin{aligned}
    \frac{f(a)-f(b)}{a-b}&=\frac{\int_a^b f'}{a-b}
  
\end{aligned}$$ ◻
:::

::: theorem
If for any 2 derivational exponential functions $f$ and $g$ such that
$f(c)=g(c)$ and $f'(c)=g'(c)$. Then $f=g$
:::

::: proof
*Proof.* Since both exponentials are proportional to their own
derivative we have that $f^{(n)}(c)=g^{(n)}(c)$. They must have the same
scaling factor $f'(x)=k*f(x)$Using the taylor series expansion we have
that $$\begin{aligned}
    f(x)&=\sum_{i=0}^n \frac{f^{(i)}(c)}{i!}(x-c)^i + \int_c^x f^{(n+1)}(t)\frac{(x-t)^{n}}{n!}dt\\
    g(x)&=\sum_{i=0}^n \frac{g^{(i)}(c)}{i!}(x-c)^i + \int_c^x g^{(n+1)}(t)\frac{(x-t)^{n}}{n!}dt\\
  
\end{aligned}$$ But since we have that $f^{(n)}(c)=g^{(n)}(c)$ those
first sums must be exactly equal thus we can express $$\begin{aligned}
    f(x)-g(x)&=\left(\sum_{i=0}^n \frac{f^{(i)}(c)}{i!}(x-c)^i-\sum_{i=0}^n \frac{g^{(i)}(c)}{i!}(x-c)^i\right)+ \left(\int_c^x f^{(n+1)}(t)\frac{(x-t)^{n}}{n!}dt-\int_c^x g^{(n+1)}(t)\frac{(x-t)^{n}}{n!}dt\right)\\
  
\end{aligned}$$ We can now cancel the sums leaving us with
$$\begin{aligned}
    f(x)-g(x)&=\int_c^x \left(f^{(n+1)}(t)-g^{(n+1)}(t)\right)\frac{(x-t)^{n}}{n!}dt\\
    f(x)-g(x)&=\frac{k^{n+1}}{n!}\int_c^x \left(f(t)-g(t)\right)(x-t)^{n}dt
  
\end{aligned}$$ In our interval $[c,x]$ $|f(x)-g(x)|$ must take on a
maximum value (sus), let us call that point $k$. Using geometric logic
about integrals we can say that: $$\begin{aligned}
    \left|\int_c^k \left(f(t)-g(t)\right)(k-t)^{n}dt\right| &\leq \left|\int_c^k (f(k)-g(k)) (k-t)^{n}dt\right|\\
    &\leq \left|(f(k)-g(k)) \left[\frac{(x-t)^{n+1}}{n+1}\right]^k_c\right|\\
    &\leq \left|(f(k)-g(k)) \frac{-(k-c)^{n+1}}{n+1}\right|\\
  
\end{aligned}$$ Therefore we have that $$\begin{aligned}
    |f(k)-g(k)| &\leq  |(f(k)-g(k))|\cdot \left| \frac{(x-c)^{n+1}k^{n+1}}{(n+1)!}\right|\\
  
\end{aligned}$$ From here we have 2 options (sus). Either
$\left| \frac{(x-c)^{n+1}k^{n+1}}{(n+1)!}\right|$ is always greater
then 1. or $|f(k)|$ From here we can abuse the fact that for any $n$
this inequality will hold $$\begin{aligned}
    n!|f(x)-g(x)| &\leq \left|K (kx-kc)^{n}\right|\\
    (n+1)!|f(x)-g(x)| &\leq \left|K (kx-kc)^{n+1}\right|\\
  
\end{aligned}$$ Letting $G$ be the integer larger than $kx-kc$ Then via
the definition of exponential we have that $f(c)=0$, and all derivatives
at $c$ are zero. Using
[\[thm:taylor\]](#thm:taylor){reference-type="autoref"
reference="thm:taylor"} we can say that $$\begin{aligned}
    f(x)&=\sum_{i=0}^n \frac{f^{(i)}(c)}{i!}(x-a)^i + \int_c^x f^{(n+1)}(t)\frac{(x-t)^{n}}{n!}dt\\
    f(x)&=\sum_{i=0}^n \frac{0}{i!}(x-a)^i + \int_c^x f(t)\cdot k^n \frac{(x-t)^{n}}{n!}dt\\
    f(x)&=\frac{k^n}{n!}\int_c^x f(t)(x-t)^{n}dt
  
\end{aligned}$$ Since we can say that for any function $$\begin{aligned}
    \int_c^x f(t)(x-t)^{n}dt&=f^{(-1)}(x)(x-t)^n-\int_c^x f(t)(x-t)^{n-1}dt
  
\end{aligned}$$

$$\begin{aligned}
    \int_a^b f(t)f(y*t)dt=
  
\end{aligned}$$ ◻
:::

::: theorem
Every function proportional to its own derivative is exponential.
:::

::: proof
*Proof.* Let our function be $f'=k \cdot f$. By the axiom of integration
there is a function $F$ such that $F'=f$. Then we can define a special
function. Letting $a+b=c+d$ $$\begin{aligned}
    \ell(x)&= \left(F(f'(b)t+a)-F(f'(d)x+c)\right)'\\
    \ell(x)&=f(f'(b)x+a)f'(b)-f(f'(d)x+c)f'(d)\\
    \ell(0)&=f(a)f'(b)-f(c)f(d)
  
\end{aligned}$$ $$\begin{aligned}
    \ell(x)=(f(f(x)))'
    =f'(x)\ell(x)
  
\end{aligned}$$ ◻
:::

# A Journey into Higher Dimensions

Our goal is to using the calculus we already know to deduce properties
about general functions like: $$\begin{tikzcd}
    {\mathcal{R}^n} & {\mathcal{R}^m}
    \arrow["f", from=1-1, to=1-2]
\end{tikzcd}$$

## The Cartesian Plane and Products

To first start this it is worth asking what exactly the cartesian plane
is.

$$\begin{tikzcd}
    X & {X \times Y} & Y
    \arrow["fst", from=1-2, to=1-1]
    \arrow["snd"', from=1-2, to=1-3]
\end{tikzcd}$$

$$\begin{tikzcd}
    & C \\
    X & {X \times Y} & Y
    \arrow["fst", from=2-2, to=2-1]
    \arrow["snd"', from=2-2, to=2-3]
    \arrow["f"', from=1-2, to=2-1]
    \arrow["g", from=1-2, to=2-3]
    \arrow["{!}", dashed, from=1-2, to=2-2]
\end{tikzcd}$$

::: theorem
:::

::: proof
*Proof.* So what does a differentiable function
$G: \mathcal{C}\mapsto \mathcal{R}$ look like?

So if a function $f:\mathcal{C}\mapsto \mathcal{C}$ can be written as a
combination of 2 functions from $\mathcal{C}\mapsto \mathcal{R}$ then
$f(a+bi)=g(a+bi)+i*h(a+bi)$. Then by definition $$\begin{aligned}
    f(a+bi+d(x+iy))&=f(a+bi)+d(x+iy)f'(a+bi)\\
  
\end{aligned}$$ ◻
:::

# Homework Solutions

::: lemma
The inequality below is true $$\begin{aligned}
    n!<n^n<(2n)!
  
\end{aligned}$$ for $n>x^2$
:::

::: proof
*Proof.* First we can expand out the terms on both sides
$$\begin{aligned}
    {x\cdot x \cdot x \cdot \dots \cdot x}<{1\cdot 2 \cdot 3\cdot \dots \cdot n}
  
\end{aligned}$$ equivalently showing that $$\begin{aligned}
    \log_x(1)&< \log_x \left(\frac{1\cdot 2 \cdot 3\cdot \dots \cdot n}{x\cdot x \cdot x \cdot \dots \cdot x}\right)\\
    n&<\sum_{i=1}^n \log_x(i)
  
\end{aligned}$$ ◻
:::
