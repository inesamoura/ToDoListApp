//
//  AppDelegate.swift
//  ToDoListApp
//
//  Created by Ines Amoura on 07/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Remplacer le point de personnalisation après le lancement de l'application.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Appelé lorsqu'une nouvelle session est créée.
        // On utilise cette méthode pour sélectionner une configuration avec laquelle créer la nouvelle scène.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Appelé lorsque l'utilisateur abandonne une session de scène.
        // Si des sessions ont été supprimées alors que l'application n'était pas en cours d'exécution, celle-ci sera appelée peu de temps après application:didFinishLaunchingWithOptions.
        // Utilisez cette méthode pour libérer toutes les ressources spécifiques aux scènes supprimées, car elles ne reviendront pas.
    }


}

