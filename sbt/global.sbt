libraryDependencies += {
  val version = scalaBinaryVersion.value match {
    case "2.10" => "1.0.3"
    case _ ⇒ "1.7.4"
  }
  "com.lihaoyi" % "ammonite" % version % "test" cross CrossVersion.full
}

def blacklistProj(s: String): Boolean = {
	if (s.contains("matryoshka")) { true } else { false }
}

// sourceGenerators in Test += Def.task {
//  if (blacklistProj(name.value)) {
//	Seq.empty
//  } else {
//    val file = (sourceManaged in Test).value / "amm.scala"
//    IO.write(file, """object amm extends App { ammonite.Main.main(args) }""")
//    Seq(file)
//  }
// }.taskValue

