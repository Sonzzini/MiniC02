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
    case TelefoneAmplificadorSonoro = "Telefone_Amplificador_Sonoro"
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
    
    var desc: String {
        switch self {
        case .ClosedCaptions:  return "A programação televisiva ou um vídeo possui legendas ocultas que podem ser ativadas."
        case .InternationalDeaf: return "O local oferece ajuda e/ou acesso para surdos."
        case .InterpreteLibras: return "Para profissionais intérpretes que trabalham e atuam na comunicação em Libras."
        case .Libras: return "O local terá pessoas que se comunicam em libras."
        case .OpenedCaptions: return "Legendas que já vêm no vídeo e não podem ser desativadas."
        case .ProtecaoOuvidoObrigatoria: return "O barulho ambiente é alto demais e pode provocar perda auditiva ou dano."
        case .SistemaAudicaoAssistida: return "No local há alguma forma de tecnologia que fornece acessibilidade."
        case .Telebobina: return "O local possui sistema de aro magnético e o sistema de som será transmitido no aparelho auditivo ou implante coclear. Basta colocar no modo T (telecoil)."
        case .TelefoneAmplificadorSonoro: return "Aparelho de telefone possui um controle de volume amplificado que pode ser usado por pessoas que possuem perda auditiva leve ou moderada."
        case .TelefoneSurdos: return "O local possui um telefone para surdos que possui um teclado e visor que permitem enviar e receber mensagens"
        }
    }

    var id: String { return self.rawValue }
}
