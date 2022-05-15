# Word-Series Averaging

The Word-Series Averaging methods are used for reduce the computational cost for highly oscillatory ordinary differential equation (ODE) systems. On the other hand, these method add errors in the process but their order is O(1/w^r), where w is the frequency and r is the lenght of the words uses.

More information of these method can be found in the documentation (docs) and its bibliography.

This repository is written fot Matlab and needs symbolic calculation tools.

# Contents

This package contains four functions.

- CalculateWords: It calculates all the posible words with a given set of letters and length.
- Calculateavgfunc: It calculates the basis functions for a word given the basis functions for words with one letter.
- Calculatebetas: It calculates the beta coefficient for a word.
- Calculatekapas: It calculates the kapa coefficient for a word.
- Wordseriesscript: It contains a demo of these function with the same system explained in the documentation.

# Questions

Write to the mail: r.lozanoc93@gmail.com.
