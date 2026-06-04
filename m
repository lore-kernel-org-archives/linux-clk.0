Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022082.outbound.protection.outlook.com [52.101.126.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E384402B96;
	Thu,  4 Jun 2026 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574171; cv=fail; b=iIZv/KSnPvk/dx6qLI/jBIo6T85/CZxxgHEeC6AyK2RoMmGHbv0CiUu1JA2zqOLZnysyQbDnebwkJMgSoLknET2vR1pVp6YNh+bTuCeqlA61TWJJxrcyh92yXC0Fl/VHyCpankmdbqleD1yxdr5GNB7KXTCpLm10klDGNiHLYDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574171; c=relaxed/simple;
	bh=aa6+exR8VVdMAKNFkoCJE3bfvinMC49HsMTE17oFyXg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cAhMyUqNY/llPyTACJipGhFBy6ayP6T1Gz5LVMfLdo5S++iBQ6U5BR7WAzeA69yFHnsjdsfzFaTygrXP0U2TFV7LGpq+JeO4cdOrpD0cG3AaRyOgugSscTeD6YeogVT+wqRfxEnxmWBe3mGRCvLxgekYt0x0WIArfSdksFrGoY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUj1E3HT8vMHvzPlQunwIBbt2eaGupyT4ExP8nWVkOpYIzzJiwlJxqZpLBdPUxV3MEegfE9iDuAERwQKd53eV4DATQwbWMHghDNIjEDw7V3bi+wOsm3xKQkPYtyZOM7OH4BAop/ocVTDCHxJTHL6F0cah2BBnvBeWEPtk/+g0bhnepAm/iW2R/tmKcOzbmDd/Hj3cXLA9Auzmbxdb1DBSq1AMjZJIrniNhja4ELxvUv0bp8qZ3fqB52iRw7KqgycmWaR/hSnbeZsNMWSVBfvVKPKIG/rTJe/S+RqEcq8umHc0+c56wgR8GBWvJ4oqTovpwcA5Pae61rwida5cgySow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa6+exR8VVdMAKNFkoCJE3bfvinMC49HsMTE17oFyXg=;
 b=Yaq3S64h5NtOuPR9KoM+s/JBCMuvfBSxmPPNZvbZHVNyN5ilw+p1A6aLzwUVh4ERku+Rz+0VOPhdiDIGnSk1/Sf4RPi+i4rdiJoP0KBS2krb6q98V94zFoqtI99XJBG4k/aWhy9Zi1j4wdgZa3zwTtudQvImjTKDWoVwnyLhK+a4obpCFbri2mLngGJgWXj1IzTkjv7msf5jiJfWdHkllGzpbkVbZS/Z62Om0x4z/A9p3jOAKYViiLXgoyVjc/Q7Zci8Q7jxx+9h0o+MakTWzTz2hLejnKqKenkOCpcwSR7HGWUi9bx4RaMa+PYFy2AJEP37zDUNqSquxpVUydmhhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 by PUZPR06MB5674.apcprd06.prod.outlook.com (2603:1096:301:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 11:56:06 +0000
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7]) by KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 11:56:06 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH v1 5/7] reset: cix: add sky1 audss reset controller
Thread-Topic: [PATCH v1 5/7] reset: cix: add sky1 audss reset controller
Thread-Index: AQHc79phPD9C9UERX0a5ny47WoKmorYq9PwAgANdN3A=
Date: Thu, 4 Jun 2026 11:56:06 +0000
Message-ID:
 <KL1PR06MB623670256AA0B4EF9D61842482102@KL1PR06MB6236.apcprd06.prod.outlook.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
	 <20260530021642.64059-6-joakim.zhang@cixtech.com>
 <1a1513afb45636a0d42e5521585f35ebec05bd3b.camel@pengutronix.de>
In-Reply-To: <1a1513afb45636a0d42e5521585f35ebec05bd3b.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6236:EE_|PUZPR06MB5674:EE_
x-ms-office365-filtering-correlation-id: 8d6f1002-a2b8-4a3a-3391-08dec23042a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|56012099006|4143699003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 CBdmp0ZNTC+R07XNLtCnxIyUGuejl1CAdWxce+S3o9qaxsrkQllyNh1zCnKh8x7oljdpBotgXOet7O6gRewWT1j8+pFN3d4gByjpnXH7WYvErGYj20iu3qQY7PmQGeSwj6GM0Oo50lee0lVoME7LvwHYaWkQ8qB8W2BaIUjujUOJXrnvngbC4IR9fZ11jpdy/5trJ767Zpq0+tidx/p1omAVgjc64xsXfb+cZ6dFv+hReRSkNuBGQ9CefWNiiuO8AdO52JGJ0KAcHuEo5lDLhv11wKQhOJWUMMrtHf9Noi9ncjjswT+Yk4ZDUbTdO4RhMgTeCMko+ATHksUDXJb9azMdGDsDQu6ZThIp3tmaJPKU6J0QR/EyWXzGgFmFTqPxIpOEihWixIh9roapK6jkj2+E8J0zbOh5J9h/qni7hWzj/pRe4blmcEVDPS2AXbC7b/7yHx0HYm0rS+sNSamqKIXf+JN3W6kTvIionHLt17J2OQE8ScpbU9UUMrJnsTzUh1ubRday718YAoaep6S+iZJJxBsb47/uuKyM0UPR+T4DX35BIy2lYke4H6WIcbHQdGyEfg+SB9H7M5Y89PKgKzwZgvii3QA9mlOmjyHBO+VJfp79fmuHW71LkPxqdS57Sl2hShvJk9bkyJn1aojbbEIAlZaC8svUudljKeNBjbEp6Maxu0PBjbuSWa2YG9D8SdoDVpw+KUgbbdt5x2caE8/8UGCQQg0wdpBu6O9VS7NR0g2RrqH+cRVb3jKQd9y6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6236.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnRBejl2WTBCKzc3MlRpdmNENmwwY3pkQWcyeW5Da3VCZXBvbCtrZkNiaTZQ?=
 =?utf-8?B?dFd4MW9ZK1I0eGhqbFdZT0lwbXdLRHNEL3JETHJuTEJ1TkN0NGFtaE41U2R6?=
 =?utf-8?B?SWRMdnFDQmpCaHIxcXFQS0dwY1dWVDJHVEZLNWZpQStBWnY1ckRYbkRiU09H?=
 =?utf-8?B?R3g0TVpiNnNXckRzZEtiVk02czZOdkdIVEpueC93c2ZZeHlkUzQzeFJHOWlk?=
 =?utf-8?B?M0R3WGlsZGp0ejFSTFZrY0lBUHV2cVpTYnZGemxSOGhSeDI1MFIvdWtWbjJq?=
 =?utf-8?B?TjBBZldMTXVqZEdsTEluNGJld0FkRGNvWll1YjVIY3ZsdVduMUdHL016M3Bw?=
 =?utf-8?B?NW9TUHNBUzdBbWc2N1JPczE2V0JRUTdFY3p4U29uQ2VDcFFQeTEvZEZFKzdo?=
 =?utf-8?B?M0dJclU1RU4yYjBEc3RPbkoxbkpmdUh5eUN5MXZhSlQxNm5aeHUreXVSMFlG?=
 =?utf-8?B?ZE9kYUw0TWkyNE5SOCtjalh6Q1FiU3NrUFlpUjRYK2hLZWNXa0dCYWhnT2gy?=
 =?utf-8?B?ZGhSTUZGaFJidG1mVnNkS0lYcGdxR3o2TnlBY0hVYzBaQ0xYajBYcFBLcjNq?=
 =?utf-8?B?TkRlZmtRcWhhMFMra2JUSTl2VS9xczNzb3FwL1V5THhaVFB6akRsdkRLNmNC?=
 =?utf-8?B?L1puQ0dKbU1nUWNjS2RLMWwrRHJrSUlFN1h0NjUydU80QVZTTXhrWmRHalI1?=
 =?utf-8?B?L2l1bU83NzJ5SW9jaWZUcWxzaytDNVlmanNyNEdYajd1dkhIYmY0L3ZHTkhv?=
 =?utf-8?B?LzB0S3djWUNBeFl6Y1FFZ3BJSk14MHBsYTJQVWFWMUZja1Q4QUZCeWxRRGhy?=
 =?utf-8?B?VVlyR29FZ2hiNDBYTHAvaXFvSnRiOStBZHV2VWdnM0Q3UEpjaWxpUW0welps?=
 =?utf-8?B?N2xENi90ZlF6NmRWODF1bWw4N21LNWVzZG4vdkVhYWFhbkJqS0hjeHhicGdT?=
 =?utf-8?B?bEhCdVM3MmYxZVp4M05yNnNIOElTT09ZMW4vMHc2aHMzaVlPZ3p6TjZmai9Y?=
 =?utf-8?B?S1dvUGo5L09kM1IwWVEzOUdTSTFuRTBzZy9DeUJDc1paSC9RUlMzQU5vWktS?=
 =?utf-8?B?ZUpFb1dZOWtvc21rS3NjbzByWG1Oek1mSVRzME9FbDErU1dBV3hkZVNZYVNx?=
 =?utf-8?B?NnhiazE0RWRBbThUS0RORDd5YWN5YUhzaER6aXp3YzQ5T3V1aVptVjhxekFx?=
 =?utf-8?B?WElCTlBuK2QyNGdWT3lpQTdKbTVqWDBOK0xpaENnR1VpWHY4cjUxeTFwRXoz?=
 =?utf-8?B?UEp5aTR0cnhsUWJodGRuU0VoMU41VmNhejJjUmthWCs0Rm1VVExsSUQ5dERR?=
 =?utf-8?B?aTF2bUlwNVV4VmR1MzNRYm4rRTQrRU93WVpXa3VJcmszUWo3YmhsaERLTDky?=
 =?utf-8?B?OW5iRjk2WW5aMjQvN0JBNkdtNGpMRlJucm4vZmhzbk5laHlWTnA3TTBmYjA0?=
 =?utf-8?B?QUxEWlBIM3d0Qndkc0hITFhLYm53bnBJeWhKeGVWSG9wMlhPQk10eTVkZzY2?=
 =?utf-8?B?SDRRNzZ2bktlZWp4NkZTNEVXSEMxVFcyV1o5YURHNGhxQ2VRZnpkRE9tb2pW?=
 =?utf-8?B?OXJNTVpaVjBOZHVJMG91V09HVEo2NDh0RGhZdVlIMGR6azhlRHg5LzJyS3RY?=
 =?utf-8?B?RVU2bTFVME4ybEVoVjZ5T3J2dTRQdEptakN4QUNqQjZad3J5N0VKUnhFWkxD?=
 =?utf-8?B?Z0wwT3lIM0NKUjVIZUhUSUlPcU1vZmE2T2l3ZlNJSzN5VFhxcGwvS3hoYjVC?=
 =?utf-8?B?SEZZU2NKczAxakpVNlVQSDhsemVFb01mUVBHRE5PNFpBbmkxK0hwSWt0SGcz?=
 =?utf-8?B?K3l5S2FvT0RjTGtndjFTeExOc3hGdlBKbTFaemIrWkNFYk9WQWRRM0FyUktE?=
 =?utf-8?B?K1pSOGlaTjkrdG1qV3ZDVlF0RG8vN2x1Um1rZEtoeUdIRDBtYjdNVkFiZSt5?=
 =?utf-8?B?RjU2S250QkpNUzFPamY1ODBRem1UN0hQcThURDBsWGRFUEFBcUZNeFk0a2hS?=
 =?utf-8?B?SERubTdZWXZzbTVOaXd2YU9vMUxtNUFaL251bjhrOTlTdm1TaVVGeXphckFN?=
 =?utf-8?B?WG96OHZGcnJFc3B5c3RJcVBhVEtzc0FVNWxDOWhPQk9CUUlyc3JIMkV1aUFO?=
 =?utf-8?B?NzNZZjRWdVFld1c2YnhuUUh5T2g5aEFyV09aK2xWTXY0cXhvN0s1R1hFSmtX?=
 =?utf-8?B?U0txekJPMXA5WGhKWUd6cUoxWkR5RGVkTFVQbFZRVTdqZjRwMU92VTl2WXBt?=
 =?utf-8?B?RThnM3UwcjEyMEh4VDFpM1NYWU5CQ2RqUmtjUmpQUmdCb1o2TzA5RGxLYlgr?=
 =?utf-8?B?bzlla1Z0b2hkUVlid3NFTytVbTQxYzFSUFZ0bUhkYU43aDhnZUl5dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6f1002-a2b8-4a3a-3391-08dec23042a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 11:56:06.5480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GcWuBIBW61mdO+UQZsWfpk4yQDmbU/TgW60AN3euIvsQ5OrquLoVkdhFG34/VtavKKMiCp9OWoM4oMvzBI3LPDLezIt8UXs+/NlDHRicmkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5674

DQoNCkhpIFBoaWxpcHAsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiBUdWVzZGF5
LCBKdW5lIDIsIDIwMjYgNDozMiBQTQ0KPiBUbzogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdA
Y2l4dGVjaC5jb20+OyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsNCj4gc2JveWRAa2VybmVsLm9y
Zzsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5v
cmc7DQo+IGxnaXJkd29vZEBnbWFpbC5jb207IGJyb29uaWVAa2VybmVsLm9yZw0KPiBDYzogY2l4
LWtlcm5lbC11cHN0cmVhbSA8Y2l4LWtlcm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT47IGxpbnV4
LQ0KPiBjbGtAdmdlci5rZXJuZWwub3JnOyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MSA1LzddIHJlc2V0OiBjaXg6IGFkZCBza3kxIGF1ZHNzIHJl
c2V0IGNvbnRyb2xsZXINCj4gDQo+IEVYVEVSTkFMIEVNQUlMDQo+IA0KPiBDQVVUSU9OOiBTdXNw
aWNpb3VzIEVtYWlsIGZyb20gdW51c3VhbCBkb21haW4uDQo+IA0KPiBPbiBTYSwgMjAyNi0wNS0z
MCBhdCAxMDoxNiArMDgwMCwgam9ha2ltLnpoYW5nQGNpeHRlY2guY29tIHdyb3RlOg0KPiA+IEZy
b206IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiA+DQo+ID4gQWRk
IHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0aGUgQ2l4IFNreTEgYXVkaW8gc3Vic3lzdGVt
IChBVURTUykuDQo+ID4gVGhlIGRyaXZlciBjb250cm9scyBzb2Z0d2FyZSByZXNldCBiaXRzIGlu
IHRoZSBhdWRpbyBDUlUgcmVnaXN0ZXINCj4gPiBibG9jayB2aWEgdGhlIHBhcmVudCBzeXNjb24g
cmVnbWFwIGFuZCByZWdpc3RlcnMgYSByZXNldCBjb250cm9sbGVyDQo+ID4gZm9yIFNvQyBhdWRp
byBJUCBjb25zdW1lcnMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2FraW0gWmhhbmcgPGpv
YWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gDQo+IEFwYXJ0IGZyb20gdGhlIHJlZ2lzdGVyIHRh
YmxlcyBhbmQgdGhlIHdheSB0aGUgcmVnbWFwIGlzIG9idGFpbmVkLCB0aGlzIGxvb2tzDQo+IHZl
cnkgc2ltaWxhciB0byByZXNldC1za3kxLmMuIFdoeSBub3QgaW50ZWdyYXRlIEFVRFNTIHN1cHBv
cnQgaW50byB0aGUgcmVzZXQtDQo+IHNreTEgZHJpdmVyPw0KDQpZZXMsIHdpbGwgcmVmaW5lIHRo
ZSBhdWRzcyByZXNldCBkcml2ZXIgaW50byByZXNldC1za3kxLmMsIHRoYW5rcy4NCg0KSm9ha2lt
DQo=
