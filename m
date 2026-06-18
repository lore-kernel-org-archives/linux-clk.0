Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8E3C8717;
	Thu, 18 Jun 2026 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774854; cv=fail; b=VdxT2kO4Mo45rqCVK4uMNVyomVzykP/lqoHxt+bQE5baSS/gl4z1EkAVAj+YVuZ2ozLRMvRE+wH+ytg/FJizhn2CYIoYX0FMr9GBtWEn9fn29pXlrj2l/6+swVMAlvK8wIkvuw5h63u/qzDBSIJFpft5nbs2u4u7zV3HMikuUQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774854; c=relaxed/simple;
	bh=L7ZM/zatYF2LKm1dBZYlpiylf3GFVRj44mizucxmVqM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O6yM/9gNGMItDwgyKnVCyJPoYJIMXO2SKiKV3VvFUiBK/IimHKly3b93NCPmJ18T7+OaOC07DoGKzbUSJgTcyW0VnxJY+00QLI7PC6nEDVQ0KudzwUnfbbv6Urokbc3Tu5UcE1Jr7s/99GB3eHCXVVJ0InxX1WGW8bijVXzeOBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGngsgAV8Vdv8ee1JPRL+VuwhDnolkKPuPflZmNHUj3mYUCOwH9bdfzc5bX9qDTVOZWPZj81YNrk8GGdN/6u727B6MApGcoKrQPDk0p4uB7d+tGxQ1jQKzWsbbvdDk+cV4W2uviKTj4D8iMe8WqAFvMAjNHwUqt0IsRjxxUenGjJL6ccbyxCBbkgjceeZ3vudLfB3qHeF5aRG4uRY17rl2eEITthrn8ocvRiYMUxHTFlnmzFkSayGMQ8DF5le9hSPMMOmEP5EAz7sAar0zNPnN4dqtOlPjiNAbyVn+wA9eZbqEV0WcTtgBUoF601gxC+iz8XGlNm9DgXOak7m/UVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7ZM/zatYF2LKm1dBZYlpiylf3GFVRj44mizucxmVqM=;
 b=OiEeE4tBYviTSO/fxbOr2CmHhob9dI7/Hq2M0IejrYe7lsCnzzOdT4wNjDCySi2p08FrwDCIdQ7eB+FKBC/6dLb5pYjg82oJJj+Fx4Ntxau7F/iTJkphaHs3rHuHptexZIWYeLeBOw3gbX5ZpEGwvMm+fRLLXX4xQ1OBi9V7AI7tQBtsaDSDIK6fAxF0cnvMEVXYSS+n4uLynRF7WupeHAXSiS0y3+B8IrEUhXWPzqGcukCXzzPH9WxG53Ufgiy4Ctv6BCShM19nJEroVQUbC4078iahE1CeQI/lFC0escLT9fTszPnjXJoniWBlUiFEpRhFnoXI5DnvUcqWA1tiAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SE3PR06MB9242.apcprd06.prod.outlook.com (2603:1096:101:332::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Thu, 18 Jun
 2026 09:27:29 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 09:27:28 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Gary Yang
	<Gary.Yang@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Thread-Topic: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Thread-Index: AQHc/h82CYMaDL0LD0Koho75ZPcCVLZC50MAgACkQWCAAHGQAIAAD2fg
Date: Thu, 18 Jun 2026 09:27:28 +0000
Message-ID:
 <SEYPR06MB6226B25BA7652287C752E4C782E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
	 <20260617060437.1474816-4-joakim.zhang@cixtech.com>
	 <20260617-clinic-blank-61289f8fc1c2@spud>
	 <SEYPR06MB62262C0F7823337CA9496DE982E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <cd63c1ab9831fdfd39aad8d1a40c4702a9cbb158.camel@pengutronix.de>
In-Reply-To: <cd63c1ab9831fdfd39aad8d1a40c4702a9cbb158.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SE3PR06MB9242:EE_
x-ms-office365-filtering-correlation-id: 141a1aba-72f3-4c32-fa45-08decd1bd0ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 vmZK/dkyPy4Smln0zqTrJzOyuAQRv4k5XwfZzcnUPlfnHZ+j5saNma5RAb2WWJCjRLq5JVMcyPF4KsftyQFpOd/uYHrsmErwAMmQ5xnxxm5rg7RtRadJS3YRw8omA5u57idp3GfjAFfkkOm2AVUjmP5YGeUHw5Rw1k/IBO+GCI0+SU6OgVgDFOdNOdhGx+73pPzx0yshGDKrRYngYeRM89nLxODAEEyXFxe0r+9MSJfX9i/npErtiOHhIGSeFV3by1L45dXLpDQg2raTfZKJJC6LMl3Jbk14dDBVOyor8LqgBeb5Lmmmf01BPcnLODpnJPXfqBO6CXzx9I02lJS8RfLKDR6EFv8VSjf8g3cBY5PEKySOpWX7QX19f8fVVjkW0C+m/97jpvWITf2NK1IQkGa4u+0dnCwGjZbBasHnPnzPrAR3iTRNYLhw+GLenutlM/FxQKuGyN8aq3uAZhvHy4AK+7ZIOt9TU5lpfHwObsH625IrSH2kUG+jn8dYU36EN6Wsa2MFEfjFUvL2us/Mbamjg9kUUZ+sSM/w1S0xzVa+jyNV6M/flgRGoOuDRET7pkiB3zH8em+lbUhHnNDPyFQ4P10R69ukOfhEJ51kbE7+roztk9Vw/giTINuUOFFQ6SYbNQnhV059oBlBcSCdCH1BbPwTYIV0hsYUWeAfuSdegnQxEa/EJKlv/F+wZuDGqTqT37nrsVM7gjiArl2WoAYetSF8xUGO7jiyyhHrONms/OuOBidj9nWmSYqqpx5b
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alYvM2txVXN0dk5FYXpXM2RqMGltUnRkK0tMczdnTnV2amViQnhvRlFPM3Ir?=
 =?utf-8?B?eTJML0RhWit5cW5OTUdpZEpnR0l5Q0l1NlpnSUtJYmhrMkoyS3NHeUgxbWtz?=
 =?utf-8?B?UHZqY3hEaXhRVGRaR2ZtSDd5L1NMQXpSMUpDMSs1U1pad0o2NnJzS1B2Q0F2?=
 =?utf-8?B?eG5WNlFWWmljZHJNb3FRNHpudEpaallTVUl2ZHoxaGJQL3dNdGxVVU9VM1Ux?=
 =?utf-8?B?NDJwZW80clNHZnR2N1pNWWZhSXYycHRuU2JYWHZYTFBLNWlNMDZpZ3lBcW1M?=
 =?utf-8?B?RktMbmpQYitQOU5KMDd3b0ltSDNaaHJweXlBOXFQNWhIWHNqUlErUDVnaEdw?=
 =?utf-8?B?ZzhGRkVkbWhJSmh4UlpkSTR1M0RYS0ZlV0c4U1VJL2hxNkJtT1hpbllrcE4z?=
 =?utf-8?B?a3F0RVBocWZaazJWS0Z3QWlkUmZHelpCWXFxTVZZTlRSMHkrVEMrdzZZRHdu?=
 =?utf-8?B?Y3pqN1Y4dmpaVjRJTlFWZVF3WW5NSWJ4bk5NS2RWWEZzVGNPT1hYNE1VVE94?=
 =?utf-8?B?YlVQdDUzOGtwYzNIV2ZGSE5MWWorUkRyeGFzL0R6VWZiRTdBbTBQZDVsMS8x?=
 =?utf-8?B?L29Ybys5eTlBenFPdExidGZOQ0xVZXRrNTNDNWJ3QzZhMWpCeTVuWTlNWThw?=
 =?utf-8?B?eXlNNzRNVmlGQlJ1Szd3UDJMdzg2QnVSVHdJYU5VMk0xY0E5dDFzZzd2VEtt?=
 =?utf-8?B?TzgrbkVuN2ZDazV6eS93UXVXSm5WYllVbFQxRzcvS1Z6UUQ4K1kzazdMT3ZK?=
 =?utf-8?B?ZkMyZ2UzK3ZUaGdHSmZocHA0cWpLRTZQRlUrS1UwZzJwZ3NQYXJUUjlyT1dN?=
 =?utf-8?B?cHVVREhnNmZtaUhSMmF0blFkT3lkWWJuWVJySDA0bmV0K3ZFRmNIVUlVcXBX?=
 =?utf-8?B?L253MlJxME1neEFYV1A3ZTVNSkJ3T1VoVUtIc21oT2FMTDc2bHE3dC9aa2Nw?=
 =?utf-8?B?TldmZkcwQkxqSnIxYmRPdlFUWXdLclJFeGVlUUhQYzU4U1F1dURiUWIzWUJ1?=
 =?utf-8?B?anlhaXQ1S2EzOTl1U0piZGpKU0RCL01xTnRxc01kMExCaWtza2xjRkpBZzVx?=
 =?utf-8?B?NnlhRFhERkZWQWVDazQ4TE03TWNhOXdtV3V6THJ2eFowVUZWMHluL1Y4WmpQ?=
 =?utf-8?B?Y1kwNEhQdFBuM3hZVzVTQTNYM3VZZTlBTEtDOXBlNDNrSFRLNk9NeTQvOC9O?=
 =?utf-8?B?SHRSbm9kYWtlSXRPcm1JRlM4ekZWbW50b1ZPNE13R3BtOFVDN2FGRlFaZGlJ?=
 =?utf-8?B?cGRCQlBxUWd1cmNTdHM1S3VwL3JGQnVpckc3VE1sb2tJQnB4RVdpMWVTQ2J4?=
 =?utf-8?B?QUdDd0hBWW5qQXdxZ20yWkpZWHZheXNCWkkrWE1tNTkyTWp0YXIyc29KUzhI?=
 =?utf-8?B?VlAwWlFZTVBaUGFPejBtc1FQVVRUL3hzL2NETlBmS2U0T1EyMEV0emV2T1Uy?=
 =?utf-8?B?b0tSNGtLTVg3UlFKZGNEMi93WVpVUW5iSUFvZnZNcUNjZG5ldTZ0S2FGaGhO?=
 =?utf-8?B?RWl5YVYwY2ZtTXVWdXlydWpYckRrVG1UR0E1aThMRzBHeG9wRDV6ZC9YdkhQ?=
 =?utf-8?B?OVdXV09IQVdtM0N3dzlMOEVjL2hYN25qNjk1OE1STHFuN1Fya0NSbEh0OGhz?=
 =?utf-8?B?Z2tKbzMwc1RQbGRpMGJTZGNDLzJkaDJ2dFNaRkxiYUVIeHN2aEhTV01ONGVB?=
 =?utf-8?B?bmJPdmpyVjl5emVzaGZqZjQ0SGo1Y0tGWXByM2RPcUh5TVM1VC9PN2NIQ2N1?=
 =?utf-8?B?QWhEcGU2MEpiV3NQTEhSTzFhQ3l6OU92ZXpBODRLQnJEWTkraElyZC8zK3dZ?=
 =?utf-8?B?RlMxQkdTOHZYcDJ2V01zTXlZWWVVTThvRUVzMjRacWpjQytvK0ZwREl4c0xv?=
 =?utf-8?B?R1lBck1JNWlvRk5BajF2Y0Zvd0hHa3AvM2I0ekFjOHNnc2pHN1lzUnorQ0xi?=
 =?utf-8?B?d2YrRXE5UFJCQVI1UkV3bkFVbTZyQis0WTdUYzRkK3MvWm13VVpxZloyQk83?=
 =?utf-8?B?MXM2a0xjSzFCRDFWdkUrbzBXOGhXV3VIL3NVdmFlVE4zVk5uOEhUU0p3YW9p?=
 =?utf-8?B?MEpBU2x6UTFvWVBET3VGYVNrYWU0Wld1dHFCbEcrMXNWWWViVDhXdFF6VGpR?=
 =?utf-8?B?U0lhNTlQcFVLL0QrZjNid2QySW5UK2JDQ0p5OG8xVXBvd3Zxb2VKdXIzamI2?=
 =?utf-8?B?RUFQUXhDZlRjcGFvck04M0g4MmREYU13VndzUGV4dHlFazFXUGZ4aFZNSzdG?=
 =?utf-8?B?Vy9PTFBva1pPaHdzTnQ2NHFTWllTOEtOdFE1cmw3ZmRTRVlueERWd2JFTy9t?=
 =?utf-8?B?ejMvWUwyciszaDR6aXBPRjRiaTE2cWhqMk9PdWdWT0VxYUYxUW9KUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141a1aba-72f3-4c32-fa45-08decd1bd0ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 09:27:28.6013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W++81X7L5Y1Xi4LmhNOXXgvuOgL8AHwxv8/Ez71ASHWjFdl/Ygs18nZgdAqKvCvENJsBthdFKTwJtcNE75MtrQ6jz45C0lcncVMax8JgGjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9242

DQpIZWxsbywNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5l
IDE4LCAyMDI2IDQ6MzAgUE0NCj4gVG86IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRl
Y2guY29tPjsgQ29ub3IgRG9vbGV5DQo+IDxjb25vckBrZXJuZWwub3JnPg0KPiBDYzogbXR1cnF1
ZXR0ZUBiYXlsaWJyZS5jb207IHNib3lkQGtlcm5lbC5vcmc7IGJtYXNuZXlAcmVkaGF0LmNvbTsN
Cj4gcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5v
cmc7IEdhcnkgWWFuZw0KPiA8R2FyeS5ZYW5nQGNpeHRlY2guY29tPjsgY2l4LWtlcm5lbC11cHN0
cmVhbSA8Y2l4LWtlcm5lbC0NCj4gdXBzdHJlYW1AY2l4dGVjaC5jb20+OyBsaW51eC1jbGtAdmdl
ci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDMvNV0gZHQtYmluZGluZ3M6IGNsb2NrOiBjaXgs
c2t5MS1hdWRzcy1jbG9jazogYWRkIGF1ZHNzDQo+IGNsb2NrIGNvbnRyb2xsZXINCj4gDQo+IEVY
VEVSTkFMIEVNQUlMDQo+IA0KPiBDQVVUSU9OOiBTdXNwaWNpb3VzIEVtYWlsIGZyb20gdW51c3Vh
bCBkb21haW4uDQo+IA0KPiBPbiBEbywgMjAyNi0wNi0xOCBhdCAwMTo0MyArMDAwMCwgSm9ha2lt
ICBaaGFuZyB3cm90ZToNCj4gPiBIZWxsbywNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3Jn
Pg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDE3LCAyMDI2IDExOjU2IFBNDQo+ID4gPiBU
bzogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4gPiBDYzogbXR1
cnF1ZXR0ZUBiYXlsaWJyZS5jb207IHNib3lkQGtlcm5lbC5vcmc7IGJtYXNuZXlAcmVkaGF0LmNv
bTsNCj4gPiA+IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBr
ZXJuZWwub3JnOw0KPiA+ID4gcC56YWJlbEBwZW5ndXRyb25peC5kZTsgR2FyeSBZYW5nIDxnYXJ5
LnlhbmdAY2l4dGVjaC5jb20+Ow0KPiA+ID4gY2l4LWtlcm5lbC0gdXBzdHJlYW0gPGNpeC1rZXJu
ZWwtdXBzdHJlYW1AY2l4dGVjaC5jb20+Ow0KPiA+ID4gbGludXgtY2xrQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1hcm0tIGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY0IDMvNV0gZHQtYmluZGluZ3M6IGNsb2NrOg0KPiA+ID4gY2l4
LHNreTEtYXVkc3MtY2xvY2s6IGFkZCBhdWRzcyBjbG9jayBjb250cm9sbGVyDQo+ID4gPg0KPiA+
ID4gT24gV2VkLCBKdW4gMTcsIDIwMjYgYXQgMDI6MDQ6MzVQTSArMDgwMCwgam9ha2ltLnpoYW5n
QGNpeHRlY2guY29tDQo+IHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBKb2FraW0gWmhhbmcgPGpvYWtp
bS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIEFVRFNTIENSVSBjb250
YWlucyBhbiBpbnRlcm5hbCBjbG9jayB0cmVlIG9mIG11eGVzLCBkaXZpZGVycw0KPiA+ID4gPiBh
bmQgZ2F0ZXMgZm9yIERTUCwgSTJTLCBIREEsIERNQUMgYW5kIHJlbGF0ZWQgYmxvY2tzLiBUaGUg
Y2xvY2sNCj4gPiA+ID4gcHJvdmlkZXIgaXMgYSBjaGlsZCBub2RlIG9mIHRoZSBjaXgsc2t5MS1h
dWRzcy1zeXN0ZW0tY29udHJvbA0KPiA+ID4gPiBzeXNjb24gYW5kIGFjY2Vzc2VzIHJlZ2lzdGVy
cyB0aHJvdWdoIHRoZSBwYXJlbnQgTU1JTyByZWdpb24uDQo+ID4gPg0KPiA+ID4gV2h5IGNhbiB0
aGlzIG5vdCBqdXN0IGJlIHBhcnQgb2YgdGhlIHBhcmVudCBzeXNjb24gbm9kZT8NCj4gPg0KPiA+
IFRoZSBjbG9jayBhbmQgcmVzZXQgYmxvY2tzIGFyZSBoYW5kbGVkIGJ5IGRpZmZlcmVudCBzdWJz
eXN0ZW1zIGFuZA0KPiBtYWludGFpbmVycyAoY2xrIHZzIHJlc2V0KS4gUHV0dGluZyB0aGUgY2xv
Y2sgcHJvdmlkZXIgb24gdGhlIHBhcmVudCBzeXNjb24gbm9kZQ0KPiB3b3VsZCBtZWFuIGEgc2lu
Z2xlIGRyaXZlciBoYXMgdG8gcmVnaXN0ZXIgYm90aCB0aGUgcmVzZXQgY29udHJvbGxlciBhbmQg
dGhlDQo+IGNsb2NrIHByb3ZpZGVyIG9uIG9uZSBkZXZpY2UsIHdoaWNoIGRvZXNuJ3QgZml0IHdl
bGwuDQo+IA0KPiBUaGVyZSBhcmUgbWFueSBleGFtcGxlcyBvZiBjbG9jayBhbmQgcmVzZXQgZHJp
dmVycyBzaGFyaW5nIHRoZSBzYW1lIG5vZGUsIGJ5DQo+IHVzaW5nIHBsYXRmb3JtX2RyaXZlciBm
b3Igb25lICh1c3VhbGx5IGNsaykgYW5kIGF1eGlsaWFyeV9kcml2ZXIgZm9yIHRoZSBvdGhlcg0K
PiAodXN1YWxseSByZXNldCkuDQoNCk9LLCBJIHdpbGwgaGF2ZSBhIGxvb2suICBJZiB5b3UgYXJl
IGFsc28gcHJlZmVyIHRvIHRoaXMsIEkgd2lsbCByZWZhY3RvciB0aGUgcGF0Y2guDQoNClRoYW5r
cywNCkpvYWtpbQ0K
