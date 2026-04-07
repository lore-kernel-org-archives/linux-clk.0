Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2110.outbound.protection.partner.outlook.cn [139.219.17.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C47389DEA;
	Tue,  7 Apr 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544607; cv=fail; b=YZjt6gVCA72WhH966gA03r9WVChMLbdnxi0JFr+aRI5l6rpy8AFECQ8QHmf3KJ8Km3nuqdCSXa+h3ZU4Y3w2ysLrEVg02UNK4qgR97mf6VNew8/rBxoIDL1vfB/u2WXyrfd3evBlo1mTTY+MokayJUXSwkYtoi45kWuoeR8GD3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544607; c=relaxed/simple;
	bh=krYBL8bYbuTpSXyTVIqdlAKaMWxSC8lJqiM2/pEafVw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mKS5lPHgxsg85ZrSxF98/lN4s2xrVSvrQAR17wDLFXbBj+CNjBqHerlqW97QdWWKjaswJVv+CUR2l4hb8k8ndn+y4ys/WaYjPzbBhfq/U5Lufszk5RLsV6wBB5meMfQ3zDwn7up4wADgYlM09IQFGaRRhsGUYgFmxAI0HVHX9EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7JQg6/COAE3o9dgGcPIReAEvMJaxtGGrdo9Yr3WWjCcdJrgccgs9UWheohlYVVc9b2SrfauSRHWvKuYg+vNDRAifXLP+u8mVvJQeYOeyN7Z4aZz1XJIQeSNRSh8vwpiUHz5YFkAy8Vlz3zvjCiPPO5Ojlyky1QauvJdlSrMqG2U2Q52nH++hDXCPLCCYIr+k+FXJn7eQATKkP1p6DAHhp2iLV8qW/8GtC4SEFCeuF43l/Qc0A6TUsL1fVr3S/1c0QKPE2HtqB39pWh5T4sJkP1YxpV66RmppJlgcx/nIYe5MXzrmGEIGK/xzyZ8yKgRgVvPDQSuDdb8iqEG7usLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krYBL8bYbuTpSXyTVIqdlAKaMWxSC8lJqiM2/pEafVw=;
 b=UcFSx+ok2/frkhxx6kknra0PlVYBIwk5qQ1DmiVaCZ3M/Y/W3P2MjHQGTgOKXJpuWA6qGzYEyTFQesMPTeFIMSYzwD2Ir4+D/+Q8tP16Bs8D6Bf7q6qW+sSnTl65f3fl1j+qlJ9D4xeMwD9B1aTmpM6am7idbPZW87eO8WDLsPViEIhNny/fD0D6TPzNf69bTjMN3gBjIbct+iuqwnlMx25Lt3fUHvntyjE8tKnGLDRUY74VL75dRfw0RxUZZTnVBnXfyNirR9XId2Lv1oviKs7vOP+P6nr4arax8O4lVEkExMQ1yENAF6S42+hMvMhmazbz8f5PBcB1PSghlN+gNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 06:49:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Tue, 7 Apr 2026 06:49:51 +0000
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
Subject: Re: [PATCH v1 11/13] dt-bindings: hwinfo: Add starfive,jhb100-socinfo
Thread-Topic: [PATCH v1 11/13] dt-bindings: hwinfo: Add
 starfive,jhb100-socinfo
Thread-Index: AQHcwy29Jbuv8/tn4EuVftDhed9T17XQEsgAgAMcUeA=
Date: Tue, 7 Apr 2026 06:49:51 +0000
Message-ID:
 <ZQ4PR01MB12021DE82F5D893BBA15A659F25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-12-changhuang.liang@starfivetech.com>
 <20260405-strong-watchful-marmot-fdfad6@quoll>
In-Reply-To: <20260405-strong-watchful-marmot-fdfad6@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
x-ms-office365-filtering-correlation-id: e45a7a0b-8c4d-497f-77a7-08de9471de32
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 xllWX3rEL5413XMPNoFzAWg/o4CZqMK1zcQ7kMdOK4Fvp7F3cvNb8CAIgHJG3DT7HWhLaJzk9WFnhTsm5PlPZoaCputGsx6nFHZi5A/EfppEv0W2qXYXHn3KNfG8aRKU/ESVpeOvjqPcnTK3UIxEwmgSUaM/pKknMgtNRjx+ree7PjtUyf0PiPmoirvr+n4y+Pw6NfavYBKfSvnnjAJ4BjtV6h35gdGne9sW+ufiWpXBXQK2AL4p4iwYf+Mz7167egm2iMAm4knnbfK4l1vbmEpk3VOU60yFe61vknSmQqs8IT2rOWypvkDF+tXgsuHMPzJkkTsGSWEdbt+vZ34/dTQVRY0TuN3C5UshECBzmTSTUx+GTVcaDg4lHhaD2BmV7WaLSUM0xd/3GVuTKUHoESygUUyJLgJrtEBRU8fssxJ+eZrVT08tV52zyFtbAr08CF2lrgOXqTC0MuTWxfCMt4zA7KnvPs5iM8mQTX86sybK8g/z+q+1TCO0NExCPeNy95CPbqef832kYxk6IE2Q0ssM+nI1T3amR4dO+NNcTIlXGFQPTqw412mEVrRjTQdVurOtJTJr5XWleiSRW3R8mqf7khCw6jMm5AYSmiA9To4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWZTNi9Nb1lFRUtIQnUrQlBlaDJFdUhJYUhkOTR4UWY5L1hIRUtHZTZJNFdH?=
 =?utf-8?B?MUEzNjltSHgvcUZTdGZaVHFpRDE0dlYxR3h6eE9nS2ljUzBsMGJzRFh5eC81?=
 =?utf-8?B?WVhRQk9HQmF3TWhqL3lkNXN1U2Fhb2JUL3V5dVJFL1J2cFB5OERUYm1YOGZR?=
 =?utf-8?B?UDdIeEwwYzNVV1R6Rkg5LzVFMFh5V2QyWjFpeGUrTVNRS1NFOTVFYkh5WGs5?=
 =?utf-8?B?eTlKWEZGVFM3YUJqRm1DczVDcDBuWTQwcmhmbSt3eWZjWTFGY1NsUVlvMzd5?=
 =?utf-8?B?V0hUS0hjOHEzQWd6Y3piOTV1YndNdTB2NVpsSkVTdVFmdVpZMWcyczFQQXhN?=
 =?utf-8?B?TFUyZkh3QUFqODlXOWFQL3NZL3pKdWRpMVZEaUU4UTI5WHFzUW5QdC9KeXZS?=
 =?utf-8?B?eDd5WHZEMTBHd3J3d0Q0UHJtbEhwWVFYOCtZWnNEbWhmREQ4WXE4b2hQQTBF?=
 =?utf-8?B?TTlVSDhLT256NGJnRlRZWjQ0L09LTStidzI3SzBzN05KUmVBN1R3Tm53bm5I?=
 =?utf-8?B?MW9sMGFxNFlNMmF6QnlyaERoT3BhMnZNV1lNc2lsd0FQd25tQldsS0hCZnVo?=
 =?utf-8?B?Vms3cGdqa2FBR2ZHMFhLek1FM0w3M2ZyYnp2bnMxTmlXbWJVa0I3bTJwSkU0?=
 =?utf-8?B?ZVlJWE1TcmZzanNsVkRTcWNDV29FamIxOGhiQzQ0cUQ3ay92aklNbUxRZXM2?=
 =?utf-8?B?WStWMHJFR05kS3R4aDhaaS9waStDRjZ6bEN2azIyRkw5bkhIY2diTDlqTmho?=
 =?utf-8?B?VWI0SktHajFmc3JQeDBaQzNBazBEVUgzamVSVmROZzJkeWdzTGdVRTh1TEY4?=
 =?utf-8?B?T0NuOU9tb0QvZG45TkwzazZrNUVLR1BGK1VueXhicWZwQ21MWWordDVNWkpz?=
 =?utf-8?B?c0VLdXI4MG83YmllNEhtMXRyTTBEZDVXb0xzZDFyZXpVR2tIS1hkL3N4L2Nx?=
 =?utf-8?B?N2EraHpqMjduWGNxSThqOW8wTm9ndmZJREtxZjl2Y3cwRlBqYXNBaXlTb01k?=
 =?utf-8?B?M2h3aEgxcDJHenNYVFpyWGduRVc5Y3RvdVUvRVVuUnJWSW9qVG1PTkFVL3RH?=
 =?utf-8?B?Q0ZneFI5R0lENVNUWHVYUjlvYTlLZXp6V1hyRlIrRTNGYmpqTWF5QktpcFBY?=
 =?utf-8?B?WmM3Q2VGY3c1cGlLMFplalRpakNWKzZoWUpnMjBpelNlaElKNWlVcCtjRkNk?=
 =?utf-8?B?MWt6MkxDTDYxUlVGTDQ1RnQrZ2piODhKWm1pTzYzalR3UU1ldjVHTVJGNVFC?=
 =?utf-8?B?ZUdZY0JzMnFUampVc2ZRazA4WFpZQ25sWHFCblpyRHp6SUxFazBMRVpROExG?=
 =?utf-8?B?b1FIM0hjYm9jblAyZi9Dd3M0ejY4K1YvYlp3WHZQelAyUVMrQitUanZXbDV2?=
 =?utf-8?B?UjhUMUVIRjJzeDNmOS9pQmh3ZmlkV25SSWExNHVsaWRmWWlmRzBmYnMzMmls?=
 =?utf-8?B?WHA0bk9id3pwYjdrRFF2bWRqWUFhWVRHSThmWEZLUkpNT0xUOXRJN2Q0VnR6?=
 =?utf-8?B?SlE3Y25SdlllNkVhVjd4ZHY4Q1BTUThKZ1gwTFlVZU9iaUNKcjlXdjhQeUdJ?=
 =?utf-8?B?V1hITmV6ckc5KzhKS0VWL2lJTTFnanZFVDNyWEo3VVppR2pvZkZCUjRHM0do?=
 =?utf-8?B?U2JCZlBzZTlQUFd3eVRsMzVPM0FYY2RKRE5RMTFoblFoLzBKNkluWEo4OEVa?=
 =?utf-8?B?MXBSTXVvNkxPUmdOV2RmSzZuaHAxQzZ5ckJieUNEbitlNTl3UkhXSzFBejhG?=
 =?utf-8?B?R05XMzZZU1U2eXh3ckY5MkV2TUdYR1lQd2UrUUJLMHJOYWZHeEhTaWdqUzBO?=
 =?utf-8?B?eldSS0VuMTdLWHhleHJuVEcxNk1hMzNsbmRPWHJRTHBUWnJjU3FuVDlJajRZ?=
 =?utf-8?B?cWVOa1RMU0VPcldMdjZzUU96MENlL0lRL0NJMkJrUWZuTndwaUlIVzlqSmRo?=
 =?utf-8?B?dGVMWXcwTGNleWJ5MEt1ZDJnaGJIeEYrSE0xbEpJTU9HdjdmaXZrRWt1d25W?=
 =?utf-8?B?dnM5RGhVTFpCN05nT0RodzlGZzNIRDNZVGtnY0hvYmJnRncyd2FGM1pZV1hX?=
 =?utf-8?B?ZnB1UWp2enh4cDNlN3lIME5BK2dwTnJxY0JlbVdWREQrM09xclhlbDhscWZC?=
 =?utf-8?B?Q3NSVWpOYVoxSTlKL1VycldPU1pjc2kyNmlSYjZSMDBrcEgzemlZWHVrZmZq?=
 =?utf-8?B?dnNxU296THN0bmc4dDJmNE1IRTdodDhYMWRXajFIc3VmZm1qRnExbkFRYW1J?=
 =?utf-8?B?S3VpaGREZWRwVFMweWZNSkJPQkVGN0RqTml5YnpVU0c1OFNvaGZHZWIyVTVL?=
 =?utf-8?B?cm53YnBuTEpoOW9sbjgrQ2JJODRUY0MrbFY3aTZTbjE0aElFc2Fpck1KalZP?=
 =?utf-8?Q?FyrXN9hCbW2pPcjw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e45a7a0b-8c4d-497f-77a7-08de9471de32
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 06:49:51.2772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayI4NtVLek2NYvOWBXWc3hw+Mg+Vkz/u7KBb9sp5pjtOh3SbdLIpGZwsPI8T44KHZtwYEmrue92hj2QdL/7aHfxtZn0x9Lmb4AwkYbdilQy6wGyyTjCpvKKKbyhy/45K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gVGh1LCBBcHIg
MDIsIDIwMjYgYXQgMTA6NDk6NDNQTSAtMDcwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4g
PiBBZGQgc3RhcmZpdmUsamhiMTAwLXNvY2luZm8gZm9yIFN0YXJGaXZlIEpIQjEwMCBTb0MuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5n
QHN0YXJmaXZldGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9od2luZm8vc3RhcmZpdmUsamhi
MTAwLXNvY2luZm8ueWFtbCAgICAgICB8IDM2DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3aW5mby9zdGFyZml2ZSxq
aGIxMDAtc29jaW5mby55YW1sDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdpbmZvL3N0YXJmaXZlLGpoYjEwMC1zb2NpbmZvLnlh
bQ0KPiA+IGwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od2luZm8v
c3RhcmZpdmUsamhiMTAwLXNvY2luZm8ueWFtDQo+ID4gbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYzZiN2Q1YTRjOTENCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3aW5mby9z
dGFyZml2ZSxqaGIxMDAtc29jaW5mbw0KPiA+ICsrKyAueWFtbA0KPiA+IEBAIC0wLDAgKzEsMzYg
QEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+ICtodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9od2luZm8vc3RhcmZpdmUsamhiMTAwLXNvY2luZm8ueWFtbCMN
Cj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogU3RhckZpdmUgSkhCMTAwIFNvQyBwbGF0Zm9ybSBjaGlw
aWQgbW9kdWxlDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIENoYW5naHVhbmcg
TGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiArDQo+ID4gK2Rl
c2NyaXB0aW9uOg0KPiA+ICsgIFN0YXJGaXZlIEpIQjEwMCBTb0MgcGxhdGZvcm0gY2hpcGlkIG1v
ZHVsZSBpcyByZXByZXNlbnRlZCBieQ0KPiA+ICtKSEIxMDBfUFJPRFVDVF9JRA0KPiA+ICsgIHJl
Z2lzdGVyIHdoaWNoIGNvbnRhaW5zIGluZm9ybWF0aW9uIGFib3V0IHJldmlzaW9uLiBUaGlzIHJl
Z2lzdGVyDQo+ID4gK2lzIGxvY2F0ZWQNCj4gPiArICB1bmRlciB0aGUgc3lzY29uLg0KPiA+ICsN
Cj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+
ID4gKyAgICAgIC0gY29uc3Q6IHN0YXJmaXZlLGpoYjEwMC1zb2NpbmZvDQo+IA0KPiBObywgbm90
IGEgc2VwYXJhdGUgZGV2aWNlLg0KPiANCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4
SXRlbXM6IDENCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+
ICsgIC0gcmVnDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiAr
DQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgY2hpcGlkQDM4IHsNCj4gPiAr
ICAgICAgICBjb21wYXRpYmxlID0gInN0YXJmaXZlLGpoYjEwMC1zb2NpbmZvIjsNCj4gPiArICAg
ICAgICByZWcgPSA8MHgzOCAweDQ+Ow0KPiANCj4gT25lIHJlZ2lzdGVyIGlzIG5vdCBhIGRldmlj
ZS4gTkFLLg0KDQpJIG5vdGljZWQgdGhhdCBvdGhlciBwbGF0Zm9ybXMgaGF2ZSBzaW1pbGFyIHBy
YWN0aWNlczoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjAtcmM3L3NvdXJj
ZS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc0LmR0c2kjTDIwNQ0Kb3IgY291bGQg
eW91IHByb3ZpZGUgbWUgd2l0aCBhbHRlcm5hdGl2ZSBzdWdnZXN0aW9ucz8gVGhhbmsgeW91IHZl
cnkgbXVjaC4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K
