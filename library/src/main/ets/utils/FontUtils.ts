
export function updateObj<T>(old: T, newVal: T): T {
  let t = {...old}
  for (let key of Object.keys(newVal)) {
    if (newVal[key]) {
      t[key] = newVal[key]
    }
  }
  return t
}