import Lake
open Lake DSL

package Trimmer {
}

@[default_target]
lean_exe «trimmer» {
  root := `Main
}
