//
//  ProjectManager.swift
//  Whatever
//
//  Created by hoopes on 1/4/20.
//  Copyright © 2020 hoopes. All rights reserved.
//

import Foundation

class ProjectManager: ObservableObject {

    @Published var initialized: Bool = false

    var projects: Array<Project> = []

    var currentProjectIndex = 0
    @Published var currentProject: Project!

    // FIXME: How to load from firestore?
    func load() {

        self.projects.append(Project(title: "Project 1"))
        self.projects.append(Project(title: "Project 2"))

        self.currentProject = self.projects[0]

        self.initialized = true
    }

    func toggleProject() {
        currentProjectIndex = currentProjectIndex == 0 ? 1 : 0;
        currentProject = self.projects[currentProjectIndex]
    }
}
