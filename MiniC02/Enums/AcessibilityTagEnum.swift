//
//  AcessIconsEnum.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 09/10/23.
//

import Foundation
import SwiftUI

enum AccessibilityTag: String, CaseIterable, Identifiable {
    case ClosedCaptions = "icon-CLosed_Captions"
    case InternationalDeaf = "icon-International_Deaf"
    case InterpreteLibras = "icon-Interprete_Libras"
    case Libras = "icon-Libras"
    case OpenedCaptions = "icon-Opened_Captions"
    case ProtecaoOuvidoObrigatoria = "icon-Protecao_Ouvido_Obrigatoria"
    case SistemaAudicaoAssistida = "icon-Sistemas_Audicao_Assistida"
    case Telebobina = "icon-Telebobina"
    case TelefoneAmplificadorSonoro = "icon-Telefone Amplificador_Sonoro"
    case TelefoneSurdos = "icon-Telefone_Surdos"

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
