//
//  SceneDelegate.swift
//  ToDoListApp
//
//  Created by Ines Amoura on 07/01/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Utilisez cette méthode pour éventuellement configurer et attacher la `window` UIWindow à la `scene` UIWindowScene fournie.
        // Si vous utilisez un storyboard, la propriété `window` sera automatiquement initialisée et attachée à la scène.
        // Ce délégué n'implique pas que la scène ou la session de connexion sont nouvelles (voir `application:configurationForConnectingSceneSession` à la place).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Appelé lorsque la scène est libérée par le système.
        // Cela se produit peu de temps après que la scène entre en arrière-plan ou lorsque sa session est supprimée.
        // Libère toutes les ressources associées à cette scène qui peuvent être recréées la prochaine fois que la scène se connecte.
        // La scène peut se reconnecter plus tard, car sa session n'a pas nécessairement été supprimée (voir plutôt `application:didDiscardSceneSessions`).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Appelé lorsque la scène est passée d'un état inactif à un état actif.
        // Utilisez cette méthode pour redémarrer toutes les tâches qui ont été mises en pause (ou pas encore démarrées) lorsque la scène était inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Appelé lorsque la scène passera d'un état actif à un état inactif.
        // Cela peut se produire en raison d'interruptions temporaires (par exemple, un appel téléphonique entrant).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Appelé lorsque la scène passe de l'arrière-plan au premier plan.
        // Utilisez cette méthode pour annuler les modifications apportées à l'entrée de l'arrière-plan.

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Appelé lorsque la scène passe de l'arrière-plan au premier plan.
        // Utilisez cette méthode pour annuler les modifications apportées à l'entrée de l'arrière-plan.

    }


}

