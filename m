Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684553;
	b=k4TCZK3uuxrY3aAbj/gRCfRPdN6xbeefH+k8hzC16/XRokbTH/1jw+Aes0Nw7fqch8KV
	 5zBRQkWH0lxgBHEC/OnUjPmfGJAmQSVghOrclEqo5kNG0xSLHwTTRtnyCB6ZloVJQIiN8
	 8lj9LcwJfihFsPj6EkQnv2QJ2vIlx0uPovXQ3aOB0QT9XrEcJ1KMQ/wrLFFXeK39O2T8k
	 ZKzSxDE8vmHuOMEqfkh5Q/xGxw8Sua32nXMYgsnW2cLsanx+5UKr+r6dd+UzQ8By0ia3S
	 a8a8+36vctlSTs/B6LXgaxIhLGemEq+2jf7rPQ96fUW09YQtbFAjjj5EeC6h0wK/aZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684553;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:DKIM-Signature:Received:Received:
	 From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hnQtRhBVRID+XGd26F7tCL9qKOH1XE7ZFksKdllJ83A=;
	b=SHXZqnmZqOuP0OMOrfGw1T4jKY4LhIYvHDzQ1olQg5YpV5KZpv+SgN+Ws0DVMpR3r8hw
	 ppg70OJSYJh30QQHLgXLBNHHR95g5YuvLTEuJ8xo/fNyl30zHmlg+OkZSOzlGm2z+dr5U
	 4VSO0VO0Bbn6YZ+zKY0OzqTFaAfYCcMFeetUn7ZYM7p6nyk/9cPCTqkTwLcezV0yBAWkr
	 DcoZFoGc38vk4ct4K+6NOFjKNfvQ5Ba2JY4o/71PG2t7uDN2MBoG1PzOpB7lCCfjTEfzj
	 sqCbgMMsyPbu/moBJ6F3iJ0qJF7cSEVosMMvunFavBvCMH0UXbpaxp0kb9h2IoUKIAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=cDuBgymW;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=fKbE93s8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C61606A326;
	Thu, 26 Nov 2026 09:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C61606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=cDuBgymW;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=fKbE93s8
X-UUID: f6843e40e97911f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=hnQtRhBVRID+XGd26F7tCL9qKOH1XE7ZFksKdllJ83A=;
	b=cDuBgymWxjziZ9GTpyhC2p6WUixRGqJ1Vy2PiluuKeoGFGLklYsJfdzvVf4H7IZFjrvgWf0Pe0IhIPjo7KeNvzj5rBmLoOF38B/CH1YjcwJZHW1seWxwlJncim1vnVwgVohBO4WG+Qbj4wnC84kyLO536Pcwg2LqdG9MfrgXhkE=;
X-CID-CACHE: Type:Local,Time:202611261622+08,HitQuantity:5
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:248f8564-5912-4e25-9fae-7ca7504eae1c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:4ad3e5a4-9c91-4436-9e93-208691c4dbe5,B
	ulkID:nil,BulkQuantity:0,SF:80|83|102|110|111|836|865|888|898,TC:-5,Conten
	t:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f6843e40e97911f1a7aecdb2598be72c-20261126
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2025711074; Thu, 26 Nov 2026 17:15:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:15:44 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 17:15:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQoQks+4BxjwjKYRP+IhzHVm8rAIXvPQ/3zMg+mqR3RjrPSkklIEbEIB3+flObEP8a8V+PCP8XqbvqGCUBSAKCbYDi6lsXXiquo/xDqUe+WRbnGgKntwHNHARMjZWAFZbDcsM2qM/XtHU9sgC7IDz+1UqIv8l45pKPq1j13gQu1ASLqSJZNJttptlT75zK7q7weFIzYdQ8okVUyG3bBL1jge9BHhXwv7xyjAmnjeQGQIngiCxiPhWM+XzhADPI82V3/jgm115GN5AM+I9CTJZUmychJL7tzEvF31dw6QINBUUwgqQUwM+8WCKg2eWxsJiPr+rGTRUkk/VVgJ4udyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnQtRhBVRID+XGd26F7tCL9qKOH1XE7ZFksKdllJ83A=;
 b=AlTIUKlJxjTUI/hze3WexkV/MSmRqvrTxd7kbOskKDKrhRa38egSaEQMqX8/BV96APMF8P0XAHkpaBBcxUCoFu8LJTLcSPMAPyN0qLvIYtVBqi8drY2uyWgK6QCmtpiAx2roqB2cJGXAVJO3nsbpR5/PL9QDIe5L4wT4uMFNNNDEkPGFrUPPB/PRA0IFZ6o37JiQfJOYlr3i9T45N9tSS1jnXn7F+pO0X67/38JTisMjVL4BIb8If8RZC/ObC3OFd84TkHMrCcm2g4EK027HcnsXBAmwzaiCA407hWOt3M1jtSX+puLWAQCha7DgcUIcmk3IgTGDhldb5UB8kXve6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnQtRhBVRID+XGd26F7tCL9qKOH1XE7ZFksKdllJ83A=;
 b=fKbE93s8/RFdeNUROz9i3ZSVDghKZWWOwv088WuJYcjgEC8eDEBjLhOw31yABbNK2PmLb4kwAT2W0Cl43P5N7mDBdS9xjCxagVIFKnpPBSOn7d92kyzvr2RhQgmbydoIF6uh8g9Mm+UwhWm8W6PU2ftKc7p9BnOlYD6QU35HeEM=
Received: from SEYPR03MB7814.apcprd03.prod.outlook.com (2603:1096:101:178::13)
 by SEZPR03MB7441.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 09:15:24 +0000
Received: from SEYPR03MB7814.apcprd03.prod.outlook.com
 ([fe80::4c1f:6338:5176:9943]) by SEYPR03MB7814.apcprd03.prod.outlook.com
 ([fe80::4c1f:6338:5176:9943%4]) with mapi id 15.21.0639.012; Thu, 26 Nov 2026
 09:15:24 +0000
From: =?utf-8?B?RWNobyBaaGFuZyAo5byg546JKQ==?= <Echo.Zhang@mediatek.com>
To: Roman Vivchar <rva333@protonmail.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, MMDVFS Team
	<linux-mediatek@lists.infradead.org>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?TWluZy1GYW4gQ2hlbiAo6Zmz5piO5rGOKQ==?=
	<Ming-Fan.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Thread-Topic: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Thread-Index: AQHdfYarnY6PkYLQLUiznshoF7FyKQ==
Date: Thu, 26 Nov 2026 09:15:24 +0000
Message-ID: aec7ad7951653fc1494aead59c61de3c144316bc.camel@mediatek.com
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: SEYPR03MB7814:EE_|SEZPR03MB7441:EE_
x-ms-publictraffictype: Email
client-request-id: b8fa4862-0eef-461e-8f10-1d57c49a41bc
request-id: 602ddb46-6102-4ffd-b0d9-08df4b9dcde8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|261009223327099003|261009223027099003|261009221727099003|261009220027099003|261009221227099003|18092099006|3023799007|261028144727099003|56012099006|261022105027099003|11063799006|10067099003|261102130727099003|261021121427099003|261102123227099003|261026140227099003|261026121527099003;
x-microsoft-antispam-message-info: GrN8U4KpDvPy5EpWFS51tQ8S6OEbJd7HarUa6DlpmcvO7pcLwqzxNFKWZbQ5aiPA/bSrO7fq8GOW6JzhwR7ajESMhedHUhuMcH63a/L4n0wzom0VAy1N6ofhy1IuC+YawSCLV1O/pcHZf2RwJSL5nL1b0mslqde2L/w6pA+Sf4kV1o62uumf2/jd9r34B2brhMNI2zHCbvVa66M/3O9QjlQpsUN1ZrzK7zJ5temqF7pbH5phOkJBOlLklEllsdVpp1xVKw8q0HNiwL6YTXv88j0CupcrVNpObBbr/QNFf77kCXK22PkX9fuDHQj3R1omCSmMUsonHaZDD/tHhGdpivMuKmvoh714x4W582JETmWEf5fzocwLA4816++duAK5nWnmoPmW+EcMkY1EbVL4ryRVvIBnnTvNQ/Uhq1jGNcH597gpTzU6Yvy3QqjUlHc99MyaUZ0hLx/2v2f82PqoRM3pbYew54NJNUjKbYiwsY2OlcRx7rEeWB0nubjc1pexynnNwO8oTkkjYI4/tqU9+3aDNnYh7nHHXMV3bMbXabs6fgHUvSvOTEDHRlzM7stvAkaIMS2aa6/z4N3J0Gc9dbpGUvND1g8IkXnmAOO7lTo8trQsW3mKvJuZg5ijQC4r+LAElDGQihJE6SPloFgGyJFv7kmMTHu0f/m5EY8MQDI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009220027099003)(261009221227099003)(18092099006)(3023799007)(261028144727099003)(56012099006)(261022105027099003)(11063799006)(10067099003)(261102130727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0NldURHUGpETXR1ckJ3N256UlZZNFkyamIwNWEyQi9RQXVnRmE3dnkrYkZp?=
 =?utf-8?B?eGxOR2lERzgyODdsanNocjVickV0RUhDaGR5VVJmUUZ2M290NHNXTCtZQnNy?=
 =?utf-8?B?S1FlR0JxM2svd255aUJxblQ3OGlwRHJQcmtHdzVrY0xydmNhSm1LVTh6dEtq?=
 =?utf-8?B?Y3F6b1hSUFZpNXcwWGU0RkZ5TzBzeURRMm1IR3NyVjRUZE9NMWtJbWcwZHhQ?=
 =?utf-8?B?R3UzeXJ5RjZWdGtMbDQ0TU1rdjBOWTl3S1RkaVZBUEN1dk1LRFhEMG0vNWhQ?=
 =?utf-8?B?M3YyTmFEQTFTSFJqdUlHWWM2S01IVm5wM1RhTVJIc0hMaXJOekt5dkpRQWUv?=
 =?utf-8?B?RXBhWFk1cjdqQUM1bDFuQktndkFOVUJ6TFNJclFlUktsMDFLUWZHVHVieURp?=
 =?utf-8?B?eEQ0dC9LdUhodC96ald0L2VDM1B3Q3NIVTVLVnh4Ly9XSmFiU09keURkQi9C?=
 =?utf-8?B?RnowZzRKNnZYSjVvSjJsdTMwNGFhaVF2NXNGWnZyMTdjOFp1ZEd6Zjc1dWVZ?=
 =?utf-8?B?MC9Rc1ltLzQ0dDBRR3h1N1haUHJ3WFdXbkpDckN3T0l0YkUwV1RrR1VQM25a?=
 =?utf-8?B?eVNXZEdKYU81eXFjaklndTVhd2EzR0NJWTRMRTMyanFiTkxGbDJSeDhuOS9L?=
 =?utf-8?B?M3VZSGFFcy9SeDYrU2UweTFraWVXWDFhUFZycEx4U0tsNEJxV05ZT3lFM3FC?=
 =?utf-8?B?Z2xXK2VQWE9CQTl2VS9jRXhMbDJkOXNVbnZCLzlLSnBwWldrN0RSYWtxelly?=
 =?utf-8?B?WGoxREtldTh1cWZPMTducUdQS0VWdnlTZnpDOWlvMXFNcTdVQUV4VXEydDVT?=
 =?utf-8?B?M0J5Wi9hRUl0dnlFNXd6bGlDT0U4SzRJT1hOb0l3NmFCc2MxOHl2aHcwVm5L?=
 =?utf-8?B?aGZwRjRxNFVHbmNTdU05M2lHRTFEazRTSkQrZ3BuMy9pK1JLd2x0TTQ3ODVT?=
 =?utf-8?B?TmFzeHhxY0lQc3h2aVhaWFlmVEg5bEwxdlRCOWFsQ2RIZy9URGNVQk93UHdv?=
 =?utf-8?B?Q25QeUMxRGNOTWZtOVBHZElBd3czMUFENkFSWVZFckFRbStHL0crUEpCZ05v?=
 =?utf-8?B?NTFLNUx2KzFaTlJJbWxGL2NiZ2F3eVg3N09EckRmUE45SWoraGl5MVRUcW1p?=
 =?utf-8?B?RlZuRTRDOTFPOUhiRVR5RndyQlVVRXMxMDJEZ3FwemVPd0FOQlhmWkxBWlNN?=
 =?utf-8?B?ZEZZS2w5RFpJNjFLRUE4YlpqUzhJamJncko3SGN1a0ZlY0lyakcyZEM5RTJ4?=
 =?utf-8?B?VUljdVlEclhpMm5FTTgzejdhdkVGRnRxZFdzaUFoMlhrWGRSdVdRQ2M4WXh2?=
 =?utf-8?B?WGVqd0ZWWXdDWDNvYTR0N2I0VXUyTkZTSXdpTGcya2dyOVZBd3NpdzJzMmxT?=
 =?utf-8?B?K0ErOTRFR3JnUDZ6WkFrUFI2Mi9HZjVEeVVsbytOK1cyQ2NFQkxPSmZSK2tq?=
 =?utf-8?B?UFZDNW9yRzZLOEQwck85WnpIeVJ2M0tkOHRQQUdqNE82QVNNU1FsRzdyUDZz?=
 =?utf-8?B?TG01MUVMZks5ZW04RW1meEtRdGR5SU8zc3dhNmlZanhWejJNWHFaYmxHUW8y?=
 =?utf-8?B?eUJQeXoramxXL0xwYWc0bVBkOSszMVdDNVhLeGJ6Ri9aZFZ5RVRnUllMT2Zm?=
 =?utf-8?B?QlUyazczNTU4N3hkOXNhdGsrK0RLUzRMaTJLcEtwUWVjb0JHa1pJUG02eGV5?=
 =?utf-8?B?a0ZLRGVJdWFXaVlFeXg0T3NsbjB0Nmhaakd4Y3QrWEtqQmY1Zk1uVmZ1UFJH?=
 =?utf-8?B?K201bi84Rjg1UVpPL0N5aU81TmV5SkxMNDN0YStGeTBaRFd6VlhTYkVCOFl1?=
 =?utf-8?B?ZjN5b0ZsSUpEbGZUUFRGZzFpVmxEMjVTU010Q3diK0ViS0IvcndBeGRWK201?=
 =?utf-8?B?b09rZzExMDBZM1QwdS9DUDZjNy9ZNTVMUld6ME42M2hqMUNkZDlhQ2lmQXNl?=
 =?utf-8?B?UTNxTThHak1BUVMrdWM1NlE5MGpWUXVISUlxQ3FhaEdYbXJ3R1VJQnB0QWE0?=
 =?utf-8?B?aGUrY3ZnbElrajVJVi9ERGN6MzJLMFZXamp3YW12UUY5QVM2L3JkZTh4Q1ZC?=
 =?utf-8?B?ZGhtb2FCVE80bjNZYi9zZ1UraklMKzZYVVdUay8yaGpBc1BnWHpsdmpuWmpW?=
 =?utf-8?B?akNFVmNmQVR4OHEzQitnMWhQbk4vTTJIS0JVUGxIYUpSd3FDRmtSZFhWUmpp?=
 =?utf-8?B?YytpWVRWUFk3TmozNmJ5RXQvWlVsQVFhWXdmWnpBcnhKejFaNVB3VWZZMVQz?=
 =?utf-8?B?eGRPSGxJNGhlOU1qUnRNU1Q5TUtUdW9wMGxxMTd4NWdEWFpFNFFrcVVrQmhI?=
 =?utf-8?B?OTdHa2ZvZTdUSkFyVDh0TTlDSFhzdTlnNVUramsvTVVKbk9ZUVJqUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QwxdQ4zVR3OtRP84gi8Se3dyL1Sk14bJfol/qdqGWO4QwkojSZVZMJWcmI57CQqdQB00jeFQZhapopTmbn1I9G9+Zi8Yc6WJEiAgd0/8QtgtSRd9VbB+WFCXTRZlgjFn8Gssbi4+tHYr80XhY6fJ9i/eWhlsjaYxGBG8vNevpc+CzaTPXrN4JIqD1kZLw0KeJXqp3KcD1mWqRzn9qtfwbuBUZn1MRYLaW6QOJ/G3UfgwS9uyrlGqXqCMTIiyybvpfA5Rjxdut59aQDJI+fdzprwR3dyI6D1Br0vss0esu6UnaeSNd6XxwvVdzual3x3jV1AMep1hDwqTuv2ate5SDg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7814.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602ddb46-6102-4ffd-b0d9-08df4b9dcde8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 09:15:24.5746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUuPl9Rwz814/IkhwqlY/ZjAhInxHFQ8lNPpg+j+otSxIoXDG91A+K6sWZ2/iHztelCk23Wybk0NSXi5ZubBeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7441

T24g5LiJLCAyMDI2LTExLTI1IGF0IDA4OjM4ICswMDAwLCBSb21hbiBWaXZjaGFyIHdyb3RlOgo+
IAo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4KPiAKPiAKPiBPbiBXZWRuZXNkYXksIE5vdmVtYmVyIDI1dGgsIDIwMjYgYXQgODowMSBB
TSwgRWNobyBaaGFuZwo+IDxlY2hvLnpoYW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4gCj4gPiBB
ZGQgdGhlIFZDUCB0cmFuc3BvcnQgdXNlZCBieSBNTURWRlMgdG8gbWFwIEFQIGFuZCBmaXJtd2Fy
ZSBzaGFyZWQKPiA+IG1lbW9yeSwgbWFuYWdlIGZlYXR1cmUgcG93ZXIgcmVmZXJlbmNlcyBhbmQg
c2VuZCBJUEkgY29tbWFuZHMuCj4gPiAKPiA+IFdhaXQgZm9yIFZDUCByZWFkaW5lc3MgYW5kIGhh
bmRsZSB0aGUgc2VsZWN0ZWQgTU1VUCBvciBWQ1AgUkVBRFkKPiA+IG5vdGlmaWNhdGlvbiB0byBp
bml0aWFsaXplIGZpcm13YXJlIGFmdGVyIGJvb3QgYW5kIHJlc3VtZS4KPiA+IFNlcmlhbGl6ZQo+
ID4gSVBJIHRyYW5zYWN0aW9ucyB3aGlsZSBzaGFyZWQgbWVtb3J5IGFuZCBhY2tub3dsZWRnbWVu
dCBzdGF0ZSBhcmUKPiA+IGluCj4gPiB1c2UuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEVjaG8g
WmhhbmcgPGVjaG8uemhhbmdAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gCj4gLi4uCj4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1kdmZzL21tZHZmcy1jb3JlLmMKPiA+
IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1kdmZzL21tZHZmcy1jb3JlLmMKPiA+IGluZGV4IGMz
MmZhMTE1NTdhZi4uMzM4OGE1YTNhMTQ1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbW1kdmZzL21tZHZmcy1jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVr
L21tZHZmcy9tbWR2ZnMtY29yZS5jCj4gPiBAQCAtNywyMiArNywyMyBAQAo+ID4gCj4gPiDCoCNp
bmNsdWRlIDxsaW51eC9hdG9taWMuaD4KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRl
ci5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ID4gwqAjaW5jbHVkZSA8bGludXgv
ZGV2aWNlLmg+Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiA+IMKgI2luY2x1ZGUgPGxp
bnV4L2lvLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4KPiA+IMKgI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPgo+ID4gwqAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KPiA+IC0jaW5j
bHVkZSA8bGludXgvbm90aWZpZXIuaD4KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiDC
oCNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVtb3RlcHJvYy9tdGtfdmNwX3B1
YmxpYy5oPgo+ID4gwqAjaW5jbHVkZSA8bGludXgvc2NoZWQvY2xvY2suaD4KPiA+IMKgI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgo+ID4gLSNp
bmNsdWRlIDxsaW51eC9zdXNwZW5kLmg+Cj4gPiAtI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5o
Pgo+ID4gCj4gPiDCoCNpbmNsdWRlICJtbWR2ZnMtaW50ZXJuYWwuaCIKPiA+ICsjaW5jbHVkZSAi
bW1kdmZzLXVwLXByaXYuaCIKPiA+IAo+ID4gwqBzdGF0aWMgaW50IG1tZHZmc19yZWdpc3Rlcl9k
ZXZpY2Uoc3RydWN0IG1tZHZmc19kZXZpY2UgKm1tZHZmcyk7Cj4gPiDCoHN0YXRpYyB2b2lkIG1t
ZHZmc191bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3QgbW1kdmZzX2RldmljZQo+ID4gKm1tZHZmcyk7
Cj4gPiBAQCAtMzQsMTQgKzM1LDEzIEBAIHN0cnVjdCBtbWR2ZnNfZGV2aWNlCj4gPiAqbW1kdmZz
X2ZpbmRfZGV2aWNlX2FueSh2b2lkKQo+ID4gwqB7Cj4gPiDCoMKgwqDCoMKgIHJldHVybgo+ID4g
bW1kdmZzX2ZpbmRfZGV2aWNlX2J5X3ZlcnNpb24oTU1EVkZTX1ZFUlNJT05fSFdDQ0ZfRFZGU19W
T1RFUik7Cj4gPiDCoH0KPiA+IC1FWFBPUlRfU1lNQk9MX0dQTChtbWR2ZnNfZmluZF9kZXZpY2Vf
YW55KTsKPiA+IAo+ID4gwqAvKioKPiA+IMKgICogbW1kdmZzX2dldF92ZXJzaW9uIC0gR2V0IE1N
RFZGUyB2b3RpbmcgbWVjaGFuaXNtIHR5cGUKPiA+IMKgICoKPiA+IMKgICogUmV0dXJuOgo+ID4g
wqAgKsKgwqAgMCAtIE5vIGhhcmR3YXJlIHZvdGVyCj4gPiAtICrCoMKgIDEgLSBIV0NDRiBEVkZT
IHZvdGVyCj4gPiArICrCoMKgIDEgLSBIV0NDRiBEVkZTIHZvdGVyIChWQ1AgSVBJIHdpdGggTU1V
UCBTUkFNKQo+ID4gwqAgKi8KPiA+IMKgdTMyIG1tZHZmc19nZXRfdmVyc2lvbih2b2lkKQo+ID4g
wqB7Cj4gPiBAQCAtOTYsNyArOTYsOCBAQCBzdGF0aWMgaW50IG1tZHZmc192YWxpZGF0ZV90b3Bv
bG9neShzdHJ1Y3QKPiA+IG1tZHZmc19kZXZpY2UgKm1tZHZmcykKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAobXV4LT5mcmVxX251bSA9PSAwIHx8IG11eC0+ZnJlcV9udW0gPgo+ID4gTU1EVkZTX01BWF9M
RVZFTFMpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG11eC0+ZnJlcV9udW0g
PT0gMCB8fCBtdXgtPmZyZXFfbnVtID4gcmMtCj4gPiA+bGV2ZWxfbnVtIHx8Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXV4LT5mcmVxX251bSA+IE1NRFZGU19NQVhfTEVW
RUxTKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW1k
dmZzX2VycihtbWR2ZnMtPmRldiwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIk1VWCAlZCAoJXMpOiBpbnZhbGlkIGZy
ZXFfbnVtOgo+ID4gJWRcbiIsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGksIG11eC0+bmFtZSwgbXV4LT5mcmVxX251
bSk7Cj4gPiBAQCAtMTEyLDEwICsxMTMsMTEgQEAgc3RhdGljIGludCBtbWR2ZnNfdmFsaWRhdGVf
dG9wb2xvZ3koc3RydWN0Cj4gPiBtbWR2ZnNfZGV2aWNlICptbWR2ZnMpCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGogPiAwICYmIG11eC0+ZnJlcVtqXSA8
PSBtdXgtPmZyZXFbaiAtCj4gPiAxXSkgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1tZHZmc193YXJuKG1tZHZmcy0+ZGV2LAo+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJNVVggJWQgKCVzKTogZnJlcSBub3QKPiA+IGFz
Y2VuZGluZzogZnJlcVslZF09JWxsdSA8PSBmcmVxWyVkXT0lbGx1XG4iLAo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGksIG11eC0+bmFtZSwgaiwgbXV4LQo+ID4gPmZyZXFbal0sCj4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaiAtIDEsIG11eC0+ZnJlcVtqIC0gMV0pOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1t
ZHZmc19lcnIobW1kdmZzLT5kZXYsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJNVVggJWQg
KCVzKTogZnJlcSBub3QKPiA+IGFzY2VuZGluZzogZnJlcVslZF09JWxsdSA8PSBmcmVxWyVkXT0l
bGx1XG4iLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpLCBtdXgtPm5hbWUsIGosIG11eC0K
PiA+ID5mcmVxW2pdLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBqIC0gMSwgbXV4LT5mcmVx
W2ogLSAxXSk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gCj4gV2h5IHRoaXMgY2FuJ3QgYmUgaW4g
dGhlIHByZXZpb3VzIHBhdGNoPwo+IAo+IC4uLgo+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL21lZGlhdGVrL21tZHZmcy9tbWR2ZnMtdmNwLmMKPiA+IGIvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbW1kdmZzL21tZHZmcy12Y3AuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZmM2ZGIxYzg5Mjk0Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tbWR2ZnMvbW1kdmZzLXZjcC5jCj4gCj4gLi4uCj4gCj4gPiAr
LyoKPiA+ICsgKiBtbWR2ZnNfZ2V0X2Jvb3Rtb2RlIC0gR2V0IHN5c3RlbSBib290IG1vZGUKPiA+
ICsgKgo+ID4gKyAqIFF1ZXJ5IGJvb3QgbW9kZSBmcm9tIGRldmljZSB0cmVlIC9jaG9zZW4gbm9k
ZQo+ID4gKyAqLwo+ID4gK3N0YXRpYyB2b2lkIG1tZHZmc19nZXRfYm9vdG1vZGUodm9pZCkKPiA+
ICt7Cj4gPiArwqDCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpucF9jaG9zZW47Cj4gPiArwqDC
oMKgwqAgc3RydWN0IHRhZ19ib290bW9kZSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHUzMiBzaXplOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgdGFnOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgYm9vdG1vZGU7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHUzMiBib290dHlwZTsKPiA+ICvCoMKgwqDCoCB9ICp0YWc7Cj4gPiArCj4gPiAr
wqDCoMKgwqAgaWYgKGJvb3Rtb2RlIDwgVU5LTk9XTl9CT09UKQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4gPiArCj4gPiArwqDCoMKgwqAgbnBfY2hvc2VuID0gb2ZfZmlu
ZF9ub2RlX2J5X3BhdGgoIi9jaG9zZW4iKTsKPiA+ICvCoMKgwqDCoCBpZiAoIW5wX2Nob3Nlbikg
ewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290bW9kZSA9IE5PUk1BTF9CT09UOwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4gPiArwqDCoMKgwqAgfQo+ID4g
Kwo+ID4gK8KgwqDCoMKgIHRhZyA9IChzdHJ1Y3QgdGFnX2Jvb3Rtb2RlICopb2ZfZ2V0X3Byb3Bl
cnR5KG5wX2Nob3NlbiwKPiA+ICJhdGFnLGJvb3QiLCBOVUxMKTsKPiA+ICvCoMKgwqDCoCBvZl9u
b2RlX3B1dChucF9jaG9zZW4pOwo+ID4gKwo+ID4gK8KgwqDCoMKgIGlmICh0YWcpCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb3Rtb2RlID0gdGFnLT5ib290bW9kZTsKPiA+ICvCoMKg
wqDCoCBlbHNlCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb3Rtb2RlID0gTk9STUFM
X0JPT1Q7Cj4gPiArfQo+IAo+IE5vLiBQbGVhc2UgZG9uJ3QgYWRkIHlvdXIgZG93bnN0cmVhbSBj
b2RlLgo+IAo+IEknbGwgc3RvcCBoZXJlLiBUaGlzIHBhdGNoIG1vZGlmaWVzIHRvbyBtYW55IHRo
aW5ncyBmcm9tIHRoZSBwcmV2aW91cwo+IG9uZSwgYW5kIHRoZSBzZXJpZXMgb3ZlcmFsbCBuZWVk
cyBtb3JlIGNsZWFudXAuCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFuCgpIaSBSb21hbiwKCkFn
cmVlZC4gVGhlIHRvcG9sb2d5IHZhbGlkYXRpb24gY29ycmVjdGlvbiBiZWxvbmdzIGluIHRoZSBw
YXRjaCB0aGF0CmZpcnN0IGFkZHMgdGhlIHZhbGlkYXRpb24gY29kZS4gSSB3aWxsIG1vdmUgaXQg
dGhlcmUgaW4gdjIgaW5zdGVhZCBvZgphZGRpbmcgY29kZSBpbiBvbmUgcGF0Y2ggYW5kIGZpeGlu
ZyBpdCBpbiB0aGUgbmV4dC4KCkkgd2lsbCBhbHNvIHJlbW92ZSB0aGUgZG93bnN0cmVhbSBib290
bW9kZSBoYW5kbGluZywgaW5jbHVkaW5nIHRoZQphdGFnLGJvb3QgbG9va3VwIGFuZCB0aGUgcmVj
b3ZlcnktbW9kZSBJUEkgc2hvcnRjdXQuIFRoZSBWQ1AgYmFja2VuZApwYXRjaCBjaGFuZ2VzIHRv
byBtdWNoIG9mIHRoZSBwcmVjZWRpbmcgY29yZSBwYXRjaDsgSSB3aWxsIHJld29yayB0aGUKc3Bs
aXQgYW5kIHJlbW92ZSBkb3duc3RyZWFtLXNwZWNpZmljIGNvZGUgYmVmb3JlIHJlc3VibWl0dGlu
Zy4KClRoYW5rcywKRWNobwo=
