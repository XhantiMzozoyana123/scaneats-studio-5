'use client'

import { useState } from 'react'
import { Camera, CameraResultType, CameraSource } from '@capacitor/camera'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import Image from 'next/image'

interface MobileCameraProps {
  onImageCapture?: (imageUrl: string) => void
}

export function MobileCamera({ onImageCapture }: MobileCameraProps) {
  const [capturedImage, setCapturedImage] = useState<string | null>(null)
  const [isLoading, setIsLoading] = useState(false)

  const takePicture = async () => {
    try {
      setIsLoading(true)
      const image = await Camera.getPhoto({
        quality: 90,
        allowEditing: false,
        resultType: CameraResultType.Uri,
        source: CameraSource.Camera,
      })

      if (image.webPath) {
        setCapturedImage(image.webPath)
        onImageCapture?.(image.webPath)
      }
    } catch (error) {
      console.error('Error taking picture:', error)
    } finally {
      setIsLoading(false)
    }
  }

  const selectFromGallery = async () => {
    try {
      setIsLoading(true)
      const image = await Camera.getPhoto({
        quality: 90,
        allowEditing: false,
        resultType: CameraResultType.Uri,
        source: CameraSource.Photos,
      })

      if (image.webPath) {
        setCapturedImage(image.webPath)
        onImageCapture?.(image.webPath)
      }
    } catch (error) {
      console.error('Error selecting image:', error)
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className="space-y-4">
      <div className="grid grid-cols-2 gap-4">
        <Button 
          onClick={takePicture} 
          disabled={isLoading}
          className="h-12"
        >
          {isLoading ? 'Taking Photo...' : '📷 Take Photo'}
        </Button>
        <Button 
          onClick={selectFromGallery} 
          disabled={isLoading}
          variant="outline"
          className="h-12"
        >
          {isLoading ? 'Loading...' : '🖼️ Gallery'}
        </Button>
      </div>

      {capturedImage && (
        <Card className="p-4">
          <h3 className="text-lg font-semibold mb-2">Captured Food Image</h3>
          <div className="relative aspect-square w-full max-w-sm mx-auto">
            <Image
              src={capturedImage}
              alt="Captured food"
              fill
              className="object-cover rounded-lg"
            />
          </div>
        </Card>
      )}
    </div>
  )
}
