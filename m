Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD71343889;
	Wed, 23 Sep 2026 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158990; cv=fail; b=lj5xqvocipCvri9dKx/6wB430fdn5Z7z0t1r1BicT0Ww1pJ3UZ+PMWOIvjbesNLG3fErx2tmTZf20iVaX6SZqeuCA/SgCWYZOuld0R+1WuYWEIGy0SRMNnJtx1wif9fdFy8xoLgSnXCNdIF5fKtCzZXG+y7LM9xwGYjFQ75XohA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158990; c=relaxed/simple;
	bh=UDRM18WHlk49NhuI588IkLz6NPB2H6XTYQAnhHPWKC8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hNYTEII9vKm4l6Y2NiSFTbbBfnhWRfDELGYdBC6uKYezubrgnZeBgR/RBDL7LuSo9cTM1lJJYU7Wzci3ZMlni7SwCDmSPdKLmXQDD/h/Nwj5VrG1kCi4bPIwBs+g7VrdIoy46AFpQ9zKRPB+rZBK8LoBOq7t1ffr9RCbNOu7/0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OFXtdR+c; arc=fail smtp.client-ip=52.101.125.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OFXtdR+c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTFvj8PP2BWPinDTfGIeyyU8iH+53EV+abU8U0mJNj9cKc9DwS5ExRPv/LMNmaIiP72dQrTLTbtZb20FJ07yhrwY748HTNcWAx9evUtLvyjeRzIZ1XyFFgyZLsO48TzrVfm76hQKYwfOpVB1QVKXTLFKdW7PQYtKjyV6mj/isj1wYcSS2me7womeYUY3Aez+hVxkus2qp+ldCUDQtRDZRv3st8DrxlvOf0MdVjYNFDjHfwoxxTqgFt4Af9iAps9oOVHLUAGrUhgJnuat0GJlOmxneoXLwZJ0VLtS1BIyet4d+UZBinZZj7EnAzWRV3EbqpZkrTpgmRcOHP/o330mGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDRM18WHlk49NhuI588IkLz6NPB2H6XTYQAnhHPWKC8=;
 b=SwO31xpbAHkOby7/S2iMn23gjp5VXOoZo/7LON2xwZOWBugrULPZikLX28B/kCVwqIceErV27yhP8Odnx3MRmQTPPT+NJpE9FUdK4SLF9uFo5Kty/RuONjmTsPsTKF+MsIdjB7akwzFK604ToKktX7Lj0swPar3TR4IdCRY67A2loyQc1M11ziVCSHKT1tvBdnEWhq23YqdTO1lmlZ7XreJeRQFB/Jjj5HNcCROm/4cRgjTrrvh+Kn0H6MeE/d7Kc3cqUNPDcCu1wyYjgTVm9NZd2ztq1W3+/1GmGoY2Ln7gR7NgOrCmtWPr7QDBtcghFPOrTW7GglLmCwDbEB87Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDRM18WHlk49NhuI588IkLz6NPB2H6XTYQAnhHPWKC8=;
 b=OFXtdR+ct62I6/dC0clFlRp3YhVDIqsov1o81Y1D5ioXTCGPXwNYb7zEX/H7zxpLpdAIBriEI2tBsk9b0fWWswWnMC5hS0kkvWCqcnfhm1W8znQAdIEerulAbrUcmPvn8gcF53Cgn+gpOSZ6Nua6kLoY4ZGhNdVB+3ZwPeHR99s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13929.jpnprd01.prod.outlook.com (2603:1096:405:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:23:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:23:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and
 reset
Thread-Topic: [PATCH v3 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and
 reset
Thread-Index: AQHdSkqt6xSLd5WHvUWW7sT78DHE47bb8qGAgAAC/gA=
Date: Wed, 23 Sep 2026 10:23:03 +0000
Message-ID:
 <TY3PR01MB113466780CB01265B797B64B386822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com>
 <20260922042707.116378-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyxEY1qOeq7EEHN+o-Buw9pv-Onb0+PBM=Sr-KUaBH_Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUyxEY1qOeq7EEHN+o-Buw9pv-Onb0+PBM=Sr-KUaBH_Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13929:EE_
x-ms-office365-filtering-correlation-id: cc75f20d-4468-4cfd-9e10-08df195ca690
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 JuAxS61jG7VBUi27bGUAg/4VyYynWVRJYCzuPJ0RTkmsQNdPlgE/26SiK40ZK4wIjxwAluDhYNMqT78TdCBGKWEMAqY8K50AhPy2WoavW2Rz1qlA/BbwTV34zqamEvjxqFqGXzUwn516xTKC5YOAsgzZDyE6uGZRdov8dUzAr9J3P828eU+Wp/C4i+CbsyCt8Risv/4PGHim8M0HXegRvOz3PC8HJVIcmrcZY+J0hrgi9d6BlK4mOYWrROM6iP5QuEhn7yT1nSDSrGTrVIpBMGtXitj//IsSvHU7Bn/5NEqoO1cerfB8Clo5PQyaTSUjyQptj4awl8yVE/whuOF93nD2wFR3BSRKRRi259s+af3peiU1Z96DPFM8sOmDnnMnGvWe1c4t+ZEv8gIVv3yQltudOZR3r+LLu6SHxdCl7TfJLbpCbt2gwGyvDD50RWg7ckBiZQNZQ+a+VTgslC8XYfD4It9KfxN6jGT2RQCd5NUR6MSExlUC3sJOBjbQenBZH0ykxsQjevj6vNMHmXvzsG06e1VwYptPTMrZlRQ1DHz735/3uKMwn79hmuun2hhhg92lJpi9zbIdZdNteLDW65/Ju0zduFNOqYrug2ZbO2F9ij3byJ+gMypkJDCiAoSwmf7zS65+Mvipa+yI3s3XMScfldFu3slSc1PSX3X07Si1GE/kzEbpWJu1yUPt7Y6qGsWXzj5aPzZ1Kv44hiNOmw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVhINllLMk4xVGtaU3ZEa2NzaXJ3N1dFWW51ekw1WXZxcTM2bTY3TktnbTY2?=
 =?utf-8?B?VFlZT3NKU3h6Y0FJZVErd0VJWUwvSDlKcndxZG05b0hvd0loQkJ1RFdoWVZJ?=
 =?utf-8?B?aUpKK0xSZXY3RURBbk1iMnBiS3YzMURLb0lOK0lnOFpydDhiMEZqOTdsUlUx?=
 =?utf-8?B?WkhIOUhoZzBDT1hPdkhBaUtPTlpmVUVEV20yaVNhZVprekt3dFZweHQ5S0I1?=
 =?utf-8?B?MGY0MFJ0U3ZUQ0RZZEdMOGZpWnJXdkJwOEpMVjV0SjNWYm1qT1Bzbzh0SjM3?=
 =?utf-8?B?a2RIWU1wMWhpTURjQTgyVXk3ZlZVSzlna3NLZlFPTEIvUVBBRVN4cUZKOHd5?=
 =?utf-8?B?Q0ZEcHZlS0Zoa2xwUEZXS0J4RmNWMHhtUUNEU3JXYmxzNVQ4NVZWRTFwS2hJ?=
 =?utf-8?B?VGhwbW00UTVlNmtWY3NGRXdSR29HV3l2S2gzOHhPS01BZ241emViSThONXUx?=
 =?utf-8?B?Uk5kc3ZlY2dyUWV0eGo1T2UyYWpsR2RiazB5Rm9LUU5LVkhwY0x4YWJlUjR6?=
 =?utf-8?B?M2tqYVM3MWswQ21WTW50djVCbE9hWS9VK3I4am42THJ2SEdPYUc4ei9UQ2ly?=
 =?utf-8?B?dDhjOTlUT21KdXRjL01TQzhIWEt5ckNRL0FvODBRVlowSUxOM0NDUGlxSjU0?=
 =?utf-8?B?RldrbEE1K1JJdDM3dzIyUUJaRXdNRGhpQ2p3dkFRMy9zY3JlQXhXOVp6R0c0?=
 =?utf-8?B?Wk1LcDdKQjlqWE9tR3c4aDZ0Z2dtZDVFWDlzVkZqMWJwT2hLdHVseTJReXdV?=
 =?utf-8?B?Y242YjJ4VVNTRE54V0VCSklCYXorbWY2a0xvRHNFc0VrWjdwVHUrczBHQWM4?=
 =?utf-8?B?dXJ6WVNPclM0OCtkc1RpRDBza3BGK2FkeTlmRGtGb0R3N0pseFlRbzN4YlVQ?=
 =?utf-8?B?SWx4ZmZ5UDFMVCtqOGZ1RXM0YXhHOGRaT3Nadmk3NHlIa0VJRGhOMytCU3lk?=
 =?utf-8?B?UnhMVk4vTXB3VEllMUNyN2ErclhpUHc3VHluK3Z3RTBwaCtjTVlyTW5UMjB2?=
 =?utf-8?B?MlRMTkhIU0ZTUDNlcEhjNGtaZnhZbTVTZUx2TUlQSm9RMzdOdUpkSWI5NTR2?=
 =?utf-8?B?NExucnV2ZXYyZWRQcWcxc3BjYjdRbnc4OXlSUmExaTJGNHcvSGxOcWtWNDVC?=
 =?utf-8?B?KzdaTU5kdkNmSnBSQk1USnV5ZDIyUWtJR3dWZkVqZUFqdksyS2NZbWZySVlM?=
 =?utf-8?B?UGsramYyc21hMmMwUzlSdm9tb3NWWms3S2xISmxCYlVmTktQUHVGRDNnUURo?=
 =?utf-8?B?Z2VxL1lnOWRhaWxMN0gwU0liaTdJcHpQdFpkNEZQdVVOdm5ZWHFUT3MyVWJ6?=
 =?utf-8?B?Mkd3YzJldVBaUTVLUS83dHpXdkNrWmRBblJYOEV4dnhoSloweERQU1RNV09Y?=
 =?utf-8?B?RjdvZUZJWkJWVllNZEZwb0czNXluRmRtK2NpVk53TURidFgxR2ZqdFM0NVd3?=
 =?utf-8?B?MGZIRUpCUWFSV2txNURnNHBmZWx4MmRHcWNNTHI5enJyRzI5L3ZoeWlmdDg1?=
 =?utf-8?B?MEVQMGtGQncyc01Ta2toOVNCM2FHeTRLTUxZb29mTGh1TmZSaTJQTG9qeExL?=
 =?utf-8?B?NVZOYkJUTVhyR2ROb0JrbHh4c2RBQ3RFYkd3eExZQ1VSandPTGZwVWZNQ1hN?=
 =?utf-8?B?QnhTL3JKZ0VHejg0Tklia010UXg0T3JhM1NlZWgrODEySU5UVkR0TGllQUVF?=
 =?utf-8?B?aStCdXVPbFh5TGdSMEh5QXFkODdYZTVJMHVLaHlNL09qM09iUXVRTnZUT0NV?=
 =?utf-8?B?VTl6OTJIc2R2TjBqWFQ2WENPVmhzWmRqa1dGQXNNOS9XUlBhOE52QUFLOG5H?=
 =?utf-8?B?Q0tjLzEwN3BRejBzdzBucWNtKzF6eVpxMWRRRmoreGllWFN1aHZXZkRkOGJw?=
 =?utf-8?B?cWZNbWM0enZuTWk0T2ZvVUVwRzZ6ZUtHUzdFeUNXVldsdWJ1QnlhaktjakFo?=
 =?utf-8?B?N2hXRGJsMGNIQm9PRWdGcUhjMkRYeUJpQlFPUjFjNEwyMUhlNUFkRE1xMEQr?=
 =?utf-8?B?V01wSUFTZzJwN09wczY4Q3ZPZHQrbWl5elVMRWd4WVBnUVhVSGtGczhpc293?=
 =?utf-8?B?djgwQUZpRE1EUkxNcFNHaWZyWlJDd2xNM2J0S3hPOHBYQjZESFdTWGwxUnUy?=
 =?utf-8?B?eFlRU3VXUWd5citadTZFQUhndWZKaGhxWkdsSmlLNm1RcEZYaDU0VDJjSlZm?=
 =?utf-8?B?YUNuZStKWUtpU25qRlpTSUFaL09VU0RXeVEweE9XTE01THFUcmNDd1FreUpn?=
 =?utf-8?B?bUFnYzlmRWJwOGtONXB5aDZYU2d6MnpXeUVKcTdyaDlRU0tPaldPZDdqVVBK?=
 =?utf-8?B?ZXUyZ2VLMU5BR1NaNUZ1ZzZRdnp2QXR1K016WE1Hb3RRN1c4YmVEUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cc75f20d-4468-4cfd-9e10-08df195ca690
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 10:23:03.1940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: noiC1McyPBrbzqkcs3u7+G6jGc3ZfzGH1vVLTajIs3aY730J9KMZKyx8skQOP6b1byEbEfRA5IsKoQxJNkmNSC4KfCX2dM1ag6rqrQbSqiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13929

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIzIFNlcHRlbWJlciAyMDI2IDExOjA5DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS84XSBjbGs6IHJlbmVzYXM6IHI5YTA4ZzA0NjogQWRkIFRTVSxBREMxIGNsb2Nr
cyBhbmQgcmVzZXQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDIyIFNlcHQgMjAyNiBh
dCAwNjoyNywgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4g
PiBBZGQgY2xvY2sgUDIwIChQTEwyX0RJVjIvOCksIG1vZHVsZSBjbG9ja3MgZm9yIEFEQzEgKEFE
Q0xLLCBQQ0xLKSBhbmQNCj4gPiBUU1UgKFBDTEspLCBhbG9uZyB3aXRoIHRoZSBjb3JyZXNwb25k
aW5nIG1vZHVsZSByZXNldHMgZm9yDQo+ID4gQURDMSBhbmQgVFNVIG9uIHRoZSBSWi9HM1MgKFI5
QTA4RzA0NikgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4g
PiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA4ZzA0Ni1jcGcuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvY2xrL3JlbmVzYXMvcjlhMDhnMDQ2LWNwZy5jDQo+ID4gQEAgLTU1OSw2ICs1NjAsMTIg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9tb2RfY2xrIHI5YTA4ZzA0Nl9tb2RfY2xrc1td
ID0gew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU1RPUChC
VVNfTUNQVTIsIEJJVCgwKSkpLA0KPiA+ICAgICAgICAgREVGX01PRCgiZ3Bpb19oY2xrIiwgICAg
ICAgICAgICBSOUEwOEcwNDZfR1BJT19IQ0xLLCBSOUEwOEcwNDZfT1NDQ0xLLCAweDU5OCwgMCwN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVNUT1AoQlVTX1BF
UklfQ1BVLCBCSVQoNikpKSwNCj4gPiArICAgICAgIERFRl9NT0QoImFkYzFfYWRjbGsiLCAgICAg
ICAgICAgUjlBMDhHMDQ2X0FEQzFfQURDTEssIFI5QTA4RzA0Nl9DTEtfUDIwLCAweDVhOCwgMiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVNUT1AoQlVTX1BF
UklfVklERU8sIEJJVCgxNCkpKSwNCj4gPiArICAgICAgIERFRl9NT0QoImFkYzFfcGNsayIsICAg
ICAgICAgICAgUjlBMDhHMDQ2X0FEQzFfUENMSywgUjlBMDhHMDQ2X0NMS19QMjAsIDB4NWE4LCAz
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU1RPUChCVVNf
UEVSSV9WSURFTywgQklUKDE0KSkpLA0KPiA+ICsgICAgICAgREVGX01PRCgidHN1X3BjbGsiLCAg
ICAgICAgICAgICBSOUEwOEcwNDZfVFNVX1BDTEssIFI5QTA4RzA0Nl9DTEtfUDIwLCAweDVhYywg
MCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVNUT1AoQlVT
X1BFUklfVklERU8sDQo+ID4gKyBCSVQoMTUpKSksDQo+IA0KPiBUYWJsZSA0LjUtMTAgKCJSZWdp
c3RlcnMgZm9yIE1vZHVsZSBTdGFuZGJ5IE1vZGUgKDIvMikiKSBzdGF0ZXMgdGhlIFRTVSBiaXQg
aXMgbG9jYXRlZCBpbiB0aGUgTUNQVTIgTVNUT1ANCj4gcmVnaXN0ZXJzLCBidXQgdGhhdCBzZWVt
cyB0byBiZSBhIHR5cG8uDQoNClllcywgSSB3aWxsIHJlcXVlc3QgaGFyZHdhcmUgdGVhbSB0byBm
aXggdGhpcyB0eXBvLg0KDQpDaGVlcnMsDQpCaWp1DQo=
