'use client'

import { useEffect } from 'react'
import { App } from '@capacitor/app'
import { StatusBar, Style } from '@capacitor/status-bar'
import { SplashScreen } from '@capacitor/splash-screen'
import { Keyboard } from '@capacitor/keyboard'

interface MobileLayoutProps {
  children: React.ReactNode
}

export function MobileLayout({ children }: MobileLayoutProps) {
  useEffect(() => {
    const initializeMobileFeatures = async () => {
      try {
        // Hide splash screen after app loads
        await SplashScreen.hide()

        // Set status bar style
        await StatusBar.setStyle({ style: Style.Light })
        await StatusBar.setBackgroundColor({ color: '#ffffff' })

        // Handle keyboard events
        Keyboard.addListener('keyboardWillShow', () => {
          // Handle keyboard show
        })

        Keyboard.addListener('keyboardWillHide', () => {
          // Handle keyboard hide
        })

        // Handle back button
        App.addListener('backButton', ({ canGoBack }) => {
          if (!canGoBack) {
            App.exitApp()
          } else {
            window.history.back()
          }
        })

      } catch (error) {
        console.log('Mobile features not available:', error)
      }
    }

    initializeMobileFeatures()

    return () => {
      // Cleanup listeners
      App.removeAllListeners()
      Keyboard.removeAllListeners()
    }
  }, [])

  return <>{children}</>
}
