import 'dart:convert';

ShowOrderModel showOrderModelFromJson(String str) =>
    ShowOrderModel.fromJson(json.decode(str));
String showOrderModelToJson(ShowOrderModel data) => json.encode(data.toJson());

class ShowOrderModel {
  ShowOrderModel({
    bool? error,
    List<Orders>? orders,
  }) {
    _error = error;
    _orders = orders;
  }

  ShowOrderModel.fromJson(dynamic json) {
    _error = json['error'];
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
  }
  bool? _error;
  List<Orders>? _orders;
  ShowOrderModel copyWith({
    bool? error,
    List<Orders>? orders,
  }) =>
      ShowOrderModel(
        error: error ?? _error,
        orders: orders ?? _orders,
      );
  bool? get error => _error;
  List<Orders>? get orders => _orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));
String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    String? orderid,
    Address? address,
    List<Orderdetails>? orderdetails,
  }) {
    _orderid = orderid;
    _address = address;
    _orderdetails = orderdetails;
  }

  Orders.fromJson(dynamic json) {
    _orderid = json['orderid'];
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['orderdetails'] != null) {
      _orderdetails = [];
      json['orderdetails'].forEach((v) {
        _orderdetails?.add(Orderdetails.fromJson(v));
      });
    }
  }
  String? _orderid;
  Address? _address;
  List<Orderdetails>? _orderdetails;
  Orders copyWith({
    String? orderid,
    Address? address,
    List<Orderdetails>? orderdetails,
  }) =>
      Orders(
        orderid: orderid ?? _orderid,
        address: address ?? _address,
        orderdetails: orderdetails ?? _orderdetails,
      );
  String? get orderid => _orderid;
  Address? get address => _address;
  List<Orderdetails>? get orderdetails => _orderdetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderid'] = _orderid;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_orderdetails != null) {
      map['orderdetails'] = _orderdetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Orderdetails orderdetailsFromJson(String str) =>
    Orderdetails.fromJson(json.decode(str));
String orderdetailsToJson(Orderdetails data) => json.encode(data.toJson());

class Orderdetails {
  Orderdetails({
    num? id,
    num? userId,
    String? orderId,
    String? intruction,
    String? prodid,
    String? productname,
    dynamic goldPurity,
    dynamic bangleSize,
    dynamic weight,
    String? image,
    dynamic variant,
    num? quantity,
    dynamic price,
    String? addressId,
    dynamic discountedPrice,
    dynamic subTotal,
    String? activeStatus,
    String? confirmedStatus,
    String? confirmedStatusDate,
    String? readyStatus,
    String? readyStatusDate,
    String? deliveredStatus,
    String? deliveredStatusDate,
    String? cancelStatus,
    String? cancelStatusDate,
    String? createdAt,
    String? updatedAt,
    String? categoryName,
  }) {
    _id = id;
    _userId = userId;
    _orderId = orderId;
    _intruction = intruction;
    _prodid = prodid;
    _productname = productname;
    _goldPurity = goldPurity;
    _bangleSize = bangleSize;
    _weight = weight;
    _image = image;
    _variant = variant;
    _quantity = quantity;
    _price = price;
    _addressId = addressId;
    _discountedPrice = discountedPrice;
    _subTotal = subTotal;
    _activeStatus = activeStatus;
    _confirmedStatus = confirmedStatus;
    _confirmedStatusDate = confirmedStatusDate;
    _readyStatus = readyStatus;
    _readyStatusDate = readyStatusDate;
    _deliveredStatus = deliveredStatus;
    _deliveredStatusDate = deliveredStatusDate;
    _cancelStatus = cancelStatus;
    _cancelStatusDate = cancelStatusDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _categoryName = categoryName;
  }

  Orderdetails.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _orderId = json['order_id'];
    _intruction = json['intruction'];
    _prodid = json['prodid'];
    _productname = json['productname'];
    _goldPurity = json['gold_purity'];
    _bangleSize = json['bangle_size'];
    _weight = json['weight'];
    _image = json['image'];
    _variant = json['variant'];
    _quantity = json['quantity'];
    _price = json['price'];
    _addressId = json['address_id'];
    _discountedPrice = json['discounted_price'];
    _subTotal = json['sub_total'];
    _activeStatus = json['active_status'];
    _confirmedStatus = json['confirmed_status'];
    _confirmedStatusDate = json['confirmed_status_date'];
    _readyStatus = json['ready_status'];
    _readyStatusDate = json['ready_status_date'];
    _deliveredStatus = json['delivered_status'];
    _deliveredStatusDate = json['delivered_status_date'];
    _cancelStatus = json['cancel_status'];
    _cancelStatusDate = json['cancel_status_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _categoryName = json['category_name'];
  }

  num? _id;
  num? _userId;
  String? _orderId;
  String? _intruction;
  String? _prodid;
  String? _productname;
  dynamic _goldPurity;
  dynamic _bangleSize;
  dynamic _weight;
  String? _image;
  dynamic _variant;
  num? _quantity;
  dynamic _price;
  String? _addressId;
  dynamic _discountedPrice;
  dynamic _subTotal;
  String? _activeStatus;
  String? _confirmedStatus;
  String? _confirmedStatusDate;
  String? _readyStatus;
  String? _readyStatusDate;
  String? _deliveredStatus;
  String? _deliveredStatusDate;
  String? _cancelStatus;
  String? _cancelStatusDate;
  String? _createdAt;
  String? _updatedAt;
  String? _categoryName;

  num? get id => _id;
  num? get userId => _userId;
  String? get orderId => _orderId;
  String? get intruction => _intruction;
  String? get prodid => _prodid;
  String? get productname => _productname;
  dynamic get goldPurity => _goldPurity;
  dynamic get bangleSize => _bangleSize;
  dynamic get weight => _weight;
  String? get image => _image;
  dynamic get variant => _variant;
  num? get quantity => _quantity;
  dynamic get price => _price;
  String? get addressId => _addressId;
  dynamic get discountedPrice => _discountedPrice;
  dynamic get subTotal => _subTotal;
  String? get activeStatus => _activeStatus;
  String? get confirmedStatus => _confirmedStatus;
  String? get confirmedStatusDate => _confirmedStatusDate;
  String? get readyStatus => _readyStatus;
  String? get readyStatusDate => _readyStatusDate;
  String? get deliveredStatus => _deliveredStatus;
  String? get deliveredStatusDate => _deliveredStatusDate;
  String? get cancelStatus => _cancelStatus;
  String? get cancelStatusDate => _cancelStatusDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['order_id'] = _orderId;
    map['intruction'] = _intruction;
    map['prodid'] = _prodid;
    map['productname'] = _productname;
    map['gold_purity'] = _goldPurity;
    map['bangle_size'] = _bangleSize;
    map['weight'] = _weight;
    map['image'] = _image;
    map['variant'] = _variant;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['address_id'] = _addressId;
    map['discounted_price'] = _discountedPrice;
    map['sub_total'] = _subTotal;
    map['active_status'] = _activeStatus;
    map['confirmed_status'] = _confirmedStatus;
    map['confirmed_status_date'] = _confirmedStatusDate;
    map['ready_status'] = _readyStatus;
    map['ready_status_date'] = _readyStatusDate;
    map['delivered_status'] = _deliveredStatus;
    map['delivered_status_date'] = _deliveredStatusDate;
    map['cancel_status'] = _cancelStatus;
    map['cancel_status_date'] = _cancelStatusDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['category_name'] = _categoryName;
    return map;
  }
}

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    num? id,
    String? userId,
    String? cname,
    String? mobile,
    String? landmark,
    String? address1,
    String? state,
    String? city,
    num? pincode,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _cname = cname;
    _mobile = mobile;
    _landmark = landmark;
    _address1 = address1;
    _state = state;
    _city = city;
    _pincode = pincode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Address.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _cname = json['cname'];
    _mobile = json['mobile'];
    _landmark = json['landmark'];
    _address1 = json['address_1'];
    _state = json['state'];
    _city = json['city'];
    _pincode = json['pincode'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _userId;
  String? _cname;
  String? _mobile;
  String? _landmark;
  String? _address1;
  String? _state;
  String? _city;
  num? _pincode;
  String? _createdAt;
  String? _updatedAt;
  Address copyWith({
    num? id,
    String? userId,
    String? cname,
    String? mobile,
    String? landmark,
    String? address1,
    String? state,
    String? city,
    num? pincode,
    String? createdAt,
    String? updatedAt,
  }) =>
      Address(
        id: id ?? _id,
        userId: userId ?? _userId,
        cname: cname ?? _cname,
        mobile: mobile ?? _mobile,
        landmark: landmark ?? _landmark,
        address1: address1 ?? _address1,
        state: state ?? _state,
        city: city ?? _city,
        pincode: pincode ?? _pincode,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get userId => _userId;
  String? get cname => _cname;
  String? get mobile => _mobile;
  String? get landmark => _landmark;
  String? get address1 => _address1;
  String? get state => _state;
  String? get city => _city;
  num? get pincode => _pincode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['cname'] = _cname;
    map['mobile'] = _mobile;
    map['landmark'] = _landmark;
    map['address_1'] = _address1;
    map['state'] = _state;
    map['city'] = _city;
    map['pincode'] = _pincode;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
