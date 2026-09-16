// Also cover explicit targets and links inserted by the search interface.
function openLinksInNewTabs(root) {
  const links = [...root.querySelectorAll("a[href]")];
  if (root.matches?.("a[href]")) links.push(root);
  for (const link of links) {
    link.target = "_blank";
    link.relList.add("noopener");
  }
}

openLinksInNewTabs(document);
new MutationObserver((records) => {
  for (const record of records) {
    for (const node of record.addedNodes) {
      if (node.nodeType === Node.ELEMENT_NODE) openLinksInNewTabs(node);
    }
  }
}).observe(document.body, {
  childList: true,
  subtree: true,
});
