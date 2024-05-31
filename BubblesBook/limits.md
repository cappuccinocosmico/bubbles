::: definition
For any categories $A$, $B$, and an element $c \in B$, there is a
constant functor $A \xrightarrow[]{\delta c} B$ that maps every object
in $A$ onto $c$ and every morphism in $A$ onto $id_c$
:::

Consider a map from small category, that looks like a diagram
$$\begin{tikzcd}
    \bullet & \mapsto & x \\
    \bullet & \mapsto & y \\
    \bullet & \mapsto & z
    \arrow[from=1-1, to=2-1]
    \arrow[from=2-1, to=3-1]
    \arrow["f"', from=1-3, to=2-3]
    \arrow["g"', from=2-3, to=3-3]
\end{tikzcd}$$

And now consider the constant functor for some $c$. Then what would a
natural transformation $\mu$ from $F$ to $\delta c$ would be a
