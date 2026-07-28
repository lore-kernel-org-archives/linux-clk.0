Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2440912CDBE;
	Tue, 28 Jul 2026 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242113; cv=fail; b=VwBcFk9oZsMkVXj/CmLGVttsG1g7KLyJLFY03p6pPakViqbyxuof1DTsLp0Xc1sYnxZqsCW4wKxjgq5rxT49qSCu0O+D+jEHKAF1B3GlWsMSP+1WrAdFhhFvwGq1TrLwXJAMmj36oHXFPzGrPcTm5zIJfaATdr01X0lHfwxpneI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242113; c=relaxed/simple;
	bh=UUA1CR9FZVyM98gWzg11IDRqr4YhxNGsQw6w6SvhoyY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F5kDAT0Q/dMhgwZ5DQ1dAHnN7qIMHNKfodOueyzZzHHtx5lUllO3mQwcsY3wSHMZTBq7UDVNV+4p9bN7Ee/gklGrfGP/5ZeHCkKVbU5zRvG5ESd931Gcnj3eWJ+TqoziBtxP/BHiBcjtAh3asWodrT7uJ8TkWQHOhcLqKehpS/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bSkGca87; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bSkGca87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmkGnxvZx8OruXM5PItPw8R7XZyi9UprG+qU+8TM1yavoNr8mdIqiIoZHre0fr1JS//lN0cweAuoBkKBKK6z08XK//rWpTIzkOrfoarqHukGwmQDTbXc2xz3B2M//TEJ7R0xBEHLO3+iq2aCMDaD/VV/vRTdm4ofmM4NU7dVa36/FEc4tEjYivTPV8a3rBlnHmQ5khj9cWUGroFjtr57uvUeuZEmGCwpY8u+wW/Fk/1TOSgORkf2lz4JFvSKHzkaIGtMhGnZ/g20mzrHw+Y8y51+ti5Dng6fTXZwUs/Pg14auEX6SixUBzMFO/rK8+9VFBWRIRyrh0Ge5LpVUbATrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUA1CR9FZVyM98gWzg11IDRqr4YhxNGsQw6w6SvhoyY=;
 b=Zj7aY+MBKyIXlulToGozSR6i+36ikMQL3EpiZadoCESCm5yNdvGAZCe9iSHntZ8XnHSW1Gj6F/yXen6+9f9n7xf1M/+2rOGn2MQbHjyKuBsR0TCvtYDq03t5PCiUvzQYPsj9z6WwtRgZMO2BrSzQOMtKK9n26bWKdLb1ymMqhmQ8qzzu2LVm4xBJSfLo1DMmMIAHmB8u+QU7UHUL74wHSZlsHesIin+hIByCS9ZyfDV+I8YCT9Bv+QJ3mnecOxo1UOJkREygr46LmM6TvK6wzAnvryfPw0JhNh1wl7rb2+MV9NOea9C3Ni6i5kge8pl5pinrsIS+QSCqT37dfqEsdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUA1CR9FZVyM98gWzg11IDRqr4YhxNGsQw6w6SvhoyY=;
 b=bSkGca870sy53uhDViaR7P/Oh63QzyP9KUR+/evXIYA3Pr82wP+RQajZfYVyKuVtFJ0sVGWlPioJeSEW9Oc0xoFoa7cv+Aq7s8A4SQPjEdJBM5KLHmTOrBTE5ZRDuAn49EQvglvg1A3F0xPLDT77OwQUFK3BbPORNzQuwZ4DjzY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10424.jpnprd01.prod.outlook.com (2603:1096:400:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 12:35:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 12:35:07 +0000
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
Thread-Index: AQHdAApe7oo0Hv5c/0CPDytv5nQPwbZnBzWAgBwQkKA=
Date: Tue, 28 Jul 2026 12:35:06 +0000
Message-ID:
 <TY3PR01MB11346C90ECE3632E3006BFDA986CB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
 <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10424:EE_
x-ms-office365-filtering-correlation-id: 19da647a-649c-4405-c03a-08deeca4a7eb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 q7+kOT3ambfjVvUVF5MLFw3OpM2NQYVZ0dtAYbRA/9d1kSDxx+8R7m5QD/KFUlJdQ6gwtgiNDvMsQc8GbheUSDpYmJkkqitPnW4pB90Qd4vrBCb3Pa7zs3R3TlLrVCJk6xBXWc+9FD/5EM6Nb1kCXHGe+3Y1pzPpdvF0/a7Q7Gpp1TqhoxYPfVYYUDxstcymMW8lNzgLS88XkZ3oU3o4Pzx0AoyxhrTkryDIFnZ9TUpRAxXRnsA2je0ACVuc/Oh13zd1swkjocuYMHK0KijTQsMnJRJW7t0E9XlEWgc16guNsfI9UDg9eRYwsjKUzOPQs2yfFQoIwQretfwTiG6sgQi7n5Z0BIcsGJGffshRBGac97rw1z6dMAu0URmauPywtY6BflRmZI4acHHnToheoFl16RMQMz1gnEcFc6u0yk43CP9NP8eF7/fmwHvOmFKxSkovaEDQMbF9eH8pTHp8WehcyHl2d3sNujTXWLrv51e+gWk/SwS3xmdpTVjaocnh+O3/UcNwHJT8Cb7A1GOkJjeniIS2mweV7/O9XSM6vf0v58kmHkdV2wjWqDAHky2KjMTTDw6QYwYUtnZ4H5FaRwjX/ETeTtt4QeweInSRmR0hSWH+9rETXKh4pqceg6gqQ1IX4cddBAeJmRv5NQY0UB5KfsNVg7mlzQhmJzJzMrgsXZ1p4OdDxi/DNnPmElcEMUJmKCM2tjJ57EVoexuuDddPm2Qpcnyn/HmuLpudtqI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3BDcmFpdmt5ZzRJOVlaazVEbEhSLytvTU8vdHYzbzBCdWM5dUlzMks4czRX?=
 =?utf-8?B?QThKWkpEZSs3ZVRud0lqZTlrRjM3TGZlVmFyaTRwTExCNlZnU1E2bnJFcmt1?=
 =?utf-8?B?TlJhUXhSNFdZWUF0K0NVenRvTHk3NitNeW5YZ3plS3hMNlNpTHBKZzRRMUhK?=
 =?utf-8?B?c2Q1ZTdXZ3VMd1Bycm5iTy9pbGhsMldwVER2ckZBTmhScGYrcDJlY3hXRVl1?=
 =?utf-8?B?bThpYnluVzhDbjBpZnMyMC9IMUdtVVdXSUF6dG9YbDJhQUp4c3hESWh4TmNw?=
 =?utf-8?B?R0d6YURPV3hrTXFNQXpCU29xWmJLMWpObGpZUXJYRUE2T2dCQ1lpV2ZlRmQx?=
 =?utf-8?B?dTJpZklNcUErbnNKcnUwRmF2bEJZVlZmWWtoQjFPY0FiY0dJMW5TWEE4UkdR?=
 =?utf-8?B?N05sRy83Z20zdjd1RGVkU1RGWWNnY1pFZ2h4aWY5aVpOUlhYUUM0SmFJMkFp?=
 =?utf-8?B?cmdWQUtiUEZYbE9wK0lhYmtJTHpLTmt6MVl6UDVkVnEzdEVNc3ZLM3FnQm0x?=
 =?utf-8?B?dDUxQW1jVGNSN1Q5VDVZNklBWWZkQkMyNlJvaTRBMm8reXBCRk5QVmJIM25N?=
 =?utf-8?B?UFl4T3plRDJ2TnNQbmhDSDNKOXNPSUg2S0xHb0FYMmVTUm55c29zbmZoMGxS?=
 =?utf-8?B?eDRuZU9sRnJjVGJYemJ6WitwQTY1WnBvem9VcU83UkVBZ0srbllLMGZrN2Za?=
 =?utf-8?B?d0ZESjNMRy9leElIOVFxMm1GbUM3eUJFeWtheVNwcytyMUVGbloya1RIRVFa?=
 =?utf-8?B?UVFZN0R3NS8vdzhuSTNaRmdZTUFQR3BDOUoweHBmT3NDR1o5eFRmdUxFVlhI?=
 =?utf-8?B?VWxpZXUwQ0RMek41NG8rWXhzU1R5OWEwL3JsMUQ0SFBNVVV6Q2xzMGlYQXpY?=
 =?utf-8?B?ZmpUWWdCVlRBeEFZeWxUZ3BmNEp5V1dLVjgwdENkc2ZteEVOdE16anZlbmhZ?=
 =?utf-8?B?NjMrYlBxYk9SdmkwRCtlZVB2MmIwWG0wQStJTUsvQWJQdmM1Ui8xYm9uU1Ra?=
 =?utf-8?B?T3F0MndoajhrOTNaNVcrbnNUWHcwUnRWam5VODlGa0VBR1RnUzF0a1h3Q21Q?=
 =?utf-8?B?bGUzUWZ1ajU0dTU1WHRjckxqS2pVYUEwRW5INW5XZ2V5TTVpSTdNNmZPcXpJ?=
 =?utf-8?B?N3pWSTA5dGxHYm1sOXdEc1RkNGw1SU1PVlh5SlNOT0w5SWpkTmxjdzhTK2h0?=
 =?utf-8?B?eFZkclozL2Qyc3hvOUY0KzB2TEQrbU05dzl2dE0vcmJkMVNJNkhGUlNhOHo3?=
 =?utf-8?B?eXdyOU9YR2hMbFg5YXc1MWgxaVRiWmxnRU9mcndWYTFHcVhtaWlLbUN3QkNx?=
 =?utf-8?B?OFJYcEkxS2ZkVzY4UHdWM0oxeEF5c1Zud0J2TlFpOERKREpRNUtKVU1zK25O?=
 =?utf-8?B?bW9mRWxqb1pRQVNLbXNoNFZSMkdPa1MyT0VRaEhxT0YwNy8vUGhwMHlCbWE1?=
 =?utf-8?B?WnB5TGVXMy9lTGtSMG9uSkZPbWh6RWx4Nzk4dWlobDJGaXE4R1RBQngwTjc0?=
 =?utf-8?B?SFlHRlB5RnM2SjRoNlcrS25lUmYwUTMySnRZTWNwUC9NZlRzRDN2RjRFUnZs?=
 =?utf-8?B?VmxUS29uTHoxMWdRUWNBUzl2OUFZVVdrWTB3eU14TU55cmlrd1loSlU0ckdl?=
 =?utf-8?B?T29yZWNqcUVxN2NtdmYrT0pHL3pWQ0E0dXRMM0xCMm5tQzJtUFZZamdhUElQ?=
 =?utf-8?B?d1NtRkdCZkJLR1U1WVREQ2tUSTJhdE5LNzdReXowaEF5emY0YytyMkxlTEE1?=
 =?utf-8?B?Zyt0TEo0T0o1SU9JanhXUURaWVAxUTQzeXYrbDZNakRzbWhsTlhWUVVTRWt6?=
 =?utf-8?B?dFBhRjNiRWhUZVpTazZianpkOXZMdDNOdmlYd0VZeE4wcENGNlMvTW5iekZ4?=
 =?utf-8?B?MzlHUXBtaFNrNStyZUtyQ29seGZYeDBSNDhtVG9RRWdHWFVyYXZUMG1PbUtW?=
 =?utf-8?B?dGZRVmZ0MFJYNENjVWFZcndpR3p5NUwxaXZDUE5nRHVjRFNTUjJ2cU5iOEhV?=
 =?utf-8?B?Q2dPN20xOWttQXNJbm52QzY1NVZOZk4xNC9ucjg0SE9WaTVkemJ6ekEwUExY?=
 =?utf-8?B?RlZWck1vN2VzYVRNSlFidTdDeXRnQTVCUFZ1d3FEYmpCWlg2ODhsNXNKYVhk?=
 =?utf-8?B?SnNjRlZnUlJDcDhLdUFyWlFaODdxNzk5ZDh5aUVGdjV6WjhReXYvVzE3VDNF?=
 =?utf-8?B?aWhlSlpZMzY2MFZTL1NwZUI4SExnVEl1dHRTa3pNclBzZUl3S1QzaitwSW1a?=
 =?utf-8?B?dUhvY3YxeVMwVmtIMGc3T3NvQ05Mb0hhalg0NXZON2VqZ3RENlRLbTlmUWZC?=
 =?utf-8?B?NGVKQ3lzbGZ1TzNKWWZOTkZtUE41NEE4MTc3RXUzbjU2aHVlRzB6QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 19da647a-649c-4405-c03a-08deeca4a7eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 12:35:06.8692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6R5hpPLWWpexk+KALdERvpemV3YveUMUUTsdwospDJZsyRsfUBYc1WuuCVLX1USMhbx7ULSyauPvIKqUlezgYGywgoimnokchphaIbg8Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10424

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEwIEp1bHkgMjAyNiAxNjo0OQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDQvNl0gY2xrOiByZW5lc2FzOiByemcybDogQWRkIHN1cHBvcnQgZm9yIFJaL0czTCBEU0kgbXV4
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCAxOSBKdW4gMjAyNiBhdCAxODo0MCwgQmlq
dSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgc3VwcG9ydCBmb3IgUlovRzNM
IERTSSBtdXggdGhhdCBzdXBwb3J0cyAyIGR1dHkgY3ljbGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gTW9yZSBj
b21tZW50cy4uLg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5j
DQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+IEBAIC0xMjAs
NiArMTIwLDExIEBADQo+ID4gICNkZWZpbmUgUlpHM0xfUExMN19GU1REX0RJVl9NUl9NSU4gICAg
ICg4ICogTUVHQSkNCj4gPiAgI2RlZmluZSBSWkczTF9QTEw3X0ZTVERfRElWX01SX01BWCAgICAg
KDE2ICogTUVHQSkNCj4gPg0KPiA+ICsjZGVmaW5lIENQR19QTExEU0lfU01VWF9MVkRTX0RVVFlf
TlVNICAgICAgICAgIDQNCj4gPiArI2RlZmluZSBDUEdfUExMRFNJX1NNVVhfTFZEU19EVVRZX0RF
TiAgICAgICAgICA3DQo+ID4gKyNkZWZpbmUgQ1BHX1BMTERTSV9TTVVYX0RTSV9SR0JfRFVUWV9O
VU0gICAgICAgMQ0KPiA+ICsjZGVmaW5lIENQR19QTExEU0lfU01VWF9EU0lfUkdCX0RVVFlfREVO
ICAgICAgIDINCj4gDQo+IEkgYW0gd29uZGVyaW5nIGlmIHRoZXNlIG1hY3JvcyBhcmUgd29ydGh3
aGlsZSwgYXMgSU1PIHRoZXkgbWFrZSBpdCBoYXJkZXIgdG8gdW5kZXJzdGFuZCB0aGUgY29kZS4N
Cg0KT0ssIHlvdSBtZWFuIGZpbmQgYSB3YXkgdG8gZGV0ZXJtaW5lIHRoZSBwYXJlbnQgYmFzZWQg
b24gc29tZSB2YXJpYWJsZS4NCg0KRm9yIGVnOiBEU0kgc2V0cyAiZHNpX2Rpdl9hYl9kZXNpcmVk
IiB0aGlzIGNhbiBiZSB1c2VkIHRvIGRpZmZlcmVudGlhdGUNCmJldHdlZW4gRFNJIGFuZCBMVkRT
LCBidXQgRFBJIHN0aWxsIHVzZSB0aGUgc2FtZSBwYXJlbnQuIFNvLCB3ZSBjYW5ub3QNCnVzZSB0
aGlzPz8NCg0Kc3RhdGljIGludCByemczbF9jcGdfZHNpX3NtdXhfZGV0ZXJtaW5lX3JhdGUoc3Ry
dWN0IGNsa19odyAqaHcsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgY2xrX3JhdGVfcmVxdWVzdCAqcmVxKQ0KIHsNCisgICAgICAgc3RydWN0IGNs
a19odyAqcGFyZW50ID0gTlVMTDsNCisNCisgICAgICAgaWYgKGRzaV9kaXZfYWJfZGVzaXJlZCkg
ew0KKyAgICAgICAgICAgICAgIHBhcmVudCA9IGNsa19od19nZXRfcGFyZW50X2J5X2luZGV4KGh3
LCAxKTsNCisgICAgICAgICAgICAgICByZXEtPmJlc3RfcGFyZW50X2h3ID0gcGFyZW50Ow0KKyAg
ICAgICB9DQoNCg0KfQ0KPiANCj4gPiArDQo+ID4gIC8qKg0KPiA+ICAgKiBzdHJ1Y3QgY2xrX2h3
X2RhdGEgLSBjbG9jayBoYXJkd2FyZSBkYXRhDQo+ID4gICAqIEBodzogY2xvY2sgaHcNCj4gDQo+
ID4gK3N0YXRpYyBpbnQgcnpnM2xfY3BnX2RzaV9zbXV4X2dldF9kdXR5X2N5Y2xlKHN0cnVjdCBj
bGtfaHcgKmh3LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBjbGtfZHV0eSAqZHV0eSkgew0KPiA+ICsgICAgICAgdTggcGFyZW50ID0gY2xr
X211eF9vcHMuZ2V0X3BhcmVudChodyk7DQo+ID4gKw0KPiA+ICsgICAgICAgLyoNCj4gPiArICAg
ICAgICAqIENESVY3X0RTSXhfQ0xLIC0gTFZEUyBwYXRoIChkaXY3KSAtIGR1dHkgNC83Lg0KPiA+
ICsgICAgICAgICogQ1NESVZfRFNJeCAtIERTSS9SR0IgcGF0aCAoY3NkaXYpIC0gZHV0eSAxLzIu
DQo+ID4gKyAgICAgICAgKi8NCj4gPiArICAgICAgIGlmIChwYXJlbnQgPT0gMCkgew0KPiA+ICsg
ICAgICAgICAgICAgICBkdXR5LT5udW0gPSBDUEdfUExMRFNJX1NNVVhfTFZEU19EVVRZX05VTTsN
Cj4gPiArICAgICAgICAgICAgICAgZHV0eS0+ZGVuID0gQ1BHX1BMTERTSV9TTVVYX0xWRFNfRFVU
WV9ERU47DQo+IA0KPiBUaGUgNC83IGR1dHkgY3ljbGUgaXMgZHVlIHRvIHRoZSBkaXZpc2lvbiBi
eSA3IGJldHdlZW4gTTIgYW5kIE0yX0RJVjcuDQo+IFBlcmhhcHMgaXQgc2hvdWxkIGJlIHNldCBi
eSB0aGF0IGRpdmlkZXIgY2xvY2sgaW5zdGVhZD8NCg0KWW91IG1lYW4gZGVmaW5lIGEgY3VzdG9t
IGNsb2NrIGZvciBNMl9ESVY3IGFuZCBjYWxsIHNldGR1dHkgZm9yIGdyYW5kIHBhcmVudA0KZnJv
bSBMVkRTIGJyaWRnZSBkcml2ZXIgdG8gZGlzdGluZ3Vpc2ggTFZEUyBmcm9tIG90aGVycyA/Pw0K
DQorc3RhdGljIGludCByemczbF9sdmRzX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
LA0KKwkJCSAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLA0KKwkJCSAgICAgZW51bSBk
cm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykNCit7DQorCXN0cnVjdCByemczbF9sdmRzICps
dmRzID0gYnJpZGdlX3RvX3J6ZzNsX2x2ZHMoYnJpZGdlKTsNCisJc3RydWN0IGNsayAqY2xrX3Bh
cmVudCwgKmNsa19ncmFuZF9wYXJlbnQ7DQorDQorCWNsa19wYXJlbnQgPSBjbGtfZ2V0X3BhcmVu
dChsdmRzLT5kb3RjbGspOw0KKyAgICAgY2xrX2dyYW5kX3BhcmVudCA9IGNsa19nZXRfcGFyZW50
KGNsa19wYXJlbnQpOw0KKwljbGtfc2V0X2R1dHlfY3ljbGUoY2xrX2dyYW5kX3BhcmVudCwgNCwg
Nyk7DQorDQorCXJldHVybiBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBsdmRzLT5icmlkZ2Uu
bmV4dF9icmlkZ2UsIGJyaWRnZSwgZmxhZ3MpOw0KK30NCg0KQ2hlZXJzLA0KQmlqdQ0K
