Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2107.outbound.protection.partner.outlook.cn [139.219.17.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E453BB4A;
	Wed,  8 Apr 2026 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775625450; cv=fail; b=oWSoBPPlHoiTlq6P9OkusO78kY4UCOUd0uzr1VF45RUqqL+skYYlNE71/F6ykzqg2kExOd7ssupIEVU14JjU+PAbhJCC6z0vyqIAHEQ+enjB5b7pghfGtWTUSDhYsbYT7zRe7Ekzr0S5UlfAljyP9PsGHYRWqZS20de9ieBbzrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775625450; c=relaxed/simple;
	bh=CqPIehgaZjPMjAtGaZ4ZjIT249f65UeYwFdnifHWMnM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ocKpC+0Ir8NWYZNjgdrzvUiC4tlZfrpGo2AKm5/7GM8cVzugD3kuv54aag3iXrgKh5j1ODPwirCdIf+LkJy/3jYM6R4kOx+4mm2QcAFrOONJsCqeC4nWn3ye0IRzcmZUc7dUoxd2SmR569Yw7do5cEHpODBzTUwoSbZn35Uq31w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5LWvbMqnS1Dtjh6BQH1G6HdKz7zjElJTeniEdXQbYvxQeqAY+IrtUy02stO9Z14F+0kv462+dFbNzR4sWJ7BQeBPJdnGLiraOq2IuXiWH/gpwRZ/pHazhHUGitIPYqz2P8qBaSAq62n7DXR2pp69wpHj6UDlvo9T+1VrH9cuMraUG8jJKx6MxxKFJf87tGNCEjlOCl6iB4eMjnjdmlA+paTZ2388XvYiydM6C5YysUmaQkeRjJiThle2OUrZZIDNzzfswp64Hl8F+qUFA9qb1SByWehDM3nOh6Wh0xBZ3ef7BfarVNFctj5F7hBUcB3M87eWwxnbrd0TT0N45hYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqPIehgaZjPMjAtGaZ4ZjIT249f65UeYwFdnifHWMnM=;
 b=ZZgYOG3pVL3cDaAuUEsxI+uzxPQJmbCRm4xfFQLTiZE8Zv/kGL/In7twG3hs4QP2zzq8z4koJJGHdeqkwwFSZB/+ufwQS7D3qglDm8VWcuygfBo4EaI+sZ5QVerTpIcRz8CgxNyiQ51fWjpeNkM/OfgOXrqZWSnBLjAE5iLOe9juYfLjGGNv+uQxYExvqcQwyKBRbczO56WrPc1ZrVl5DyY6+nCmaKxjAmpcYwhdF/aPsp9Vr0KlOKKOnsrD/yFJrxN2DfPCAF8Rg3McvcAXWkpZEajspbH2mFk1ZdMEjKG31ZY/j5WjxBFUNDR8F7kNKhDMjRGjGqC2KeO+4boAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1330.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 05:17:14 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Wed, 8 Apr 2026 05:17:13 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Alexey
 Charkov <alchark@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 02/13] dt-bindings: clock: Add system-0 domain PLL
 clock
Thread-Topic: [PATCH v1 02/13] dt-bindings: clock: Add system-0 domain PLL
 clock
Thread-Index: AQHcwy22YPp12r/yEUmhen/Q/gxFdLXQEmAAgAMepYCAAAGdAIABdOuA
Date: Wed, 8 Apr 2026 05:17:13 +0000
Message-ID:
 <ZQ4PR01MB120210CE64AEE9CD57002CCAF25B2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-3-changhuang.liang@starfivetech.com>
 <20260405-godlike-pistachio-mackerel-7ab494@quoll>
 <ZQ4PR01MB120275BC5277C4FF18A738E6F25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <5f2a1946-9ca7-414c-a764-60f46f3b3cf5@kernel.org>
In-Reply-To: <5f2a1946-9ca7-414c-a764-60f46f3b3cf5@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1330:EE_
x-ms-office365-filtering-correlation-id: 27941fbc-f58c-418c-3ca8-08de952e1803
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 gIyS0zZ2JEwj45plCUzxXseEHoUZgoWjwIu5qLuxt4bV4iHNE9SQLqIKXjCToiRJV4lsLyjHCBERbJHj8/h7WJaEIP6ZLy6Dk1gJybXtXl0rYPjxmpv6bHm7vSu/AiK7hPdTemN5QZ3+Wv58yVfvn00aUAZafS4zHdeYr+cl4CfOsyZ5Wasd8SgpBYWP7fBbRYS7qxWAaKvQzT0frqZpv0IfuMGCUW3kXRlOS3M1MKXbNdr2uQv4bBsSHbXUYuzDJBOauGQSKPkoOh6WED6SVEElDmXiCWILz/+8oPZ2Qblxtk+uDuim6v24zC3pOorBIZJu2aoc2artGVv/2+rpBrq9mO4lVg616sykvB4CU/tkn4husqSf6JYyAl21R2CPiAY5ZG1+ucSONsF5MbpfhE+Ntx7aaastPoYqfI9kQIoBIZOIWP1/bS7gwB8ZskUne6TcPoO5h/o9tbnyaSMPtodEaxwbLTYhH9uey5Tc6cTyBt19hRY8pLHbNYSXgV3DaMHc9ZhI+tyXmuxK5Ec/AobFgPXFwwFgOPNRf09dhjDVbm+TeCGvwXQnxliYrMDMFOA+vKxLknHwzfeQ94w2G/bjwNe9p89lBn5/ThTH9Bc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnpZOXFWTDV5dURwWGt3cE4yRGJxVjhaTHdCTVh2RVFlbFdwL200eFIxZEJz?=
 =?utf-8?B?N3JENTc2R2xFSG91KzRDbG1ZMXhVTTBzK3pjbUVzU1dnZWpEeVZ4c1lNRDlp?=
 =?utf-8?B?TnBNMUVpOURJUnphVUpYbTd5UVdjL3hkNUNySVd0T040eUtZNzdyNW9pNDdY?=
 =?utf-8?B?NHRkQ09YU0oyK0l4QS9iWC9SRlBYY0ZjKyt4MHBZZUhCcElsTHFDOHgxUFNC?=
 =?utf-8?B?eGNabVZXb1kwMHhER1dTSUpxRmFraUtWY2RwZTIydUZySE5MMTFSOXRRVU9y?=
 =?utf-8?B?QVg2T3VBT2lsY0U5NDhFU1RXNUtnaDQ0K1QxNVRLL3BqLzU2K05xbFAvQ2Zk?=
 =?utf-8?B?WFhTQzRMQUMyYTBGUjN1L1d3ekYzMGlsVFAzUzdzaEtocllWbTdJd1NaRlN3?=
 =?utf-8?B?aW5MTHphL2NITmlkSEttajhsUi9Dckc4Y1ArcHMrcUtzc3Q4R1NjU2t3ZnVI?=
 =?utf-8?B?TXN2MWpIenhNRG1TVTB6a3J4LzlFa2JjMDR0d2c1UVFxbVhYRm5adSswcmcv?=
 =?utf-8?B?VTFveG1zTXBrRnlReG8rYUxNK0ZsenZMTXNNV2lXZm1US2pFYkFadkN0N2lB?=
 =?utf-8?B?SWlJTGxJaDlnZXdYb0p6dzEwZkNNT1ByOElkVGc5QjVtZnRzSkRta2JHdUQ2?=
 =?utf-8?B?ZzdaWnROdmNoNHBwUjB2c1QxbjRzbGE0ZENLcWZnZzJETkZEZmRBQStHSEgx?=
 =?utf-8?B?R2FiMmE4OXF6T21yRTdQREoxZ3dZbG1oUWc5Ny9Vdjk0WUFSZ0h2N1dFZXE1?=
 =?utf-8?B?eGVoV3hwbjZ6bDg5ZWcwQ20zbm5SQ2Nha1dTRDVrNGVVdTN0ckhBU1FQWGl5?=
 =?utf-8?B?T3UvSXRKZmFEcnoxb3FwK1grSDdtMURYWElCbW02RXB1Ync4eWlYbVIzZzdx?=
 =?utf-8?B?UXlXQVJpMElqUm1ySElUOEU4OS93YlkyZDRudmNueEZINXBRcmVnMll2Y0pr?=
 =?utf-8?B?Nm9zdlk3aCtFVUNMUnZzL2FHdTJEQ3ZEVnc5S0t2bVk1cWRhRGVLNklYZHRy?=
 =?utf-8?B?aWoxbTRSODYvYjgwVkZ3WmsxTWxBWVdRRjJUTkc3NzM3SUhYRHRodlVkbmxV?=
 =?utf-8?B?bmVDK2ZCVCsxOGlVU01ybXJ6SHR3MFdYY2NnMHVscGFmSGZiUGlVc3RnR1FI?=
 =?utf-8?B?NFRPYlBrTVNEc1VoS2Y0M21xSGVEdlFpamZSOG1sekttWVJtTXVEdXlQMkNQ?=
 =?utf-8?B?TFR2UWVTL3V6M2tEc2lydWFOODI3NjI2NVN5L3JJVFpkNDBSMmtUd0FGS2FJ?=
 =?utf-8?B?N2N3aGxUN1BtZ0Y5Z3JvL3hXMG5jbFg2RzZ5am52MmEyVWJsUml4WDhKQ2N1?=
 =?utf-8?B?dWR3NUhVdXR5akpBZ0N6WGdDaHFldU84K0VUK2xaM1JUQWlxeEFCMlFXVTJm?=
 =?utf-8?B?WUswL3p5WDFVUVl2UGYyN2VURjQyRlYvc0M4bDdBMU5HcklkVjBFTVpkSERL?=
 =?utf-8?B?cnB1Wk5QWURhMVU2ZzdFYXNTSWhFaUwzZ1czdlZERURPZXhGU3docXd1eWUx?=
 =?utf-8?B?Q21kT0xWaHV4N09ib2Z6NVMwZ3J4M1gyejVWTnJPRTZXTGpyNmpGMm9kK2Ns?=
 =?utf-8?B?MDQ0aVFxRDR1dUJ2MUR4OHpJemFnZ2RMVmhacjc1WGwwTThsbXV4WXVlRWYx?=
 =?utf-8?B?SldaTmRSeGhzeUp5aXRMeWJicjhBMEFFWGo1ZUJvWnhLMW9FNUVjTlFjdHNQ?=
 =?utf-8?B?VENOSVVSMHlFTDg2RHNZK3Fmb1poc0h0UGc2enllbXFSbllleTFFaHNRNUpr?=
 =?utf-8?B?YkJrN2lYNi8ydEdKSm12SGoyVUI5ZEpydVZCeTRwQ2hLY1FBR05hNlRCdjlv?=
 =?utf-8?B?eTRaTVhtdmFIZEo5MTNPc0RWQTFDL0dENlpVNkpxc294d1BCZVdpUjFkTE93?=
 =?utf-8?B?aUxQLzlpeEZHWUJjMlBucllyUjRJUlM1STlPSWZReU5ET2owK0RqSDhZalRa?=
 =?utf-8?B?cXp4ZDIwL3dLR0F4Y3ptM25YLzNieWdIOTNuS0hyQ05BK2V0U0h6Q0dDWUor?=
 =?utf-8?B?N0xaYy9aek5DdHJBL2V0RkFGK3FTczJnNzNneWl6QzBVNHBjVU5seVVEWFh4?=
 =?utf-8?B?eXBsVE9mdWpVejhPZFpDUExiOHdieHcvc0VTQ0RFRkhVVWU2eXowL1IrRkxM?=
 =?utf-8?B?b3pLL3FvekpqcGMzekZDQzE4Ujh0dGE4aVBlK21OQngwWGIrNlFqZWdCM0xT?=
 =?utf-8?B?VWk1d2tDaUZGS05sV3JIbzB3a2lQaXZQY3U1NlpvY2h1Q1J3ZGo5N3pONkVo?=
 =?utf-8?B?cGI5a005b3U2bnhibTRUcW1kbURBcVFVUHZRWHROQmJUQUU3cmdWUnhhSVkv?=
 =?utf-8?B?aWpOOG0wWWNCeklNZCtBYzdiTVNsamtXdHJJZ01hWTR4dEtxcysrRnVJUDNB?=
 =?utf-8?Q?W/atKgBV5zw0urR4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 27941fbc-f58c-418c-3ca8-08de952e1803
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 05:17:13.6464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngUBqmWU8HBwkpRRI2MeDPmLflkoNF6qMRUOYoBOXowyobYN50xmDBSeK2xhvdHyIbdftPmPd5sbbb7OBzlgn8RBdwTy2EhhmYdr+jqoyOjw5jDt/H+2SxPnk8c0wmCP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1330

SGksIEtyenlzenRvZg0KDQo+IE9uIDA3LzA0LzIwMjYgMDg6NTYsIENoYW5naHVhbmcgTGlhbmcg
d3JvdGU6DQo+ID4gSGksIEtyenlzenRvZg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3
Lg0KPiA+DQo+ID4+IE9uIFRodSwgQXByIDAyLCAyMDI2IGF0IDEwOjQ5OjM0UE0gLTA3MDAsIENo
YW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4+PiBBZGQgc3lzdGVtLTAgZG9tYWluIFBMTCBjbG9j
ayBmb3IgU3RhckZpdmUgSkhCMTAwIFNvQy4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBD
aGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4+
PiAtLS0NCj4gPj4+ICAuLi4vYmluZGluZ3MvY2xvY2svc3RhcmZpdmUsamhiMTAwLXBsbC55YW1s
ICAgfCA0NA0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4+PiAgLi4uL2R0LWJpbmRpbmdzL2Ns
b2NrL3N0YXJmaXZlLGpoYjEwMC1jcmcuaCAgIHwgIDYgKysrDQo+ID4+DQo+ID4+IFlvdSBkaWQg
bm90IHRlc3QgeW91ciBjb2RlLiBBcHBseSBwYXRjaCAjMSBhbmQgdGVzdCBpdC4gRG8geW91IHNl
ZQ0KPiA+PiBidWlsZC1sZXZlbCBlcnJvcnM/DQo+ID4NCj4gPiBJJ20gdmVyeSBzb3JyeSBhYm91
dCB0aGlzLiBJIHdpbGwgcmVvcmdhbml6ZSBteSBwYXRjaCB0byBhdm9pZCB0aGUgcmVsYXRlZA0K
PiBlcnJvcnMuDQo+ID4NCj4gDQo+IEFueXdheSB0aGlzIG9uZSBzaG91bGQgYmUgZm9sZGVkIGlu
dG8gdGhlIHBhcmVudC4gWW91IGhhdmUgb25lIGdlbmVyaWMsDQo+IHN5c3RlbS13aWRlIGNsb2Nr
IGFzIGlucHV0LCBzbyBhcyB3ZWxsIHRoaXMgY2FuIGJlIHRoZSByZXNvdXJjZSBvZiB0aGUgcGFy
ZW50Lg0KPiBBbmQgbm8gYWRkcmVzcyBzcGFjZXMuDQo+IA0KPiBPdGhlciBleGFtcGxlcyBoYXZl
IG9uZS1yZWdpc3RlciBhZGRyZXNzIHNwYWNlcywgc28gdGhlc2UgYXJlIG5vdCByZWFsbHkNCj4g
c2VwYXJhdGUgZGV2aWNlcy4NCg0KSnVzdCB0byBjb25maXJtIHdpdGggeW91IGFnYWluLg0KDQpU
aGUgY3VycmVudCB2ZXJzaW9uIG9mIGR0cyBpcyBhcyBmb2xsb3dzOg0KCQkJc3lzMF9zeXNjb246
IHN5c2NvbkAxMzAxMDAwMCB7DQoJCQkJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaGIxMDAtc3lz
MC1zeXNjb24iLCAic3lzY29uIiwNCgkJCQkJICAgICAic2ltcGxlLW1mZCI7DQoJCQkJcmVnID0g
PDB4MCAweDEzMDEwMDAwIDB4MCAweDIwMDA+Ow0KCQkJCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0K
CQkJCSNzaXplLWNlbGxzID0gPDI+Ow0KCQkJCXJhbmdlcyA9IDwweDAgMHgwIDB4MCAweDEzMDEw
MDAwIDB4MCAweDIwMDA+Ow0KDQoJCQkJc3lzMHBsbDogY2xvY2stY29udHJvbGxlciB7DQoJCQkJ
CWNvbXBhdGlibGUgPSAic3RhcmZpdmUsamhiMTAwLXN5czAtcGxsIjsNCgkJCQkJY2xvY2tzID0g
PCZvc2M+Ow0KCQkJCQkjY2xvY2stY2VsbHMgPSA8MT47DQoJCQkJfTsNCg0KCQkJCWNoaXBpZEAz
OCB7DQoJCQkJCWNvbXBhdGlibGUgPSAic3RhcmZpdmUsamhiMTAwLXNvY2luZm8iOw0KCQkJCQly
ZWcgPSA8MHgwIDB4MzggMHgwIDB4ND47DQoJCQkJfTsNCgkJCX07DQoNCkluIHRoZSBuZXh0IHZl
cnNpb24sIGl0IHdpbGwgYmUgY2hhbmdlZCB0byB0aGlzLCBjb3JyZWN0Pw0KDQoJCQlzeXMwX3N5
c2Nvbjogc3lzY29uQDEzMDEwMDAwIHsNCgkJCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoYjEw
MC1zeXMwLXN5c2NvbiIsICJzeXNjb24iOw0KCQkJCXJlZyA9IDwweDAgMHgxMzAxMDAwMCAweDAg
MHgyMDAwPjsNCgkJCQljbG9ja3MgPSA8Jm9zYz47DQoJCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0K
CQkJfTsNCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K
