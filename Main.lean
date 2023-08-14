open IO FS System FilePath

def trimEnds (s : String) : String :=
  (s.split (· == '\n')).map (fun l => l.dropRightWhile (· == ' ')) |> String.intercalate "\n"

def main (args : List String) : IO Unit :=
  match args with
  | [] => println "No root directory provided!"
  | d::_ =>
    for fp in ← walkDir d do
      if fp.extension == some "lean" then
        let text ← readFile fp
        writeFile fp (trimEnds text)
