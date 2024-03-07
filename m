Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816414C7C
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 01:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709776389; cv=fail; b=cuzP1uTUdudHmIIZ4N2F9EBJoLQZj3eMvWkU0nqp1Yf/+U8Q8llvFnQYiUe9KX99zzd/7nvImrd9OAEeVeiZSSMdaRT21hu7iVxIs1Wf+b21kyo8BeLIKbYMNutgmSqYCuqk5EBaJYx0tUkTKYo/tQyjdtu7HYU1Hrb+iMvs2X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709776389; c=relaxed/simple;
	bh=RlvoR+UATFJ3TmQ0n7NOhGI3r/CvlKBUMUWowgU2ikM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AY03yDskY/1dYgdYcJMhWrT0iTo49Kq+6hmOk+YmCm15yAwtTEVMaSj6NDocikpQB+lAVp4RTB6fc0OticgNkdcAGp+bHXoldl6DAEuJMcMsCtk19upu7VcZPPl36vYkdflvMTQ7fRLpi7K0qjgd6FcLF3KogmnLTdP9ER2qH0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmTa35EkB/lrOnnmgwFIl06g4S1la57SZZ1tf04SwsXvu3AuJ3YkKWHbIL+RZkXIDhnGDsTS6e+Htj6+vrZ8kMGquhyeNch6SqHBcRJa9KlrOEoz0HNTffaNwWPLHVN8UqQ6eassXVeX04I68q1JULBkT4ZFb8TnjmsdiOJsAgaS/4lhFeDRXXMpMrd6n4+BgblU1YOV55VNzurx0E+2LnJCs5xowBRShLUuVrBmY1HkEn9q3Wp2T1WO99kVgak5nvKDHL+MFi/OlHWf1Sq3UbTEhdDLnIPTjCdS9uhhExzZ2uieDIVLmyYucucwUbtAvx5mmH48ct1Ea+apGqPhxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlvoR+UATFJ3TmQ0n7NOhGI3r/CvlKBUMUWowgU2ikM=;
 b=FR3wUy8+Kf8tLxwJ2e+xs2USB+yRRPknPMb+hC0SX4Bbf2PPmzzLrxGYbdupP78i1FalsqOCXMuyTu+LaEInFXl5QbOGYEaX6fTGIz7wtZrMD4YuGx4Wcg3LOMFmp20/yMsUby6IsPxbTpJyZxme4DH3tWq7lzktZPsvpyyZdZywbkB9VI0HLyQmqA5NcRhuoQwj/uRvSIHH1/0JCfMUE7wyZmI+U62UP/7014MUdKvca2SeD/pZntL07pgOyYZnVqaJpyLatrHTs4VnhgawGVJz6GNbkCudW9AHg/zJ/Gffb50Pxv2DdLKJ6cQzTIBHU1mu80EOg74zQwzAERoglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1226.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.53; Thu, 7 Mar
 2024 01:52:57 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45%4]) with mapi id 15.20.7316.051; Thu, 7 Mar 2024
 01:52:57 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: RE: [PATCH 3/3] clk: starfive: jh7110-vout: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 3/3] clk: starfive: jh7110-vout: Convert to platform
 remove callback returning void
Thread-Index: AQHab7KI3x9dR91itka3p+K3lRvhJbErhIiw
Date: Thu, 7 Mar 2024 01:52:57 +0000
Message-ID:
 <ZQ2PR01MB13070C9D89DFE7AF49346111E620A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <cover.1709721042.git.u.kleine-koenig@pengutronix.de>
 <90054b8b2e118bc04ec37e044d0ac518bb177cf4.1709721042.git.u.kleine-koenig@pengutronix.de>
In-Reply-To:
 <90054b8b2e118bc04ec37e044d0ac518bb177cf4.1709721042.git.u.kleine-koenig@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1226:EE_
x-ms-office365-filtering-correlation-id: edd7a6dc-3aba-4c10-8336-08dc3e494fe6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ry1rCbfNVrn7A6yYrYVN0atrJ7k1RCsTcB8LGoMBZUtPdrxTMBth+OlZKB3y/JaNxY2Mlr8cO2kICK1o0bQTwy192LyIVEfOdqvX7JfpKVY/jOwOKahVYivtPngRug3EKzDZzG8Yll1cuk0MHpxUxpKL+E5VmNtzO4axunf6c12STeaZtHmYxQai/7l0YCUYR0ZJ+Qy7SJmqMUTTlnqedOXMyt4eZ/P+v9nKdYcxmWLnwi+t5qYr9WzOMbS7/Oej5CgKEqS4qG9XWshG/n2uScwWN0w8FpvhCTJtJr+SrLbGh5P5PryxNPa/vOlDgswnyY5oIWeIKQHGCwL+T83HgStoWLF8A/rs/ntHKctqqYfhjE80+RS6keOni2hS/XMF71r2jFnfxtJs+bbxl2OwaVGq2ESloDPC3YQ3jbZlj2fujIqgAALr+4xmiydnyrsJKyMI40Ewpo2+cL3X5sNN9TMMpeCdL23Ef330oDJKAMUnjjU2YN7456/ssA5OwUQ16BJPPylAvBP0mpCLw08VwBvR6O6oJOLZlhmUz/2XsQbzliSKiRf7hvfWf9v0br+/lARP+GjqXKefr/exL3uB5oSHUwhgrIQsBGgxCkq9YBztj21o2qBgwngapEBetQn7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkgrbSt1cFFxRzdNdncrSWt0MUoxa21QSW5OWEw5dmhNZU05anl5ZS9wMmtq?=
 =?utf-8?B?a2JIcCt3d0NiR0o3RElSQmErQkZyaXhMYXZmYkRuZ2JqdVR2N0hGdm94aWsz?=
 =?utf-8?B?cG1YM0ozY2ExVlZiUWNTSE5zZXhLaTRSeUgrbks3TTJ4T1FwakFoeVVGM3E3?=
 =?utf-8?B?cS9tYnJHOVpxd0h1bWVVMkp0eG9yQStkcjhpREtQR0VhUmwvSUluVmF3cEUw?=
 =?utf-8?B?a20zeFFZa0JQZDhZM2FLNll4TEVXbzBSQUg1eVBCNEhZRWIxTDhjYmtEWko0?=
 =?utf-8?B?TmNWTUZMa1hoSW1sdGw5QjR0NHRQbUdlUDAwbUdoTzFkWlM5NzdES2RBRS8w?=
 =?utf-8?B?OU5GNVlBV2I3NGRid1k1RHFtK3dGbXFhRU5ZUFdlV0ZsbnNxVk15RVlpTU92?=
 =?utf-8?B?c3V4b3Y3bUVEUHRLT1YyWFBzQ3Z0QkpYRkwvdThJQVc2RlJ0T2FjUGtzUS9P?=
 =?utf-8?B?TCtaUC9nTXVJM1VOSHliRXdDYVlKblVMcWQvMTZuTkI3a2dBNm0yYUJBSmdu?=
 =?utf-8?B?R0FkUDI3VXVTdUdjMWg3MGN0b0dYSzZaWmFFZHZSdjZoSi96VzdHV2dhWUxV?=
 =?utf-8?B?WEZRVzNrRlA0ZlBwYXVuaDE0UnUzWnZuN3I2aXQ0djAxU1g1aHJ6R1dPeFZI?=
 =?utf-8?B?dHJZS2ZjUGk2bXNGeGJHdTNKdG9KOHUzK3RZNE1nb0ZETzNwdytOQ0J4Y0dr?=
 =?utf-8?B?WEdhTFA0UjZyYVZZOU1BMDhySXlkdjFQMDV1MnU0QlEzb09HOXR2RHFDSnUy?=
 =?utf-8?B?VnBvcXkwOEtpQmtZVzlMMys0Sy9GalBDWEhvK0JLTmFpa2xJWENxbWlnVVBJ?=
 =?utf-8?B?UWh2VkJzUDhLYklGL1dSa1dTVFBZNFFLd20rOTVraFdJL0VxREZwY2o4MDRH?=
 =?utf-8?B?Nmw1Y2JwaHdObVozaEtkdzI5cHlUUGIrelFiSVVtSGZoUFdvTlBEeXlNYmNE?=
 =?utf-8?B?TTdjODRCVEJOR0t3MTIyb3dwaWxxV2VpSStvNkozUFZzVzc5SGN3WmpCU09J?=
 =?utf-8?B?Yy83N3BCK2JOSkdqVWpkaWV6bkI2Y3FTSmtISmlyKy9yY05zRUNXUWZwTWNz?=
 =?utf-8?B?YWhkaFhVTTBoajYydVpSeCtUeHJqVUhjNjZmakhWVzQrWWhFYzR6SG83YmIz?=
 =?utf-8?B?TFVqTEJKdHdTaFIxR0JpWUdCS0pLb2xtMkhWd1lyY0pnb3YvM21mSzBoY3FF?=
 =?utf-8?B?YXdHZkdwbk9Ed2tEUHVhTHZUNk00QThBaEd0MVVyOFQzWFJybjV4SEZzSnZi?=
 =?utf-8?B?VWZyTlhySzlDM29VU2N2WmFpOTFtR0NweE90MCtWV29YcjQ5VGRGUy9nV3I4?=
 =?utf-8?B?TWtCVnFnNGJvSTRraE1BbWdLTW5BM3RZUlAwQTQ3dmpmalYvTFZqcjBPSnNP?=
 =?utf-8?B?ZGNKL3o1eEZsRndwV2NpNTdKMnRNNms3am96RHVvaHdaREJ1QUJMWHkyUmV6?=
 =?utf-8?B?SnA3UWRLYjRXb0NIUGUrRW96Q3VpaHMvZHRuNTVOREpnWmZRR3ROVTFyQ2Rs?=
 =?utf-8?B?ZWQzcmxSTnVVNnVWMUhKaDZuNGNSNTlIaE8wYk8vcjBjN0F6YUh4L2NjUVh0?=
 =?utf-8?B?dnFRUlgwT1BPTGJQblltVW82OHJyWHNIMm1xVUVGMTVVL3c1enViUk91SGhm?=
 =?utf-8?B?d09lWG90bzFUZjhxT3dJanpBbGpqT25rQkRHQzZwbm1pYXhkVDdDajFsUi9G?=
 =?utf-8?B?aEtZMFVHSElvK20rVkV0alc3WTV0elhYd2J6ZnVHUHFFRVlWMjh3LzEzVzZG?=
 =?utf-8?B?NmlYcXBNVGxrVTB0Q29ZallBNUh5VFBLVHRlZWJnM1hvN0hoMlNZZ09mY3ZC?=
 =?utf-8?B?ZTBJR2ZUU3lobzZlTW12UjEvMHl5R010N2taRDU4TFp1VERPdFlEUDd5RHR6?=
 =?utf-8?B?S1B4YzVDOU1wTWJyMkt0N3hmV01zR3F4ZThocFdpWjk0dWV2MGFpczZ1Wms0?=
 =?utf-8?B?RjN4dFIwUU9DV20wNHZuMnpjOFpnaVVHMkJ3M1haWFN0N2dIK1JaOWUvRDRE?=
 =?utf-8?B?OFlkeUxWOVgweUtvb3gxbU5aYS9FY2pxd09PV2ZwUytoN2w0c1ZQZURPY1ZZ?=
 =?utf-8?B?c1grOG1RZXhFRFBQNTVVdE5NNFpTQ1Fzd3pnVGs5RWY5blV4Q2tEbDRVM3VZ?=
 =?utf-8?Q?nSVmtyt4jD/tPD1X6IhNCGm+s?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: edd7a6dc-3aba-4c10-8336-08dc3e494fe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 01:52:57.3240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +HTj/6BSYKgXidnVUAJnLmRWVEQVe1wV59OFDUH4EyCoDZO5zMhH2Uz7Zdv1UqmNeF/NxuN8wZe9yULZ2f6aOAZ8mhqsM1iSfmBSiLDBJzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1226

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
