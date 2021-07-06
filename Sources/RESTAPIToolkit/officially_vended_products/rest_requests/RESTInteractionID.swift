//
//  RESTInteractionID.swift
//
//
//  Created by Jeremy Bannister on 3/12/21.
//

///
public struct RESTInteractionID: CustomUUID {
    public let uuid: UUID
    public init (_ uuid: UUID) { self.uuid = uuid }
}
