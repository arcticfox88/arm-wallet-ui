class TokenListModel {
  TokenListModel({
    this.msg,
    this.code,
    this.data,
  });

  TokenListModel.fromJson(dynamic json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? msg;
  int? code;
  Data? data;

  TokenListModel copyWith({
    String? msg,
    int? code,
    Data? data,
  }) =>
      TokenListModel(
        msg: msg ?? this.msg,
        code: code ?? this.code,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.list,
    this.pagination,
  });

  Data.fromJson(dynamic json) {
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(TokenModel.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  List<TokenModel>? list;
  Pagination? pagination;

  Data copyWith({
    List<TokenModel>? list,
    Pagination? pagination,
  }) =>
      Data(
        list: list ?? this.list,
        pagination: pagination ?? this.pagination,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    return map;
  }
}

class Pagination {
  Pagination({
    this.totalRecord,
    this.currentPage,
    this.pageSize,
    this.totalPages,
    this.hasNext,
  });

  Pagination.fromJson(dynamic json) {
    totalRecord = json['totalRecord'];
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    hasNext = json['hasNext'];
  }

  int? totalRecord;
  int? currentPage;
  int? pageSize;
  int? totalPages;
  bool? hasNext;

  Pagination copyWith({
    int? totalRecord,
    int? currentPage,
    int? pageSize,
    int? totalPages,
    bool? hasNext,
  }) =>
      Pagination(
        totalRecord: totalRecord ?? this.totalRecord,
        currentPage: currentPage ?? this.currentPage,
        pageSize: pageSize ?? this.pageSize,
        totalPages: totalPages ?? this.totalPages,
        hasNext: hasNext ?? this.hasNext,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalRecord'] = totalRecord;
    map['currentPage'] = currentPage;
    map['pageSize'] = pageSize;
    map['totalPages'] = totalPages;
    map['hasNext'] = hasNext;
    return map;
  }
}

class TokenModel {
  TokenModel({
    this.id,
    this.tokenName,
    this.tokenType,
    this.symbol,
    this.chainName,
    this.chainAddress,
    this.decimal,
    this.iconUrl,
    this.isHot,
    this.isAuth,
    this.isRecommend,
    this.isMainNetwork,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.tokenId,
    this.tid,
    this.platform,
    this.contentEn,
    this.contentZh,
    this.link,
    this.issueSupply,
    this.issueAt,
    this.apiId,
  });

  TokenModel.fromJson(dynamic json) {
    id = json['id'];
    tokenName = json['token_name'];
    tokenType = json['token_type'];
    symbol = json['symbol'];
    chainName = json['chain_name'];
    chainAddress = json['chain_address'];
    decimal = json['decimal'];
    iconUrl = json['icon_url'];
    isHot = json['is_hot'];
    isAuth = json['is_auth'];
    isRecommend = json['is_recommend'];
    isMainNetwork = json['is_main_network'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    tokenId = json['token_id'];
    tid = json['tid'];
    platform = json['platform'];
    contentEn = json['content_en'];
    contentZh = json['content_zh'];
    link = json['link'];
    issueSupply = json['issue_supply'];
    issueAt = json['issue_at'];
    apiId = json['api_id'];
  }

  int? id;
  String? tokenName;
  int? tokenType;
  String? symbol;
  String? chainName;
  String? chainAddress;
  int? decimal;
  String? iconUrl;
  int? isHot;
  int? isAuth;
  int? isRecommend;
  int? isMainNetwork;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? tokenId;
  int? tid;
  String? platform;
  String? contentEn;
  String? contentZh;
  String? link;
  String? issueSupply;
  String? issueAt;
  String? apiId;

  TokenModel copyWith({
    int? id,
    String? tokenName,
    int? tokenType,
    String? symbol,
    String? chainName,
    String? chainAddress,
    int? decimal,
    String? iconUrl,
    int? isHot,
    int? isAuth,
    int? isRecommend,
    int? isMainNetwork,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? tokenId,
    int? tid,
    String? platform,
    String? contentEn,
    String? contentZh,
    String? link,
    String? issueSupply,
    String? issueAt,
    String? apiId,
  }) =>
      TokenModel(
        id: id ?? this.id,
        tokenName: tokenName ?? this.tokenName,
        tokenType: tokenType ?? this.tokenType,
        symbol: symbol ?? this.symbol,
        chainName: chainName ?? this.chainName,
        chainAddress: chainAddress ?? this.chainAddress,
        decimal: decimal ?? this.decimal,
        iconUrl: iconUrl ?? this.iconUrl,
        isHot: isHot ?? this.isHot,
        isAuth: isAuth ?? this.isAuth,
        isRecommend: isRecommend ?? this.isRecommend,
        isMainNetwork: isMainNetwork ?? this.isMainNetwork,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        tokenId: tokenId ?? this.tokenId,
        tid: tid ?? this.tid,
        platform: platform ?? this.platform,
        contentEn: contentEn ?? this.contentEn,
        contentZh: contentZh ?? this.contentZh,
        link: link ?? this.link,
        issueSupply: issueSupply ?? this.issueSupply,
        issueAt: issueAt ?? this.issueAt,
        apiId: apiId ?? this.apiId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token_name'] = tokenName;
    map['token_type'] = tokenType;
    map['symbol'] = symbol;
    map['chain_name'] = chainName;
    map['chain_address'] = chainAddress;
    map['decimal'] = decimal;
    map['icon_url'] = iconUrl;
    map['is_hot'] = isHot;
    map['is_auth'] = isAuth;
    map['is_recommend'] = isRecommend;
    map['is_main_network'] = isMainNetwork;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    map['token_id'] = tokenId;
    map['tid'] = tid;
    map['platform'] = platform;
    map['content_en'] = contentEn;
    map['content_zh'] = contentZh;
    map['link'] = link;
    map['issue_supply'] = issueSupply;
    map['issue_at'] = issueAt;
    map['api_id'] = apiId;
    return map;
  }
}
