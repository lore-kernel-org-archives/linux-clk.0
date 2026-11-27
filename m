Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795748337;
	b=1+fgkeBVS+kAgOIUAnem+5aX8ehHgfkzNiVsrVaTsk/MmY8rEh8a0OZ4zQbRep6mwysH
	 5pP30hfuoxHrqLuV9XPsrtFFpaxVL8nd3KjlzlgRKeniOkZ8NeLoMIh+DXQ158+Iad8GC
	 7uUqM6/kAriA5g7aauldM2AHlp672ehEMRIVELutsP8Hqi4/DkMMCIXwN5j5Xp2WAA2xy
	 A+L1rRQD0EBNaZF0T19LdcWEgXM1R2oYFjwXqzriA4cMAN9DsN+zehB98WQ1F09ZlVx0W
	 sw8hh34gZBhY6TnL/b6cUwCjDaSLg0MC+IcYKBd7dkvRyCQwddjNp3LM1lCj7PXkIwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748337;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BCQus/wSCHMsrknsuDSs4PW783Tugmi+XtShyGJfVrI=;
	b=tnbrft6bUoDzSIfCwGPi++Ybr6h4HjqtRXjMtAzywva4/juLn4qvrT8WJfg+9rGO30JV
	 FWCk2CHKmSLvLm+GQdtkQ8my/UrH3dLnH60n+LSNgTgyEosYF9lltH3l+WH4tWlJ2n9Dw
	 1SAcEo9lz1xXTlOofi9dI05GW1WPUzwQJIHqwj8NIpZYqNwovGNfI4/kYW9Sio4eFpOxk
	 Btbj7S0hEV6J/IclS6z4be5bnE3oTrwuYxJg+FpD4k3Gg+L9EXsfOhkJhna/EkVmOoIna
	 1RdHCzyVqB5lOUbSKQ/B/m2JjTc6Vm6QuBs4o36fQNVXyMLXt3uxIuCu0+BcaNPoZXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=teh3TSgF;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=rgTyPyUH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084A606A31C;
	Fri, 27 Nov 2026 02:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E084A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=teh3TSgF;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=rgTyPyUH
X-UUID: 775f9af2ea0e11f1a7aecdb2598be72c-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BCQus/wSCHMsrknsuDSs4PW783Tugmi+XtShyGJfVrI=;
	b=teh3TSgFeSmj/STmfstFn9IG1bXbCJz8TYI/g+a/U9fs/8+oMiqLQX4tqovAECv8Nyheik2ohbnEy6ZVez6xzr14Z7AjJAfrilZJUSglbPNtG+kQ8Y57MgeseYuSdYrjDHLSY++mgp+NJwVfg/ys8U7ZnNDScrLmzoXHEmmqu1w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ba570ce6-a4c6-4b68-a77d-96ed853444d3,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:b0318ac,CLOUDID:7b397fbb-b9da-4397-b15a-78b988d0f104,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:4|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 775f9af2ea0e11f1a7aecdb2598be72c-20261127
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1542613632; Fri, 27 Nov 2026 10:58:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 10:58:46 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Fri, 27 Nov 2026 10:58:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROLsj6cwaodk/ORqU8Mq+WkKg/rLz9yrrvtOdTs8HdKj4p6etP6LaX5/Tq66H+HBTl+N94Q8rOlLiTPLLmIMV6sVwhgekbn4t+JyYKCTmGlpRMxYPEGSVAP3qP1b+uCVlxaqh1l5AlpkTSA9owX3mmoAas5lOvuVYhS8di1Vzq3a4oHCM9/Of07eufe7uVrfpN8uPxaTg2G3ll70KVxuoS5Sn1VHnmY0m1oaodYKzJGsbKPmwaw9X8/GQ/lecVIGWjQqA/Ps7+KKrwrj/3DnBH182pAfgTLOoqC6iGroGgyDs0en8Veeb4zOI9yp7XWS6oeZyeWCEYl9u4dCAKCtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCQus/wSCHMsrknsuDSs4PW783Tugmi+XtShyGJfVrI=;
 b=KcIw/Xsv1Q/Jfs4K4s9dZ9iB+jxIckUYkH0AOljZxgRxYKfAYDHFitKdDz95oKPXiOK8da5OLDG2qQVO50Zf2k2ez2CnGXYoioPESZOBA3FiFg2DWtsJpqalGeVWrIwR6+WEA+oo8tPJ4wg2SzE+bXsbI0LnlcbM5GasCE361MdJMn85t1BCq569hChqxd+F3KMOfB7+Yhvii1it6QVMxCVUoRVnbTmEhJFINNZsJkrAyr6BAhWoaaj57kr6sxt1WGulrGJd4Ho67QgEyz7AXXWlwpMAMKEY5Hf11yDFseOR711o9fSayZ8HHxrP1E+Bv9Rj62aNNdQFExCsxWScdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCQus/wSCHMsrknsuDSs4PW783Tugmi+XtShyGJfVrI=;
 b=rgTyPyUHBepf1xKGUOseDFZUGgxaFAaTL/KTpmpejkfsd2WkoW3EBNA3QMCwW6Je86li3HtFQu+qxvPXziV5FQdY46sJ7rh6QNbtXb1pNeV/agm7BPZM1gHvjVBLdFGMK42wE90ibk38unn7LG7jRcpZXHXH+7w+u4gCQwT9WOU=
Received: from SEYPR03MB7814.apcprd03.prod.outlook.com (2603:1096:101:178::13)
 by SEZPR03MB8634.apcprd03.prod.outlook.com with HTTP via P2P; Fri, 27 Nov
 2026 02:58:42 +0000
Received: from SEYPR03MB7814.apcprd03.prod.outlook.com
 ([fe80::4c1f:6338:5176:9943]) by SEYPR03MB7814.apcprd03.prod.outlook.com
 ([fe80::4c1f:6338:5176:9943%4]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 02:58:42 +0000
From: =?utf-8?B?RWNobyBaaGFuZyAo5byg546JKQ==?= <Echo.Zhang@mediatek.com>
To: "bengris32@protonmail.ch" <bengris32@protonmail.ch>
CC: "robh@kernel.org" <robh@kernel.org>, "justinstitt@google.com"
	<justinstitt@google.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	=?utf-8?B?TWluZy1GYW4gQ2hlbiAo6Zmz5piO5rGOKQ==?=
	<Ming-Fan.Chen@mediatek.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>, "morbo@google.com" <morbo@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Thread-Topic: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Thread-Index: AQHdfKJj9hR096u0pEC2G0gi+0l2Lrc+2nEAgAJio4A=
Date: Fri, 27 Nov 2026 02:58:42 +0000
Message-ID: <f549699f9ec79a555950adae284ba34a8f4a6ff7.camel@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
	 <20261125060037.649659-5-echo.zhang@mediatek.com>
	 <20261125143248.237422bc@ben-desktop>
In-Reply-To: <20261125143248.237422bc@ben-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: SEYPR03MB7814:EE_|SEZPR03MB8634:EE_
x-ms-publictraffictype: Email
client-request-id: c2efa42e-020c-48ba-9a6c-492ee0516913
request-id: 659a0bf7-01b1-489e-044e-08df4c325853
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|11063799006|4143699003|6133799003|261009223027099003|18002099003|22082099003|3023799007|10067099003|56012099006|261102123227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261021121427099003;
x-microsoft-antispam-message-info: kBJXxw5MvgLjl7K7rDFVQuJUCGlZUH6JWXOaCQwV5ty7FeRx5Fn3Swz6Qm+M+sTgXDperqPhze1z+MDZi126Jits49Mjne+bz7EO14eIkRhutyA4MLFVUYJ3k437ABKoAgpVnrYg9IiVx99xnb9yrytJI9+KIL1goDKN23ExoqaYTUrsFJ1o33eohiEtgDjvSLR7ARj5RA30+2WTemw/oynsYJ3ckTf5hvHoEVNeIx1ZTE9oOzpfcK227b9fa78VoFj0RypNVw3m+0uInnTVdk7LmubSV2/+POk/qtwBwi3XqxuDOkF2mMPMnIvt1xtNCBFeiLePTcdVJpbAF1RbP/d+UEdVTTrgLyRGWP0k//sienkR3ivygaz+ph/rQ6h7kT33/V6pFv8FSsurTAHI0qudwGVWQmMab9icxJfD1RJYUYuCj9vnFUBkgcVb9S05aXenZ9vzNGpX/52+CNs0xOjAFz9NTCO0RD7hMwJaeIINB4qzETb3jGdk8RM0RSRZNU9Pvy0olTUXZy1TuqJIIXII6N+4rsvB21B7OJ0HOI6ESYOJxEUGtUkVxOlJr38oSb+9fDuOrGyWRnCd9b5cLX+T5t7CG4fXyVzGzzFSYf/muYw6o51qXvJ3yegSwdZdfoWINcRxJJgwpwPmJTimcB6faF69+bVHR6EFCoKQDeM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(11063799006)(4143699003)(6133799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1VFZTllanJuUnUrZlltK2RhejNYeGdJSUsvVGdVVlFqd0VwNWF2RHJSbjQ4?=
 =?utf-8?B?bllLN2VrVGxWMEVhMzRjRGFsV0YwbjNWcDRPRE5LYlZvQ1F1NjYyeFIydHE2?=
 =?utf-8?B?WkdESkd2NE91SzhrQ0xaV09nWStDcXpJc2p0bnMzK1UvcmRmcWxaMXRFbEUw?=
 =?utf-8?B?WU9tbzBWVnQ4bXppQnY1anlqU2Y5d3FVNG93citiSlFKRzZqQmpyZmtTZnZn?=
 =?utf-8?B?enkxSVRmVHh2UzBLSUJtaUJ5MDU1M3NVbmx6dEY3Z1NTdGgvSS9Va3NjbWFj?=
 =?utf-8?B?dGNpaTRMdnowbURaNTgrbjBOa2g1SmQrZzc1SVNOa0V1UkpRV1hIYkRESUcr?=
 =?utf-8?B?SXlFZEdOTDZhejZoS1hkMmhHRmJjTzRpY2JVbHJneXNjenpNbUJOY2hqR2NE?=
 =?utf-8?B?dnM3dmpZTjRTd1liVUtjZC8vYURjYmw1OUFRMXhpQlplTlZSVFhlR2UvRHl2?=
 =?utf-8?B?Ny80MHB6MkhJYVpoaXVJZUtDSjZ1ZDJnNE9GckltNk5PR1JmVllSL1JReGdt?=
 =?utf-8?B?c1Ixb3pPanJPT3drK09KcUwwenNRM2ZMNFB6R1RGUXBXUTROWGlaeHZjbDZ3?=
 =?utf-8?B?azNxM05ZUi9CY0Q0MkNxdjl1MEpudjNXcHhDSGlod3lwb0FGUXJGbHRDT01V?=
 =?utf-8?B?SVBIRnozUEpDZ1UxcTdwcHloa1dSdUNGSlUvaWtCYzhBL1FCRGNxVzZLaHpk?=
 =?utf-8?B?VEdpM3ZEMmZDSTNyZmhML2pFdjF1SURzZVcwanJNTjRaVVdKWHpNL3lyS2NP?=
 =?utf-8?B?YkxvK2l4ZG9RVlZWazI1T0pWR3lzbkZzWCs5R0NNaXQzQ0FsNlpJN2xXVHR6?=
 =?utf-8?B?Njc0ZmxIREt3bnlxL3Y5TlhldUNPK1ZnN1JvVlZmdGh3UVdrWFAwRDZJU3c1?=
 =?utf-8?B?a3AvNGRxMG5VYlErT2J6YzNmUWsyQ2R6RWFnRXlMRFA5RlVUNHk2OEpUVkI0?=
 =?utf-8?B?MHpoejNNbUNHU0xNNGFzR3pWdENwcitKU0tybVg1Q0V2eWhhczJtdEVBSFd5?=
 =?utf-8?B?VWM1aHlDMklrby9FRU5aYjhsYjhTVk1PZjREVGxjQUp2YnEwNjdqYkhYUmVi?=
 =?utf-8?B?djQ4QU1tY3RWaVJrQzQxUmpxUjNwNHYvZk9SR0tvWjMrTEU2Y3duV3IwOUxm?=
 =?utf-8?B?dmVlaExJS3Z3YTYwaVZ1VVJFQ0QyVWtIRzdYZXhQQ1pLYmN0RStzdGdOWHlv?=
 =?utf-8?B?U05MOUYyNmFUUjVOZHl0NmVEc09ENW9rdm1RWDJjUzZtTUJwU3RNYy9wdDZm?=
 =?utf-8?B?amVLelZQZzdkV21TaGFkY1Q5MndFd1NHYU55WW8vRHR5T0czZnNJeHFIUmhX?=
 =?utf-8?B?UXhnb00zL1doTGExaWd0MjNzRFQ5SklNK09UMk9SYnNCV2puM29DQ0MrYU5L?=
 =?utf-8?B?ZFVxOU9uTVhiMWVWdlM1bmlBNzR3ZFMrajd2SGlYcmhsTTI2Z1ZtR2RMMWRS?=
 =?utf-8?B?UWN0UHQwSjVaTUM1d2dMTUovelZEeEp1QWU1bklrVVFkYjM1R0ZwSTk3Sjdk?=
 =?utf-8?B?Wm94cVE1MTRMT1ZIUTdVTVNhc2U2LzRMeThCVWlrbnY3aFpkL1ZrMDJJYXNF?=
 =?utf-8?B?VXRNQTQxdmgxSTNNSENXMHlQNkErL1lqTWVxMVE4R0pHZlVFMFFKSEdVb0tu?=
 =?utf-8?B?MzVuS3paL1BVMjhwOGMyb2pLbDBKS1lpRS84Ky9RSGk3cEwzcCtpOHRyRlF0?=
 =?utf-8?B?SlZGVFdXZVpyZ285T09yTFN1YTVJWnZxTHk0RFBwZ0Z6R3VwaDhVNjVDRVd0?=
 =?utf-8?B?blkxOTVKUDhNTmZ5VTY3ZFNhbHRPN2RzOGhBOUlyaUorWkV3OVQyQUI3cXIw?=
 =?utf-8?B?bEJPNjh0aWxJRCtibk9JM0MxRzBHanM4MDI2NjZHYlk2c29IS1lTTGZPdVd2?=
 =?utf-8?B?WGlJNkdRMTZWREpFaVk1SG5ud2dyTmdweEEvK0RVVCtsNkFqNDBFYStLOVY2?=
 =?utf-8?B?anhERkgvZkRDbUE2b296ZDVyc1lYbUpBRWdPK0EzSHBSQnI1a1ZnNm9SS1M0?=
 =?utf-8?B?cGNtUFpvUWRReWlZanFzNVFWSitVU2VQS1NoYktQOWlsTnlKemdMVG5EcWY0?=
 =?utf-8?B?V3dVdjZRa1kxRi9LNHBjeVJkNkNnSzl3MzhwQ1hWV3loZk9ncXdlVG1Yb1ha?=
 =?utf-8?B?RFoxWkdTYjZad1A3akxmY0dOTzVIZTR3Um5tNXFDRjRyNC9HWFhVQmRpdlhi?=
 =?utf-8?B?MjUrVzcyZ2dOKzJNM1dQbnZ1RXFSYitNbFlqNERNaFdRTFNDKzdiT2FxODhh?=
 =?utf-8?B?aXA1azRUV2VZQlpEY0FvaWVVL1FVZ3RpT2IvOUZPSHVmZ1ZUNlY4YngxOGk1?=
 =?utf-8?B?cFQydU1SMG9NZXRVZS9SdzFud3RZU3lFaVlSc0VQZHpockJSOERwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2815BE5A11343F429E7E034BD7038323@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: bbF1F0L/26KqZUrT7Dhy3rj1JnPSS8mw0XeoD3pMGxP3HqWIkLbDdNW+e+acgqB1e3HOXfBabzwzm+pqfnRTcQKTNsdp7eM6kGqPvujqJ/uAWWLmzjWIpW2c+q+dwTPZv5OQ0lJShtWWMOf+noLYlDLNXq3RPg9I9lbUZHmwZhqbL9dzgSZz1kboHieHR7smUbeblyiuKlwfKRNvtOZFheBo3l2ctSVlcdqq15fUqZrP4wkfKCm60Np2y5AJNDg4G8Aa1SwPq2Q2F7FNSuQUhqePXy19Pn2m5Eau1YXV5Kaj09JqtMXKXrBWUIZHVO0cC0KCOFgxQRkOJCrvlwN1uQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7814.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659a0bf7-01b1-489e-044e-08df4c325853
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 02:58:42.3583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyQvKd9J+XZr3uvSKhgwSo/1bH+OpfjlSUFkJVPl6sbrLv+hc7ZXxsXa4A+1BeZZteZMFcAAr74vh0hWYCJbfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8634

T24g5LiJLCAyMDI2LTExLTI1IGF0IDE0OjMyICswMDAwLCBCZW4gR3Jpc2RhbGUgd3JvdGU6DQo+
IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IE9uIFdlZCwgMjUgTm92IDIwMjYgMTQ6MDA6MDkgKzA4MDAgIkVj
aG8gWmhhbmciDQo+IDxlY2hvLnpoYW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFk
ZCB0aGUgVkNQIHRyYW5zcG9ydCB1c2VkIGJ5IE1NRFZGUyB0byBtYXAgQVAgYW5kIGZpcm13YXJl
IHNoYXJlZA0KPiA+IG1lbW9yeSwgbWFuYWdlIGZlYXR1cmUgcG93ZXIgcmVmZXJlbmNlcyBhbmQg
c2VuZCBJUEkgY29tbWFuZHMuDQo+ID4gDQo+ID4gV2FpdCBmb3IgVkNQIHJlYWRpbmVzcyBhbmQg
aGFuZGxlIHRoZSBzZWxlY3RlZCBNTVVQIG9yIFZDUCBSRUFEWQ0KPiA+IG5vdGlmaWNhdGlvbiB0
byBpbml0aWFsaXplIGZpcm13YXJlIGFmdGVyIGJvb3QgYW5kIHJlc3VtZS4NCj4gPiBTZXJpYWxp
emUNCj4gPiBJUEkgdHJhbnNhY3Rpb25zIHdoaWxlIHNoYXJlZCBtZW1vcnkgYW5kIGFja25vd2xl
ZGdtZW50IHN0YXRlIGFyZQ0KPiA+IGluDQo+ID4gdXNlLg0KPiANCj4gWy4uLl0NCj4gDQo+ID4g
K3N0YXRpYyB2b2lkIG1tZHZmc19nZXRfYm9vdG1vZGUodm9pZCkNCj4gPiArew0KPiA+ICvCoMKg
wqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wX2Nob3NlbjsNCj4gPiArwqDCoMKgwqAgc3RydWN0
IHRhZ19ib290bW9kZSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgc2l6ZTsN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUzMiB0YWc7DQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1MzIgYm9vdG1vZGU7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1MzIgYm9vdHR5cGU7DQo+ID4gK8KgwqDCoMKgIH0gKnRhZzsNCj4gPiArDQo+ID4gK8KgwqDC
oMKgIGlmIChib290bW9kZSA8IFVOS05PV05fQk9PVCkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybjsNCj4gPiArDQo+ID4gK8KgwqDCoMKgIG5wX2Nob3NlbiA9IG9mX2ZpbmRf
bm9kZV9ieV9wYXRoKCIvY2hvc2VuIik7DQo+ID4gK8KgwqDCoMKgIGlmICghbnBfY2hvc2VuKSB7
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290bW9kZSA9IE5PUk1BTF9CT09UOw0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPiA+ICvCoMKgwqDCoCB9DQo+
ID4gKw0KPiA+ICvCoMKgwqDCoCB0YWcgPSAoc3RydWN0IHRhZ19ib290bW9kZSAqKW9mX2dldF9w
cm9wZXJ0eShucF9jaG9zZW4sDQo+ID4gImF0YWcsYm9vdCIsIE5VTEwpOw0KPiA+ICvCoMKgwqDC
oCBvZl9ub2RlX3B1dChucF9jaG9zZW4pOw0KPiA+ICsNCj4gPiArwqDCoMKgwqAgaWYgKHRhZykN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb3Rtb2RlID0gdGFnLT5ib290bW9kZTsN
Cj4gPiArwqDCoMKgwqAgZWxzZQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vdG1v
ZGUgPSBOT1JNQUxfQk9PVDsNCj4gPiArfQ0KPiA+ICsNCj4gDQo+IFsuLi5dDQo+IA0KPiA+ICtz
dGF0aWMgaW50DQo+ID4gK21tZHZmc192Y3Bfc2VuZF9pcGlfaW1wbChzdHJ1Y3QgbW1kdmZzX2Rl
dmljZSAqbW1kdmZzLCB2b2lkICpkYXRhLA0KPiA+IHUzMiBsZW4sDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBib29sIHZjcCkNCj4gPiArew0K
PiBbLi4uXQ0KPiA+ICvCoMKgwqDCoCBtbWR2ZnNfZ2V0X2Jvb3Rtb2RlKCk7DQo+ID4gK8KgwqDC
oMKgIGlmIChib290bW9kZSA9PSBSRUNPVkVSWV9CT09UKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtbWR2ZnNfZXJyKG1tZHZmcy0+ZGV2LCAiSVBJIHNraXBwZWQ6IGJvb3Rtb2Rl
PSVkXG4iLA0KPiA+IGJvb3Rtb2RlKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUFDQ0VTOw0KPiA+ICvCoMKgwqDCoCB9DQo+ID4gKw0KPiANCj4gQWxsb3cgbWUgdG8g
Z2l2ZSBteSB0d28gY2VudHMgaGVyZSwgZXZlbiBpZiBJIGFtIGEgbm9ib2R5IDopDQo+IA0KPiBB
bmRyb2lkIGJvb3Rtb2Rlcy4gV2hpbHN0IEkgZG8gcmVzcGVjdCB0aGUgcmVhc29uIGZvciBBbmRy
b2lkDQo+IGJvb3Rtb2Rlcw0KPiBleGlzdGluZywgd2hhdCBJIGRvIG5vdCBsaWtlIHRvIHNlZSBp
cyBwZW9wbGUgY2hlY2tpbmcgZm9yIHRoZQ0KPiAqQW5kcm9pZCoNCj4gYm9vdG1vZGUgaW4gdGhl
aXIgZHJpdmVycy4NCj4gDQo+IEFuZHJvaWQga2VybmVscyB0aGVzZSBkYXlzIGFyZSAqbW9kdWxh
ciogdGhhbmtzIHRvIEdLSS4gSSAqZG8gbm90Kg0KPiB1bmRlcnN0YW5kIHdoeSBwZW9wbGUgc3Rp
bGwgY2hlY2sgZm9yIGJvb3Rtb2RlcyBpbiB0aGVpciBkcml2ZXJzIHdoZW4NCj4gdGhlcmUgaXMg
YSBtdWNoIGJldHRlciBvcHRpb24gb2YgKm5vdCBsb2FkaW5nIHRoZW0qIGlmIHRoZXkgYXJlIG5v
dA0KPiB3YW50ZWQgaW4gdGhlIGN1cnJlbnQgYm9vdG1vZGUuDQo+IA0KPiBIYXZpbmcgeW91ciBk
cml2ZXIgZGVwZW5kIG9uIHRoZSBiZWhhdmlvdXIgb2Ygb25lIHNwZWNpZmljIHVzZXJzcGFjZQ0K
PiBpcw0KPiB0ZXJyaWJsZS4gQW5kIHRyYWNraW5nIGl0IGluIGZpcm13YXJlIChnaXZlbiB0aGF0
IHRoaXMgY29kZSBpcw0KPiBjaGVja2luZw0KPiBmb3IgYW4gImF0YWcsYm9vdCIgcHJvcGVydHkg
cHJlc3VtYWJseSBhZGRlZCBieSB0aGUgYm9vdGxvYWRlcikgaXMNCj4gZXZlbg0KPiB3b3JzZS4N
Cj4gDQo+IEFzaWRlIGZyb20gZW5hYmxpbmcgdGhlc2UgcXVlc3Rpb25hYmxlIGJvb3Rtb2RlIGNo
ZWNrcyBpbiB0aGUNCj4gZHJpdmVycywNCj4gSSBoYXZlIG5vIGlkZWEgd2h5IHRoZSBib290bG9h
ZGVyIG5lZWRzIHRvIGdldCBpbnZvbHZlZCB3aXRoIHB1dHRpbmcNCj4gbm9uLXN0YW5kYXJkIHN0
YXRlIC8gYm9vdCBpbmZvIGluc2lkZSBvZiAvY2hvc2VuIChpLmUuIHRoYXQNCj4gImF0YWcsYm9v
dCINCj4gcHJvcGVydHkpLCB3aGVuIEFuZHJvaWQgc29sdmVkIHRoaXMgcHJvYmxlbSBieSB1c2lu
ZyBib290YXJncywgYW5kDQo+IG1vcmUNCj4gcmVjZW50bHksIGJvb3Rjb25maWcuDQo+IA0KPiBJ
IHdpbGwgYWNrbm93bGVkZ2UgdGhhdCAianVzdCBub3QgbG9hZGluZyBtb2R1bGVzIiBkb2VzIGdl
dCBhIGJpdA0KPiBtb3JlDQo+IG51YW5jZWQgaWYgeW91IGJyaW5nIHNvbWV0aGluZyBsaWtlIHVk
ZXYgLyBBbmRyb2lkIGluaXQgaW50byB0aGUgbWl4LA0KPiBidXQgdGhlcmUgYXJlIHN0aWxsIGJl
dHRlciBzb2x1dGlvbnMgdG8gdGhpcyBwcm9ibGVtOiBlaXRoZXINCj4gZ3JhY2VmdWxseQ0KPiBo
YW5kbGluZyB0aGUgc3RhdGUgd2hlcmUgdGhlIGhhcmR3YXJlIGlzbid0IHJlYWR5IGluIHlvdXIg
ZHJpdmVyLA0KPiBtYWtpbmcNCj4geW91ciBib290bG9hZGVyIHNldCBzdGF0dXMgPSAiZGlzYWJs
ZWQiOyBvbiB0aGUgcmVsYXZlbnQgRFQgbm9kZSwgb3INCj4gYmxvY2tsaXN0aW5nIHRoZSBtb2R1
bGUgZnJvbSB1c2Vyc3BhY2UgaW4gYm9vdCBtb2RlcyB3aGVyZSBpdCBjYW4ndA0KPiB3b3JrLg0K
PiANCj4gSW50ZXItZHJpdmVyIGRlcGVuZGVuY2llcyBhcmUgbm90IGEgZ29vZCBleGN1c2UgZWl0
aGVyIChlLmcuIGEgY29yZQ0KPiBjbG9jayBkcml2ZXIgZGVwZW5kaW5nIG9uIHNvbWUgRFZGUyBk
cml2ZXIgdGhhdCBpcyBhIG5vLW9wIGluDQo+IHJlY292ZXJ5LA0KPiBmb3JjaW5nIHlvdSB0byBs
b2FkIGl0IEFOWVdBWSwgZXZlbiBpZiB0aGUgYm9vdGxvYWRlciBkb2Vzbid0IHN0YXJ0DQo+IHRo
ZQ0KPiByZXF1aXJlZCBmaXJtd2FyZSBvbiByZWNvdmVyeSBib290KS4gSWYgdGhhdCBpcyB0aGUg
Y2FzZSwgdGhlbiB0aGVyZQ0KPiBpcw0KPiBzb21lIHNlcmlvdXMgcmVmYWN0b3Jpbmcgd29yayB0
byBkby4NCj4gDQo+IEZpcnN0IEkgYmVnYW4gc2VlaW5nIHRoZXNlIHNvcnRzIG9mIGNoZWNrcyBp
biB2ZW5kb3IgdG91Y2ggc2NyZWVuDQo+IGRyaXZlcnMsIGJ1dCBub3cgaXQgc2VlbXMgdG8gYmUg
aW5mZWN0aW5nIFNvQyBzaWRlIGRyaXZlcnMgYXMgd2VsbC4NCj4gDQo+ICpLZXJuZWwqIGRyaXZl
cnMgc2hvdWxkIHdvcmsgdGhlIHNhbWUgcmVnYXJkbGVzcyBvZiB3aGF0ICp1c2Vyc3BhY2UqDQo+
IGVudmlyb25tZW50IGlzIHJ1bm5pbmcgKHdpdGggdGhlIG9ubHkgcmVhbCBleGNlcHRpb24gYmVp
bmcgdGhlDQo+IGFic2VuY2UNCj4gb2YgZmlybXdhcmUgb3IgZXhwbGljaXQgY29uZmlndXJhdGlv
bnMgZnJvbSB1c2Vyc3BhY2UpLiBBbmQgaW4NCj4gc2l0dWF0aW9ucw0KPiB3aGVyZSB0aGV5IGdl
bnVpbmVseSBjYW4ndCB3b3JrLCB0aGV5IHNob3VsZCBub3QgYmUgbG9hZGVkIGF0IGFsbC4NCj4g
DQo+IFRoZXJlIHNob3VsZCBiZSBubyBzdWNoIHRoaW5nIGFzICJrZXJuZWwgZHJpdmVycyBkZXNp
Z25lZCBmb3INCj4gQW5kcm9pZCIsDQo+IG9ubHkgImtlcm5lbCBkcml2ZXJzIGRlc2lnbmVkIGZv
ciBMaW51eCIuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEJlbiBHcmlzZGFsZQ0KPiANCkhpIEJl
biwNCg0KVGhhbmsgeW91IGZvciB0aGUgZGV0YWlsZWQgcmV2aWV3LiBJIGFncmVlIHRoYXQgcmVh
ZGluZyB0aGUNCkFuZHJvaWQtc3BlY2lmaWMgYXRhZyxib290IHByb3BlcnR5IGFuZCB1c2luZyBp
dCB0byBza2lwIElQSQ0KdHJhbnNhY3Rpb25zIGluIHJlY292ZXJ5IG1vZGUgZG9lcyBub3QgYmVs
b25nIGluIHRoaXMgZHJpdmVyLiBUaGF0DQpiZWhhdmlvciBjYW1lIGZyb20gdGhlIGRvd25zdHJl
YW0gaW1wbGVtZW50YXRpb24gYW5kIHNob3VsZCBub3QgaGF2ZQ0KYmVlbiBjYXJyaWVkIGludG8g
dGhpcyBzZXJpZXMuDQoNCkluIHYyLCBJIHdpbGwgcmVtb3ZlIG1tZHZmc19nZXRfYm9vdG1vZGUo
KSwgdGhlIFJFQ09WRVJZX0JPT1QgY2hlY2sgaW4NCm1tZHZmc192Y3Bfc2VuZF9pcGlfaW1wbCgp
LCBhbmQgdGhlIGFzc29jaWF0ZWQgYm9vdG1vZGUgc3RhdGUuIEkgd2lsbA0KYWxzbyByZXdvcmsg
dGhlIFZDUCByZWFkaW5lc3MgYW5kIGVycm9yIHBhdGhzIHNvIHRoYXQgdW5hdmFpbGFibGUNCmZp
cm13YXJlIGlzIGhhbmRsZWQgdGhyb3VnaCBub3JtYWwgZHJpdmVyIG1lY2hhbmlzbXMsIHdpdGhv
dXQgYQ0KYm9vdG1vZGUgY2hlY2suIFdoZXRoZXIgdGhlIGRldmljZSBpcyBlbmFibGVkIG9yIHRo
ZSBtb2R1bGUgaXMgbG9hZGVkDQpmb3IgYSBwYXJ0aWN1bGFyIGVudmlyb25tZW50IGJlbG9uZ3Mg
aW4gcGxhdGZvcm0gY29uZmlndXJhdGlvbi4NCg0KVGhhbmtzLA0KRWNobw0K
