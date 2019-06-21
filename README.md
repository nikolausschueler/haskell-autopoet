What is it?
==========

This is my Autopoet program, written in Haskell. It is an implementation of the
"Dissociated Press" algorithm https://en.wikipedia.org/wiki/Dissociated_press.

Summed up, the algorithm works like this: Select some sequence of letters from
the file.  Typically, you would start at the beginning of the text. Find all
successors of the sequence. Choose one randomly. Drop the first letter of the
sequence and add the successor to the end. Repeat the search for successors with
this new sequence. When the sequence matches right at the end of the text, there
is no successor. Stop.

I use it as an extended form of "Hello World" when I want to play with a
programming language. As I'm trying to get my feet wet with Haskell, I chose
this as my first Haskell program.

Usage
=====

I use the Glasgow Haskell Compiler to compile. You can compile the program with:

```
$ ghc poet.hs
```

An example
==========

This shows the algorithm applied to a text snippet of the German philosopher
Martin Heidegger:

```
Das Dasein ist ein Seiendes, das nicht nur unter anderem Seienden vorkommt. Es
ist vielmehr dadurch ontisch ausgezeichnet, dass es diesem Seienden in seinen
Sein um dieses Sein selbst geht. Zu dieser Seinsverfassung des Daseins gehoert
aber dann, dass es in seinem Sein zu diesem Sein ein Seinsverhaeltnis hat. Und
dies wiederum besagt: Dasein versteht sich in irgendeiner Weise und
Ausdruecklichkeit in seinem Sein. Diesem Seienden eignet, dass mit und durch
sein Sein dieses ihm selbst erschlossen ist. Seinsverstaendnis ist selbst eine
Seinsbestimmtheit des Daseins. Die ontische Auszeichnung des Daseins liegt
daran, dass es ontologisch ist.
```

Save the text to a file and run the program with:

```
$ ./poet < heidegger.txt
```

This gives you:

```
Das Dasein selbst sein zu dies dieses ihm sein sein. Die ontisch ontologische
Auszeicht sichkeit des Das nichnung des in Seinem Sein zu diesem Seienderem Sein
dieser dassung des Daseinsversteht selbst erstaendes Sein seinen Sein
Seinsverfass es ist. Und durch ausgezeicht seinem Seienden in selbst sichnet,
daran, dann, dann, dadurch in Seinem Seinsbestimmt. Zu dieses ist geht nur unter
Weise und dieses Daseins. Die ontologisch seins. Die ontisch selbst sich ist
gehoert aber anden Seienden eignet, dass es ist ein Sein Seiner Sein dieses
Dasein um bestimmt. Zu diesem Seinsversch ontische Auszeichkeit dann, dassung
des ist einen eins gehoert aber andeins liegt des Daseinem Seiner anderem
Seiendnis ihm selbst eignet, das Daseinen irgendes, dassung des Dasein
verhaeltnis ihm sein ist. Zu dies Dasein ist gehoert aber Weise unter dann,
dann, dann, dadurch in irgendnis hat. Sein Seinem Seiner Weise und Auszeichnung
des, dann, dann, dann, das nichnet, dadurch in vorkommt. Es ist.
```

Can you spot the difference?
