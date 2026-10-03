Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2133.outbound.protection.partner.outlook.cn [139.219.17.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830BB3537E5;
	Sat,  3 Oct 2026 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791026975; cv=fail; b=Sf476h7XBSICPddmHTZiqFOuKw9KRhtlkPdubV9/EPgZZP/NocInwDDBPYk0fvAGoSZlcWR3a5iusrqK8B65jfnzcZv5ND5gv4HquJCy1jUFac3lqTyGt4HlB0WFGhdUDDEnuoZQ5Ih9AkFHG5Au/YhsyhW90MUApUnXaDfsETE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791026975; c=relaxed/simple;
	bh=qwIx5wxUVuXHwCrqB7pqFJB1Xic5CGeEeq5hNxmtnTk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pq8vSvVI6hWyQsrGpVXB+rKo7qlZSKG2DnenYOzk4ymxuwFBAMw/GqhPlNteDU2dAgRqJBMFBkqtSmmhv1hzfXPoyA53VMjd9levIBDBSrg9y8H5cCD/Orj+Almkf1n5x/oMjE4S9AoT7oQkUnlMlLbFcguBkFOQ/NVGVL+5gO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZDG5SvQ2arpmj3aJdXsVlO0VZRRkGTex9Bown0NldHfgDDlXoE6ih9i5tZ4ujDWgL81lat7qfHmAkfCJ01+ysZJmFILxaoEX7qhxN9B34bPhGgo7pNtml6nnx0IuzGnz38OxreU4J0uXA//iIxvYYp7cNSAmojXqqCpbzkCgIIWkPYEIdtYmNVt27V/wTyjBz9agKF7UyR9c2NoMCXS1iO+ZdhfqHl+ZTe5H1fy9uxBFseo5A0qYGonaIO8VSUzYIUmirl7sfj2uLfLdlfP5+eke4I3BXRhZd5TILKyTXPTK7q1oeE3mJu20B0F4spNhh60piH1fFhlRL7cp2r3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwIx5wxUVuXHwCrqB7pqFJB1Xic5CGeEeq5hNxmtnTk=;
 b=i+knkiN2tYkRWMzFmfocX4k98DiCoIGyqhSdAe/uMQXSdI7/gPidwl13zlOqQLFNn8ElPjLId47fdZPFfrjvpHvA8BRqdtFLn26L3dhsaMou+x6V8OCKlX6T7/YoNnx2dvmvRnFwA57Wnu8DlQl+8wRoOsAZHn4uHRhZZoWxQYWc04+ARUCnSAqVmxOiAY33fIgc2iM8FZq2EsPPeaC4oLmv1aXqqEC5Wu+33qDrKxW0Y3AB0oEHmZoTI4G48pz2oYqAPaZZ+nc2V4qPNCHoqdPhOo/IIanPFMmreZSaoe73Ix3NR91GJi40vevpbFQ7ahd79FAqIG5Rpy6GIdmuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 11:29:18 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0472.016; Sat, 3 Oct 2026 11:29:18 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
	<keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 3/8] clk: starfive: Add peripheral-0 domain PLL clock
 driver
Thread-Topic: [PATCH v5 3/8] clk: starfive: Add peripheral-0 domain PLL clock
 driver
Thread-Index: AQHdNtN8zEycFiTIF0WGda8EH9quprbnEy0AgATUBXA=
Date: Sat, 3 Oct 2026 11:29:18 +0000
Message-ID:
 <ZQ4PR01MB1202F5CB0172B43C162A3074F2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-4-changhuang.liang@starfivetech.com>
 <179076152492.1471718.9285719072832956935.b4-reply@b4>
In-Reply-To: <179076152492.1471718.9285719072832956935.b4-reply@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: 22ed404a-b35e-4662-b1be-08df21419005
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 HfKh0VUaX0SJpP8D1QCU1In4790o7vE1y0A9C6B2/F8nF5I6FSSTmSPnQ8igw6IUm5/aAI6hFG6mFkmbLYxvkSCFCfmY+ISh0SAqAjvdbYRDMM4tbgqy6jSDw+LqNELfeqWEvo4g8IBeAE6DlHCeAcpMztwCTdd0mPbkF2XeB10ZuEKuqL1KcS4YRWRqOsmxSMvwG5ZDpm0J3wq3q/Zk4eDBdLxFVTcu6GIUHmm0RU9AxQz5ZjKHPpDaNpHqaheq86/gR88pgjoTmp4FDU06VtQZaMzIqzgbCiH6urn/XR30GhSLdsGYpesPg3AQqw6s7SZNe/80MoB/Yxbn9OP0laQb1sybygQdrcviSEsU/JMJRw+Dc/vshFc7ZfVXk4I3sq1TEGEqdZ1hUsdAE40/ZYuNxAn+RUQXmR+GoZsmQm78vhsuA7Wa/vkZ15OeGp1GTo/Hj4IfakwBG+Klz11teFa98vYNTHpWJ+bgPzamEalUEG+RB2F5kDyBsPrM4AEIvrEmGBbu1SnaYXwiH800UnjQB4RP1PkfXmzZcTz/F18XOGTv+wI5Fg0lMVlLHT/3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RU5kU2hGdjJpUjNaMkg2SUwxV1BnQ2tYRWR4M1JGWHZydDdzZ2c2L0lJa0hR?=
 =?utf-8?B?MXNVMHg3NzlaekpNWFAySXZPSVVWL2JLYTgrc1UweUUwby8wVSs1WFdPeWdN?=
 =?utf-8?B?WGtxYmVtWCtRYW52TEdZY1NkVDUraS9oSW5yY3I4ZGhMZ3FzbVJQcUdLVy81?=
 =?utf-8?B?UmJkSS83eG95d3JDQjBPeVNkSzRZNldjK0NHVlhLb2FrUk9XMUgycFdFR3Vv?=
 =?utf-8?B?a203MXZOWGc0Z294aFI1TGRNMm1wekVHZmk5TERiMVZvd3ZqSnhrYjRGN000?=
 =?utf-8?B?TDFLUE4zNk9NYmhvWmJsa0dCcVErdC9pTjBFa0RET2U3a3dXVG5BOEhyTWxX?=
 =?utf-8?B?QnFYeEYvVXhBVlNtbTdwOUVGNkNzSHF5SWtoakQ0SDcvVWpHZXNKa2ZyRWgx?=
 =?utf-8?B?WmV5UzhRZGV5dk5IZEFDOXlKTmNMZDgxZGkxS011dWVzV3ZqRTFzbTNIelE4?=
 =?utf-8?B?L2Y1VHp5T1hlRlZQWW02RHB3QTdKbnRSTjkwKzRHNlA1QjN6WFJjQkplTHgy?=
 =?utf-8?B?WG53UHBoeG96Z1R6K1pCVGRhanQ4TVZMQWN4R2IwdkhIcWM0YmJMOC90QzFM?=
 =?utf-8?B?VkNvcW54dENjQ3NmZk5taUZvRy9sTFhZOTJMVitKM013SW1Bb3NkSDdtZU8y?=
 =?utf-8?B?WFlxcVVrR1dtWStIRkZGM3k4YXk4c25uQUlnU2ZNTCtIejhhLzVlTFM3Qm1R?=
 =?utf-8?B?eFpqWTdWa1llNmRMdFBBTGVCL2pLT0txa1lwU00xOEFId0xiTHVacGJwZ3U0?=
 =?utf-8?B?UjByVGJTNVNKOWJOQjBhU3VKSm44QkF6ZlZ0YkxBNTlsR29lUTFraU55bHRq?=
 =?utf-8?B?T0Y2NjdmNTRoRnZuVHZqRmxQa3ZuSXlRYzBZbURwUXM3OTJIdFRKSk1EeEZz?=
 =?utf-8?B?anJjbW55WE5uSzFENEpDVzN2bkFCZXhqbXN4VllJamhkVDVmSnkvQTN6QnFF?=
 =?utf-8?B?ZzV1U2RQMzdDRVQ0TGd1L2xpb2U1VnIrUVJ3bWNUWEhsUGNtRmhkem0zTGFE?=
 =?utf-8?B?cVQ0SUp0WGRqMFlGRis1bEhXd2xRajE0ZDBxdUc5QjZvbloyS3ZMd2dQSWFj?=
 =?utf-8?B?eGlSNXI2enFpNlpxc3R1Tmp6aFYzdnhwVjdKb0JFdGM2ODFKdVdkY3QyMWln?=
 =?utf-8?B?UjVENFNLdTZkQ1J6MDNNSzBsRzhTQU1UME00NXRTYUNmLzJVWUl5K0lWRWsy?=
 =?utf-8?B?Mk1uTVFmWm1VaTJkQVlFVHdNYmNLNXFOMk13bnlQNmFJRUJ5QTZnZ1B4SkRN?=
 =?utf-8?B?dWNBYmlGQkxNVGlrS213SVZsVit4dG0vbzcrV2lsM0RDV05rSjd3d1BxY3R0?=
 =?utf-8?B?N2d1OVdub2p6UmpuQ3BTM2ZLVDRYNWVhYmZmcEt6YWYyMS9kdnREcWlBaVRw?=
 =?utf-8?B?U3NaVjhEK1hPNHVyM0REN1M4STJIekVXVVlCMDVXMjZaWFFUU2JDcmpYeGVr?=
 =?utf-8?B?dDZnOVB3R0RhNGhhZUNDbWFHU2hhNGRhN0ZDblluN2VqaFpVQ1hwUjV5RmFO?=
 =?utf-8?B?a2E4bTBURVBES0M1K2x4cFo0TDhSS1FMWVFyd3ZKSEljdjNSeUR1RHczMFYy?=
 =?utf-8?B?NHBoaTdVVWIrSFBhSXp0L1krd3V2ekxFb2FyS2t6T1V4dkJpejdKOXlnKzE5?=
 =?utf-8?B?S1lLT1BlZlhOTG9wT0dhbkxBSXhmVWExYllXa0lFK3lLNklJMlNtZGZXZ2gw?=
 =?utf-8?B?ZS84aDN4VFM5MFo2eHhzWGZ5bmJsOVhIcyt3WkIzU0phdElxSFN5VklhLzZz?=
 =?utf-8?B?OFliSDNRL1I1bmN1ZGlTR0QzUHJmYjJ4TkJtSUsvQnJtdFZ5VTVRMm9LNGlP?=
 =?utf-8?B?eS83YVdTN3NSY0lnMTNROHd4QUJoYzJEb0NqVmdCR1FXSGNSOVdHQXBrWHJJ?=
 =?utf-8?B?TVllVTRCL2NGY0NPZnRZeU42cmNoMnJjZEh0N1RQQTYvcitCYkw1SjJQMS9s?=
 =?utf-8?B?S3NTM3I2UHlPcnRjOXo5SklDNUNlSVY0L0JxT0I3K01VTjJlUUFHTHpBRlFI?=
 =?utf-8?B?THZiVnR6cU9mait5bHROWVFGMTU3NEU5TGRZcHIzc0Y1VTFMK2daUUJsSThy?=
 =?utf-8?B?NmgySjVTUFZObk5SZnF4bzdIL0lCRnhlSlc2K3FKVmtVSFQvMlpxWUZUYkhL?=
 =?utf-8?B?Nk9tYmJ6MmVHTU95NHluYTFnY1hTMTV5N1dWK1JNU0txMVJXZ0lwc3FkRWJo?=
 =?utf-8?B?UjVWY3p1L015V3F6bjFDUXNGMGx3Qkw2aFY0OElqb04rUUxLVFNqTnpVeVJ5?=
 =?utf-8?B?K1BnWXVwc1NOL3JHZ0V1aWFTeHZnT0hzZ2xlZ3ZENU03ODdaaXBwajNNK1Jl?=
 =?utf-8?B?WElqd09SRmNUVWZpTGZnWGNCSTRPUTFTdWVKaEJWTUJNajhYOUpMcllNR3FK?=
 =?utf-8?Q?Kd5+s3Mu9bLjV/xA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ed404a-b35e-4662-b1be-08df21419005
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 11:29:18.1854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVa/BwugjH5MhyfiEv5dOUJsix3v1D1c6Jcl+3iEHOEM2Oz23k/92YXT0yRTYWVAOBwvvcs/6PcmzZynkiaut9NfH/fu134Ur/zuiqRo3sUR6l8+E0op4XGvEfimzjVH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267

SGksIEplcm9tZQ0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gMjAyNi0wOC0yOCAw
Mjo1NiAtMDcwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBBZGQgcGVyaXBoZXJhbC0w
IGRvbWFpbiBQTEwgY2xvY2sgZHJpdmVyIHN1cHBvcnQgZm9yIFN0YXJGaXZlIEpIQjEwMA0KPiA+
IFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVh
bmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogWGluZ3l1IFd1IDx4
aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Nsay9zdGFyZml2
ZS9jbGstc3RhcmZpdmUtamhiMTAwLXBsbC5jICAgIHwgNjAgKysrKysrKysrKysrKysrLS0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpo
YjEwMC1wbGwuYw0KPiA+IGIvZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoYjEw
MC1wbGwuYw0KPiA+IGluZGV4IGUyMzM2NTE2NDQ5Ny4uZjZlYmFhZjVhYTE4IDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaGIxMDAtcGxsLmMNCj4g
PiArKysgYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamhiMTAwLXBsbC5jDQo+
ID4gQEAgLTMwLDYgKzMwLDkgQEANCj4gPiAgI2RlZmluZSBKSEIxMDBfUExMNF9PRkZTRVQJCTB4
MTgNCj4gPiAgI2RlZmluZSBKSEIxMDBfUExMNV9PRkZTRVQJCTB4MjQNCj4gPg0KPiA+ICsvKiBQ
ZXJpcGhlcmFsLTAgZG9tYWluIFBMTCAqLw0KPiA+ICsjZGVmaW5lIEpIQjEwMF9QTEw2X09GRlNF
VAkJMHgwMA0KPiA+ICsNCj4gPiAgI2RlZmluZSBKSEIxMDBfUExMX0NGRzBfT0ZGU0VUCQkweDAN
Cj4gPiAgI2RlZmluZSBKSEIxMDBfUExMX0NGRzFfT0ZGU0VUCQkweDQNCj4gPiAgI2RlZmluZSBK
SEIxMDBfUExMX0NGRzJfT0ZGU0VUCQkweDgNCj4gPiBAQCAtNDE3LDE2ICs0MjAsMjEgQEAgc3Rh
dGljIGludCBqaGIxMDBfcGxsX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ID4gIAl1bnNpZ25lZCBpbnQgaWR4Ow0KPiA+ICAJaW50IHJldDsNCj4gPg0KPiA+IC0JaWQg
PSBwbGF0Zm9ybV9nZXRfZGV2aWNlX2lkKHBkZXYpOw0KPiA+IC0JaWYgKCFpZCkNCj4gPiAtCQly
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsICJubyBtYXRjaCBkYXRhXG4iKTsNCj4g
PiAtDQo+ID4gLQkvKg0KPiA+IC0JICogSW5zdGFudGlhdGVkIGFzIGFuIE1GRCBjZWxsIG9mIHRo
ZSBzeXMwIHN5c3RlbSBjb250cm9sbGVyLA0KPiA+IC0JICogd2hpY2ggb3ducyB0aGUgRFQgbm9k
ZSBkZXNjcmliaW5nIHRoZSBQTEwgcmVnaXN0ZXJzLg0KPiA+IC0JICovDQo+ID4gLQltYXRjaF9k
YXRhID0gKGNvbnN0IHN0cnVjdCBqaGIxMDBfcGxsX21hdGNoX2RhdGEgKilpZC0+ZHJpdmVyX2Rh
dGE7DQo+ID4gLQlucCA9IGRldl9vZl9ub2RlKGRldi0+cGFyZW50KTsNCj4gPiArCW1hdGNoX2Rh
dGEgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gPiArCWlmIChtYXRjaF9kYXRhKSB7
DQo+ID4gKwkJbnAgPSBkZXZfb2Zfbm9kZShkZXYpOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQlp
ZCA9IHBsYXRmb3JtX2dldF9kZXZpY2VfaWQocGRldik7DQo+ID4gKwkJaWYgKCFpZCkNCj4gPiAr
CQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLCAibm8gbWF0Y2ggZGF0YVxuIik7
DQo+ID4gKw0KPiA+ICsJCS8qDQo+ID4gKwkJICogSW5zdGFudGlhdGVkIGFzIGFuIE1GRCBjZWxs
IG9mIHRoZSBzeXMwIHN5c3RlbSBjb250cm9sbGVyLA0KPiA+ICsJCSAqIHdoaWNoIG93bnMgdGhl
IERUIG5vZGUgZGVzY3JpYmluZyB0aGUgUExMIHJlZ2lzdGVycy4NCj4gPiArCQkgKi8NCj4gPiAr
CQltYXRjaF9kYXRhID0gKGNvbnN0IHN0cnVjdCBqaGIxMDBfcGxsX21hdGNoX2RhdGENCj4gKilp
ZC0+ZHJpdmVyX2RhdGE7DQo+ID4gKwkJbnAgPSBkZXZfb2Zfbm9kZShkZXYtPnBhcmVudCk7DQo+
ID4gKwl9DQo+IA0KPiBUaGlzIGlzIHF1aXRlIHVnbHkuDQo+IA0KPiBJdCBsb29rcyBsaWtlIHlv
dXIgUExMIGlzIGEgYnVpbGRpbmcgYmxvY2sgeW91J2xsIGJlIHJlLXVzaW5nLg0KPiBKdXN0IG1h
a2UgYSBtb2R1bGUgb3V0IGl0IGFuZCByZS11c2UgaXQgaXMgZGlmZmVyZW50IHBsYXRmb3JtIGRy
aXZlcnMgcmF0aGVyDQo+IHRoYW4gdHJ5aW5nIHRvIGZpdCBhbGwgeW91ciBkZXZpY2VzIGluIHRo
ZSBzYW1lIHBsYXRmb3JtIGRyaXZlci4NCj4gDQoNCkdvdCBpdC4NCg0KQmVzdCBSZWdhcmRzLA0K
Q2hhbmdodWFuZw0K
