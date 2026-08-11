Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8283BD24A;
	Tue, 11 Aug 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466403; cv=fail; b=mg53D/zx/LIMyULIGYsl2WaMU4KwER2cdGLf/Y3FFAcTXdQU0uGtPtc2osN2xWQ2J+lHlwbkoWZ30D5CAvcAw6PST3aBszsJ3AdGxIVSofFvE7lr8+Yxnq21JQiqzajxPu/WDPtvtFcyRhxA7kR+HYCYTIqN+N5fZRcavlNrllU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466403; c=relaxed/simple;
	bh=WJR92dAlhKOcpJeU1AQ2bM51LXiWo6CW1KoNzSecCak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Aq7N2l7fLCr8IICmwrQG39/YyWFhIiDi9WFRqG9WBCwlGgBSak7DTQvoFsDVw9I1XGl5Ub2B/rG1kPSK/ukK3x940l9vvMj9w8NaYjkXs9iIQRumg+9AA3JVGJ2g6Df5iRwSddhS3sohQazCI2AW0fC/50Ng9apCPk+wYxGo+no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WPEzahj6; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WPEzahj6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvdAvwMzai1I3fyUOJmr0C2gu/mqKOMnPBtZD0AlrMxeUZ/LhJjrlIYI7cS2R+syd7x8YbYMexb+nF+6IwImEvJ4V6i7JIrwGwx4QvqizNw+NEXHajvpvkyHyefo56YNFAilBE5EfJhFdDvldU+j0X2GH0wPNemvI+2IPZ33JSeY+Te2IklA3BV56vKi1zyNhgvWLfbPswj1Dovk9YQ8vM/RV2GmpX/apI5DmsvL9cZCZ3EDPUrsbRWTnDRVamlPILxSBHDShNxIT3EM+2+yGXnue/eTtGjtVFkXgM1/UVOR5jXkpil5PvpGqFWWtm3X+0lrFnmOqLOclLj3UwXLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJR92dAlhKOcpJeU1AQ2bM51LXiWo6CW1KoNzSecCak=;
 b=xw4eXSx2ayYYKyIq5U+rpnFpf88ogUrnWs8R0lPEolSYUsK2sEWEnyPKlfSIlR0kiupUyAMf/iiUT5hJ+Nd0KyTybdBmb8J/9teRud73PfXiQFJTQmrjkbdRkTbSTqSdPI/sVhKMpMWfiLoK2fkcBdyge9hdYqWFYn0gHqYogUK9Jd0cpoLjmIta0DpQGh4TU7SptQC0wJQlCCEYbWMNmnEIUdirymHSuzW8m/Gj8kC44AaYVkehOWAgK4oZtCGJfvg61Ef6BBlswDWdUvPeYIVOSjTI760YgeAM//5vEkGrU1UM+hUYZXimfxZ6kvTrAjZ7hf+9HkscZjpIMtcwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJR92dAlhKOcpJeU1AQ2bM51LXiWo6CW1KoNzSecCak=;
 b=WPEzahj6qkCMVCNGf0C1h2pbsusCWmN0n86fBO1hNHX21MpcKVI119LXyPqs3lbaIw+WjVWNsOQGRGE4W09DLfBX2iCGtcBXVILBTHUJGX0Yy9q2KuwjeTB3Fxbr2f0hgJauvUuLfUo1I4zDBNFradwwhpoZD6LQaj3+bKCfRpI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYXPR01MB15181.jpnprd01.prod.outlook.com (2603:1096:405:277::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 16:39:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0315.012; Tue, 11 Aug 2026
 16:39:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
Thread-Topic: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
Thread-Index: AQHdAApe7oo0Hv5c/0CPDytv5nQPwbZnBzWAgBwQkKCAFHehAIAB0Cmg
Date: Tue, 11 Aug 2026 16:39:47 +0000
Message-ID:
 <TY3PR01MB11346BCDC9E53BEA1785E76D786DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
 <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
 <TY3PR01MB11346C90ECE3632E3006BFDA986CB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdXFyOwuOge4PYTaDEmL=T1PTn3iNRiR==5C4ZKRKKew0w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXFyOwuOge4PYTaDEmL=T1PTn3iNRiR==5C4ZKRKKew0w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYXPR01MB15181:EE_
x-ms-office365-filtering-correlation-id: 43ce9c10-f520-4747-f75b-08def7c727ec
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 VyMScuPLhWGZSVYBMUurqbXKzxShqkszFp0AX2dhusGEoWZ7AwJOcEPopiFe7UA8FTrwOqpzHSfOWi/luPAFsU0qoNd60ogW3UtTpEyIp6Oz/NPjmtArG7SPWv/Hk8//yhZtqIYwKrIKv8c6YlzPBuwAHieL3kaA9phoKgop25r4BQGDFUpR1TgmYas0gn2HtwhTMN6oyol+6N3TNDgrwvy3og500DhRVNdryCcSI+a0uKMb3tRDoA5c/VdT24kdUNTc4GeZY/jC+7zAOZ3BGjSa0U3PORQtRlgMcbxv00DeSdBGsJeCcUtnHx928SM11MH3uOY4t2gTaVfK7jESUhgRPUZ+93qMPJpHnz4g0LpQWrjEAUtP44a4tSIh96htOEqVPVcCm4SmJlKGxYxO73q+vQoq9FCyBR7MNXNRe/dRa087Gfx1QlRbA6LePqWCUD3Gy8g1JI19uYycRT2iPnLGtyR1zDqwEL/Bqj+GJl5sjWj2joiVnw4jVc/dhthBK8om+or3y2Wfa4UCtZVZgWxL4zAORdWL1C7AbgQ20EmfWq8aPrN7NAPZet+pJbfV+xFcu1U7IcfP9P7glNMNn2tVCttm1AiebcgwfGhrjs0EoRQCRYxJBVxXCXjG5LKd+JtwC6pdl6Xlf2LumdSnd2f5mFCrr+AJFmR/AuXE3ac59XIPydIem6OgmJ78KCQgvnsoIuOSM8+amsZvrDmLGGJCe0MWe/2J+z2M5oeRNkw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1UyVGI2VGVZbkk1M0xzNGNKMVF6OEZydlFMcGVIUVpLSWpWeEVJa0svWDRL?=
 =?utf-8?B?NGoyNmxzMmF2TE5tYTIyQmM3NFpBVWFTM2ROdUl6aU1KL2hXZGlsU1JqRnFK?=
 =?utf-8?B?MDlDWkVVSW9JS0d1ajJTOFJ0U1hSa2dHNHJ4MGRHZGVTMlVLQTNUUFh3T014?=
 =?utf-8?B?bGs5WmFuV3Z1OU52Mk1JTDJhNXB1bzlvVDQ2N21KcE5TZ0F1Rk9Scm1Xd2xu?=
 =?utf-8?B?MXg5dzNQbnVVbzM4UFkxU0RmcTVacDNseVZHbVFGN3FlYmNBeEZuUTl4Sk5r?=
 =?utf-8?B?N3RJQ0pTQkFWSk41emVNOUhBSnlFSjhVaTgxcW55MkordkpBVWh4dGJDdHlO?=
 =?utf-8?B?T0NRTVc0d3M4MTdiM1U5dExrRGppL2t1ZFc0ekd3emxvTU1lVFZkaWtiRjVv?=
 =?utf-8?B?TXJPYWJPVWNpOThlQ21ZN1VTalpYSEwyQlJsbUVXZFZVOFR4TENmcE9FNVo3?=
 =?utf-8?B?UVpnRHZ1TklYclJldE1XQkJpUmZCZWI0bitrblRrNURtb1RwdFlEcDVIa3Vr?=
 =?utf-8?B?L28vMTRKMThXaGZnOExaaVZ1YVhReTlCTWpla1VxNEw0MEZBVWZxNG45T094?=
 =?utf-8?B?THpuTHNpOHZCUmtJVmZyVUhKcmRpbGF3SGRQcHZ4N3M1WXFicTNYN1NpWFJC?=
 =?utf-8?B?NVIyUEwzV3docU5EV2pKOGJmSkM0OXJoSG11TUg3SFAxYWVtQTZ6bHlobXNY?=
 =?utf-8?B?RlVsUytveTc1NWhXU3ExR3dMV3FJVi9wUHlrU3dOckZXKytCS3dqd01mTGFr?=
 =?utf-8?B?dExmZDFYV0pYdUIvYlpBODRoZGxUdzdMc0JqeG8zNDl1dEkyMkRvbm5XOXhx?=
 =?utf-8?B?alo1bWNMa1ZjNGR0S1ZFWWk2ZW8yZEFDb2V5VitiRW9IbzlEcytLdTZ0cDR3?=
 =?utf-8?B?MndIN3hnbWFjTUltQ1lYZ0FkVEwvdmpKbG1wb2tEaUNHSTczMjBLamZjWGg3?=
 =?utf-8?B?N21ML05iNnliRnhJalM0OXcvYzJKMGV4MzMyc1JSSTZaT2N4S2ZIclN0Z04x?=
 =?utf-8?B?dTc5Y0d1M1V4alhaYmhpTFZpL1JJWDRQS2hUZkJUY2VMck4yZVU4SUJYVVph?=
 =?utf-8?B?RUtUN1hwcmUzbDdReEF0dkZoNmxGTjgydGJOenFrZ01yT29yQ1FSdm1kUnlv?=
 =?utf-8?B?M0xCMTNEcHoxcDFxRzBudStrTzZROXZRK1FkZE9HUzdBM0QvSURkN1JPbFpw?=
 =?utf-8?B?b2lMRkpKM0xabXZBbmVrWWJYUlpGZHZKMEZPNm1PellaVk54RXVWdW1pdktT?=
 =?utf-8?B?MDFsU0RZUnNDRk5qQklsTW5wTFdCT2FEek5iL0lsTmdZYjNZZVR2Z0YrdzNF?=
 =?utf-8?B?QlhMVHNCYVYyOGNCYTFuT1JXNEpSY1J4Umg0Q0JWczNraG5FSFRxZDVTZ2I3?=
 =?utf-8?B?MVROYU8yUTRCcDhCT3BBSTBpdkxLWlF1Y0VWUm5Qd1FyZE5SUVBoQjZYZ0gw?=
 =?utf-8?B?T2JPaHBQRlVMcUVXRWhaYXFIL0J6T1BnUUZ2clpwZnJiOTJaNnJaVXdQaHhO?=
 =?utf-8?B?VE5PeXp3TXpBNnRVc1QxanRsa1ZLd3hQL2czQ0Njb1M5Z09DemwvbnhucFlU?=
 =?utf-8?B?NFl2TVZWaXdtVk1XRXNUdndmRG52bW5qQllGQUJnKzVyWHorZXFvb2ZsNVFi?=
 =?utf-8?B?ejQ0TXBXYzdTODRvdWdlcWNTU3hhVmtEd2VzWGtubzhhb01UVS9LeTJzVlNV?=
 =?utf-8?B?b1hqdHJHVEs4c1NoVEhWdEhFa1ZyYU9YU1dhZmE1aVBIV2c5WEJmMnVGRWlm?=
 =?utf-8?B?d21GV3FpbE1VaUtnTllqNzZJQVhxSlYrcEhqUWRIbzYvUWl3amRVZGVGMVZ6?=
 =?utf-8?B?S05QSVliT3RSVVEzME1waU5yUFNGZCtMZjg0bFlubHRkTksrOGc5N2kvbENk?=
 =?utf-8?B?aGEvNkh1TFY4b1p2RW1pRGROdzhQbThvL2VLNHZxeXBXdDBOOUNaQ3RQNUVK?=
 =?utf-8?B?QWNGaGRTZ2tmOHJEbUZVdXk5VmJ6THZTUEExTktJeWp3bThsb3YrMmVxaTAx?=
 =?utf-8?B?YVk5WTd1OFdCdGdYNnB5QVVOMVcrdXUrMkp6OUJYcnJCSFN3Wi9oREdaWk5P?=
 =?utf-8?B?eWRsdXJDdlhkbFNKZ3ZBQnU4LzRtM21PQ0dxV2xHL0gwNHBXeDloMWdkOS9U?=
 =?utf-8?B?L25QcnRUdExBTU4veFQvdXZjT0RwV0N3ZDVEL29Yc1NpdGZ6RGdFZmtaRnlw?=
 =?utf-8?B?Wm9ZYzZacE5Gb2RUOEczKzFoMG9OTG5jTEtGaTFURzgyWGxITGpKeTQwZHo2?=
 =?utf-8?B?S3o4SzZVL0t0QkthT0ZSdklTSy9WTUd5MVA5a1Y2a1hidnNMT0t2eEtRNnVR?=
 =?utf-8?B?OVNyVGMxdisyRitLVHpjb2g3OEZkSFFIL1JSSkRXMUZpWUNuWVdsZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ce9c10-f520-4747-f75b-08def7c727ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 16:39:47.3410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jtPn48jB4kzoAlAqDz/06TmRgBw8LxwDhNURjbWa2wjRZ7cPr8ezhePt13bsUHwEyFxZL07im6RVR9jnA6vcTb5l90IC8RrezBNrHmwvLHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15181

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEwIEF1Z3VzdCAyMDI2IDEzOjU3DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggNC82XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3IgUlovRzNMIERTSSBt
dXgNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDI4IEp1bCAyMDI2IGF0IDE0OjM1LCBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gT24gRnJp
LCAxOSBKdW4gMjAyNiBhdCAxODo0MCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90
ZToNCj4gPiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4gPg0KPiA+ID4gPiBBZGQgc3VwcG9ydCBmb3IgUlovRzNMIERTSSBtdXggdGhhdCBzdXBw
b3J0cyAyIGR1dHkgY3ljbGVzLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcnpnMmwtY3BnLmMNCj4gPiA+ID4gQEAgLTEyMCw2ICsxMjAsMTEgQEANCj4gPiA+ID4g
ICNkZWZpbmUgUlpHM0xfUExMN19GU1REX0RJVl9NUl9NSU4gICAgICg4ICogTUVHQSkNCj4gPiA+
ID4gICNkZWZpbmUgUlpHM0xfUExMN19GU1REX0RJVl9NUl9NQVggICAgICgxNiAqIE1FR0EpDQo+
ID4gPiA+DQo+ID4gPiA+ICsjZGVmaW5lIENQR19QTExEU0lfU01VWF9MVkRTX0RVVFlfTlVNICAg
ICAgICAgIDQNCj4gPiA+ID4gKyNkZWZpbmUgQ1BHX1BMTERTSV9TTVVYX0xWRFNfRFVUWV9ERU4g
ICAgICAgICAgNw0KPiA+ID4gPiArI2RlZmluZSBDUEdfUExMRFNJX1NNVVhfRFNJX1JHQl9EVVRZ
X05VTSAgICAgICAxDQo+ID4gPiA+ICsjZGVmaW5lIENQR19QTExEU0lfU01VWF9EU0lfUkdCX0RV
VFlfREVOICAgICAgIDINCj4gPiA+DQo+ID4gPiBJIGFtIHdvbmRlcmluZyBpZiB0aGVzZSBtYWNy
b3MgYXJlIHdvcnRod2hpbGUsIGFzIElNTyB0aGV5IG1ha2UgaXQgaGFyZGVyIHRvIHVuZGVyc3Rh
bmQgdGhlIGNvZGUuDQo+ID4NCj4gPiBPSywgeW91IG1lYW4gZmluZCBhIHdheSB0byBkZXRlcm1p
bmUgdGhlIHBhcmVudCBiYXNlZCBvbiBzb21lIHZhcmlhYmxlLg0KPiANCj4gTm8sIEkgbWVhbiB0
byB1c2UgdGhlIGFjdHVhbCBkdXR5IG51bWJlcnMgaW4gdGhlIGNvZGU6DQo+IA0KPiAgICAgLSBk
dXR5LT5udW0gPSBDUEdfUExMRFNJX1NNVVhfTFZEU19EVVRZX05VTTsNCj4gICAgIC0gZHV0eS0+
ZGVuID0gQ1BHX1BMTERTSV9TTVVYX0xWRFNfRFVUWV9ERU47DQo+ICAgICArIGR1dHktPm51bSA9
IDQ7DQo+ICAgICArIGR1dHktPmRlbiA9IDc7DQo+IA0KPiBCdXQgcHJvYmFibHkgdGhpcyBjYW4g
Z28gYXdheSBhbnl3YXkuLi4NCg0KT0suDQoNCj4gDQo+ID4gPiA+ICsNCj4gPiA+ID4gIC8qKg0K
PiA+ID4gPiAgICogc3RydWN0IGNsa19od19kYXRhIC0gY2xvY2sgaGFyZHdhcmUgZGF0YQ0KPiA+
ID4gPiAgICogQGh3OiBjbG9jayBodw0KPiA+ID4NCj4gPiA+ID4gK3N0YXRpYyBpbnQgcnpnM2xf
Y3BnX2RzaV9zbXV4X2dldF9kdXR5X2N5Y2xlKHN0cnVjdCBjbGtfaHcgKmh3LA0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY2xrX2R1
dHkgKmR1dHkpIHsNCj4gPiA+ID4gKyAgICAgICB1OCBwYXJlbnQgPSBjbGtfbXV4X29wcy5nZXRf
cGFyZW50KGh3KTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIC8qDQo+ID4gPiA+ICsgICAg
ICAgICogQ0RJVjdfRFNJeF9DTEsgLSBMVkRTIHBhdGggKGRpdjcpIC0gZHV0eSA0LzcuDQo+ID4g
PiA+ICsgICAgICAgICogQ1NESVZfRFNJeCAtIERTSS9SR0IgcGF0aCAoY3NkaXYpIC0gZHV0eSAx
LzIuDQo+ID4gPiA+ICsgICAgICAgICovDQo+ID4gPiA+ICsgICAgICAgaWYgKHBhcmVudCA9PSAw
KSB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBkdXR5LT5udW0gPSBDUEdfUExMRFNJX1NNVVhf
TFZEU19EVVRZX05VTTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGR1dHktPmRlbiA9IENQR19Q
TExEU0lfU01VWF9MVkRTX0RVVFlfREVOOw0KPiA+ID4NCj4gPiA+IFRoZSA0LzcgZHV0eSBjeWNs
ZSBpcyBkdWUgdG8gdGhlIGRpdmlzaW9uIGJ5IDcgYmV0d2VlbiBNMiBhbmQgTTJfRElWNy4NCj4g
PiA+IFBlcmhhcHMgaXQgc2hvdWxkIGJlIHNldCBieSB0aGF0IGRpdmlkZXIgY2xvY2sgaW5zdGVh
ZD8NCj4gPg0KPiA+IFlvdSBtZWFuIGRlZmluZSBhIGN1c3RvbSBjbG9jayBmb3IgTTJfRElWNyBh
bmQgY2FsbCBzZXRkdXR5IGZvciBncmFuZA0KPiA+IHBhcmVudCBmcm9tIExWRFMgYnJpZGdlIGRy
aXZlciB0byBkaXN0aW5ndWlzaCBMVkRTIGZyb20gb3RoZXJzID8/DQo+IA0KPiBJIG1lYW4gdG8g
ZGVmaW5lIGEgY3VzdG9tIGNsb2NrIGZvciBNMl9ESVY3IHdoaWNoIHNldHMgYSBkdXR5IGN5Y2xl
IG9mIDQvNyAoaS5lLiBhbiBvZGQgZGl2aWRlciBjbG9jaw0KPiB3aGljaCBzZXRzIC5udW0gPSAo
ZGl2ICsgMSkgLyAyIGFuZCAuZGVuID0gZGl2KS4NCj4gDQo+IFRoZW4geW91IGNhbiBqdXN0IGRy
b3AgcnpnM2xfY3BnX2RzaV9zbXV4X2dldF9kdXR5X2N5Y2xlKCksIGFzIHRoZSBjbG9jayBjb3Jl
IHdpbGwgaGFwcGlseSBjYWxsIGludG8gdGhlDQo+IHBhcmVudC4NCg0KT0ssIHdpbGwgYWRkIEZG
IGNsb2NrIHdpdGggLmdldF9kdXR5X2N5Y2xlLCB0aGF0IHdpbGwgc2V0IDQ6NyBkdXR5IGN5Y2xl
IGR1cmluZyBjbGsgcmVnaXN0cmF0aW9uLg0KDQoNCkNoZWVycywNCkJpanUNCg==
