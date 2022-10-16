module.exports = {
  plugins: [require("prettier-plugin-md-nocjsp")],
  overrides: [
    {
      files: ["*.md"],
      options: {
        parser: "markdown-nocjsp",
      },
    },
  ],
};
