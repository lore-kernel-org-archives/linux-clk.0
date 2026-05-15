Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2132.outbound.protection.partner.outlook.cn [139.219.146.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0E13AF66D;
	Fri, 15 May 2026 03:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778815637; cv=fail; b=WJMR2jv/wzOfE7amoa1F9hPcvvP94q5eKD9ZVYDjhsXhkFYy8q/ygSSsee3xDi30OeyUbiZWMAdTcohLEYpxwNiy9mAfvPu+uNLOEHPFeOvooIHk2YrhwkzuQLrck74JTWV4t3PE3Dgt4AG/MUfOsnGGo9dwROpcMe/wNbM4y/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778815637; c=relaxed/simple;
	bh=a1K8nApd5oCI+fc5No/XgIAGC4m4mDi29fRc6lBeXd4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oZBCAoNPg5l/ekKNDKBHOeFv7uTc/J2WerMAqPx0eDhDC8MaZyyvyOJsl9Xf4RYCL9idy064cEihkg2VqNXT3OPtENtpDVn3Pyz964i/QkK5Opf4URUBcBaupnb4x6HI2E5aHBQY7re/wExTE1CKnkPkuaQF3qd7Sj/OrwPBIQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9etRBQ13nKuOFFFaoJ9t25G6XuYOJCvj2E1ZKaIS6/gyLTy5bKDXHQT2dD9xdcoYBQ7Jou8BlpTlrsvthRZnqBh3WiQlW5ow+JkZ7hXEWZ5vYLg6I+oSZE5GfyfICS/qEt6leLyq3NF2NAyxJMxk7b0Zsk1pDclCeOMySxEQgnENFWKCv3CLVRudaVvBIu/sjp8GyYH74d+CmX6fEM85YNDloLimvZIRkZ2t3ngSkuwQLZ764pZeeNJbyqq7s68a+MaxqKqCGckOd0H+jq/3Bdxnb2Zpe0V7CRtcjeLqBH+3x7rZY9VfyABOtQwkxxQ6f6JkGMQu7ImqVRlq6DoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1K8nApd5oCI+fc5No/XgIAGC4m4mDi29fRc6lBeXd4=;
 b=Y868Fk99iMnPq75OTs8WxUbvE7wGNdaUY14EUw/3S4hMC3FULg0m6BmWxZsmQrBcwwGKgtY7zA3H8rI/MjH2EdDPwrcHJSVmzu4QFksd5s2zxF4G4t6h3ucVUyyKguBtT5GRvnH6PhoqOGzmFkrUe2RhrMk1RUfP5L359l4Q+5GXoutbPomsfDTBeWO95uTfRdR68KSx8OHUW0R1/2utXXd1wqnGKqMMR2/TBUAMUTtLMJ6d6ldY/TFoc687cw5NmgGx9O8oHJnEUcO8vOohXlT+RcO69+wX0kqqbStLmjN6PxAc3CrdPQObFE9QfH+CSlcLpNt3s+F5I3kuDAJklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn (10.2.3.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.13; Fri, 15 May 2026 03:27:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Fri, 15 May 2026 03:27:05 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>
CC: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 02/12] dt-bindings: clock: Add system-0 domain PLL
 clock
Thread-Topic: [PATCH v2 02/12] dt-bindings: clock: Add system-0 domain PLL
 clock
Thread-Index: AQHc4epNxMv7iBZ/3Uu+1XTNofixhbYNlyiAgADaaSA=
Date: Fri, 15 May 2026 03:27:05 +0000
Message-ID:
 <ZQ4PR01MB12023573F126D79D48B0B26DF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
 <20260512083521.3448-3-changhuang.liang@starfivetech.com>
 <6f891c51-8149-4c53-ba1f-7c76f50091c4@kernel.org>
In-Reply-To: <6f891c51-8149-4c53-ba1f-7c76f50091c4@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
x-ms-office365-filtering-correlation-id: 3a2e5c76-39a1-42ce-6dcd-08deb231d6b7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003|921020|38070700021|4143699003;
x-microsoft-antispam-message-info:
 0CHk5xNkC2rrHRGx6n02S1lyDg2ITYfhNO/7Yjgeu+z76nbgOfs0kKzd+I2IRPb0+pk08qpXqtQzJp0OI/fqWCfOmDak15FEX1bdzCylMJnnX6I7hj09fu6sFfrqnAW3mZu28n6Rq1/xfxwazcg+5O7bOV2Of+2dejl6mOugGa7qgnl+YsLtwxEOGHU0SeZ+Y6GG3m23vB51OGDwc8mpYGWN8LVwYD2A/gMZq6ck7SemvZt8KKMp7DbVS2HfWd+nVPdFnFRakw8mIYQfNExWSCFbvwfabLt5OsZgsvF58qXs/FR3Ck5H2jKNQT/b4UI+HODl5o1maWN3DL1AjFYpK13Hf6xZMtnMIHx6tBHD3jkdARVlQEqWIFZgRq0eX3LSQ2kxlcXpD4y+cgseylpc8RNkFVltPcY2odDRCBnjcR6be+At1+sEsAl/o6kUUJL6Wk5SAaSGtcSjzvUGt4Tv8ZWusmnxWp4f+RieGu+xQMX0eZAJxteY+ChmIErxmfH6w2lqlds20cpNs0hjPhSQABu7bRx1oIrhroHBCa4s/FXq1CMJRvE5VMucenIe/+UU1hO1x6p0sPA7ppatqKOtVg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(921020)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0ZuMFhWVXFpSEpaeDdiQ2t0ZlVvR0N4MWRLSVQvYjhUbWRSWld5K3EvOHIz?=
 =?utf-8?B?eXV0eTJVUUdqMlR6RkZ1c3FDdXh5REVqNy9pODBBN0RMRUFHZDUzNmhuNzZF?=
 =?utf-8?B?RzZLWnZrSWoxOXFLL0RHV2NudzBneTl3aFo1NkgwbldFcG9KVFdEL1d2SVp6?=
 =?utf-8?B?azlsL2MybktpY1pNY0lzMjNCeVFYQW01eFdjY3dVWDlzQmxpeDM2eko1bW51?=
 =?utf-8?B?SkJCUFZUT21xRFpjSGVQY1g3V284dG9iUVV1QmxZOG5ndVdxVExvbTd1WGZ6?=
 =?utf-8?B?L2piMFhVSHVRS2pmWUs1K1hBZWhhaDRIRDNOV1kwR0drd0NQY0JnN0dsdUtn?=
 =?utf-8?B?aXoxMHhvT0VqMlhJdklBUTNxalRQcG1HTFEvcnpWaXluMHRYbnRndVFVRTl1?=
 =?utf-8?B?NHMvT2VlRkVzNS9WOEpWaDhocVQ5Tzc3ZW1pSGtaOENUOHpta2YzTU5yYm9F?=
 =?utf-8?B?UFdMMGVJWFphY2hVaGJVaVY1TVRGNnBLYUkrNG5RSnZuYXRnY0hmRExrM2wy?=
 =?utf-8?B?aGd5RzJrVE8vUy9LK2RCOU5vWCtNRFpQNWhaV1grd1Q0NDBxQ0d0QUMyYUYy?=
 =?utf-8?B?OUxJVzhlQ1RRS0grTGh6bllCUWhLVGVvcklDYVdqMGlKcXN6YjBubFA0c3Ri?=
 =?utf-8?B?bUhDQUpWUmlaQjFJc2l0Z1gvWTlvMEJzNXdwaEZFWGtiVnBQSGI4Si93OTB5?=
 =?utf-8?B?Q2piRklLZ2poNEttc2p6WTlZVnYrbGcwVHRYT3BtQzdjMDh0SytpME9mZTUy?=
 =?utf-8?B?VlVzUUg0emtKRFBDeXowV3hOSjVreUZLLzR6VXcxTjFiMTRKUVliSmFrczhI?=
 =?utf-8?B?ZDExVW9jWmFLT2dza2drYW1TTUcwaHA2ei80Q1RXTlJBRFdRT0V4NDd4RjFV?=
 =?utf-8?B?UGRqLzVVL3ZtTDhxS216Y0ZVYkZlQThibDhvamVCQnhJUUt6NmJ1RXhab25s?=
 =?utf-8?B?YisvVytaYThBZ0VQWW9ucWd5ZURVVnpSNmZQbHQ5SEx2Tkc4cFlaOStWbEts?=
 =?utf-8?B?T0NkTVQwYzdrVVlJOFo5a29UcncxRXdvbFR4bmkwNVlaeDlUYm9YbzhiQXAw?=
 =?utf-8?B?MEhubVV0bEUrdEp3czdXcGNEUm5QTGs0Y2poeEZIcnNmN0M5N2N0ayt6dHRr?=
 =?utf-8?B?UXlJQUM5Qkw2NktJanRNY01BQkFhK3hyN1BsUU5zTVFsTXh6YzFTeXVVNVNs?=
 =?utf-8?B?YmdWai9TbVdrL3VITmhwTGtCaFFUcnJ2amY1Y2F3elc0YXd2amhJOHdpNENW?=
 =?utf-8?B?SzBqV3EzYUlNUnpyd1laNmJzT0hFS0U4OUlKUGFuQUh3VEFNd2RWbG9oTkFs?=
 =?utf-8?B?b0dkZjl0eVpLWnk3MlZMQ00vdnExQTZsQXVlbDQ3UDhVaHJUZlFpV1Z0bG5p?=
 =?utf-8?B?cFMrdG41cWpWbnlaUEVWVU5MZnpEdXpjZ1BtRTB1SC9zTzkrYWl6M1p5RjFv?=
 =?utf-8?B?T3hYUm5DUEJFUDhjNVByakFuTS9ZTU1yODEySUx5QlpLeVh4blVDVjBpNU5u?=
 =?utf-8?B?QUVXQXJINmZaTElzZHhZSnpIVFNSbk9iVjdieHpvblBQalhBeGJFdVl0dnpD?=
 =?utf-8?B?VTBSckg1K1NsR1haYXRQazZuUm1LZ2kvaWpYZUZLaWlFMEtKcmtGMndEOFVi?=
 =?utf-8?B?VkhuZjI2TENYc2YvTHVweUxPK1RFcEZZT0pReWFXWjZhZW1RQVN1a2xHdW03?=
 =?utf-8?B?b0lyaU5lNUdCUWIwZ2dKRzVmWEZNaTlSMlc5Y2pUTkE0bTRob1ZzNEJ1ZjAw?=
 =?utf-8?B?MTMvMEUrRHU2SmdaUzRBdFRaNzJHaTJQN1Qyc3l1Z1ZON01LeFZJVXFXcHRy?=
 =?utf-8?B?SkMzU3JyWm03Y3Z2Mys4VklUY1hjcXFubVRBL05wQ2FGQm8rYmZmZWovUDlU?=
 =?utf-8?B?OHBDUnVxajJCNFp2dkl5aERNU0R6bTFYOVJFMFdXSjd6aWVEcTRFUFZIZWZU?=
 =?utf-8?B?ZTAydGFNUTZBbVozN0VTK1czK0ZKYUNVMUJHUEo1ZjkwalRMbHlxdGNwTmlI?=
 =?utf-8?B?cDFPSkJ6SGUxaFJEdXlWWUp0NFdkMlpZTEJMM1Avdmk4d1VZTUoza25DL2ZL?=
 =?utf-8?B?UW5MbThxSERYV0VEK3hPYUFia0xlYklHemtXMk01L3M5Uml1Smp6a3E3QjI1?=
 =?utf-8?B?R1pwNHZmMUFSalQ3TDhFK2kxaDR3bGx2eHJTaCsrRlUrMHZoQmFza2s3TEM2?=
 =?utf-8?B?YnNhUlZod25nY2JMajhjNGtGbzVaOGZiZVlTVmJWaE9wK0NQZ2NPdFVBc1oy?=
 =?utf-8?B?b1pzOEgwZGdPcHptTnV5NTlPQUd3c2txN2xMSjJCbk0zaFpRNkFaUE5XVkhl?=
 =?utf-8?B?TFVsNHo0eWNoYTN6R0Y5aElRMGFad3E1R3orRVQydnBFeG5kMy92SWhrUzNH?=
 =?utf-8?Q?c6X1Wvh8axPafGaU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2e5c76-39a1-42ce-6dcd-08deb231d6b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 03:27:05.8172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r5e5oUSxw17fqY+a5RnHR1DJ1xki/4F3qzqGWneoX6lhCS5UK99OyBtnAawixmRtuk7tyqsuPtHuS6+nLuEtdLza2fojRJLOctYyWyGrHFyKdFRn04rlgLmbiVfca9Si
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gMTIvMDUvMjAy
NiAxMDozNSwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBBZGQgc3lzdGVtLTAgZG9tYWlu
IFBMTCBjbG9jayBmb3IgU3RhckZpdmUgSkhCMTAwIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdGFyZml2ZSxqaGIxMDAt
Y3JnLmggfCA2ICsrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+
IA0KPiANCj4gV2h5IGlzbid0IHRoaXMgYWRkZWQgd2l0aCB0aGUgYmluZGluZyBmb3IgdGhpcyBk
ZXZpY2U/DQoNCkRvZXMgdGhhdCBtZWFuIGRpcmVjdGx5IHNxdWFzaGluZyBwYXRjaGVzIDIsIDQs
IDYsIGFuZCA4IGludG8gcGF0Y2ggMT8NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K
