import { LanguageParse } from '.';
import { LanguageRules } from './Rules';

export class DefaultParse extends LanguageParse {
  public language: string = "default";
  protected rules: LanguageRules = {
    string: undefined,
    number: undefined,
    boolean: undefined,
    keyword: undefined,
    comment: undefined,
    method: undefined,
    operator: undefined,
    block: undefined,
    identifier: undefined,
    default: undefined
  };

}