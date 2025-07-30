// Simple mobile-compatible version without server dependencies
export interface FoodScanResult {
  foodIdentification: {
    name: string;
    confidence: number;
  };
  nutritionInformation: {
    calories: number;
    protein: number;
    fat: number;
    carbohydrates: number;
    allergens: string[];
  };
}

export interface MealInsightsResult {
  response: string;
}

export interface HealthInsightsResult {
  response: string;
}

export interface TextToSpeechResult {
  audioUrl: string;
}

// Mock function for mobile app - replace with actual AI integration later
export async function scanFoodMobile(imageUri: string): Promise<FoodScanResult> {
  // This is a placeholder - in production you'd integrate with a mobile-compatible AI service
  return {
    foodIdentification: {
      name: "Sample Food Item",
      confidence: 0.85
    },
    nutritionInformation: {
      calories: 250,
      protein: 15,
      fat: 8,
      carbohydrates: 30,
      allergens: ["gluten"]
    }
  };
}

export async function getMealInsightsMobile(data: any): Promise<MealInsightsResult> {
  return {
    response: "This meal provides a good balance of protein and carbohydrates. Consider adding more vegetables for fiber."
  };
}

export async function getHealthInsightsMobile(data: any): Promise<HealthInsightsResult> {
  return {
    response: "Based on your recent meals, you're doing well with protein intake. Try to include more colorful vegetables for antioxidants."
  };
}

export async function textToSpeechMobile(data: { text: string }): Promise<TextToSpeechResult> {
  // For mobile, we could use the Web Speech API or a mobile TTS service
  return {
    audioUrl: "" // Placeholder - implement mobile TTS
  };
}
