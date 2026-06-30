Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E29640BCD5;
	Tue, 30 Jun 2026 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823436; cv=fail; b=Sn/QU/bMFJuPYEgaYDEvfGuZ0I0B2mtS/yz7zEJ0uD1LOkiDVCABu6USZMNKqXq52E6bp8IvAnJuyyluUjpnXZF1y4YQL4vsGHN/SBDLYpqAqKzBr4MgqVR+axxG8aUi4Qf+gCW8dq5k+2b3EYHWd+y0+DAZzrHPK7fygYarlro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823436; c=relaxed/simple;
	bh=+7BtfpmCB9jzu/4IcIChuJIJxT1z4DKx5Tki1W6ULw0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K+dSSLqpKTIIKjL04G8DAXBsmp3EzDcCguUJEN/bV/hFZ8plUrK80txRuguTgSVRIyDjSmaNtq8VIS/ZRnK2gzqk0PRJMJDYJlYryV+HLxFo9e0hxqcptNyUaUpvVfQ2B8bM3JzGqDzzf8wDDvfeXzT69pqVPJgZP29Bs8s5OT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKAZmnQ8fw6P/9uQt54KNsTsz/DgDiIiWY1Km1TbZjS3Ndz9JJOTSbKa1wcRqUmUcq4Ntf7orgdVpqGgqVBpgfEcnhMkbgeRRttWfpod9d5m3cbCkAi1H/4l7udqIld6kleeKzBDKNvQnS/VxYN3CAVEY85q0+0Skn3EYilwh5ya0TG7A9DfI+WJqVFC3opbtIKQZDFGR6DhC0CSgvXeudOFgMczI2koXI17iZ/1db0e298RRBzKlmtlDK2zCU3FelLWNG5rXuiPDeU1PMyA9A0TTQCmBzHl6imXgjsso+cqNgNDCXiGvIFyb3MXk6iMIZcFtDa25Pgj2YMvfkrqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7BtfpmCB9jzu/4IcIChuJIJxT1z4DKx5Tki1W6ULw0=;
 b=luGzNBcVoqFKVAErOk0cuH/eBLI2sDzNeSRbPj/S0EH4oc7+mJ/vfTHjJljL3IBSZBlLCv0flLsLs4tUASK4vgGZN015E/FiKiONad2VoPlTTZknQVTYX+XzgG7mSiRCX9pKBpQsRVjI9eTFqQULf4FcnSY3VMp7H+28YoLX1geraazlZ2gkbc9G5i826mPCovLv/j0cpFKm2XpsbtcMkxRbor6ZTYPootdn3UZNcFft+KbLzTUt+68+piJtEcQB0M59vmS9j/wbhGQ4lFKY374qUDE0MBjsV9TvjnszEoi7zHBa3+ER9B9nDxsf+7OLJ29gUDcY7MOrkqGY3gV+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 by SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:43:50 +0000
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7]) by KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:43:50 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney@redhat.com" <bmasney@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v7 3/4] reset: cix: add sky1 audss auxiliary reset driver
Thread-Topic: [PATCH v7 3/4] reset: cix: add sky1 audss auxiliary reset driver
Thread-Index: AQHdB6fHRT9Vl1gjkUu7XQ+5t4R8iLZW2PSAgAAz0oA=
Date: Tue, 30 Jun 2026 12:43:50 +0000
Message-ID:
 <KL1PR06MB6236F541873C25ABBE178CA582F72@KL1PR06MB6236.apcprd06.prod.outlook.com>
References: <20260629091500.52540-1-joakim.zhang@cixtech.com>
	 <20260629091500.52540-4-joakim.zhang@cixtech.com>
 <90ecf77e16c17f0ac46b2996be58110fc01c2e08.camel@pengutronix.de>
In-Reply-To: <90ecf77e16c17f0ac46b2996be58110fc01c2e08.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6236:EE_|SEYPR06MB5134:EE_
x-ms-office365-filtering-correlation-id: 594f8450-c8b7-48de-2da7-08ded6a53c50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 mZNcUd6GHMGiZAd2lAMroPbYOIkxZgvq5yiBa4BzsJcfGD+ADizKxjxJCoQGTnzZyz4iNcN9ijM2UKuZUiWIsfwgtND+9zpV1nq6ccY6LVmiCc8x/8knt0TtxE7tLhWljJw2TK3pKVWgDZEom0FnHqr+oPy1BB5m8D9idlasSNZCyxpysl5tKRdr1d0pgGopiemebQjqdAYYKFbsmUVfq8ko1imRZXnzZKrUNuT2pgSisjW0oIkn5PYkWYLG5B7eg0HXevOoE7t0gRmhWQk1Hn7Jca9awaH6XGRRN+GtNQMYkEKkd33yOmEfSIor8fKCt84hIteQwuUHaohsguEBZgKElvS1Z0mWlnnl6NWC6nGYtx8GUnbQPyO4OcjqoJ6XBsI5VEbL6aJowgbHMpxcfWECjSAjXFztSXv0lmcTBokkTptZ3vTWQYWS3lDJmCUulZ0Xz+Y8LyVz6vsxV9R/I9piu1x5wt8X1zA3OFWfCXe1HgZ4KgXiyaD00294wKOX/YN0UBq5BFaDsbDVcJRVLQNTiSa5UOmYAnz+qbYP6kVml3c5cgq3xhlM7ZN6SbVxaZS97YnztBnrlzRLOlNh0lXSbMrxNzk4yO2t0nGY7Q0fIBVKsXb6K9wx54hBfnH3vgadlS3Yt6LxNBuFvj9pZvt5z53tO/aOostPgQj9APOg9zxgwiCEYG0kBbZIrs6+j8sDEqKqRrJwj9aAEhj8WA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6236.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHhEeDRGakEvOGhPcVVJbUIvS1FyK3FPS0FBd3R6NW5iN2tPbEsvK2UyT0J6?=
 =?utf-8?B?bElVNkRKdDFXc2dNMUlyZERoL1RUWVYyc2NXSTBsSXNyWmJWUmZhVG50V3po?=
 =?utf-8?B?MklBRXZ3OW8ySjJ0VHFaQVZKeVoweS9sM1Blb1l0bkJ1T3k5a0svYVFSMms2?=
 =?utf-8?B?cHFtQWxoRzkxK1YzZGtzODNUSWdkNE9vdXdzT25QSU5LUEVaYW5vOTlpem1v?=
 =?utf-8?B?N0tiYUhuclhQaUVYNmRPYm4wRTFXUWVkZlVLQ1Y0RTNhakpndWY3dTBDbmts?=
 =?utf-8?B?NDllSU5LTzdzR1RzRjFEZlNnSmNRK29JNE00QTdNbzJnRWJhQktJRW04bXkz?=
 =?utf-8?B?WGN6OGozZm0rVVJlN1VzbnZYa0I0ajBXMmVGdkZrQzFWMTM4S1NPT1g1aEhO?=
 =?utf-8?B?bDU2UFpIaWF1NENvT0tyVllSclR3OHVJczBvWXpXZzQ3cHpGN2x3VDQ0T2Qz?=
 =?utf-8?B?NktrWHFQVDJXTEI5amdibnFaZEpsR1hhSGxDUm1ORlNtZ3AxcmM5NWsrQXBZ?=
 =?utf-8?B?QStndm4xRGE2V2l6MEFPK01PQmFKNzZMM0dSTmduTnVVaWZ5elgva2FSTEJp?=
 =?utf-8?B?Rm9PSTJvbXNlMVFoWitXRlZ0bzEwbitBeEdHR2N6bU9yYndCOWZvbjVqQVdp?=
 =?utf-8?B?VS9tZGVrejJiUkZzZEV0S2xOWDJ5NGFkMU02OGJhL25DNWdOWTNteFUxQkls?=
 =?utf-8?B?VXF5ejN0QVVGMUNERSs4L28xaWZVZ2k5MzErejBBU1VMNzdMbmdXUGo1YWs0?=
 =?utf-8?B?VWNUaXZpQ0lML0EzaEpib2xxcGJyMUdHaXZIenF0cFdmMzBFRkZsd015WmZH?=
 =?utf-8?B?cEJvMWhsOXJEM0w0UjFCQTZIb3M2N1VzUEdDRHkwaTJQVjN4Zzg2MGRuWVlR?=
 =?utf-8?B?N2thYW5wVVltQnJwd1I1ZmN5OEN5eVRXUE1uM3c5d3dIVnJQTU5ROUF1dnY1?=
 =?utf-8?B?b1FpR1FCY3F6QjVNc3I3eGtCa3V6dFhjTDZWTVBiWStvWmNCNDVlUzByNUxX?=
 =?utf-8?B?bEUxZTFHaGdMYy9PMDZvU0ZqTnFPMjF1MjRlQ3hKN0xMd3hVbUlUdDhLbmJ5?=
 =?utf-8?B?Z05hb25SYlZ4UGQ2SWE0aHJ1N3gvMG9NY0pqa0hBcTlRRlFQMlpiUm9QR2lX?=
 =?utf-8?B?L1pmNnpRM01rUlRKRS9Ua0lCQkhXYllmZk50SkpDMTV3Z0oyQTIxK3Q3b0o5?=
 =?utf-8?B?Tk1teHg0MDZxYjBTOWlIVDBmUHA0WnZZVzJVSlBZTTZPdzNZT1ZoUU92anlj?=
 =?utf-8?B?M1dJUE5nUW83bGFwRFFTR1FsWURUVUlMSWtrQ1QvSTNlTWpEZ0VwdXJsaUlY?=
 =?utf-8?B?VnpmRHJYUkw1TUNlRzhFUDgweW9FQXBJRWQzY0lzOVlsWkVVY1VndTN0ME1Z?=
 =?utf-8?B?cXNub3RpNHI5Vk84Q0dxRURadHVDaGRCTzR1ZDd0VTY1M0JBbjl5Y0hjeUFY?=
 =?utf-8?B?UHk4QnpHN2dBd3VFbVhmcHFZNG9uS1lqZjdCVjRXRGlObGJOUVhoS09pQWhn?=
 =?utf-8?B?VXFDcDA5aS9Pd3Y3eDJVYmI4V1B4bGU2WlNUSFBWUUpvYWJtU0VmdlUweFN5?=
 =?utf-8?B?dDdCWjF3aTN0Q3JMLzlmUXlTYmoyUngrc3lwVzg5MmV2L1pMb2RueVBLVGdk?=
 =?utf-8?B?VCtuQUhNQlpSV0FlMzZxSHF0QlJ3MnBkVEc4MU5GZitITnN0ZXhweWZjNFUv?=
 =?utf-8?B?VC9HSmRrdjQ1ZlZ3elZyM0tzcXhLQW0wallTeE9CMWtrSlFMU3NzdlJlY05p?=
 =?utf-8?B?SE1DMDU0MTcxcExBOTlHbnNWWE82SUVuVGhIMlNjRURuQXdKSUpwY3dYWVVp?=
 =?utf-8?B?RThXRnpCNkNub2pudHBkQU42Lzh5cG5WOXR0Nm13eEQ4NWdoaFJtQ2JNN25t?=
 =?utf-8?B?TjJsbzFzMURITFV0dXY5dGlrSWdycktVMk9DYWhaQnVNWjdmQ2FON0swVXpX?=
 =?utf-8?B?VEtKWmJCWEx3dGpMMjVqbGR6UWNDTDh4aG8vM3NhSUVvWno2NjlLQ3ZxcEIx?=
 =?utf-8?B?dnZVcmZZZTdvai91ejR0OGZRcEtQaklqZFlzeGRzdWNHczV2S2pkZU9rbmFG?=
 =?utf-8?B?NmN3NzM4REZXTE9hZUh4dURjbTZDNDZVZzh1VXZ6aDJxMERLRTFNSUNReWE4?=
 =?utf-8?B?QzBTcEY5V2c1L2Y5RkFxM3JEZVY3STIxL28zTHd1MEp4enR6MExqMjRhcEtW?=
 =?utf-8?B?YzBwT0xTcWNNU3RJN2dmMlhja2xwbWxFZ1QvemtCVG8xdFNKQTBFd3hEMVJZ?=
 =?utf-8?B?ZzZ4Q2llWVd5d2tOc1RxSGVCS1BmR0VqcXZIUjgrdERib0VwOFVMU3BYUUpX?=
 =?utf-8?B?UmtncXpzVEdEWVdYcXI0b1J2ZldnaXRRUytzYlFETVdYWkZRa3UvQT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6236.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594f8450-c8b7-48de-2da7-08ded6a53c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 12:43:50.2401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+Z+3vGp7iwfWnMQ7g3x3htU6BD9fnwrPe/niARepxvXy0VVq8ocvlvdQYs5DXSatKV7bz4vNJZkjjIvtVzaobG56GNqIU391jM5S502Nz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5134

SGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDMwLCAyMDI2
IDU6MzggUE0NCj4gVG86IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPjsg
bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+IHNib3lkQGtlcm5lbC5vcmc7IGJtYXNuZXlAcmVk
aGF0LmNvbTsgcm9iaEBrZXJuZWwub3JnOw0KPiBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0
QGtlcm5lbC5vcmcNCj4gQ2M6IGNpeC1rZXJuZWwtdXBzdHJlYW0gPGNpeC1rZXJuZWwtdXBzdHJl
YW1AY2l4dGVjaC5jb20+OyBsaW51eC0NCj4gY2xrQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3
IDMvNF0gcmVzZXQ6IGNpeDogYWRkIHNreTEgYXVkc3MgYXV4aWxpYXJ5IHJlc2V0IGRyaXZlcg0K
PiANCj4gRVhURVJOQUwgRU1BSUwNCj4gDQo+IENBVVRJT046IFN1c3BpY2lvdXMgRW1haWwgZnJv
bSB1bnVzdWFsIGRvbWFpbi4NCj4gDQo+IE9uIE1vLCAyMDI2LTA2LTI5IGF0IDE3OjE0ICswODAw
LCBqb2FraW0uemhhbmdAY2l4dGVjaC5jb20gd3JvdGU6DQo+ID4gRnJvbTogSm9ha2ltIFpoYW5n
IDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4NCj4gPiBBZGQgYW4gYXV4aWxpYXJ5IHJl
c2V0IGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0aGUgQVVEU1MgQ1JVLiBTaXh0ZWVuDQo+ID4gc29m
dHdhcmUgcmVzZXQgbGluZXMgZm9yIGF1ZGlvIHN1YnN5c3RlbSBwZXJpcGhlcmFscyBhcmUgY29u
dHJvbGxlZA0KPiA+IHRocm91Z2ggb25lIHJlZ2lzdGVyIGluIHRoZSBDUlUgcmVnaXN0ZXIgbWFw
Lg0KPiA+DQo+ID4gVGhlIGRyaXZlciBpcyBjcmVhdGVkIGJ5IHRoZSBBVURTUyBjbG9jayBwbGF0
Zm9ybSBkcml2ZXIgYW5kIHJlZ2lzdGVycw0KPiA+IHRoZSByZXNldCBjb250cm9sbGVyIG9uIHRo
ZSBDUlUgZGV2aWNlIG5vZGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2FraW0gWmhhbmcg
PGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9yZXNldC9L
Y29uZmlnICAgICAgICAgICAgfCAgMTQgKysrKw0KPiA+ICBkcml2ZXJzL3Jlc2V0L01ha2VmaWxl
ICAgICAgICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvcmVzZXQvcmVzZXQtc2t5MS1hdWRzcy5j
IHwgMTM3DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDE1MiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3Jlc2V0L3Jlc2V0LXNreTEtYXVkc3MuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcmVzZXQvS2NvbmZpZyBiL2RyaXZlcnMvcmVzZXQvS2NvbmZpZyBpbmRleA0KPiA+IGQwMDll
YjA4NDlhMy4uZjc0ODU5YjI5MmFlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcmVzZXQvS2Nv
bmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvcmVzZXQvS2NvbmZpZw0KPiA+IEBAIC0zMDAsNiArMzAw
LDIwIEBAIGNvbmZpZyBSRVNFVF9TS1kxDQo+ID4gICAgICAgaGVscA0KPiA+ICAgICAgICAgVGhp
cyBlbmFibGVzIHRoZSByZXNldCBjb250cm9sbGVyIGZvciBDaXggU2t5MS4NCj4gPg0KPiA+ICtj
b25maWcgUkVTRVRfU0tZMV9BVURTUw0KPiA+ICsgICAgIHRyaXN0YXRlICJDaXggU2t5MSBBdWRp
byBTdWJzeXN0ZW0gcmVzZXQgY29udHJvbGxlciINCj4gPiArICAgICBkZXBlbmRzIG9uIEFSQ0hf
Q0lYIHx8IENPTVBJTEVfVEVTVA0KPiA+ICsgICAgIHNlbGVjdCBBVVhJTElBUllfQlVTDQo+ID4g
KyAgICAgc2VsZWN0IFJFR01BUF9NTUlPDQo+IA0KPiBUaGlzIGRyaXZlciBkb2Vzbid0IG5lZWQg
UkVHTUFQX01NSU8gaXRzZWxmLCBpdCBqdXN0IGluaGVyaXRzIGl0cyBwYXJlbnQncw0KPiByZWdt
YXAuDQpEcm9wcGVkLg0KDQpUaGFua3MsDQpKb2FraW0NCg==
