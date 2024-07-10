import { pasteboard } from '@kit.BasicServicesKit';
import { promptAction } from '@kit.ArkUI';

export function decodeHtmlEntities(str: string): string {
  if (str) {
    return str.replace(/&amp;/g, '&')
      .replace(/&lt;/g, '<')
      .replace(/&gt;/g, '>')
      .replace(/&quot;/g, '"')
      .replace(/&#39;/g, "'");
  }
  else {
    return str
  }
}

export async function copyText(text: string) {
  let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
  let systemPasteboard = pasteboard.getSystemPasteboard();
  try {
    await systemPasteboard.setData(pasteData)
    promptAction.showToast({
      message: '复制成功',
    })
  } catch (e) {
    promptAction.showToast({
      message: '复制失败',
    })
  }
}