import {
  BlockquoteAttr,
  CodeAttr,
  EmphasizeAttr,
  DividerAttr,
  FontAttr,
  ImageAttr,
  LinkAttr,
  ListAttr,
  TableAttr
} from '../style'
import { CodeSpanAttr } from '../style/CodeSpanAttr'
import { DefaultParse, JavaParse, LanguageParse } from '../utils'

export class PreviewOption {
  blockquoteAttr: BlockquoteAttr = new BlockquoteAttr()
  fontAttr: FontAttr = {}
  heading: Record<number, FontAttr> = {
    1: { size: 22, weight: FontWeight.Bold },
    2: { size: 21, weight: FontWeight.Bold },
    3: { size: 20, weight: FontWeight.Bold },
    4: { size: 19, weight: FontWeight.Bold },
    5: { size: 18, weight: FontWeight.Bold },
    6: { size: 17, weight: FontWeight.Bold },
  }
  listAttr: ListAttr = new ListAttr()
  dividerAttr: DividerAttr = new DividerAttr()
  linkAttr: LinkAttr = new LinkAttr()
  imageAttr: ImageAttr = new ImageAttr()
  tableAttr: TableAttr = new TableAttr()
  codeAttr: CodeAttr = new CodeAttr()
  emphasizeAttr: EmphasizeAttr = new EmphasizeAttr()
  codeSpanAttr: CodeSpanAttr = new CodeSpanAttr()
  private languageParses: Record<string, LanguageParse> = {
    "JAVA": new JavaParse(),
    "DEFAULT": new DefaultParse()
  }

  setLanguageParse(languageParse: LanguageParse) {
    this.languageParses[languageParse.language.toUpperCase()] = languageParse
  }

  getLanguageParse(language: string | undefined): LanguageParse | undefined {
    return this.languageParses[language ? language.toUpperCase() : "DEFAULT"] || this.languageParses["DEFAULT"];
  }
}

export class MdPreviewOption extends PreviewOption {
  static value: PreviewOption = new PreviewOption()
}