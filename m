Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2118.outbound.protection.partner.outlook.cn [139.219.17.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999961FBB
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709778289; cv=fail; b=M/sXR9PFrgWsXY3Yp4eueQ5ypPsnOgd2e1hNU7Wk7ncUrE3U0/gezmMsaebKxDUG5ePUp9/oRtp6BD4/dI9gBppBLanwnTyRF4v3ah242AXEHBIomvksEdOvBic0prYbFc/zfMrUgKvc6MXuSXFtCO/mmi57m2XcvVIQMo7ri1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709778289; c=relaxed/simple;
	bh=RlvoR+UATFJ3TmQ0n7NOhGI3r/CvlKBUMUWowgU2ikM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HS1vmhVlySOUtcCYkuiq0bhj0IgFn73UZQwUi0ZdLt3kn3MSOqFOaADkBOEPHjBgHIPesQKzIlExQHIOD8jbuHn28obF28CINCuANWdPRXtOwrzdVonEltjFS8B9DCdMJZss+xHMcFs6eOAtfPMypKN9ac7UM3lng/Ae2NB4XhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8NyFhlbHtOldEfjSl8FYy7H9QU54r3PvqGpCDUKey2OTp6xee10MXNwg/4pwRaNMUAghwQ3dRbq6OyLUdYxLaM9UKsJpP91W0L/KLbnnO3xLVRhiIZ1ArVuJwBnOrqx37oUIhEUlDppR760Ngg3iZ0y3pt/fdoRaulHN6lpKVvea6fl2IjUrDeyFuUJKNZQU4Q1vK8gYDaWjszYyMFIOGbfMOo24XR3jLst9ZmXEDdhcH2U/CS8q0kvQq3JlX+Kp/vmRm4uyS5V+eAxGMr+1bMU53tcqF5BNH+4a54Rg2dXVmwh4Lwlv/5Ql4NwWydQ9CU1wcz/p/b4FOFEIkDBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlvoR+UATFJ3TmQ0n7NOhGI3r/CvlKBUMUWowgU2ikM=;
 b=INoZaTm8LspVxB8LXwShR+ihrj5eG2+MqMNVrhvAG2oGxo71SdSFDk4Y8kNbyXA2mz3nN6qjDrj7B3oqnyIUE0qh6LnQezLSSMLSHySJb6IpTGLDgUi87NMRvVNiN2U4e5bXGNEFuXUzbBiiezK7DFdefwdyuPqSdArPDiifU4DG3HD2SX4V1pkobVw4pl6AmNh2YDtLrCF6vMEI+OIGb8FPyuOklh6j7EfEQOgcKkMSNxHOkDpHRk7rE+kIsREDrEwu5i+e6tDZd2jcKEwP12imo7UZKBDtB2aB0jk+FbQr4nlhZLyqEANHLoQLlAqo6g+eyEKZsdVPfoGjCrTjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1308.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.53; Thu, 7 Mar
 2024 01:50:23 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45%4]) with mapi id 15.20.7316.051; Thu, 7 Mar 2024
 01:50:23 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: RE: [PATCH 2/3] clk: starfive: jh7110-isp: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 2/3] clk: starfive: jh7110-isp: Convert to platform
 remove callback returning void
Thread-Index: AQHab7KIi49JlSXte0K1B876cClBLrErgmyg
Date: Thu, 7 Mar 2024 01:50:23 +0000
Message-ID:
 <ZQ2PR01MB130763E655905552A6D9E4CBE620A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <cover.1709721042.git.u.kleine-koenig@pengutronix.de>
 <312ec7052c4e327c0b365e167a8e86b406cb7dfa.1709721042.git.u.kleine-koenig@pengutronix.de>
In-Reply-To:
 <312ec7052c4e327c0b365e167a8e86b406cb7dfa.1709721042.git.u.kleine-koenig@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1308:EE_
x-ms-office365-filtering-correlation-id: dee5c95e-90dd-414a-9ebc-08dc3e48f412
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fTHZu1MTsE0bSSRnbUBcIP4Zb3oIyMYTIUsxzWp9Q6Xry4KSMKpg4HAhcVWmI7nAELowxotiYRO3PzAemsSbVMkzIEQLYLF5N7q8vcdiJ+lsDu4U+dagRshhvnlGyLrrGeA8Ab7Y1HA93omADFcm95JP5edar9aOkCx1qH/nYt6vFythAsyiXaUSKE7CtsAKtT9QCGSHjiJFiOkKOHBy56jD5jZJ9e7/RI63o1EzqgoKaOTgo4kiVnN+VtyIPyxUViWuSYaXMi4KJ46TEqF3UTiQYKQVXA11vWepqwfSmRG+4fbOb6+2Cnff7X+Kkk33Vi6c2cBRrDX2MBSN7rcZERAszVKZVwKM1YJ4aOSuLEx+74I/RScWbKGTN4le0tiMq3KSoRBslHJMQK89mamUobciOQ27K/tWmLN5HGQbkW1mlnzqUqD6X5MFLsbMVs/b5+MnNszoeSnI5TYaaZA+ye6ezCsAxsUlmQ+eBGMGe0W6iIjVSxm6vHxh59A59ZtD+9woqz2EnVAzhX6OdiquzZA3ldMjs/18Zmi0u6/AdA4GvfkYhWBMOJdKwxm6HUAVvyKOAHDpeBOqBTQ/mb9jqcVmN+BA4SCAdj1bBh9duM1b0oj+vYqG1y1wRCi8F/Nb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWdvUkx2ME9zMVE3L0FQSUJRVTVFK0hLemljVXMrMmVLYkZUd0M4eldBNWxE?=
 =?utf-8?B?TWlFSHBkNkIxK2R3MGl4ZGRpSlJTZGwzY1RIQ3hlNCtESXZ4amg0TUczWmhU?=
 =?utf-8?B?NXhIN0N2YmxoQURqNnYzbzBzRXhPRWxweWZUNTFBK0VyenBtZFc2SEJudzVz?=
 =?utf-8?B?di92NUZCZldoeGxwbWhwUk0vamxCMElvcW42V1hBTEhmQ0ZjSlQ1Y0FUTHRY?=
 =?utf-8?B?L2NEVFNGeTJ4ODMwa3lCajBVNTJpdE4wc3VPYS9SMTEwSGNnSUtpYUNwSEpl?=
 =?utf-8?B?MVN0VUlFN2R5YjJMVUVzbkh1Vmhnc1EzSHhTM0gyK1ZNblA2aHRYWFVkTW9M?=
 =?utf-8?B?TWY0aFV0SkZsdGpJYi8wS1BndndSQVM2Yjl6S25sSWxFSHJQZnR0R05DNUFS?=
 =?utf-8?B?aXNxTStQSFlaOW9Pd0x0eXAveVdTNW9YTndNWCtFbEcwczBKNDVNbkQwQVVp?=
 =?utf-8?B?TjEvR21YaktBV1V4SzRJWFNiTTk0aGliZTM1dlRHNDNtUVMzNGp0bVd0OWFq?=
 =?utf-8?B?ajREc1NkbTVvUU9NYmVQenNWVUE5U3ZBMFJtQ1kzKzRDK2t6aGp3dDFVNXM5?=
 =?utf-8?B?Y29QOTRPT2ZhVStDV2NlOVpiR0RQU095WFR2K1FMajQyZ2dPem11SGFuVFJE?=
 =?utf-8?B?NnFmNUhqVEdOTDhUbUl0UlA3UnJCamdaNTZ5MjI3QzhEQjdXWFJKak5MT3lW?=
 =?utf-8?B?RmsyV254bEFGOTYrN0NOMlV5MDZsMVF1SUxlWS8xaVBLaFRSTXdTYThZdkdi?=
 =?utf-8?B?dmZteWJwMHN6SkhramlUQlAwNFBpcjRUcUdCZ0ZaV001YnlBbkZjbkJib0ZI?=
 =?utf-8?B?RmpmbitpOGhwWGxrWkhjWVJ1SkhsOUlBYkJObzZYSnUybWF6RERoL3VOZGgv?=
 =?utf-8?B?Z3dsVVRWTG5hSUVNamExb3dJRG1xUktHTDdLUkM5ZlZXYXJNV2dYejM1eVpx?=
 =?utf-8?B?Qm1rckdjOFAyQlRMeE9talgyM0lKMlVNWmFvU1hhbWpVdk96YmpqQXhxMVZB?=
 =?utf-8?B?ZXpEWkVhUGhJdC9heDVQYUJkMy81VVZ3VnJpQjZ1UkpCdk1Zc0NjemNMMm9o?=
 =?utf-8?B?OHhER3hRc1d0aUhaTUdIREhRZThBWEVEYXJhYVVDZ05tbkVFNzVqRGV3SHd0?=
 =?utf-8?B?YzZxaHhMald5U2R0aFpncStsOEFWdURjcXZWcS9rcHI3SlhobEt3STYxRnps?=
 =?utf-8?B?amNtZGx6ck02dFN3blZEWE13VmpFSk5OQXJGaEZqdWN1eXZCOXQxY2tNV1Q4?=
 =?utf-8?B?UmRWMFRKVUdrUVlCS2hybzI2aTBiRjU5WVU1TEo2SUoycU9NN0MzR01pdkpx?=
 =?utf-8?B?SDN5aTJ2QXNQSnRXMEx5SkFvOFdkRHlJZytpU2hESnVLQVk4L29oQm1rK2VO?=
 =?utf-8?B?QTNBY2NVMFQ3VGJONGlOZ2ZOUFFVQUJJNm1vUHplVk52MmxDa1F2ZC9TdUt2?=
 =?utf-8?B?NVVGNzVxbURpS0RIZFk5ekFBdER0QlRaU3RoWE5XUjNpcUI4aStrSnFWRHZB?=
 =?utf-8?B?NUhHQVpqVnR4M2F4U2hKeWNDOGhWalVFczJ5Wm0zaGM0Qm52YndXTzdkZlJ2?=
 =?utf-8?B?VG9Ham5HWk8yczd5eU5DRjdDb3JhMVVSZGp0VTF4NzVkR3YzQU5OM0tYRjg4?=
 =?utf-8?B?bm5kVXRJcWU1Z3BOTXNaTmJoZ0JqOFdyVzBNMm96U1dSTHdYbzBZRVlGMkVG?=
 =?utf-8?B?UjZZTkcwSW81eTBneVBsc0c1M0NmYUNZcGNGbGdkUXo5UExyRGVxVGFmZFdW?=
 =?utf-8?B?VkhtUEZ0cWVZRDE0K3pCcTMxM0Z0SlhEdmhwTWo5aE01aGZwZ2FMOW1rZk02?=
 =?utf-8?B?R3pabVJtVG1hQUZHUWZqWDhzUkphMm1XblRVeExQNTBVSHFKNkc3T0I2OXBF?=
 =?utf-8?B?L2Vma0hTbElCcWZyNWx5RWdSR2FsenIrZDlJSnNzK1IySXBSamYzTFU1Mzdx?=
 =?utf-8?B?ZzR3VTIwTWQxQVNxNHBnS1N4cjZVK1hHajdOWUk1bWw3d0VDeTJuYTZvUmJ1?=
 =?utf-8?B?QitYK3pkOVNuemF5YTJGVE8va1hzUFgzNTRTczFNRmV0RHJzay8rVVJSZFgy?=
 =?utf-8?B?c1hQYVhnajBJVkhBd2RySWhNWGtLMndOdS9yVkNQaXZFNk9TbDlOaXc0OTNt?=
 =?utf-8?Q?pgU43lmlmKoW6EyvsErOdHNQd?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: dee5c95e-90dd-414a-9ebc-08dc3e48f412
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 01:50:23.2773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZ4zpV6l9IxOgOIDGiDGsSGGahzQnV2ySHyNcxNOwl6Z4cDv0XSCooqu0hGq27g150x5m/ufsa1C8IY1ebu5qmZDh/IuUWSC/DfAFa8D8ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1308

PiBPbiAwNi4wMy4yNCAxODozOSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IA0KPiBUaGUg
LnJlbW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3
aGljaCBtYWtlcyBtYW55DQo+IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9z
c2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkgcmV0dXJuaW5nIGFuDQo+IGVycm9yIGNvZGUu
IEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20gZW1pdHRp
bmcgYQ0KPiB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBs
ZWFrcy4NCj4gDQo+IFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhl
IHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlDQo+IGZpcnN0IHN0ZXAgb2YgdGhp
cyBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVfbmV3KCksIHdoaWNo
IGFscmVhZHkNCj4gcmV0dXJucyB2b2lkLiBFdmVudHVhbGx5IGFmdGVyIGFsbCBkcml2ZXJzIGFy
ZSBjb252ZXJ0ZWQsIC5yZW1vdmVfbmV3KCkgd2lsbCBiZQ0KPiByZW5hbWVkIHRvIC5yZW1vdmUo
KS4NCj4gDQo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJpdmVyIGZyb20gYWx3YXlzIHJldHVy
bmluZyB6ZXJvIGluIHRoZSByZW1vdmUgY2FsbGJhY2sgdG8NCj4gdGhlIHZvaWQgcmV0dXJuaW5n
IHZhcmlhbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpSZXZpZXdlZC1ieTogSGFsIEZlbmcgPGhhbC5m
ZW5nQHN0YXJmaXZldGVjaC5jb20+DQoNCg==
