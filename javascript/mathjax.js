window.MathJax = {
    tex: {
        inlineMath: [["\\(", "\\)"]],
        displayMath: [["\\[", "\\]"]],
        processEscapes: true,
        processEnvironments: true
    },
    options: {
        ignoreHtmlClass: ".*|",
        processHtmlClass: "arithmatex"
    }
};

// De eerste weergave gebeurt door MathJax zelf na het laden.
// Wacht bij latere navigatie op de asynchroon geladen MathJax-runtime.
document$.subscribe(() => {
    if (window.MathJax.startup && window.MathJax.startup.promise) {
        window.MathJax.startup.promise.then(() => {
            window.MathJax.typesetClear();
            window.MathJax.texReset();
            return window.MathJax.typesetPromise();
        });
    }
});
