object dmCliente: TdmCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 306
  Width = 326
  object cdsClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cliente'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'nombre_cliente'
        Attributes = [faRequired]
        DataType = ftString
        Size = 150
      end
      item
        Name = 'direccion'
        Attributes = [faRequired]
        DataType = ftString
        Size = 150
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dtpClientes'
    RemoteServer = Conexion
    StoreDefs = True
    OnDeleteError = cdsClientesDeleteError
    Left = 96
    Top = 8
    object cdsClientescliente: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClientesnombre_cliente: TStringField
      FieldName = 'nombre_cliente'
      Origin = 'nombre_cliente'
      Required = True
      Size = 150
    end
    object cdsClientesdireccion: TStringField
      FieldName = 'direccion'
      Origin = 'direccion'
      Size = 150
    end
  end
  object Conexion: TDCOMConnection
    ServerName = 'ServidorDatos.ServidorDCOM'
    BeforeConnect = ConexionBeforeConnect
    Left = 24
    Top = 8
  end
  object dtssClientes: TDataSource
    DataSet = cdsClientes
    Left = 200
    Top = 8
  end
  object cdsProductos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'producto'
        DataType = ftInteger
      end
      item
        Name = 'nombre_producto'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsProductosIndex1'
        Fields = 'producto'
        Options = [ixPrimary, ixUnique]
      end>
    Params = <>
    ProviderName = 'dtpProductos'
    RemoteServer = Conexion
    StoreDefs = True
    OnDeleteError = cdsProductosDeleteError
    Left = 96
    Top = 184
    object cdsProductosproducto: TIntegerField
      FieldName = 'producto'
      KeyFields = 'producto'
      Origin = 'producto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProductosnombre_producto: TStringField
      FieldName = 'nombre_producto'
      Origin = 'nombre_producto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsProductosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
    end
  end
  object dtsProductos: TDataSource
    DataSet = cdsProductos
    Left = 200
    Top = 184
  end
  object dtsDetalle_Factura: TDataSource
    DataSet = cdsDetalle_Factura
    Left = 200
    Top = 125
  end
  object dtsFacturas: TDataSource
    DataSet = cdsFacturas
    Left = 200
    Top = 66
  end
  object cdsDetalle_Factura: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'numero'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'producto'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'cantidad'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'valor'
        Attributes = [faRequired]
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'numero'
    MasterFields = 'numero'
    MasterSource = dtsFacturas
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
        Value = -1
      end>
    ProviderName = 'dtpDetalle_Factura'
    RemoteServer = Conexion
    StoreDefs = True
    AfterPost = cdsDetalle_FacturaAfterDelete
    AfterDelete = cdsDetalle_FacturaAfterDelete
    OnCalcFields = cdsDetalle_FacturaCalcFields
    OnPostError = cdsDetalle_FacturaPostError
    Left = 96
    Top = 125
    object cdsDetalle_Facturanumero: TIntegerField
      FieldName = 'numero'
      Origin = 'numero'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDetalle_Facturacantidad: TIntegerField
      FieldName = 'cantidad'
      Origin = 'cantidad'
      Required = True
    end
    object cdsDetalle_Facturaitem: TStringField
      FieldKind = fkLookup
      FieldName = 'item'
      LookupDataSet = cdsProductos
      LookupKeyFields = 'producto'
      LookupResultField = 'nombre_producto'
      KeyFields = 'producto'
      Required = True
      Size = 150
      Lookup = True
    end
    object cdsDetalle_Facturavalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = ',0. $;-,0. $'
    end
    object cdsDetalle_FacturaSUBT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUBT'
      DisplayFormat = ',0. $;-,0. $'
      Calculated = True
    end
    object cdsDetalle_Facturaproducto: TIntegerField
      FieldName = 'producto'
      Origin = 'producto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnChange = cdsDetalle_FacturaproductoChange
    end
    object cdsDetalle_FacturaSUMTOT: TAggregateField
      Alignment = taCenter
      FieldName = 'SUMTOT'
      ReadOnly = True
      Active = True
      DisplayFormat = ',0. $;-,0. $'
      Expression = 'Sum(CANTIDAD*VALOR)'
    end
  end
  object cdsFacturas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'numero'
        DataType = ftInteger
      end
      item
        Name = 'fecha'
        DataType = ftDate
      end
      item
        Name = 'cliente'
        DataType = ftInteger
      end
      item
        Name = 'total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'cliente'
    MasterFields = 'cliente'
    MasterSource = dtssClientes
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIENTE'
        ParamType = ptInput
        Value = -1
      end>
    ProviderName = 'dtpFacturas'
    RemoteServer = Conexion
    StoreDefs = True
    OnNewRecord = cdsFacturasNewRecord
    OnPostError = cdsFacturasPostError
    Left = 96
    Top = 66
    object cdsFacturasnumero: TIntegerField
      FieldName = 'numero'
      Origin = 'numero'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnChange = cdsFacturasnumeroChange
    end
    object cdsFacturascliente: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFacturasfecha: TDateField
      FieldName = 'fecha'
      Origin = 'fecha'
      Required = True
    end
    object cdsFacturastotal: TFloatField
      FieldName = 'total'
      Origin = 'total'
    end
    object cdsFacturasCARTOT: TAggregateField
      Alignment = taCenter
      FieldName = 'CARTOT'
      KeyFields = 'cliente'
      Active = True
      DisplayFormat = ',0. $;-,0. $'
      Expression = 'SUM(TOTAL)'
      GroupingLevel = 1
    end
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dtpConsulta'
    RemoteServer = Conexion
    Left = 96
    Top = 242
  end
end
