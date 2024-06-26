import 'dart:io';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/models/property/create_property_model.dart';
import 'package:mulki_zerin/src/models/property/properties_list_result.dart';
import 'package:mulki_zerin/src/models/property/property_filter_model.dart';
import 'package:mulki_zerin/src/resources/api_provider/property_api_provider.dart';

class PropertyRepository{
  PropertyApiProvider propertyApiProvider;

  PropertyRepository({PropertyApiProvider apiProvider}){
    this.propertyApiProvider = apiProvider ?? getIt.get<PropertyApiProvider>();
  }

  Future createNewPropertyAsync(String accessToken, CreatePropertyModel bodyModel, List<File> files) => propertyApiProvider.createNewPropertyAsync(accessToken, bodyModel, files);

  Future<PropertiesListResult> fetchPropertiesListAsync(String accessToken, PropertyFilterModel filterModel, int page) => propertyApiProvider.fetchPropertiesListAsync(accessToken, filterModel, page);
}


