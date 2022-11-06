module.exports = {
  plugins: [require("prettier-plugin-md-nocjsp")], // prettier3.0導入までのWA
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
