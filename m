Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.106
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816076;
	b=TMUPK4OhGNDA8JJsb6JachC6foa9r6xhQ7clJbN8VAxVqMvfxxX5bLIViCFnAk5YI/qM
	 4xJdSFn1Nnbl8IkjpCROT1YtpzOvVsXhni7w1a05IP//2bTJlsJ6ZRd4Z48AtL/D05BiZ
	 RzUB94l0oc7t6JNGk1S7pb1olxZUHpm3Y94E0/DmvDbNciWSWGb1J0BHKOzRZDDJYlkmW
	 U4NzD+VoRrpq9h9p9Nc97jbQ6+/pJoSXC7rf2kMahTdl240nS07ogAJPnKqx0rFyCOyE1
	 C0iuZpHb1JvigSNyinCYaZJouCSqf5YFwCftJ0dXTA5MXycCiwnHWJGKnCIH9QmCtnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816076;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HApZlbt+hTMg8Hf4OamGduqmsiTL4yJNzRju2xDk02s=;
	b=QwYW39slM+M58eq3+zGj50Psbi4Rv55TrpOLDvxeknKZ+KOsuHeuLUe345KkzOvpQuW0
	 QGXMkHmrZ41MZPiHIM5pLHaqhBHjDdnTP8xbIK9gMOnGHYGAbBDwyub2XWInuV0cKGMSS
	 fFhGBspYk6It1RmtvYqkdx7DFYD9KLljGw36Fki3qKdwgk09MEXNsfJIz3H/LnysSL2NU
	 2lUoNkTOSvrHRCVwUmM6f/jv4ThKPKRbxkRRmFw83xh1tk7lPdeNMJq3ToNIo8Z5B1bsP
	 p4Rhy1ORwlcpSGfzFeWY4hsmuDDuulwgbiwES/lJLK9rDkrkhPtnGeJFyWncWLJMyTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.106
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2106.outbound.protection.partner.outlook.cn [139.219.146.106])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE84606A331;
	Mon, 16 Nov 2026 08:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE84606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCQVAPK/LEXqMWCd5zSCf4V2p+O5RrErl4dSuQ0+P1DYuNTedNTXB2/Dz8/S3pZWzCd4HwzvXoFTvFOsnIQ9tzAcOR8YSi/srRA9IZamDOV2W9IDS43Y5ColMIswVAlcOfH8I6T4dZ+rTz+Kw2OInf7Pvxc6lVv9h+48rEjivXzdWP0QQ+WdpnL/zkDBsbAAvpYV4cOlnlydKmZTEN7G+ji7UyY4V5u3Vgfd5hxAZj9LATyaKT/f7EAs7GdCOktEy8KjiaAjRyXxJY3qM58F5zWF5YZoVH3NCBXXQM9mC9BTAdU5VXiYXSc5JPxJonuJ/JRN/WV2ryeQH0Umeb5Jbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HApZlbt+hTMg8Hf4OamGduqmsiTL4yJNzRju2xDk02s=;
 b=mSO6M+Zj3UOLXO7hQu/UbW6atis4yAR/MRE6y5D1EepvtOvJoYnbrLSkADk8jRPFXurYM9WoFQSuxAHN04CPigCyM3F2FYo6lBlLshejzcBrZ/pIMBMgSZCrjdGQWCTEKUdh/DQylYaMcu+kUIunJi6mNd17n7dnS570zF8BYgVU/idoMryDQWagUFbQHzuaroxW0P9UWJxccMxLYKwsMudHxhGtHe83i9p8B8KzQ1lNrNRA5PVACj3PR93fWQeMt8tyFtV4jfl3nIW2DRqEIeU2EXZffobRtMZmaqlfdtoWQtzu9S34RT5N+Fwz9qcQ3XCNagWlkyJvMYCgD1vzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 08:01:03 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Mon, 16 Nov 2026 08:01:03 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
Thread-Topic: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
Thread-Index: AQHdWv1uA4scW39GXUGR8HsEG5hmTrcvYmMAgAEo4XA=
Date: Mon, 16 Nov 2026 08:01:03 +0000
Message-ID:
 <ZQ4PR01MB1202C1DD9DE098DB4674A940F27C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
 <179475230833.3873592.13070196353304136001.b4-review@b4>
In-Reply-To: <179475230833.3873592.13070196353304136001.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
x-ms-office365-filtering-correlation-id: c157d13c-002e-4cec-337f-08df43b7c2d4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|56012099006|10067099003|4143699003|261022075727099003|261026121527099003|261021121427099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 A3qN//guP7fxYC1gAl52ly0mBrF/ypL+VMVxYPEcfe0bYCYDvbGZP42WhaKx1tqRaw48T5Gyv8Lf/66TkfFtHV3SxUooPx+bpdx/5bexoqG4zh/zQHS09jhyvaWY5BqnEsgArDztPPG+Yq/wATlMkVQWFZx1L574JdQlvQ0C6LECCevMQhKz06H0vdFDJFdgzqxGfG/TUPSto8fqUlhUXOG7Vv1D9c0fbO8f4aY6DJVSp2OWrHImMW62lirvpjncFXfNNDW0IKAbB1Yr6pCe1NT/pS65t3WnXA6gC4yUKhsoudkhnFCtcpS07OteMYk1lRCK81kQt3DVIanOZ5ZXFPwoZrwHF3r4kQVsJw2ne7q7qVz1Mnhd/BH5K4TlMMSwkVqDj0WpgmE/RUcRe1cBdbPdgB2PQt3G5Avcq3mlCSo5F7hyvTBgbmL5S49db+/snHRfWBqLZcnbB1irT887VqlcnWoB5XY89cMEjq3VvT6mDqKzQtc5LuFzu+sLJ4cCQX5PvnMAAlSgb20vxbc9o3TGoO/Ou618/h/oLdTnum4d6vGEUjW4lnpG9muruGR+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(261022075727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckp2L0ZhM0RGbTRMYUxaMjU4a2luVGlwTncyYWNKUTJsQ25NL25UdFVOZm5Q?=
 =?utf-8?B?MHU1cldIdVBDbi8vUlBTSjFDS2l1cnlISWhUYklDd0hBVFdJY1VWY0RCZHk1?=
 =?utf-8?B?MXRhN01KbU9LZmpRV2ZoZTIwKzY1eUFyNm1hQXhJMGczb1VOM2MzU1NhN0JF?=
 =?utf-8?B?cGJzSGpGUURvQ2h2ZkZyR1lXcW5aV29jN0M5U1N6WkNWaGJzYnYxWExjNHk2?=
 =?utf-8?B?UWFjMHFPRTdYUVpQUTBnbHZvL0RUUWtsdDFFTVFINXVTYXlPRElJdzRMZkpx?=
 =?utf-8?B?cUVCWlJuTjVFTCtCbndTb3RlbHc3eGRBd2ZhdHBwNkwrazJoNkpJL3VkeTRp?=
 =?utf-8?B?L0h6NTFTZFQyZy9qOE1sZG9RQXhmaUVOK1JyYWp4dzFjNGpvZ0NmSUM4WkUw?=
 =?utf-8?B?Q1FXcnlkV29uWTFJNk1ZZXJQSnZvODRoRmtHUW5GR2hXRkFaL3JlNml5UkV5?=
 =?utf-8?B?T2RudDdnd2xzSUJzWGVQRmYrZTZxOUZuL2FUYU1wekloYlRLR3NrSjBVSzM4?=
 =?utf-8?B?NVE4TWNRd2U0YzRZREJlTXhuUTNySFIvQzQrNmk5bWtWZHk4OW11c0RKeHN1?=
 =?utf-8?B?Yld4RW1DM3RmSUFZYnUyZjdNeFRkZDZsZVZUVStwMkVmUkdpVnRGemRSVDBM?=
 =?utf-8?B?eklhSjFjWEYyMFhycHVMQ0tpMFVCNHRlZ3pVdTgvb1UxTVRRL1ZRbFcxeWJu?=
 =?utf-8?B?Y0grUUF0eHhHa0JqTWVpZDNjVTZyaDVscmo4UlB4SHV4L1JWeDZ3YlZNcUVK?=
 =?utf-8?B?TUN1d1lXRWR6UDZnZWU2cUlqTjkxRnFUZ3lZck5ZYW9aZ3F5dmd1a1NWdENS?=
 =?utf-8?B?RVEyQXBlVFZkemF5enlrNmtlK29OQlNpOUJKNU5USmZkMmhFZFpWdUZ0VmdG?=
 =?utf-8?B?TWtQRExrZHZ1UFJVd0NRMXR2czdCM2QrcXMzVWpISm5yQjc1c1RVdGdjTTI1?=
 =?utf-8?B?NVVzQm5XNGJEQms0VDJ3SHRmYU5tQTI4SDZiN1BMcXZYUzVXeWltYUwvbDQx?=
 =?utf-8?B?WHN3UWx6MU9qdFhxOUhmcVJUTlNRa1NDZ1NSRThjM2FHaDAyZStIU0VhVGRL?=
 =?utf-8?B?YktWVks3ZHJCcXNYdW5yd01CTnAwb25vZHNza2xQMmRtVE0xaUI4ZUp6L0RE?=
 =?utf-8?B?S1VYQTlmZmowS0JwQTdZQnpqZk9LZUNPKzVCKzhockhQRXMwZUVOZTJmK09Q?=
 =?utf-8?B?eHhDdkxmaGp2OGNyaHhwVjA1b29JY2VFUjZZZ2ZISmlRdFp5R1pBemVKM2hj?=
 =?utf-8?B?Q3NXTUFWdjVIVWdQWDRFWVZ0bW4vQXoxNDA1czAvcU5XZVloZnJMZCs2eFYw?=
 =?utf-8?B?bEtTQUl3YU9tM0xTWVcraUVhME5UdEVKWnduOG42TzVoSEdlK0NvYXgxZm1I?=
 =?utf-8?B?bEc1eWVRZ3AyeWVrTk5LOFhxKzlRZjB2ZjBGdUlBWkdPVnAzTTBoVnhERk14?=
 =?utf-8?B?ckdDTkZJSE5HY05qNXlYaHNuMHhEaUNhVkpXRllKRmVzMWx5WGZxZ3djbE5k?=
 =?utf-8?B?K2tFTmR1b2pYTFJ1YTBIZU85eTNydDFpMW1ma1Vxd0N4bG82MllGOVZiV3hJ?=
 =?utf-8?B?bm91QThMNjdrZmVrYWgzbXNONnN4d1RJRmx0Vzg0TGxYNnBJYUFYTjBaSVp1?=
 =?utf-8?B?RUhKeEdMNmtNMGxTdng3bHg1Z0R0WXhTRk1vL0pMSHgzSFJUSnk0RmtyWmhz?=
 =?utf-8?B?akZOazZ5TEU3eWtUeHBNUEJYR3FIWTNYLzZqWTVtOXU2OWFWZnozd3dyRWZZ?=
 =?utf-8?B?ajgzdDhUSWVyRjNQd3o5TlZPYWpaaDhwU2pLWlRMbTZZSTVMdE9BV1Z4WnFW?=
 =?utf-8?B?NE92WkxOUXY3TldSbThwV0h2ZW5qakFVWUtabjd3RUkwVmxVL21vMHR1aHVl?=
 =?utf-8?B?Qmd0YnhPd1dFV2R0TUZpaFNoUmJnSHNlL2p0WklycVdXbjFqem1qT3hMNkVM?=
 =?utf-8?B?K0htdjFLR3AwYVUrMHE1RzAxTytyclVUWC9iVW9NRmR3UVVwMzJLSnFzZkxT?=
 =?utf-8?B?MVd0a3BqYndBVWNWVExnRmVSQWJDRnVKUGphYmdtZHpqcVc4UmpiQkNMaGY3?=
 =?utf-8?B?anYwNndVcVJIR29IUk5YWlhLcjRmMW1TanY2MW9tTVYyT0hPMFE1QVYwZkRG?=
 =?utf-8?B?aEtQeFZ4THVidUlrblJIM0VvYUMyZGFQU09kVWY4akdxdTliUFcxTytwWnBx?=
 =?utf-8?B?T0VBaFpuME1pdDhQR0NUM0Ftd3RPYVFzWXk1YUJkZ3lTRjdkUTZNbkNsWmRO?=
 =?utf-8?B?S1VCNmtDMExJYVdMWVNxNGhsZUs4ckZmTTN4WTZISTBPZVhMYWZ4cER3L2tT?=
 =?utf-8?B?N0wvaXBoa0kvNFZ3TWpmaTBac2Q4SUVLVFBJdDh6WlU4NHFXRkx6bjg1dllD?=
 =?utf-8?Q?l8DdwjsMlYL/uszI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c157d13c-002e-4cec-337f-08df43b7c2d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:01:03.5665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9tvrF8VisWOhPO+igOpgyVy4TL9eD0p06wob0G551ng7zccTPC07HNsz4tCb2VZElFw9f3gyKg4riUPJ4u5RQbn6f7tga2Gr64OqVHXqABANx8LMZV0NNxniiYxR7ep
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

SGksIEplcm9tZQ0KDQo+ID4gamg3MTEwX3Jlc2V0X2NvbnRyb2xsZXJfcmVnaXN0ZXIoKSBpcyBv
bmx5IHRpZWQgdG8gdGhlIEpINzExMCBzeXN0ZW0NCj4gPiBjbG9jayBkcml2ZXIgYnkgaXRzIGxv
Y2F0aW9uLiBJdHMgbG9naWMgaXMgZ2VuZXJpYzogaGFuZCB0aGUgQ1JHDQo+ID4gcmVnaXN0ZXIg
YmFzZSB0byB0aGUgcmVzZXQgZHJpdmVyIHRocm91Z2ggYW4gYXV4aWxpYXJ5IGRldmljZS4NCj4g
Pg0KPiA+IE1vdmUgaXQgdG8gY2xrLXN0YXJmaXZlLWpoNzF4MC5jIGFzIGpoNzF4MF9yZXNldF9j
b250cm9sbGVyX3JlZ2lzdGVyKCkNCj4gPiBzbyB0aGF0IHRoZSBjbG9jayBkcml2ZXJzIG9mIG90
aGVyIFN0YXJGaXZlIFNvQ3MgY2FuIHJldXNlIGl0LCBhbmQNCj4gPiBtYWtlDQo+ID4gQ0xLX1NU
QVJGSVZFX0pINzFYMCBzZWxlY3QgQVVYSUxJQVJZX0JVUyBhY2NvcmRpbmdseS4NCj4gPg0KPiA+
IFdoaWxlIGF0IGl0LCByZXBsYWNlIHRoZSBvcGVuLWNvZGVkIGF1eGlsaWFyeSBkZXZpY2UgYWxs
b2NhdGlvbiwgaW5pdCwNCj4gPiBhZGQgYW5kIHJlbGVhc2UgaGFuZGxpbmcgd2l0aCBkZXZtX2F1
eGlsaWFyeV9kZXZpY2VfY3JlYXRlKCksIHdoaWNoDQo+ID4gYWxyZWFkeSBpbXBsZW1lbnRzIGFs
bCBvZiBpdC4gVGhlIHJlZ2lzdGVyIGJhc2UgaXMgbm93IHBhc3NlZCB0byB0aGUNCj4gPiByZXNl
dCBkcml2ZXIgYXMgcGxhdGZvcm0gZGF0YSBvZiB0aGUgYXV4aWxpYXJ5IGRldmljZSwgc28gc3Ry
dWN0DQo+ID4gamg3MXgwX3Jlc2V0X2FkZXYgYW5kIHRoZSBlbWJlZGRlZCBhdXhpbGlhcnkgZGV2
aWNlIGdvIGF3YXkuDQo+ID4NCj4gPiBUaGUgYXV4aWxpYXJ5IGRldmljZSBJRCBpcyBkcm9wcGVk
OiBldmVyeSBDUkcgYWxyZWFkeSB1c2VzIGEgZGlzdGluY3QNCj4gPiBhdXhpbGlhcnkgZGV2aWNl
IG5hbWUsIHNvIHRoZSBJRCBpcyBub3QgbmVlZGVkIHRvIGtlZXAgdGhlIGRldmljZQ0KPiA+IG5h
bWVzIHVuaXF1ZSwgYW5kIGl0IGlzIGFsd2F5cyAwIG5vdy4NCj4gPg0KPiA+IFNpbmNlIHRoZSBo
ZWxwZXIgbm93IGxpdmVzIGluIGNsay1zdGFyZml2ZS1qaDcxeDAuYywgdGhlIGF1eGlsaWFyeQ0K
PiA+IGRldmljZSBuYW1lcyBhcmUgcHJlZml4ZWQgd2l0aCAiY2xrX3N0YXJmaXZlX2poNzF4MCIg
aW5zdGVhZCBvZg0KPiA+ICJjbGtfc3RhcmZpdmVfamg3MTEwX3N5cyIuIFVwZGF0ZSB0aGUgYXV4
aWxpYXJ5X2RldmljZV9pZCB0YWJsZSBvZiB0aGUNCj4gPiBKSDcxMTAgcmVzZXQgZHJpdmVyIGlu
IHRoZSBzYW1lIHBhdGNoIHRvIGtlZXAgdGhlIHRyZWUgYmlzZWN0YWJsZS4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0
ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9jbGsvc3RhcmZpdmUvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiAgLi4uL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUt
amg3MTEwLWFvbi5jICAgIHwgIDIgKy0NCj4gPiAgLi4uL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZp
dmUtamg3MTEwLWlzcC5jICAgIHwgIDIgKy0NCj4gPiAgLi4uL2Nsay9zdGFyZml2ZS9jbGstc3Rh
cmZpdmUtamg3MTEwLXN0Zy5jICAgIHwgIDIgKy0NCj4gPiAgLi4uL2Nsay9zdGFyZml2ZS9jbGst
c3RhcmZpdmUtamg3MTEwLXN5cy5jICAgIHwgNTkgKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAu
Li4vY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaDcxMTAtdm91dC5jICAgfCAgMiArLQ0KPiA+
ICBkcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTEwLmggICAgfCAgNCAtLQ0K
PiA+ICBkcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MXgwLmMgICAgfCAyNCAr
KysrKysrKw0KPiA+ICBkcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MXgwLmgg
ICAgfCAgMiArDQo+ID4gIC4uLi9yZXNldC9zdGFyZml2ZS9yZXNldC1zdGFyZml2ZS1qaDcxMTAu
YyAgICB8IDE5ICsrKy0tLQ0KPiA+ICBpbmNsdWRlL3NvYy9zdGFyZml2ZS9yZXNldC1zdGFyZml2
ZS1qaDcxeDAuaCAgfCAxMCArKy0tDQo+ID4gIDExIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlv
bnMoKyksIDgzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L3N0YXJmaXZlL0tjb25maWcNCj4gPiBiL2RyaXZlcnMvY2xrL3N0YXJmaXZlL0tjb25maWcgaW5k
ZXggYmQyOTM1OGZmZWVjLi41MTcxNjY1NTU1NGYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9j
bGsvc3RhcmZpdmUvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3N0YXJmaXZlL0tjb25m
aWcNCj4gPiBAQCAtMiw2ICsyLDcgQEANCj4gPg0KPiA+ICBjb25maWcgQ0xLX1NUQVJGSVZFX0pI
NzFYMA0KPiA+ICAJYm9vbA0KPiA+ICsJc2VsZWN0IEFVWElMSUFSWV9CVVMNCj4gPg0KPiA+ICBj
b25maWcgQ0xLX1NUQVJGSVZFX0pINzEwMA0KPiA+ICAJYm9vbCAiU3RhckZpdmUgSkg3MTAwIGNs
b2NrIHN1cHBvcnQiDQo+ID4gQEAgLTMyLDcgKzMzLDYgQEAgY29uZmlnIENMS19TVEFSRklWRV9K
SDcxMTBfUExMICBjb25maWcNCj4gPiBDTEtfU1RBUkZJVkVfSkg3MTEwX1NZUw0KPiA+ICAJYm9v
bCAiU3RhckZpdmUgSkg3MTEwIHN5c3RlbSBjbG9jayBzdXBwb3J0Ig0KPiA+ICAJZGVwZW5kcyBv
biBBUkNIX1NUQVJGSVZFIHx8IENPTVBJTEVfVEVTVA0KPiA+IC0Jc2VsZWN0IEFVWElMSUFSWV9C
VVMNCj4gPiAgCXNlbGVjdCBDTEtfU1RBUkZJVkVfSkg3MVgwDQo+ID4gIAlzZWxlY3QgUkVTRVRf
U1RBUkZJVkVfSkg3MTEwIGlmIFJFU0VUX0NPTlRST0xMRVINCj4gDQo+IFlvdSd2ZSBzd2l0Y2hl
ZCB0byBpbXBseSBmb3IgdGhlIG5ldyBjb250cm9sbGVyIHlvdSBhcmUgaW50cm9kdWNpbmcgbGF0
ZXIgaW4NCj4gdGhpcyBzZXJpZXMuDQo+IFlvdSBzaG91bGQgcHJvYmFibHkgYmUgY29uc2lzdGVu
dCBhbmQgYWxpZ24gdGhpcyBvbmUgdG9vLiBOb3QgaW4gdGhpcyBjaGFuZ2UNCj4gdGhvdWdoLCBp
dCB3b3VsZCBiZSB1bnJlbGF0ZWQuDQoNCkknbSBub3QgZ29pbmcgdG8gcHV0IHRoaXMgc3VnZ2Vz
dGlvbiBpbnRvIHRoZSBjdXJyZW50IHNlcmllcyBmb3Igbm93LiBJIHBsYW4gdG8gc2VuZCBpdCAN
CmFzIGEgc2VwYXJhdGUgcGF0Y2ggbGF0ZXIuIERvIHlvdSB0aGluayB0aGF0J3Mgb2theT8NCg0K
PiANCj4gVGhpcyBjaGFuZ2Ugb3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUuIEl0IHJlcXVpcmVz
IFBoaWxpcHAncyBvcGluaW9uIGFzIGl0IGlzDQo+IHRvdWNoaW5nIHJlc2V0IHRvby4NCj4gDQo+
IC0tDQo+IEplcm9tZQ0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQoNCg==
