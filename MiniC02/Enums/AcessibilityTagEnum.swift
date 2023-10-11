//
//  AcessIconsEnum.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 09/10/23.
//

import Foundation
import SwiftUI

enum AccessibilityTag: String, CaseIterable, Identifiable, Codable {
    case ClosedCaptions = "Closed_Captions"
    case InternationalDeaf = "Internacional_Deficiencia_Auditiva"
    case InterpreteLibras = "Interprete_Libras"
    case Libras = "Libras"
    case OpenedCaptions = "Opened_Captions"
    case ProtecaoOuvidoObrigatoria = "Protecao_Ouvido_Obrigatoria"
    case SistemaAudicaoAssistida = "Sistemas_Audicao_Assistida"
    case Telebobina = "Telebobina"
    case TelefoneAmplificadorSonoro = "Telefone Amplificador_Sonoro"
    case TelefoneSurdos = "Telefone_Surdos"

    var label: String {
        switch self {
        case .ClosedCaptions: return "Closed Caption"
        case .InternationalDeaf: return "International Deficiencia Auditiva"
        case .InterpreteLibras: return "Intérprete de Libras"
        case .Libras: return "Libras"
        case .OpenedCaptions: return "Opened Captions"
        case .ProtecaoOuvidoObrigatoria: return "Proteção de Ouvido Obrigatória"
        case .SistemaAudicaoAssistida: return "Sistema de Audição Assistida"
        case .Telebobina: return "Telebobina"
        case .TelefoneAmplificadorSonoro: return "Telefone Amplificador Sonoro"
        case .TelefoneSurdos: return "Telefone Surdos"
        }
    }

    var id: String { return self.rawValue }
}


//if let tag = AccessibilityTag(rawValue: "icon-Closed_Captions")
//tag?.rawValue
