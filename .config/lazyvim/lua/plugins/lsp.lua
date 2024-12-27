return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            customTags = {
              "!Ref",
              "!Sub",
              "!If",
              "!If sequence",
              "!Equals",
              "!Equals sequence"
            }
          }
        }
      }
    },
  },
}
