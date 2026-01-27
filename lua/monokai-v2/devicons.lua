local M = {}

-- Fallback icons using Unicode escape sequences to ensure proper encoding
-- These are Nerd Font codepoints
local fallback_icons = {
  -- Config files
  [".babelrc"] = { icon = "\u{e781}", name = "Babelrc" }, --
  [".bash_profile"] = { icon = "\u{e795}", name = "BashProfile" }, --
  [".bashrc"] = { icon = "\u{e795}", name = "Bashrc" }, --
  [".editorconfig"] = { icon = "\u{e652}", name = "EditorConfig" }, --
  [".env"] = { icon = "\u{e615}", name = "Env" }, --
  [".eslintrc"] = { icon = "\u{e655}", name = "Eslintrc" }, --
  [".eslintignore"] = { icon = "\u{e655}", name = "EslintIgnore" }, --
  [".prettierrc"] = { icon = "\u{e6b4}", name = "Prettierrc" }, --
  [".prettierignore"] = { icon = "\u{e6b4}", name = "PrettierIgnore" },
  [".settings.json"] = { icon = "\u{e60b}", name = "SettingsJson" }, --
  [".zprofile"] = { icon = "\u{e795}", name = "Zshprofile" }, --
  [".zshenv"] = { icon = "\u{e795}", name = "Zshenv" }, --
  [".zshrc"] = { icon = "\u{e795}", name = "Zshrc" }, --

  -- Git
  ["git"] = { icon = "\u{e702}", name = "GitLogo" }, --
  [".gitattributes"] = { icon = "\u{e702}", name = "GitAttributes" },
  [".gitconfig"] = { icon = "\u{e702}", name = "GitConfig" },
  [".gitignore"] = { icon = "\u{e702}", name = "GitIgnore" },
  [".gitmodules"] = { icon = "\u{e702}", name = "GitModules" },

  -- NPM / Node
  [".npmignore"] = { icon = "\u{e71e}", name = "NPMIgnore" }, --
  [".npmrc"] = { icon = "\u{e71e}", name = "NPMrc" }, --
  [".nvmrc"] = { icon = "\u{e718}", name = "Nvmrc" }, --

  -- Special files
  ["Brewfile"] = { icon = "\u{e615}", name = "Brewfile" },
  ["COPYING"] = { icon = "\u{e60a}", name = "License" }, --
  ["COPYING.LESSER"] = { icon = "\u{e60a}", name = "License" },
  ["Gemfile$"] = { icon = "\u{e739}", name = "Gemfile" }, --
  ["LICENSE"] = { icon = "\u{e60a}", name = "License" },
  ["Dockerfile"] = { icon = "\u{f308}", name = "Dockerfile" }, --
  ["Makefile"] = { icon = "\u{e673}", name = "Makefile" }, --

  -- Shell
  ["bash"] = { icon = "\u{e795}", name = "Bash" }, --
  ["sh"] = { icon = "\u{e795}", name = "Sh" },
  ["zsh"] = { icon = "\u{e795}", name = "Zsh" },
  ["fish"] = { icon = "\u{e795}", name = "Fish" },
  ["ps1"] = { icon = "\u{ebc7}", name = "PowerShell" }, -- 󰨊
  ["psm1"] = { icon = "\u{ebc7}", name = "PowerShellModule" },
  ["psd1"] = { icon = "\u{ebc7}", name = "PowerShellData" },
  ["bat"] = { icon = "\u{e795}", name = "Bat" },

  -- C / C++
  ["c"] = { icon = "\u{e61e}", name = "C" }, --
  ["h"] = { icon = "\u{e61e}", name = "H" },
  ["c++"] = { icon = "\u{e61d}", name = "CPlusPlus" }, --
  ["cc"] = { icon = "\u{e61d}", name = "CPlusPlus" },
  ["cpp"] = { icon = "\u{e61d}", name = "Cpp" },
  ["cxx"] = { icon = "\u{e61d}", name = "Cxx" },
  ["hpp"] = { icon = "\u{e61d}", name = "Hpp" },
  ["hxx"] = { icon = "\u{e61d}", name = "Hxx" },
  ["hh"] = { icon = "\u{e61d}", name = "Hh" },

  -- C# / .NET
  ["cs"] = { icon = "\u{f031b}", name = "Cs" }, -- 󰌛
  ["csproj"] = { icon = "\u{f0aae}", name = "CSharpProject" }, -- 󰪮
  ["cshtml"] = { icon = "\u{f1997}", name = "RazorPage" }, -- 󱦗
  ["razor"] = { icon = "\u{f1998}", name = "RazorPage" }, -- 󱦘
  ["sln"] = { icon = "\u{e70c}", name = "Solution" }, --
  ["xaml"] = { icon = "\u{f0673}", name = "Xaml" }, -- 󰙳

  -- F#
  ["fs"] = { icon = "\u{e7a7}", name = "Fsharp" }, --
  ["fsi"] = { icon = "\u{e7a7}", name = "FsharpSignature" },
  ["fsx"] = { icon = "\u{e7a7}", name = "FsharpScript" },
  ["fsscript"] = { icon = "\u{e7a7}", name = "FsharpScript" },

  -- Java / JVM
  ["java"] = { icon = "\u{e738}", name = "Java" }, --
  ["jar"] = { icon = "\u{e738}", name = "Jar" },
  ["kt"] = { icon = "\u{e634}", name = "Kotlin" }, --
  ["kts"] = { icon = "\u{e634}", name = "KotlinScript" },
  ["scala"] = { icon = "\u{e737}", name = "Scala" }, --
  ["sc"] = { icon = "\u{e737}", name = "ScalaScript" },
  ["gradle"] = { icon = "\u{e660}", name = "Gradle" }, --
  ["groovy"] = { icon = "\u{e775}", name = "Groovy" }, --
  ["clj"] = { icon = "\u{e768}", name = "Clojure" }, --
  ["cljs"] = { icon = "\u{e768}", name = "ClojureScript" },
  ["cljc"] = { icon = "\u{e768}", name = "ClojureC" },
  ["edn"] = { icon = "\u{e768}", name = "Edn" },

  -- JavaScript / TypeScript
  ["js"] = { icon = "\u{e74e}", name = "Js" }, --
  ["cjs"] = { icon = "\u{e74e}", name = "Cjs" },
  ["mjs"] = { icon = "\u{e74e}", name = "Mjs" },
  ["jsx"] = { icon = "\u{e7ba}", name = "Jsx" }, --
  ["ts"] = { icon = "\u{e628}", name = "TypeScript" }, --
  ["cts"] = { icon = "\u{e628}", name = "Cts" },
  ["mts"] = { icon = "\u{e628}", name = "Mts" },
  ["tsx"] = { icon = "\u{e7ba}", name = "Tsx" },
  ["d.ts"] = { icon = "\u{e628}", name = "TypeScriptDeclaration" },

  -- Web frameworks
  ["vue"] = { icon = "\u{e6a0}", name = "Vue" }, --
  ["svelte"] = { icon = "\u{e697}", name = "Svelte" }, --
  ["astro"] = { icon = "\u{e6b2}", name = "Astro" }, --

  -- HTML / CSS
  ["html"] = { icon = "\u{e736}", name = "Html" }, --
  ["htm"] = { icon = "\u{e736}", name = "Htm" },
  ["css"] = { icon = "\u{e749}", name = "Css" }, --
  ["scss"] = { icon = "\u{e749}", name = "Scss" },
  ["sass"] = { icon = "\u{e74b}", name = "Sass" }, --
  ["less"] = { icon = "\u{e758}", name = "Less" }, --
  ["styl"] = { icon = "\u{e759}", name = "Stylus" }, --

  -- Python
  ["py"] = { icon = "\u{e73c}", name = "Python" }, --
  ["pyi"] = { icon = "\u{e73c}", name = "PythonStub" },
  ["pyc"] = { icon = "\u{e73c}", name = "PythonCompiled" },
  ["pyd"] = { icon = "\u{e73c}", name = "PythonDll" },
  ["pyo"] = { icon = "\u{e73c}", name = "PythonOptimized" },
  ["pyw"] = { icon = "\u{e73c}", name = "PythonWindows" },
  ["pyx"] = { icon = "\u{e73c}", name = "Cython" },
  ["ipynb"] = { icon = "\u{e678}", name = "JupyterNotebook" }, --

  -- Ruby
  ["rb"] = { icon = "\u{e739}", name = "Ruby" }, --
  ["erb"] = { icon = "\u{e739}", name = "Erb" },
  ["rake"] = { icon = "\u{e739}", name = "Rake" },
  ["gemspec"] = { icon = "\u{e739}", name = "Gemspec" },

  -- PHP
  ["php"] = { icon = "\u{e73d}", name = "Php" }, --
  ["blade.php"] = { icon = "\u{e73d}", name = "Blade" },

  -- Go
  ["go"] = { icon = "\u{e626}", name = "Go" }, --
  ["go.mod"] = { icon = "\u{e626}", name = "GoMod" },
  ["go.sum"] = { icon = "\u{e626}", name = "GoSum" },
  ["templ"] = { icon = "\u{e626}", name = "Templ" },

  -- Rust
  ["rs"] = { icon = "\u{e7a8}", name = "Rust" }, --
  ["rlib"] = { icon = "\u{e7a8}", name = "RustLib" },

  -- Swift / Apple
  ["swift"] = { icon = "\u{e755}", name = "Swift" }, --
  ["m"] = { icon = "\u{e61e}", name = "ObjectiveC" },
  ["mm"] = { icon = "\u{e61e}", name = "ObjectiveCPlusPlus" },

  -- Dart / Flutter
  ["dart"] = { icon = "\u{e798}", name = "Dart" }, --

  -- Lua
  ["lua"] = { icon = "\u{e620}", name = "Lua" }, --
  ["luac"] = { icon = "\u{e620}", name = "LuaCompiled" },
  ["fnl"] = { icon = "\u{e6af}", name = "Fennel" }, --

  -- Vim / Neovim
  ["vim"] = { icon = "\u{e62b}", name = "Vim" }, --

  -- Haskell
  ["hs"] = { icon = "\u{e777}", name = "Haskell" }, --
  ["lhs"] = { icon = "\u{e777}", name = "LiterateHaskell" },

  -- Elixir / Erlang
  ["ex"] = { icon = "\u{e62d}", name = "Elixir" }, --
  ["exs"] = { icon = "\u{e62d}", name = "ElixirScript" },
  ["eex"] = { icon = "\u{e62d}", name = "Eex" },
  ["heex"] = { icon = "\u{e62d}", name = "Heex" },
  ["leex"] = { icon = "\u{e62d}", name = "Leex" },
  ["erl"] = { icon = "\u{e7b1}", name = "Erlang" }, --
  ["hrl"] = { icon = "\u{e7b1}", name = "ErlangHeader" },

  -- Functional languages
  ["elm"] = { icon = "\u{e62c}", name = "Elm" }, --
  ["ml"] = { icon = "\u{e67a}", name = "OCaml" }, --
  ["mli"] = { icon = "\u{e67a}", name = "OCamlInterface" },
  ["res"] = { icon = "\u{e6b1}", name = "ReScript" }, --
  ["resi"] = { icon = "\u{e6b1}", name = "ReScriptInterface" },

  -- Modern languages
  ["zig"] = { icon = "\u{e6a9}", name = "Zig" }, --
  ["nim"] = { icon = "\u{e677}", name = "Nim" }, --
  ["odin"] = { icon = "\u{f07e2}", name = "Odin" }, -- 󰟢
  ["gleam"] = { icon = "\u{e6fb}", name = "Gleam" }, --
  ["mojo"] = { icon = "\u{e6ac}", name = "Mojo" }, --
  ["v"] = { icon = "\u{e6ac}", name = "Vlang" },
  ["vsh"] = { icon = "\u{e6ac}", name = "VlangScript" },
  ["cr"] = { icon = "\u{e7a3}", name = "Crystal" }, --

  -- R / Data Science
  ["r"] = { icon = "\u{f07d4}", name = "R" }, -- 󰟔
  ["R"] = { icon = "\u{f07d4}", name = "R" },
  ["rmd"] = { icon = "\u{f48a}", name = "RMarkdown" }, --
  ["jl"] = { icon = "\u{e624}", name = "Julia" }, --

  -- Assembly / Low level
  ["asm"] = { icon = "\u{e637}", name = "Assembly" }, --
  ["s"] = { icon = "\u{e637}", name = "Assembly" },

  -- Database
  ["db"] = { icon = "\u{f1c0}", name = "Database" }, --
  ["sql"] = { icon = "\u{e706}", name = "Sql" }, --
  ["sqlite"] = { icon = "\u{e706}", name = "Sqlite" },
  ["sqlite3"] = { icon = "\u{e706}", name = "Sqlite3" },
  ["prisma"] = { icon = "\u{e684}", name = "Prisma" }, --

  -- API / GraphQL
  ["graphql"] = { icon = "\u{e662}", name = "GraphQL" }, --
  ["gql"] = { icon = "\u{e662}", name = "GraphQL" },

  -- Data / Config formats
  ["json"] = { icon = "\u{e60b}", name = "Json" }, --
  ["jsonc"] = { icon = "\u{e60b}", name = "JsonC" },
  ["json5"] = { icon = "\u{e60b}", name = "Json5" },
  ["toml"] = { icon = "\u{e6b2}", name = "Toml" }, --
  ["yaml"] = { icon = "\u{e6a8}", name = "Yaml" }, --
  ["yml"] = { icon = "\u{e6a8}", name = "Yml" },
  ["xml"] = { icon = "\u{f05c0}", name = "Xml" }, -- 󰗀
  ["ini"] = { icon = "\u{e615}", name = "Ini" },
  ["cfg"] = { icon = "\u{e615}", name = "Config" },
  ["conf"] = { icon = "\u{e615}", name = "Config" },
  ["csv"] = { icon = "\u{f1c3}", name = "Csv" }, --

  -- Markdown / Documentation
  ["md"] = { icon = "\u{e73e}", name = "Markdown" }, --
  ["mdx"] = { icon = "\u{e73e}", name = "Mdx" },
  ["markdown"] = { icon = "\u{e73e}", name = "Markdown" },
  ["org"] = { icon = "\u{e633}", name = "OrgMode" }, --
  ["norg"] = { icon = "\u{e633}", name = "Neorg" },
  ["txt"] = { icon = "\u{f0219}", name = "Text" }, -- 󰈙

  -- LaTeX / Typesetting
  ["tex"] = { icon = "\u{e69b}", name = "Tex" }, --
  ["bib"] = { icon = "\u{f109f}", name = "BibTeX" }, -- 󱉟
  ["typ"] = { icon = "\u{e69b}", name = "Typst" },

  -- DevOps / Infrastructure
  ["dockerignore"] = { icon = "\u{f308}", name = "DockerIgnore" },
  ["tf"] = { icon = "\u{e69a}", name = "Terraform" }, --
  ["tfvars"] = { icon = "\u{e69a}", name = "TerraformVars" },
  ["nix"] = { icon = "\u{f313}", name = "Nix" }, --

  -- Build tools
  ["cmake"] = { icon = "\u{e673}", name = "CMake" },
  ["makefile"] = { icon = "\u{e673}", name = "Makefile" },
  ["mk"] = { icon = "\u{e673}", name = "Makefile" },
  ["bazel"] = { icon = "\u{e63a}", name = "Bazel" }, --
  ["bzl"] = { icon = "\u{e63a}", name = "Bazel" },

  -- Game development
  ["gd"] = { icon = "\u{e65f}", name = "GDScript" }, --
  ["godot"] = { icon = "\u{e65f}", name = "Godot" },
  ["tscn"] = { icon = "\u{e65f}", name = "GodotScene" },
  ["tres"] = { icon = "\u{e65f}", name = "GodotResource" },

  -- Shaders
  ["glsl"] = { icon = "\u{e6a8}", name = "GLSL" },
  ["vert"] = { icon = "\u{e6a8}", name = "VertexShader" },
  ["frag"] = { icon = "\u{e6a8}", name = "FragmentShader" },

  -- Images
  ["png"] = { icon = "\u{f1c5}", name = "Png" }, --
  ["jpg"] = { icon = "\u{f1c5}", name = "Jpg" },
  ["jpeg"] = { icon = "\u{f1c5}", name = "Jpeg" },
  ["gif"] = { icon = "\u{f1c5}", name = "Gif" },
  ["webp"] = { icon = "\u{f1c5}", name = "Webp" },
  ["avif"] = { icon = "\u{f1c5}", name = "Avif" },
  ["bmp"] = { icon = "\u{f1c5}", name = "Bmp" },
  ["ico"] = { icon = "\u{f1c5}", name = "Ico" },
  ["svg"] = { icon = "\u{f0721}", name = "Svg" }, -- 󰜡
  ["psd"] = { icon = "\u{e7b8}", name = "Photoshop" }, --
  ["ai"] = { icon = "\u{e7b4}", name = "Illustrator" }, --
  ["xcf"] = { icon = "\u{f1c5}", name = "GIMP" },

  -- Audio
  ["mp3"] = { icon = "\u{f1c7}", name = "Mp3" }, --
  ["wav"] = { icon = "\u{f1c7}", name = "Wav" },
  ["flac"] = { icon = "\u{f1c7}", name = "Flac" },
  ["ogg"] = { icon = "\u{f1c7}", name = "Ogg" },
  ["m4a"] = { icon = "\u{f1c7}", name = "M4a" },
  ["aac"] = { icon = "\u{f1c7}", name = "Aac" },
  ["wma"] = { icon = "\u{f1c7}", name = "Wma" },
  ["opus"] = { icon = "\u{f1c7}", name = "Opus" },

  -- Video
  ["mp4"] = { icon = "\u{f1c8}", name = "Mp4" }, --
  ["mkv"] = { icon = "\u{f1c8}", name = "Mkv" },
  ["mov"] = { icon = "\u{f1c8}", name = "Mov" },
  ["avi"] = { icon = "\u{f1c8}", name = "Avi" },
  ["webm"] = { icon = "\u{f1c8}", name = "Webm" },
  ["wmv"] = { icon = "\u{f1c8}", name = "Wmv" },
  ["m4v"] = { icon = "\u{f1c8}", name = "M4v" },
  ["3gp"] = { icon = "\u{f1c8}", name = "3gp" },

  -- Documents
  ["pdf"] = { icon = "\u{f1c1}", name = "Pdf" }, --
  ["doc"] = { icon = "\u{f022c}", name = "Doc" }, -- 󰈬
  ["docx"] = { icon = "\u{f022c}", name = "Docx" },
  ["xls"] = { icon = "\u{f021b}", name = "Xls" }, -- 󰈛
  ["xlsx"] = { icon = "\u{f021b}", name = "Xlsx" },
  ["ppt"] = { icon = "\u{f0227}", name = "Ppt" }, -- 󰈧
  ["pptx"] = { icon = "\u{f0227}", name = "Pptx" },
  ["odt"] = { icon = "\u{f1c2}", name = "OpenDocumentText" },
  ["ods"] = { icon = "\u{f1c3}", name = "OpenDocumentSpreadsheet" },
  ["odp"] = { icon = "\u{f1c4}", name = "OpenDocumentPresentation" },

  -- Fonts
  ["ttf"] = { icon = "\u{f031}", name = "TrueTypeFont" }, --
  ["otf"] = { icon = "\u{f031}", name = "OpenTypeFont" },
  ["woff"] = { icon = "\u{f031}", name = "WebFont" },
  ["woff2"] = { icon = "\u{f031}", name = "WebFont2" },
  ["eot"] = { icon = "\u{f031}", name = "EmbeddedFont" },

  -- Archives
  ["zip"] = { icon = "\u{f1c6}", name = "Zip" }, --
  ["tar"] = { icon = "\u{f1c6}", name = "Tar" },
  ["gz"] = { icon = "\u{f1c6}", name = "Gz" },
  ["tgz"] = { icon = "\u{f1c6}", name = "Tgz" },
  ["bz2"] = { icon = "\u{f1c6}", name = "Bz2" },
  ["xz"] = { icon = "\u{f1c6}", name = "Xz" },
  ["rar"] = { icon = "\u{f1c6}", name = "Rar" },
  ["7z"] = { icon = "\u{f1c6}", name = "SevenZip" },
  ["zst"] = { icon = "\u{f1c6}", name = "Zstd" },

  -- Misc
  ["log"] = { icon = "\u{f0331}", name = "Log" }, -- 󰌱
  ["lock"] = { icon = "\u{f023}", name = "Lock" }, --
  ["diff"] = { icon = "\u{e728}", name = "Diff" }, --
  ["patch"] = { icon = "\u{e728}", name = "Patch" },
  ["license"] = { icon = "\u{e60a}", name = "License" },
  ["desktop"] = { icon = "\u{f108}", name = "DesktopEntry" }, --
  ["wasm"] = { icon = "\u{e6a1}", name = "WebAssembly" }, --
  ["http"] = { icon = "\u{f484}", name = "HTTP" }, --

  -- 3D / CAD
  ["obj"] = { icon = "\u{f01a7}", name = "WavefrontObj" }, -- 󰆧
  ["stl"] = { icon = "\u{f01a7}", name = "STL" },
  ["fbx"] = { icon = "\u{f01a7}", name = "FBX" },
  ["gltf"] = { icon = "\u{f01a7}", name = "GLTF" },
  ["glb"] = { icon = "\u{f01a7}", name = "GLB" },
  ["blend"] = { icon = "\u{f00ab}", name = "Blender" }, -- 󰂫

  -- Binary / Executables
  ["exe"] = { icon = "\u{f17a}", name = "Executable" }, --
  ["dll"] = { icon = "\u{f17a}", name = "DLL" },
  ["so"] = { icon = "\u{f17c}", name = "SharedObject" }, --
  ["o"] = { icon = "\u{e624}", name = "ObjectFile" },
  ["a"] = { icon = "\u{e624}", name = "StaticLibrary" },
  ["out"] = { icon = "\u{e624}", name = "Output" },
  ["bin"] = { icon = "\u{f471}", name = "Binary" }, --
  ["apk"] = { icon = "\u{e70e}", name = "AndroidPackage" }, --
}

-- Color mappings for each file type
local color_mappings = {
  -- Config files
  [".babelrc"] = { color_key = "yellow", cterm = "185" },
  [".bash_profile"] = { color_key = "green", cterm = "113" },
  [".bashrc"] = { color_key = "green", cterm = "113" },
  [".editorconfig"] = { color_key = "dimmed", cterm = "255" },
  [".env"] = { color_key = "yellow", cterm = "227" },
  [".eslintrc"] = { color_key = "purple", cterm = "56" },
  [".eslintignore"] = { color_key = "purple", cterm = "56" },
  [".prettierrc"] = { color_key = "yellow", cterm = "185" },
  [".prettierignore"] = { color_key = "dimmed", cterm = "240" },
  [".settings.json"] = { color_key = "purple", cterm = "98" },
  [".zprofile"] = { color_key = "green", cterm = "113" },
  [".zshenv"] = { color_key = "green", cterm = "113" },
  [".zshrc"] = { color_key = "green", cterm = "113" },

  -- Git
  ["git"] = { color_key = "red", cterm = "196" },
  [".gitattributes"] = { color_key = "orange", cterm = "59" },
  [".gitconfig"] = { color_key = "orange", cterm = "59" },
  [".gitignore"] = { color_key = "orange", cterm = "59" },
  [".gitmodules"] = { color_key = "orange", cterm = "59" },

  -- NPM / Node
  [".npmignore"] = { color_key = "red", cterm = "161" },
  [".npmrc"] = { color_key = "red", cterm = "161" },
  [".nvmrc"] = { color_key = "green", cterm = "113" },

  -- Special files
  ["Brewfile"] = { color_key = "red", cterm = "52" },
  ["COPYING"] = { color_key = "yellow", cterm = "185" },
  ["COPYING.LESSER"] = { color_key = "yellow", cterm = "185" },
  ["Gemfile$"] = { color_key = "red", cterm = "52" },
  ["LICENSE"] = { color_key = "yellow", cterm = "179" },
  ["Dockerfile"] = { color_key = "cyan", cterm = "68" },
  ["Makefile"] = { color_key = "yellow", cterm = "66" },

  -- Shell
  ["bash"] = { color_key = "green", cterm = "113" },
  ["sh"] = { color_key = "green", cterm = "59" },
  ["zsh"] = { color_key = "green", cterm = "113" },
  ["fish"] = { color_key = "green", cterm = "240" },
  ["ps1"] = { color_key = "cyan", cterm = "68" },
  ["psm1"] = { color_key = "cyan", cterm = "68" },
  ["psd1"] = { color_key = "cyan", cterm = "68" },
  ["bat"] = { color_key = "green", cterm = "191" },

  -- C / C++
  ["c"] = { color_key = "cyan", cterm = "111" },
  ["h"] = { color_key = "purple", cterm = "140" },
  ["c++"] = { color_key = "pink", cterm = "204" },
  ["cc"] = { color_key = "pink", cterm = "204" },
  ["cpp"] = { color_key = "cyan", cterm = "67" },
  ["cxx"] = { color_key = "cyan", cterm = "67" },
  ["hpp"] = { color_key = "purple", cterm = "140" },
  ["hxx"] = { color_key = "purple", cterm = "140" },
  ["hh"] = { color_key = "purple", cterm = "140" },

  -- C# / .NET
  ["cs"] = { color_key = "green", cterm = "58" },
  ["csproj"] = { color_key = "purple", cterm = "56" },
  ["cshtml"] = { color_key = "purple", cterm = "56" },
  ["razor"] = { color_key = "purple", cterm = "56" },
  ["sln"] = { color_key = "purple", cterm = "98" },
  ["xaml"] = { color_key = "purple", cterm = "56" },

  -- F#
  ["fs"] = { color_key = "cyan", cterm = "74" },
  ["fsi"] = { color_key = "cyan", cterm = "74" },
  ["fsx"] = { color_key = "cyan", cterm = "74" },
  ["fsscript"] = { color_key = "cyan", cterm = "74" },

  -- Java / JVM
  ["java"] = { color_key = "red", cterm = "167" },
  ["jar"] = { color_key = "orange", cterm = "215" },
  ["kt"] = { color_key = "purple", cterm = "99" },
  ["kts"] = { color_key = "purple", cterm = "99" },
  ["scala"] = { color_key = "red", cterm = "167" },
  ["sc"] = { color_key = "red", cterm = "167" },
  ["gradle"] = { color_key = "cyan", cterm = "24" },
  ["groovy"] = { color_key = "cyan", cterm = "24" },
  ["clj"] = { color_key = "green", cterm = "113" },
  ["cljs"] = { color_key = "cyan", cterm = "74" },
  ["cljc"] = { color_key = "green", cterm = "113" },
  ["edn"] = { color_key = "cyan", cterm = "74" },

  -- JavaScript / TypeScript
  ["js"] = { color_key = "yellow", cterm = "185" },
  ["cjs"] = { color_key = "yellow", cterm = "185" },
  ["mjs"] = { color_key = "yellow", cterm = "185" },
  ["jsx"] = { color_key = "cyan", cterm = "45" },
  ["ts"] = { color_key = "cyan", cterm = "74" },
  ["cts"] = { color_key = "cyan", cterm = "74" },
  ["mts"] = { color_key = "cyan", cterm = "74" },
  ["tsx"] = { color_key = "cyan", cterm = "26" },
  ["d.ts"] = { color_key = "orange", cterm = "172" },

  -- Web frameworks
  ["vue"] = { color_key = "green", cterm = "113" },
  ["svelte"] = { color_key = "orange", cterm = "196" },
  ["astro"] = { color_key = "red", cterm = "197" },

  -- HTML / CSS
  ["html"] = { color_key = "orange", cterm = "196" },
  ["htm"] = { color_key = "orange", cterm = "196" },
  ["css"] = { color_key = "cyan", cterm = "39" },
  ["scss"] = { color_key = "pink", cterm = "204" },
  ["sass"] = { color_key = "pink", cterm = "204" },
  ["less"] = { color_key = "purple", cterm = "54" },
  ["styl"] = { color_key = "green", cterm = "113" },

  -- Python
  ["py"] = { color_key = "yellow", cterm = "214" },
  ["pyi"] = { color_key = "yellow", cterm = "214" },
  ["pyc"] = { color_key = "yellow", cterm = "222" },
  ["pyd"] = { color_key = "yellow", cterm = "222" },
  ["pyo"] = { color_key = "yellow", cterm = "222" },
  ["pyw"] = { color_key = "cyan", cterm = "39" },
  ["pyx"] = { color_key = "cyan", cterm = "39" },
  ["ipynb"] = { color_key = "orange", cterm = "208" },

  -- Ruby
  ["rb"] = { color_key = "red", cterm = "52" },
  ["erb"] = { color_key = "red", cterm = "52" },
  ["rake"] = { color_key = "red", cterm = "52" },
  ["gemspec"] = { color_key = "red", cterm = "52" },

  -- PHP
  ["php"] = { color_key = "purple", cterm = "140" },
  ["blade.php"] = { color_key = "red", cterm = "203" },

  -- Go
  ["go"] = { color_key = "cyan", cterm = "74" },
  ["go.mod"] = { color_key = "orange", cterm = "197" },
  ["go.sum"] = { color_key = "yellow", cterm = "197" },
  ["templ"] = { color_key = "yellow", cterm = "178" },

  -- Rust
  ["rs"] = { color_key = "orange", cterm = "216" },
  ["rlib"] = { color_key = "orange", cterm = "216" },

  -- Swift / Apple
  ["swift"] = { color_key = "orange", cterm = "166" },
  ["m"] = { color_key = "cyan", cterm = "111" },
  ["mm"] = { color_key = "cyan", cterm = "74" },

  -- Dart / Flutter
  ["dart"] = { color_key = "cyan", cterm = "25" },

  -- Lua
  ["lua"] = { color_key = "cyan", cterm = "74" },
  ["luac"] = { color_key = "cyan", cterm = "74" },
  ["fnl"] = { color_key = "yellow", cterm = "230" },

  -- Vim / Neovim
  ["vim"] = { color_key = "green", cterm = "28" },

  -- Haskell
  ["hs"] = { color_key = "purple", cterm = "140" },
  ["lhs"] = { color_key = "purple", cterm = "140" },

  -- Elixir / Erlang
  ["ex"] = { color_key = "purple", cterm = "140" },
  ["exs"] = { color_key = "purple", cterm = "140" },
  ["eex"] = { color_key = "purple", cterm = "140" },
  ["heex"] = { color_key = "purple", cterm = "140" },
  ["leex"] = { color_key = "purple", cterm = "140" },
  ["erl"] = { color_key = "red", cterm = "163" },
  ["hrl"] = { color_key = "red", cterm = "163" },

  -- Functional languages
  ["elm"] = { color_key = "cyan", cterm = "74" },
  ["ml"] = { color_key = "orange", cterm = "166" },
  ["mli"] = { color_key = "orange", cterm = "166" },
  ["res"] = { color_key = "red", cterm = "167" },
  ["resi"] = { color_key = "pink", cterm = "204" },

  -- Modern languages
  ["zig"] = { color_key = "orange", cterm = "172" },
  ["nim"] = { color_key = "yellow", cterm = "220" },
  ["odin"] = { color_key = "cyan", cterm = "32" },
  ["gleam"] = { color_key = "pink", cterm = "219" },
  ["mojo"] = { color_key = "orange", cterm = "196" },
  ["v"] = { color_key = "cyan", cterm = "67" },
  ["vsh"] = { color_key = "cyan", cterm = "67" },
  ["cr"] = { color_key = "dimmed", cterm = "251" },

  -- R / Data Science
  ["r"] = { color_key = "cyan", cterm = "25" },
  ["R"] = { color_key = "cyan", cterm = "25" },
  ["rmd"] = { color_key = "cyan", cterm = "74" },
  ["jl"] = { color_key = "purple", cterm = "133" },

  -- Assembly / Low level
  ["asm"] = { color_key = "cyan", cterm = "31" },
  ["s"] = { color_key = "cyan", cterm = "25" },

  -- Database
  ["db"] = { color_key = "yellow", cterm = "188" },
  ["sql"] = { color_key = "purple", cterm = "188" },
  ["sqlite"] = { color_key = "purple", cterm = "188" },
  ["sqlite3"] = { color_key = "purple", cterm = "188" },
  ["prisma"] = { color_key = "purple", cterm = "62" },

  -- API / GraphQL
  ["graphql"] = { color_key = "pink", cterm = "199" },
  ["gql"] = { color_key = "pink", cterm = "199" },

  -- Data / Config formats
  ["json"] = { color_key = "yellow", cterm = "185" },
  ["jsonc"] = { color_key = "yellow", cterm = "185" },
  ["json5"] = { color_key = "yellow", cterm = "185" },
  ["toml"] = { color_key = "orange", cterm = "124" },
  ["yaml"] = { color_key = "yellow", cterm = "66" },
  ["yml"] = { color_key = "yellow", cterm = "66" },
  ["xml"] = { color_key = "orange", cterm = "166" },
  ["ini"] = { color_key = "yellow", cterm = "66" },
  ["cfg"] = { color_key = "yellow", cterm = "66" },
  ["conf"] = { color_key = "yellow", cterm = "66" },
  ["csv"] = { color_key = "green", cterm = "113" },

  -- Markdown / Documentation
  ["md"] = { color_key = "cyan", cterm = "253" },
  ["mdx"] = { color_key = "cyan", cterm = "74" },
  ["markdown"] = { color_key = "cyan", cterm = "253" },
  ["org"] = { color_key = "cyan", cterm = "73" },
  ["norg"] = { color_key = "cyan", cterm = "32" },
  ["txt"] = { color_key = "text", cterm = "113" },

  -- LaTeX / Typesetting
  ["tex"] = { color_key = "green", cterm = "22" },
  ["bib"] = { color_key = "yellow", cterm = "185" },
  ["typ"] = { color_key = "cyan", cterm = "37" },

  -- DevOps / Infrastructure
  ["dockerignore"] = { color_key = "cyan", cterm = "68" },
  ["tf"] = { color_key = "purple", cterm = "93" },
  ["tfvars"] = { color_key = "purple", cterm = "93" },
  ["nix"] = { color_key = "cyan", cterm = "110" },

  -- Build tools
  ["cmake"] = { color_key = "green", cterm = "254" },
  ["makefile"] = { color_key = "yellow", cterm = "66" },
  ["mk"] = { color_key = "yellow", cterm = "66" },
  ["bazel"] = { color_key = "green", cterm = "113" },
  ["bzl"] = { color_key = "green", cterm = "113" },

  -- Game development
  ["gd"] = { color_key = "cyan", cterm = "66" },
  ["godot"] = { color_key = "cyan", cterm = "66" },
  ["tscn"] = { color_key = "purple", cterm = "66" },
  ["tres"] = { color_key = "yellow", cterm = "66" },

  -- Shaders
  ["glsl"] = { color_key = "cyan", cterm = "67" },
  ["vert"] = { color_key = "cyan", cterm = "67" },
  ["frag"] = { color_key = "cyan", cterm = "67" },

  -- Images
  ["png"] = { color_key = "purple", cterm = "140" },
  ["jpg"] = { color_key = "purple", cterm = "140" },
  ["jpeg"] = { color_key = "purple", cterm = "140" },
  ["gif"] = { color_key = "purple", cterm = "140" },
  ["webp"] = { color_key = "purple", cterm = "140" },
  ["avif"] = { color_key = "purple", cterm = "140" },
  ["bmp"] = { color_key = "purple", cterm = "140" },
  ["ico"] = { color_key = "yellow", cterm = "185" },
  ["svg"] = { color_key = "yellow", cterm = "214" },
  ["psd"] = { color_key = "cyan", cterm = "74" },
  ["ai"] = { color_key = "orange", cterm = "185" },
  ["xcf"] = { color_key = "dimmed", cterm = "240" },

  -- Audio
  ["mp3"] = { color_key = "cyan", cterm = "39" },
  ["wav"] = { color_key = "cyan", cterm = "39" },
  ["flac"] = { color_key = "cyan", cterm = "24" },
  ["ogg"] = { color_key = "cyan", cterm = "24" },
  ["m4a"] = { color_key = "cyan", cterm = "39" },
  ["aac"] = { color_key = "cyan", cterm = "39" },
  ["wma"] = { color_key = "cyan", cterm = "39" },
  ["opus"] = { color_key = "cyan", cterm = "24" },

  -- Video
  ["mp4"] = { color_key = "orange", cterm = "208" },
  ["mkv"] = { color_key = "orange", cterm = "208" },
  ["mov"] = { color_key = "orange", cterm = "208" },
  ["avi"] = { color_key = "orange", cterm = "208" },
  ["webm"] = { color_key = "orange", cterm = "208" },
  ["wmv"] = { color_key = "orange", cterm = "208" },
  ["m4v"] = { color_key = "orange", cterm = "208" },
  ["3gp"] = { color_key = "orange", cterm = "208" },

  -- Documents
  ["pdf"] = { color_key = "red", cterm = "124" },
  ["doc"] = { color_key = "cyan", cterm = "26" },
  ["docx"] = { color_key = "cyan", cterm = "26" },
  ["xls"] = { color_key = "green", cterm = "29" },
  ["xlsx"] = { color_key = "green", cterm = "29" },
  ["ppt"] = { color_key = "orange", cterm = "160" },
  ["pptx"] = { color_key = "orange", cterm = "160" },
  ["odt"] = { color_key = "cyan", cterm = "81" },
  ["ods"] = { color_key = "green", cterm = "119" },
  ["odp"] = { color_key = "orange", cterm = "215" },

  -- Fonts
  ["ttf"] = { color_key = "dimmed", cterm = "255" },
  ["otf"] = { color_key = "dimmed", cterm = "255" },
  ["woff"] = { color_key = "dimmed", cterm = "255" },
  ["woff2"] = { color_key = "dimmed", cterm = "255" },
  ["eot"] = { color_key = "dimmed", cterm = "255" },

  -- Archives
  ["zip"] = { color_key = "yellow", cterm = "214" },
  ["tar"] = { color_key = "yellow", cterm = "214" },
  ["gz"] = { color_key = "yellow", cterm = "214" },
  ["tgz"] = { color_key = "yellow", cterm = "214" },
  ["bz2"] = { color_key = "yellow", cterm = "214" },
  ["xz"] = { color_key = "yellow", cterm = "214" },
  ["rar"] = { color_key = "yellow", cterm = "214" },
  ["7z"] = { color_key = "yellow", cterm = "214" },
  ["zst"] = { color_key = "yellow", cterm = "214" },

  -- Misc
  ["log"] = { color_key = "dimmed", cterm = "253" },
  ["lock"] = { color_key = "dimmed", cterm = "250" },
  ["diff"] = { color_key = "green", cterm = "239" },
  ["patch"] = { color_key = "green", cterm = "239" },
  ["license"] = { color_key = "yellow", cterm = "185" },
  ["desktop"] = { color_key = "purple", cterm = "60" },
  ["wasm"] = { color_key = "purple", cterm = "62" },
  ["http"] = { color_key = "cyan", cterm = "31" },

  -- 3D / CAD
  ["obj"] = { color_key = "dimmed", cterm = "102" },
  ["stl"] = { color_key = "dimmed", cterm = "102" },
  ["fbx"] = { color_key = "dimmed", cterm = "102" },
  ["gltf"] = { color_key = "yellow", cterm = "214" },
  ["glb"] = { color_key = "yellow", cterm = "214" },
  ["blend"] = { color_key = "orange", cterm = "208" },

  -- Binary / Executables
  ["exe"] = { color_key = "red", cterm = "124" },
  ["dll"] = { color_key = "dimmed", cterm = "52" },
  ["so"] = { color_key = "dimmed", cterm = "253" },
  ["o"] = { color_key = "dimmed", cterm = "124" },
  ["a"] = { color_key = "dimmed", cterm = "253" },
  ["out"] = { color_key = "red", cterm = "124" },
  ["bin"] = { color_key = "red", cterm = "124" },
  ["apk"] = { color_key = "green", cterm = "35" },
}

---@param c Colorscheme
M.setup = function(c)
  local status_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if not status_ok then
    return
  end

  -- Try to get default icons from nvim-web-devicons
  local default_icons = {}
  local get_icons_ok, icons_result = pcall(function()
    return webDevicons.get_icons()
  end)
  if get_icons_ok and icons_result then
    default_icons = icons_result
  end

  -- Map color keys to actual colors from colorscheme
  local color_map = {
    red = c.base.red,
    orange = c.base.orange,
    yellow = c.base.yellow,
    green = c.base.green,
    cyan = c.base.cyan,
    purple = c.base.purple,
    pink = c.base.pink,
    dimmed = c.base.dimmed2,
    text = c.base.text,
  }

  ---@param name string
  ---@param color_key string
  ---@param cterm_color string
  local function make_icon(name, color_key, cterm_color)
    local default = default_icons[name]
    local fallback = fallback_icons[name]

    -- Get icon glyph: prefer nvim-web-devicons, fallback to our own
    local icon_glyph
    local icon_name
    if default and default.icon and default.icon ~= "" then
      icon_glyph = default.icon
      icon_name = default.name or name
    elseif fallback and fallback.icon then
      icon_glyph = fallback.icon
      icon_name = fallback.name
    else
      return nil
    end

    return {
      icon = icon_glyph,
      color = color_map[color_key] or c.base.text,
      cterm_color = cterm_color,
      name = icon_name,
    }
  end

  -- Build icons table
  local icons = {}
  for name, mapping in pairs(color_mappings) do
    local icon = make_icon(name, mapping.color_key, mapping.cterm)
    if icon then
      icons[name] = icon
    end
  end

  webDevicons.set_icon(icons)
end

return M
