
'use client';

import { useState } from 'react';
import { MobileCamera } from '@/components/mobile-camera';
import { scanFoodMobile } from '@/lib/mobile-food-scan';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { ArrowLeft } from 'lucide-react';
import { useRouter } from 'next/navigation';

export default function ScanFoodPage() {
  const [scanResult, setScanResult] = useState<any>(null);
  const [isScanning, setIsScanning] = useState(false);
  const router = useRouter();

  const handleImageCapture = async (imageUrl: string) => {
    setIsScanning(true);
    try {
      const result = await scanFoodMobile(imageUrl);
      setScanResult(result);
    } catch (error) {
      console.error('Scan failed:', error);
    } finally {
      setIsScanning(false);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-900 via-purple-800 to-indigo-900 p-4">
      <div className="max-w-md mx-auto space-y-6">
        {/* Header */}
        <div className="flex items-center gap-4 pt-8">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => router.back()}
            className="text-white hover:bg-white/10"
          >
            <ArrowLeft className="h-4 w-4" />
          </Button>
          <h1 className="text-2xl font-bold text-white">Scan Food</h1>
        </div>

        {/* Camera Component */}
        <Card className="bg-white/10 backdrop-blur-sm border-white/20">
          <CardHeader>
            <CardTitle className="text-white">Take a Photo</CardTitle>
          </CardHeader>
          <CardContent>
            <MobileCamera onImageCapture={handleImageCapture} />
          </CardContent>
        </Card>

        {/* Scanning Status */}
        {isScanning && (
          <Card className="bg-white/10 backdrop-blur-sm border-white/20">
            <CardContent className="pt-6">
              <div className="text-center">
                <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-white mx-auto mb-2"></div>
                <p className="text-white">Analyzing your food...</p>
              </div>
            </CardContent>
          </Card>
        )}

        {/* Scan Results */}
        {scanResult && (
          <Card className="bg-white/10 backdrop-blur-sm border-white/20">
            <CardHeader>
              <CardTitle className="text-white">Scan Results</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <h3 className="text-lg font-semibold text-white">
                  {scanResult.foodIdentification.name}
                </h3>
                <p className="text-white/70">
                  Confidence: {Math.round(scanResult.foodIdentification.confidence * 100)}%
                </p>
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="text-center p-3 bg-white/5 rounded-lg">
                  <p className="text-2xl font-bold text-white">
                    {scanResult.nutritionInformation.calories}
                  </p>
                  <p className="text-white/70 text-sm">Calories</p>
                </div>
                <div className="text-center p-3 bg-white/5 rounded-lg">
                  <p className="text-2xl font-bold text-white">
                    {scanResult.nutritionInformation.protein}g
                  </p>
                  <p className="text-white/70 text-sm">Protein</p>
                </div>
                <div className="text-center p-3 bg-white/5 rounded-lg">
                  <p className="text-2xl font-bold text-white">
                    {scanResult.nutritionInformation.carbohydrates}g
                  </p>
                  <p className="text-white/70 text-sm">Carbs</p>
                </div>
                <div className="text-center p-3 bg-white/5 rounded-lg">
                  <p className="text-2xl font-bold text-white">
                    {scanResult.nutritionInformation.fat}g
                  </p>
                  <p className="text-white/70 text-sm">Fat</p>
                </div>
              </div>

              {scanResult.nutritionInformation.allergens.length > 0 && (
                <div>
                  <p className="text-white font-medium mb-2">Allergens:</p>
                  <div className="flex flex-wrap gap-2">
                    {scanResult.nutritionInformation.allergens.map((allergen: string, index: number) => (
                      <span
                        key={index}
                        className="px-2 py-1 bg-red-500/20 text-red-200 rounded-full text-sm"
                      >
                        {allergen}
                      </span>
                    ))}
                  </div>
                </div>
              )}
            </CardContent>
          </Card>
        )}
      </div>
    </div>
  );
}
