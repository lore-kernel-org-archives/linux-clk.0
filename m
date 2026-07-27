Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30423CE0A2;
	Mon, 27 Jul 2026 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183533; cv=fail; b=ZmLaJdCHRYsFa8eOvHPNSgGDqv3rPkofwU1UNEd/rbgDyjLpgBTds7zceQa7J95NKC0THD/Y1pfeMoKFmGEAiIsUYMbDwAurz7mzUOIb6x+oKEGiY9TSRcOGNuVqrrLNHVcC4uLjYewdekLMxGVXoYAMOsinFJ1+O8wZg7P5szc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183533; c=relaxed/simple;
	bh=oCV+Ico5A7aKN0t8y/XKXMJLVOzdL1693DOOeUIT9YQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lxyMvRRUYSYKN+HuVmdfKXZXbSAJ9GaNojWyixlD/g878DMiTHLKTgZRD9x9QC3qgSLVe8Gq6I878CY/XFiCdHONA/WBVAsnXwdZuWo6RLKNivEsxN7xk6pgiM5f0Aga9HDNJTDm2TbtyhfhnBqbqjvpxktEXdEu7hRhUVzmEtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aoYSX+h9; arc=fail smtp.client-ip=52.101.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aoYSX+h9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fajefoTnk8ASCvXb4iMy+wQS3s+4fWr/OfizaKXKdi7pfs06OEWxVV7lqlnaqzwwakQpqUTh/rKnwi1hklUPujdSRnGlRgwm1+k0oUaqF5gO8/bWu6APE30C3Nt3mYtKqutlO8MFR3E1NhngnWw6r1gNTAgX/OGPxPc+Y/pmdFuzTs6g+ejoyO6TQsIL6Ct3fUDo2jn/aWdZRB+RK/mI6K+sLal2bmEj8ZR08CEGJQn7BWL11TQgMhVn5cXeFS4OWkG5f8025sJn+EN9xXJfAcyxUcp/slp+7e/CE6tAnEON0gaVAK/vTY7gVnRhPLEVnH8NcjqazFhWUU3lLZMKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCV+Ico5A7aKN0t8y/XKXMJLVOzdL1693DOOeUIT9YQ=;
 b=djX2BGsDYJbiPvxzlgoHbDRcLmo1623ojYY0HHXGfldufDsQLCWW1tRFVHCpYi+vR7AKRwipzgoZedERlxItEhr0aUzCwugMukPAF9uEKaaV/OZldtKteFke108m5EJ9bDnmKLk4uKzYmZtlrXcnv7diOpvl9BsTfQvqbFk0A2HiV8OZtMC/RHYGl1TOBXRHi8auWGZopIETMzpBRHjAAghqIDocovrpVXqrTWorSOqQssmQAMEMw5x35njcJzMCshbpDQKulU7FU0iRmLDb9hckE+kG22sixfciuj/HSrq9j08VClhv5sqGmueghVd6pJQKg1RmIfHV1jSqHao4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCV+Ico5A7aKN0t8y/XKXMJLVOzdL1693DOOeUIT9YQ=;
 b=aoYSX+h9913a2ib/AsXoHg/w3F3hHQceHbXFwj9FKpD7X+pPb9Z8EGVtuORnpkIAVlZHjZtck2oTg0l1/rcZ8cOTPdtT0ShnHG6pujEQfCd5Tk5u5KCgxLcW3copIV4qayS520ZVW5BCXb+8ntWc+4XE9ifCm0V08E5S8l6GMeU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11792.jpnprd01.prod.outlook.com (2603:1096:604:23a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 20:18:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 20:18:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
Thread-Topic: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
Thread-Index: AQHdAApe7oo0Hv5c/0CPDytv5nQPwbZnBX+AgBsDnTA=
Date: Mon, 27 Jul 2026 20:18:46 +0000
Message-ID:
 <TY3PR01MB1134681E8AE71331692A5B6AC86CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
 <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdW7=NEJJV0k1vLjLT9FBA7MSj=wm3J0-roTpsA9azhwrw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW7=NEJJV0k1vLjLT9FBA7MSj=wm3J0-roTpsA9azhwrw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11792:EE_
x-ms-office365-filtering-correlation-id: 427699be-7891-402f-0cf0-08deec1c4312
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|3023799007|38070700021|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 egXoz6T29n7xwGQRG++QpS77lT9OfinycCA2Gm2MIk4QsfYxCkbxJxO0NwiB9keTYSP5lTqeqOgZ31XtA4CgOqTiDJ990s0eAU7NqYF6EQomlyukt4+mKpVuaveGN6w/eM9k4vIS2vJ8upSYivsB9WTvo5tK9RPTjzzof2CJPvNwRFzvNlhBdp2VPDIS3Ivy/WDIb3G4uj6dYfM/LcAbZg02m+mqx5AJWDYpeSsLRRVMVSrKX67qX3QAaFA2617jNeaTJOPLvQr9f7KotE6nt14uPpqvRCIx+rMvZ/tkYcp0Dn3ZQ/IF1zLRvs7D7Z/p5ise90o3+xjVcTlkUcG1Vq8hg1NqioAemDNOC1lCVwc9ocIqFrDuEQz+eG60+ESoj5yBMGk1VDxU7FdmWDUlv51813PI1t6h959yuOoXGzyzhtAAG9PeY/BZc4sIrdKNCdanMCw2incBnRjUYWbHNhssmHILEFNZ/9hPWpftN0wCF0TrmiCvT9OP0qxcuwPn1pFDShwnrykMdn79aWIngpTMjdb4OJ8wvIs/+DB4nQOmPJnG+/oH3UsrxpfvvXJQhCfYtdJm5WXqL1BsgPCY6LwPIUu9vd69UmVyrWl+1E+i1Xc5tivPA4qvjseLazkkkqFB6UcuOlUMH264//goH4kFysHeY5j/7RWye0akw69g1KS6Cu0aFL59t+08zWBq3c+qk0795VOFl/5grYPUgtAqeuPQTF8w0pmCOv9bqSU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWZlYm9tcXZ5TU03ZkVjSjVhWm4wRVNveUEwYnR0RGg3MVlyb29pYXY4Mnhi?=
 =?utf-8?B?cTAxbkxOdndnNUIxNXRMcFBMZnFPeDY2bzhqd0FwYXVIYWN2MmVJdTFRMDRG?=
 =?utf-8?B?ejlBZlBOUXZYVHRYTkRRUW43NVNjL2RMYnhHbDR1NU5UTUNacGQ0SnJ5bmU3?=
 =?utf-8?B?ODBvanFkUmE2QUhoWThlZHh4YXhLK1U4WVRFNmUzSmdxMjgwSEZRTzBwa25B?=
 =?utf-8?B?OXk4M0xSZEY0SVFtc2tZWEs2TGw2WkE3c3p0Z0JqVy9kY29sT3FWK002ckpx?=
 =?utf-8?B?U2RKTjAzNlg3bXhHYUpoMzVOMmI1c2tseGdiTjl0cTBwdnpyNFJBUHdmTFky?=
 =?utf-8?B?bDNHZVRRQjdjVU1UQURLbmFiUGlVSHd6WFpSbzBXT3kvV3M4bDcwR0ZzTzJR?=
 =?utf-8?B?WlBDVGtWSTFVK1NjOVUyU2NlWUlGMVlsQW1MMm9VMi9aN2wrRDEramEwZ3FS?=
 =?utf-8?B?QUcyVW13MHk1Ly9XakVYZkNhVWYyYVIvVHVmd083Y2FUNXY4SGJuc0hwVXBz?=
 =?utf-8?B?cHM5NUs4REVndlBzakhJeW82YmZGaVFOT29hczVvdS9aZDlYa2Q0YkVSaW9t?=
 =?utf-8?B?TWVQUnU0czZ1bGtxbmJveDBuVjIwNjNkVnNUTVhHSThLUGpGT2NNVjJ1Rkls?=
 =?utf-8?B?d0VxeVhHeENQanRlVHlnVFV6cUNTb1dxemg2eFE0eEtldW96dzFOWjZkVVVo?=
 =?utf-8?B?VmpaZXk4OFdEQ0ZRaUF2Nk1OQjFCR2JucXdFb2x5NTVYS0t2NG8rREZvMGVp?=
 =?utf-8?B?VGtVOFZOSm1RS2hINjFONWY3a29DaXVPVVp1Nnloc3o1Ky9LYnZQR1V0Umc2?=
 =?utf-8?B?d2czY0U1aFEzSXJ1Yzh4eGJOYVRKenpJQkFLa1Mva0VYa0s2bytCbjlVMi9y?=
 =?utf-8?B?WDZPZi9VbStyb3Nrc0hLRFYvTjJqWmxnTnM2Slh3c002T2U5WGZDVVI4NE1L?=
 =?utf-8?B?WVZUWWhMbHVTdnJ5Vitocmd5RmxNWG9yeis5SkZRcDlKNGtub1VOVURxMFAy?=
 =?utf-8?B?OFhyc1lValVjOHpVcTZSU3IyMS9IZm53TkNLV1dxOFZUUkVNV0JnRmVQVEdw?=
 =?utf-8?B?TnQyMENBVjM2cWUxdG8xWDFOenZPc002QW1YVWxOUGh1dmV4UEViOEFWVTkz?=
 =?utf-8?B?YzhpVGFpNkRaZHVPUGRsSW9ibDMyWEpGVWpzanRlZkV1V2ZaMnNXSjJnSFhI?=
 =?utf-8?B?Vnc4VWlaVXpJWGJrdjJBQnkwczlDUE9xQjVjZWZJd0xOU2diRXNYQU9aaHlj?=
 =?utf-8?B?MDV2NVQzVUxBcUFFdVVFM1FsMjJsWkZZTW5LS1FKeFF3WHVzNFhqSDNzUFc4?=
 =?utf-8?B?azBwbDNKYnpWbTVXNVNnOVArZjFsSDg2U25xVmZ3bi9TdGhUeEphdU9nQjVV?=
 =?utf-8?B?cXppcXlCOEx3SlN6NVlJQmIrS2h0aGlCR2hnZkp1QmhvaGxJcUF0aUN5ekZ1?=
 =?utf-8?B?Y3dSNVBSc1I5VS9VVTFFSFUyTnpRYzN6aHhCR1A4aHk2YTlvWXJNdDJadHQ1?=
 =?utf-8?B?ZmoyeERZdXFZRzl6UktMay9ESVZUanBCZzhkT2diMmdHVTJVUEt4R3A3bUl0?=
 =?utf-8?B?Mkc1RGt6K2FzN3hZWjNQMDY4a0FoNEw0bWFqTm9rYkRhZEhpVVJFbUJ1Q0lP?=
 =?utf-8?B?N2pvRlZKaCtoR3pnWTdUSkJMbFJqcU00NSt2L3g1OFFCZnlWbnRmclQxZlpY?=
 =?utf-8?B?Z0RHNjFqMUZCRW10MllPK3FEeENqSjEzTHBSTjk3VVIxaW5Ccy84c2xpN29z?=
 =?utf-8?B?a1V0SHNPam43Z25OSVg4bkVReDlOSHVEV3B0T1pQVlROZzFLRnlldTJkYVBN?=
 =?utf-8?B?aFVTZUpPSGt1eUh1bHpkYllRS1JYeThoKzU3VHp2MnV4US9FczZwa1JiR3BI?=
 =?utf-8?B?YnUvb0xmaXA1cjRKSlEydjNnZGtHNkl6RHdhcUM4RDlBVmo1bjJJZWwyUUZQ?=
 =?utf-8?B?dzBrVnJVSmtocDcxcVNRRmgvaGZScTBiRHA2Y2JkN3puYUVCSkhkR2dGTVln?=
 =?utf-8?B?VXFTYkd4QXBPUjZ2VmxETnFRcHYwR0w3bStsTjY0eUgzeVBFL2pwdXZ2U3Rv?=
 =?utf-8?B?bFdvYXpmTnZ1RC9HcXJCTmIzWE1qcXF6aVJpMkI0Q0tuT00zY1d2S2FKTUdK?=
 =?utf-8?B?MUROR0NhL1NtbE9SbVYza1I5bk5WN08zYTBUeXF5WlJLcXpIVjJZTnRtUERJ?=
 =?utf-8?B?SlZ6LzQ4YkIyaGpMclV3MnJsaWVpRXl3UmJRNTYyS3VJQ0hKQkNUY2ZzdWVi?=
 =?utf-8?B?Uy9lYklDNW4zeXBQR295eU1qSm84NTlCS3dEWUJrcmxPbW9PcVc2ZGtTWnZU?=
 =?utf-8?B?eWVGR3FGMVNUekVxMmo0ZUFlWlgwMTljWmVhQk9Sc0VkWitOTTV6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427699be-7891-402f-0cf0-08deec1c4312
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 20:18:46.1399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +yJ+RxT6b+AyjBcm6HOyIezUX11rb8j2I6v/TfQK3gzr/Faxda0+ao8ZVinp4qpaAutxrQxhbh4zJRy3xNbkCWBn7Utau3mK/yam5ieO/Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11792

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEwIEp1bHkgMjAyNiAxNjo0Mw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDQvNl0gY2xrOiByZW5lc2FzOiByemcybDogQWRkIHN1cHBvcnQgZm9yIFJaL0czTCBEU0kgbXV4
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCAxOSBKdW4gMjAyNiBhdCAxODo0MCwgQmlq
dSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgc3VwcG9ydCBmb3IgUlovRzNM
IERTSSBtdXggdGhhdCBzdXBwb3J0cyAyIGR1dHkgY3ljbGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtz
IGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJs
LWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+IEBA
IC0xMjAsNiArMTIwLDExIEBADQo+ID4gICNkZWZpbmUgUlpHM0xfUExMN19GU1REX0RJVl9NUl9N
SU4gICAgICg4ICogTUVHQSkNCj4gPiAgI2RlZmluZSBSWkczTF9QTEw3X0ZTVERfRElWX01SX01B
WCAgICAgKDE2ICogTUVHQSkNCj4gPg0KPiA+ICsjZGVmaW5lIENQR19QTExEU0lfU01VWF9MVkRT
X0RVVFlfTlVNICAgICAgICAgIDQNCj4gPiArI2RlZmluZSBDUEdfUExMRFNJX1NNVVhfTFZEU19E
VVRZX0RFTiAgICAgICAgICA3DQo+ID4gKyNkZWZpbmUgQ1BHX1BMTERTSV9TTVVYX0RTSV9SR0Jf
RFVUWV9OVU0gICAgICAgMQ0KPiA+ICsjZGVmaW5lIENQR19QTExEU0lfU01VWF9EU0lfUkdCX0RV
VFlfREVOICAgICAgIDINCj4gPiArDQo+ID4gIC8qKg0KPiA+ICAgKiBzdHJ1Y3QgY2xrX2h3X2Rh
dGEgLSBjbG9jayBoYXJkd2FyZSBkYXRhDQo+ID4gICAqIEBodzogY2xvY2sgaHcNCj4gPiBAQCAt
NzQxLDYgKzc0NiwyMCBAQCBzdHJ1Y3QgZHNpX2Rpdl9od19kYXRhIHsNCj4gPg0KPiA+ICAjZGVm
aW5lIHRvX2RzaV9kaXZfaHdfZGF0YShfaHcpICAgICAgICBjb250YWluZXJfb2YoX2h3LCBzdHJ1
Y3QgZHNpX2Rpdl9od19kYXRhLCBodykNCj4gPg0KPiA+ICsvKioNCj4gPiArICogc3RydWN0IHJ6
ZzNsX2RzaV9tdXhfY2xrIC0gUExMIERTSSBNVVggY2xvY2sNCj4gPiArICoNCj4gPiArICogQHBy
aXY6IENQRyBwcml2YXRlIGRhdGENCj4gPiArICogQG11eDogbXV4IGNsaw0KPiA+ICsgKi8NCj4g
PiArc3RydWN0IHJ6ZzNsX2RzaV9tdXhfY2xrIHsNCj4gPiArICAgICAgIHN0cnVjdCByemcybF9j
cGdfcHJpdiAqcHJpdjsNCj4gPiArICAgICAgIHN0cnVjdCBjbGtfbXV4IG11eDsNCj4gPiArfTsN
Cj4gPiArDQo+ID4gKyNkZWZpbmUgdG9fcGxsZHNpX2Nsa19tdXgoX211eCkgXA0KPiA+ICsgICAg
ICAgY29udGFpbmVyX29mKF9tdXgsIHN0cnVjdCByemczbF9kc2lfbXV4X2NsaywgbXV4KQ0KPiA+
ICsNCj4gPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgcnpnMmxfY3BnX2RzaV9kaXZfcmVjYWxjX3Jh
dGUoc3RydWN0IGNsa19odyAqaHcsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZw0KPiA+IHBhcmVudF9yYXRlKSAgeyBA
QCAtMTQwMiw2ICsxNDIxLDExNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMNCj4gPiBy
emczbF9jcGdfcGxsX29wcyA9IHsNCj4gPiAgICAgICAgIC5yZWNhbGNfcmF0ZSA9IHJ6ZzNzX2Nw
Z19wbGxfY2xrX3JlY2FsY19yYXRlLCAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgdTggcnpnM2xfY3Bn
X2RzaV9zbXV4X2dldF9wYXJlbnQoc3RydWN0IGNsa19odyAqaHcpIHsNCj4gPiArICAgICAgIHJl
dHVybiBjbGtfbXV4X29wcy5nZXRfcGFyZW50KGh3KTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCByemczbF9jcGdfZHNpX3NtdXhfc2V0X3BhcmVudChzdHJ1Y3QgY2xrX2h3ICpodywgdTggaW5k
ZXgpDQo+ID4gK3sNCj4gPiArICAgICAgIHJldHVybiBjbGtfbXV4X29wcy5zZXRfcGFyZW50KGh3
LCBpbmRleCk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnpnM2xfY3BnX2RzaV9zbXV4X2Rl
dGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0DQo+ID4gKypy
ZXEpIHsNCj4gPiArICAgICAgIHJlcS0+YmVzdF9wYXJlbnRfcmF0ZSA9IHJlcS0+cmF0ZTsNCj4g
PiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gDQo+IFdoeSBubyBmb3J3YXJkIHRvIGNsa19t
dXhfb3BzLmRldGVybWluZV9yYXRlKCk/DQoNCklmIEkgZm9yIGZvcndhcmQgdG8gY2xrX211eF9v
cHMuZGV0ZXJtaW5lX3JhdGUoKSwgaXQgaXMgc2V0dGluZyBMVkRTIGRpdmlkZXIgZm9yIERTSSBh
bmQgbm8gZGlzcGxheSBvdXRwdXQuDQoNClsgICAgMS45NTc2NzBdICMjIyMjIyMjIyMjcnpnM2xf
Y3BnX2RzaV9kaXZfZGV0ZXJtaW5lX3JhdGUgIDEzODAwMDAwMChwYXJlbnRfcmF0ZSkvMzAwMDAw
MDAwMChyYXRlKSANClsgICAgMS45NTc2OTFdICMjIyMjIyMjIyMjcnpnM2xfY3BnX2RzaV9kaXZf
cmVjYWxjX3JhdGUgIDk2NjAwMDAwMChwYXJlbnRfcmF0ZSkgDQpbICAgIDEuOTU3Nzc4XSAjIyMj
IyMjIyMjI3J6ZzNsX2NwZ19kc2lfZGl2X3NldF9yYXRlICA5NjYwMDAwMDAvOTY2MDAwMDAwDQpb
ICAgIDEuOTU3Nzg0XSAjIyMjIyMjIyMjI3J6ZzNsX2NwZ19kc2lfZGl2X3JlY2FsY19yYXRlICA5
NjYwMDAwMDAgDQpbICAgIDEuOTU3OTE3XSAjIyMjIyMjIyMjI3J6ZzNsX2NwZ19kc2lfZGl2X2Rl
dGVybWluZV9yYXRlICAxMzgwMDAwMDAvOTY2MDAwMDAwDQoNCldpdGggY3VycmVudCBjb2RlLCBp
dCBpcyBzZXR0aW5nIERTSSBkaXZpZGVyIGZvciBEU0kgYW5kIGhhdmUgZGlzcGxheSBvdXRwdXQu
DQoNClsgICAgMS45NDA0MjRdICMjIyMjIyMjIyMjcnpnM2xfY3BnX2RzaV9kaXZfZGV0ZXJtaW5l
X3JhdGUgIDEzODAwMDAwMC8zMDAwMDAwMDAwDQpbICAgIDEuOTQwNDUzXSAjIyMjIyMjIyMjI3J6
ZzNsX2NwZ19kc2lfZGl2X3JlY2FsY19yYXRlICAxNjU2MDAwMDAwDQpbICAgIDEuOTQwNTM4XSAj
IyMjIyMjIyMjI3J6ZzNsX2NwZ19kc2lfZGl2X3NldF9yYXRlICAxMzgwMDAwMDAvMTY1NjAwMDAw
MA0KWyAgICAxLjk0MDU0NF0gIyMjIyMjIyMjIyNyemczbF9jcGdfZHNpX2Rpdl9yZWNhbGNfcmF0
ZSAgMTY1NjAwMDAwMCANCg0KQ2hlZXJzLA0KQmlqdQ0K
