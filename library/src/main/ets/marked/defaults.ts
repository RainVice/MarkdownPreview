import type { MarkedOptions } from './MarkedOptions';

/**
 * Gets the original marked default options.
 */
export function _getDefaults(): MarkedOptions {
  return {
    breaks: false,
    extensions: null,
    gfm: true,
    hooks: null,
    pedantic: false,
    tokenizer: null,
    walkTokens: null
  };
}

export let _defaults = _getDefaults();

export function changeDefaults(newDefaults: MarkedOptions) {
  _defaults = newDefaults;
}
