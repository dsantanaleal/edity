//
//  ContentView.swift
//  simple_editor
//
//  Created by Diego Alexander Santana Leal on 31/12/23.
//

import SwiftUI

struct ContentView: View {

  @State private var filename = ""
  @State private var text = ""

  var body: some View {
    VStack {
      TextEditor(text: $text)
      Button(action: {
        createFile(filename)
      }) {
        Text("Nuevo")
      }
      Button(action: {
        editFile(filename)
      }) {
        Text("Abrir")
      }
      Button(action: {
        saveFile(filename)
      }) {
        Text("Guardar")
      }
    }
    .padding()
  }

  func createFile(_ name: String) {
    filename = name
    text = ""
  }

  func editFile(_ name: String) {
    filename = name
      text = try! String(contentsOfFile: filename)
  }

  func saveFile(_ name: String) {
    try? text.write(to: URL(fileURLWithPath: filename), atomically: true, encoding: .utf8)
  }
}

#Preview {
    ContentView()
}

