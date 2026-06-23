Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023120.outbound.protection.outlook.com [52.101.127.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B43B3BEF;
	Tue, 23 Jun 2026 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198454; cv=fail; b=UH6ZWWyofFL2ApPfH9bB09tiTz5pB+KXyAI1rnZQQXJzcgkaUb0Qh+uE3s5hkDTKp+Hj+zQ+motffJADBAeSGJ8plvXtIpDM+3G/Tx7VPNJI353o1ev8q0NrqnqLePl708Iy+xcEPBvN43BThqR0IH5kHXf2XbVSCq4n/gPdYyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198454; c=relaxed/simple;
	bh=7l+Xqg37TTPdPunE0lHByK1bsQ1IwY0HjlNG7tTOnLE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BTZI2VPbrUk8kUFoVrJoaLx4aoEsEsO+wkq8+m7n13gueIwhENgnwJ+umL1djUTSaTz/ZlMPGkE5OfDVtRKb4uIRFRF8xz4htAkplYR1OPizd0UBr1gDIuBJ3i2zCqq7A5eLwzxb5gXrVfhDCjsWAnF6GMCjZnKU+Msdgt5c1Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dicq4qMm93amBjIztscNf8idIAgfZXnNC15UvU/STY3U/cmzrYws/bkHVdEhWZvt1HeCun8yFjHtQMqeHkMj6kJKY3DFGL1hSZJBJ3H567hI8J8ah7fEFA/mBfVjse0oFXeeDKr+H4MK9fWQ6pCU+znk6eGfusxxm7S2HCIrvhhIx0P7PtS0pyffcvNtcUCuNWEZm92dJewnyWVJVONHDYEbsqR5S8xGDHu7joIkHNk9t9gxrrr2xeyD7col1iCydWDT3T52hxUrajaigrNXLw40oDj2HDLgOOhoaEKsQoqGgX9LDGYSwPsJl4QtpfSsv4ZO0LDz9MczjjMhyz0Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7l+Xqg37TTPdPunE0lHByK1bsQ1IwY0HjlNG7tTOnLE=;
 b=zOno3gVpUJ93lTppOVSW9yVkCS3oOD+N+Rf4eKxsSJsEuafonDBXIniIg2zQCimFaCaGECpLvJNI/HmUInShhk5GaMMpq2GbMC3p6Hjs9vz7haSBWTdpbnBnM8lb56WdKBMH27i7OpRz4pa9IZ9qBD3kN1Ik+l/599m2SzPMY8J46wu6AYNJFtRp3DkIilfawmyZ2KE/zhR4aGwKThSvro3Frj8H3fNx4p0uL3yWGWkRr2NQcMCQvgbLka7tVm8vU1i2YpKMIOEeNutPch/suAIDnE3treh9kkkcLr1D/Uk8tMrhSiwEAxacskdL1GMO1fh7mYTozcJ59KTm16Tpmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by PUZPR06MB5817.apcprd06.prod.outlook.com (2603:1096:301:f2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 07:07:29 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 07:07:29 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Gary Yang
	<Gary.Yang@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v5 4/4] arm64: dts: cix: sky1: add audss cru
Thread-Topic: [PATCH v5 4/4] arm64: dts: cix: sky1: add audss cru
Thread-Index: AQHdAe5mLoV9YRPnhUagTZVBWldu+bZKR/GAgAFx/WA=
Date: Tue, 23 Jun 2026 07:07:29 +0000
Message-ID:
 <SEYPR06MB622668D39D087D87D294B71882EE2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
 <20260622022520.3127103-5-joakim.zhang@cixtech.com>
 <20260622-dramatic-worm-of-radiance-adf731@quoll>
In-Reply-To: <20260622-dramatic-worm-of-radiance-adf731@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|PUZPR06MB5817:EE_
x-ms-office365-filtering-correlation-id: 542f4b0a-ad68-4541-7340-08ded0f61698
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 9Lnai8AF1IQkxB07h8nJ7qOYo4TRP3HS5sYF3gLU84QXnNwkAZQAhAFYgkYFbxPUxNSebWymmi+6o7nEuo3Ddn8pn+RYjaRlyyKqUsnZykU404Jq5U4rUp78RB2fIeISnQbG6AN6wYnibWM//tPYl2PhE1Pqq1zgcOPj4mc++uRxofNVrNnNi6NeQZGXfQwAL8lp4dGu6ChAUUuAtV5OztX+gHJEuq6GmpfBdQ0iMUPLje8EeKcd4D8+S+TKj2SteIuqljGeBA/8/yZ2cd3FGD107skbXzT2KBG/sc2tpCVkelfmOU8h0q0Pw91gJSBJm5LnPmng+hnYiTXHIFOf4OL+2fuhgnRIDhOs6TJ1YZCQgJ/2S9CtBvHqPEU3GBhnMbtkMW3xqPtbiUI6GwqPKaG6kg2AS8IuC3AKQC4H+3s5fY0pseVJlYRAg/wr4e4fNIo1tBrRdoPjg5SQcp8aDY13gRQhawPxESxHMmSCYut0OLPEsOTZIvUenGSZtEsIoC8UpYmIVLDzr8fT9fLQA3uRgarhTs8z5jOaxH0u0ncN3Q1dukqryFfSUNhpmlvg4/G7HvXapoyH7ESkfzJW2ULYrZTQX8tGPGQWdMd1eJYBmGz5TrD7A7Ho6dkCvhhCesnyr2iqDQu7ojmiRk6CjoW9YZFlcZE2mKkJhu8TFivTZel8Nj6t8EuLHZNexwDLRHLOpII18RcmlWPF6D7Dqhv6VVaSfM7NT0Uu3SV5gvo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVlIZmFvcVJBNzBhYjhiTkpVZ0VYVmRuUnpyOVNYUmIrRWs3U3A1UDdJZWpB?=
 =?utf-8?B?RzRRcVNlVDRiWVNzZlhzVVVveStuaUlwN3ZRTHZBUldCM0tCeEhJQWVFT0Na?=
 =?utf-8?B?bFVWaXVHR1MrNm9abTNTQ1dDZU5ybkdQNFJBS2l0SmxxNk5lcVVPV3RueEVO?=
 =?utf-8?B?L1d1RkszUDZXSEg3bkI5MWg0Q3lwU2NHRlRwWVppL2NEZk15TmhXMkJPRHo2?=
 =?utf-8?B?UXRja0p6WVNHSkZuRFpJSXZlV3kwNSszYjhXRUdITjFRVmdnUW5HWFVUKzlL?=
 =?utf-8?B?c3VnOG5ZTU4wWWIrT1FCTm41MjhPeVVDcGFtcDNnRHVsMnNEcTRyMUxSUWdk?=
 =?utf-8?B?a0VOUTlSSGZXeFllbW83Sms5NlpLVGhYbS9ONEN3ZndoR3hodzRsQmVVanVX?=
 =?utf-8?B?bUdsNlk1dFRGWmlaWUFhZC8rR2k0S2tTSXlrTStBcUJPMnRQNjlTMHFOamd2?=
 =?utf-8?B?RVdHMHNRa3c4M0FldUFISCt5ZVZjQWMvTWhWV0ZvY2IyT3NnSmF1S0RENzB4?=
 =?utf-8?B?Ujcya25lbWNhMGVYNnRRMzdpY2pwb0hDdjB3cU92NXhqa2duU2dTRjZkdDRE?=
 =?utf-8?B?Y1VCZEkvblFuOE1lUVdXemRIZ3AzT0MvcHVxOGxVQmVjanR5TGtiUS95czRq?=
 =?utf-8?B?QWI5OE1hZDU1T3RQQ0tHektFQk1zQ2d0dm1JYU5EUXp2WHc4QUpocVZ5WGNl?=
 =?utf-8?B?c2ZreGRrL1A3Q3VmdFBMZ0FPNVdtY3hJMW9uTmxRQzB3VjFVOVFnMElPeldz?=
 =?utf-8?B?M3U4MVRxQWRQMDBSUUpGR2xZdmpXMVV5b3VWNlBMVExCZ05vQ0t4dWFkUG9B?=
 =?utf-8?B?S2I3dUVMMVBNN2MrUk9ZekpoY3Q0dzM3TlhJbnVVVkV5dG1HOEpMMjZQU293?=
 =?utf-8?B?bUQrU1pxRXVaTkdVVXMvVXdnZ2NMMXFrL2lNSGJuMEVLWURMOGI3aEhRZUpH?=
 =?utf-8?B?RmlwSFFNdE15Rjk0R3N5SnMvVDZLcG5kSG5MZVVmRitrWitoK3ZTK3pldzNH?=
 =?utf-8?B?RC9FOHVaUE5HWGtKU1NvVElOMnBZVzV3UU5FKys3Z2g5TVJlU1RHMGdLaG9E?=
 =?utf-8?B?bWZ0UnUzS05WUWhQek5wTVJrMlh4OFdiczhXSHlXbGxVMW5jNERBSkVSR2hJ?=
 =?utf-8?B?eSs0SHdBTTVwTkRsR291TWQ1Q2tPclJ4WnY1K2dRU0IzMTdlalR2dTZMQ1Qv?=
 =?utf-8?B?QmMzK3ExLytIWGJVZjllaFBKS0pJZFR0RnRsc1BKSEMxbkxpQVd2MnZpTSt5?=
 =?utf-8?B?TENkYTA5WWRIVCt2TlhTTFVjM1lydnViOFcxTGpFOWpLaDFrMkJuSmtaWUtI?=
 =?utf-8?B?c2h3UWtjSFNrNTZSSmZHZXZXM2srZnhuM05JL2dtVmQzVEkvMlJPMVZSV1pG?=
 =?utf-8?B?eU90cmhHU1dHRFVzQStyL0pSL2tpT0VseFlVM1BDL08vWlZFVnpSWFJ3N1JX?=
 =?utf-8?B?UTVleGQvNFZMWTZpSjR4YVErVVlxMEdwcE5jTVQ0WjJBSERVa0s0QWZwK1ZM?=
 =?utf-8?B?YmN5dWVLZ1FiTzZQdEJianhvUXFYcnBtd0t4amMwYUZkcjFIY0Z3Mm8wWWJr?=
 =?utf-8?B?Q1RzSU9OWkdWbGtFZ2RiL21jZnRIc0pGQnE3aHk0YmRySk9Wc3NzYUE5aGZP?=
 =?utf-8?B?Y1dJWExyT0kwSzhjejlXdFd6WC9vMll5cGlRQTJzb0pMVzZOSmFwcXBzcGRw?=
 =?utf-8?B?d0F2bFJNZmZFbnI5L3AxUzJsSk5XQnM1RFhIVkVWN1VpRkYycko5L3hoTUJQ?=
 =?utf-8?B?bVg3V3YxZ1FaOWtNeHc5emc4YndtRllDMlZyZHdYRFRDdmExVjd4Vjh5ZGhi?=
 =?utf-8?B?dHRKSDQxejJKZGhINVVReCt4UWJSRXNyQmhNUmhWNEd1bUhaMXdOeUxEdUhM?=
 =?utf-8?B?eGQxSkxUMWNUd2pTbkVOL1pDa05FOHo5Y0R6RjNtUENyRGlMZThidFBycnh3?=
 =?utf-8?B?OHkyUGNQdmwyK2xwWXRVcFVrY1g3YU1ybXFrR0dLNFpaTzlYMytRbEdZZmpv?=
 =?utf-8?B?aTVFTzZHa0ptZTcxSnVaTnJNdG4yWVRlVCs3OWpjUFZZejJlN1ZKOHhvbGxm?=
 =?utf-8?B?R0llQlo1WTEvUThpVVEvSUpFNUxxSTVGWlYxcFg0Z1E2SzdBU0wwWEovQXhI?=
 =?utf-8?B?MEpXYmR6a0c2a2pmRC9IR3cvZkUwcTZrWVZzVGlSSmhuVS9IeGpBVzAxT2xv?=
 =?utf-8?B?TzNSTm1tUXVQY0RkbHl5YXhVVnA3M05OYk5ldVBlZDdmOUJXMG8yVWZuRFFP?=
 =?utf-8?B?MFpaK0RjMmQzWEZBTEQyN1NBOEt4V1hjSG0xbXd4UzZ5ZzdXdm42NmxSNEJm?=
 =?utf-8?B?YlcxbDY1SGlTNHliU1pBSk9OTURqd2g1VmYzcnE5SlU1d01rR095Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 542f4b0a-ad68-4541-7340-08ded0f61698
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 07:07:29.2249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ol37kj/xOmiw5gLvEWlldmF1ZPVMxzifK0ZdpGeb+YH1pCc3BZpf+tuUUOrJmFPn0M4cA8FY8qhxE7ygFzVrXCLvOJP3aNnqWmAOldFgZQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5817

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMjIsIDIwMjYg
NTowMyBQTQ0KPiBUbzogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+
IENjOiBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgc2JveWRAa2VybmVsLm9yZzsgYm1hc25leUBy
ZWRoYXQuY29tOw0KPiByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3Ir
ZHRAa2VybmVsLm9yZzsNCj4gcC56YWJlbEBwZW5ndXRyb25peC5kZTsgR2FyeSBZYW5nIDxnYXJ5
LnlhbmdAY2l4dGVjaC5jb20+OyBjaXgta2VybmVsLQ0KPiB1cHN0cmVhbSA8Y2l4LWtlcm5lbC11
cHN0cmVhbUBjaXh0ZWNoLmNvbT47IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgNC80XSBhcm02NDogZHRzOiBjaXg6IHNreTE6IGFkZCBhdWRzcyBjcnUNCj4gDQo+IEVY
VEVSTkFMIEVNQUlMDQo+IA0KPiBPbiBNb24sIEp1biAyMiwgMjAyNiBhdCAxMDoyNToyMEFNICsw
ODAwLCBqb2FraW0uemhhbmdAY2l4dGVjaC5jb20gd3JvdGU6DQo+ID4NCj4gPiArICAgICAgICAg
ICAgIGF1ZHNzX2NydTogY2xvY2stY29udHJvbGxlckA3MTEwMDAwIHsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJjaXgsc2t5MS1hdWRzcy1jcnUiOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MDcxMTAwMDAgMHgwIDB4MTAwMDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICNyZXNldC1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPCZzY21pX2NsayBDTEtfVFJFRV9BVURJT19DTEswPiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPCZzY21pX2NsayBDTEtfVFJFRV9BVURJT19DTEsyPiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZzY21pX2NsayBDTEtfVFJFRV9B
VURJT19DTEs0PiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZzY21pX2Ns
ayBDTEtfVFJFRV9BVURJT19DTEs1PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY2xvY2st
bmFtZXMgPSAieDhrIiwgIngxMWsiLCAic3lzIiwgIjQ4bSI7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNtY19kZXZwZCBTS1kxX1BEX0FVRElPPjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZzNV9zeXNjb24gU0tZMV9BVURJT19ISUZJ
NV9OT0NfUkVTRVRfTj47DQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
b2theSI7DQo+IA0KPiBEcm9wLg0KT2suDQoNClRoYW5rcywNCkpvYWtpbQ0K
