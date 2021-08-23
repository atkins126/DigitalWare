object ServidorDCOM: TServidorDCOM
  OldCreateOrder = False
  Height = 225
  Width = 476
  object FDConnection1: TFDConnection
    Params.Strings = (
      ''
      'DriverID=PG'
      'Port=5432'
      'Server=127.0.0.1')
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 32
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 120
    Top = 16
  end
  object qryProductos: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from public.PRODUCTOS')
    Left = 320
    Top = 80
    object qryProductosproducto: TIntegerField
      FieldName = 'producto'
      KeyFields = 'producto'
      Origin = 'producto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProductosnombre_producto: TStringField
      FieldName = 'nombre_producto'
      Origin = 'nombre_producto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 50
    end
    object qryProductosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
    end
  end
  object qryDetalle_Factura: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from public.DETALLE_FACTURA'
      'where numero = :numero')
    Left = 224
    Top = 80
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftLargeint
        ParamType = ptInput
        Value = '-1'
      end>
    object qryDetalle_Facturanumero: TIntegerField
      FieldName = 'numero'
      Origin = 'numero'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryDetalle_Facturaproducto: TIntegerField
      FieldName = 'producto'
      Origin = 'producto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryDetalle_Facturacantidad: TIntegerField
      FieldName = 'cantidad'
      Origin = 'cantidad'
    end
    object qryDetalle_Facturavalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
    end
  end
  object qryFacturas: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from public.CABEZA_FACTURA'
      'where cliente = :cliente')
    Left = 112
    Top = 80
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftLargeint
        ParamType = ptInput
        Value = -1
      end>
    object qryFacturasnumero: TIntegerField
      FieldName = 'numero'
      Origin = 'numero'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFacturasfecha: TDateField
      FieldName = 'fecha'
      Origin = 'fecha'
    end
    object qryFacturascliente: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFacturastotal: TFloatField
      FieldName = 'total'
      Origin = 'total'
    end
  end
  object qryClientes: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from public.clientes')
    Left = 32
    Top = 80
    object qryClientescliente: TIntegerField
      FieldName = 'cliente'
      Origin = 'cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryClientesnombre_cliente: TStringField
      FieldName = 'nombre_cliente'
      Origin = 'nombre_cliente'
      Size = 150
    end
    object qryClientesdireccion: TStringField
      FieldName = 'direccion'
      Origin = 'direccion'
      Size = 150
    end
  end
  object dtpProductos: TDataSetProvider
    DataSet = qryProductos
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges, poAllowCommandText]
    Left = 320
    Top = 144
  end
  object dtpDetalle_Factura: TDataSetProvider
    DataSet = qryDetalle_Factura
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges, poAllowCommandText]
    Left = 224
    Top = 144
  end
  object dtpFacturas: TDataSetProvider
    DataSet = qryFacturas
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges, poAllowCommandText]
    Left = 112
    Top = 144
  end
  object dtpClientes: TDataSetProvider
    DataSet = qryClientes
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges, poAllowCommandText]
    Left = 32
    Top = 144
  end
  object qryConsulta: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    Left = 400
    Top = 80
  end
  object dtpConsulta: TDataSetProvider
    DataSet = qryConsulta
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poDisableInserts, poPropogateChanges, poAllowCommandText]
    Left = 400
    Top = 144
  end
end
