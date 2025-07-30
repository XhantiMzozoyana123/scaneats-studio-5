import { Device } from '@capacitor/device'

export const isMobile = async (): Promise<boolean> => {
  try {
    const info = await Device.getInfo()
    return info.platform === 'android' || info.platform === 'ios'
  } catch {
    // Fallback for web environment
    return /Android|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
      navigator.userAgent
    )
  }
}

export const isCapacitor = (): boolean => {
  return !!(window as any).Capacitor
}

export const getPlatform = async (): Promise<string> => {
  try {
    const info = await Device.getInfo()
    return info.platform
  } catch {
    return 'web'
  }
}
