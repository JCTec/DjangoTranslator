//
//  File.swift
//  
//
//  Created by Juan Carlos on 12/05/21.
//

import Vapor
import Fluent
@testable import DjangoTranslator

final class TestDjangoTranslatable: Model {
    static let schema = "stock"
    
    struct FieldKeys {
        static var id: FieldKey { "id" }
        static var grams: FieldKey { "grams" }
        static var strainID: FieldKey { "strain_id" }
    }

    @ID(key: .id)
    var id: UUID?
    
    @Field(key: FieldKeys.grams)
    var grams: Double
    
    init() { }
    
    init(id: UUID? = nil, grams: Double) {
        self.$id.value = id
        self.$grams.value = grams
    }

}

extension TestDjangoTranslatable: DjangoTranslatable {
    var tableName: String {
        TestDjangoTranslatable.schema
    }
    
    var className: String {
        "TestDjangoTranslatable"
    }
    
    var orderingArray: [String]? {
        ["id"]
    }
    
    var verboseNamePlural: String? {
        "TestDjangoTranslatable"
    }
    
    func getTranslation() -> DjangoTranslatableKeys {
        PyKeys()
    }
    
    func getModelAdmin() -> ModelAdmin? {
        ModelAdmin(className: "TestDjangoTranslatableAdmin")
    }
    
    struct PyKeys: DjangoTranslatableKeys {
        let id: String = "models.UUIDField(default=uuid.uuid4, primary_key=True)"
        let grams: String = "models.CharField(max_length=255, null=False, blank=False)"
        
        init() { }
    }
}
