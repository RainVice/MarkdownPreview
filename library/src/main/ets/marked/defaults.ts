import type { MarkedOptions } from './MarkedOptions';

/**
 * Gets the original marked default options.
 */
export function _getDefaults(): MarkedOptions {
  return {
    breaks: false,
    extensions: null,
    gfm: true,
    pedantic: false,
    silent: false,
    tokenizer: null,
  };
}

export let _defaults = _getDefaults();

export function changeDefaults(newDefaults: MarkedOptions) {
  _defaults = newDefaults;
}
