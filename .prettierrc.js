module.exports = {
  plugins: [require("prettier-plugin-md-nocjsp")],
  printWidth: 120,
  overrides: [
    {
      files: ["*.md"],
      options: {
        parser: "markdown-nocjsp",
        quickFix: "true",
      },
    },
  ],
};
