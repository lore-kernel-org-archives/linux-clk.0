Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427185;
	b=xR/kBktoP5uZc9mVzVHLLYQjCqRsUZyannL7jpgLm09f/mgJQzCee6JeJQeIMskwdQpv
	 apNVm5FIGXgKV87XorRUFfcJEexljrjvsP9zxnWhnswpV9ul6TUD7PUEcK8cdLiZ7Fl8L
	 ITJ1k1D57ibOfoyn2uv8mKt91jwGO7U/YK9KXtD61TRfkFuzcNOgi5WGoIEudMx6HD+Qa
	 4LqZeaxWkCYeuKOabSpPDX4yMtVBJOXRPc++ixlsOBShb34FrFogJDWwI46HX5fPcOhse
	 X6ptgxs2Bq0hPIpw4ZXRxfv7aH1Zg7LzhAzDsUdW6Y6x5uj5nDKbAw2BLH6dEVFjvlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427185;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
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
	bh=9tfJO76gHTo0PUh4nRmv4NBXHG6pvs8JI/GA6ansM9s=;
	b=KwZZzeBF6Ltqd26eKX612rGBOgUnZ+Y+Z8Kpd7Udi5dxRaVlPiRQ/P2iLmaPTOMXlokF
	 32BgjTceBTeaWx0n6+kN/Aa37R0HUP2DIq74KOjdUcLov2IbASeYZ+396Y/GIKnEBnZ9k
	 nXP2b09OfGAoZ8R7i6V+2ScTLLF0yueDvBhTNkKUVUBMAm6B2e1SIq1fBZ3+1BgSWNawO
	 FYqeAUcG77JwlLrb7kvO96Ny0rxEbsvBHvjYGpEyH5gRQPZ3etlcKLetR7o7Jf9LzjPnB
	 nvr27CwPL+r5XQk6maaGuOAMgyrdOzXHLrzGCAb4XER+s26heLVTW6YUoqnd3nLZfwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=SfOamkNZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.31
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39568606A31A;
	Mon, 23 Nov 2026 09:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39568606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=SfOamkNZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bie4kk/vLnpoidrbhpMls7YbMUtlSB/27TbgVXj/PkYvDFFct3b08fRWKlM6sIuuRZLNo/e+bCs1sgru1z6XQ8CpRABaow9TyZ2UXT2itHplheQlujHm30iJajVK6/etJq6HhIQR0PgIS+Lo98B8tP0Xh9EuibN+3p0xPggr1TAw2njJjhvAM5wS6TCDlE3XJaOduuIVwO99TbjF65aivyo9NufYQntTijdAHQRIs/iKg9H9Ec5K09vmUOjxzAyJYTRKU0c0fdAyYMxOl5Eulzd2Uf0f5WwWP2rivSuIoR67HZf5917yxpydZ1YBIGj8+HQt65N9qh9R8aCF6p41xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tfJO76gHTo0PUh4nRmv4NBXHG6pvs8JI/GA6ansM9s=;
 b=GwciEYwPxDDKr7hfB2/im7RoxnuRFYOaDpo7PHQu0VQ4FbAeADHu2PnX8Q+ImpK2oeJbjL1KAXGwaGEXepmzd6Htw9vKhSzOgI/xG7we6YQA4R4+/TMHYA9V+UuL164C4NapLDLoIlE8PCUVquXpV30KhJDmugg0ECUrFsQuAKcflS0u5NKjwm3znu2YbNdzJRLh9Wz+YoItnehuKBWiCZ8lvrRheNZ8PwF6lor5SiPgd0XjYxQ/es5+W4vSQ870dHLvzaSLJwMttUgkcqDgo6gOxghASeOjcCPCAxymaUoGsVPvWW496KnO9N6ly0/sOgfjMf+HJzi77JUl+gY9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tfJO76gHTo0PUh4nRmv4NBXHG6pvs8JI/GA6ansM9s=;
 b=SfOamkNZU/WvZwZkdwpBPy1NXPad5d6CbK4MIRJfJ/7cJgLnCsDP66NeHt4IFzzEg5AHCNhFmi1CopcQTE126D/ThJbz+0dubuLB9QiQBqmdW8cVEz5l50gy13EoOu3h9D4UUqnCKrtm69LO5bX8BGSQIPuZjHvz0DfYbyaI0aY=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by OSZPR01MB7938.jpnprd01.prod.outlook.com (2603:1096:604:1ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 09:46:21 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:46:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
Thread-Topic: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
Thread-Index: AQHdX8Vug6f5sfX+VEyy26VSVdBrhbc7g86AgAAZsmA=
Date: Mon, 23 Nov 2026 09:46:17 +0000
Message-ID:
 <TYYPR01MB6603558B6F19CAC31748204486452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
 <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
In-Reply-To: <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|OSZPR01MB7938:EE_
x-ms-office365-filtering-correlation-id: 0cf9f1db-75fb-4d15-cf09-08df49469f35
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|38070700021|11063799006|4143699003|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|261009221227099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 Ch8Ula0KQHcud37lWN3fJsEjAw+uJ9H31EyrpFADXHDjYp4VT2NYq7sRDuEpNKD1lipxIzXH/vT2Tcq/gNwosdttGu/cXMx83Eb50NIk4rHh+muvfIfOv8PN86sMaANxIw5DD5k7N4iPqWewn5+UYG98Grh6qi0WCyBxmC3VPdx8j/qOmJN2SAIwy3Ls3uziL5RGBBwiACRCXgiYUiWDxtsdAccU93HvoWv/Ue2xaIcLGklMCyRm8JXRU5NO4eBMw0RrGMuxYI8Pe2dIDtJG9XKv6ae3FyYMI9SEWjWwNq/jfn82X5ffaQhRmq9Sjr/uyhyQvt1v0lc2hlxazOzWx9K1Tkk1fG2wIJ604QSaCeGbT34vyArszdi0k40eCG6kRWlbw96MZ4AXgteJuD1MwFNEiOEtPDocHYzS3R2wvl0fZS6+0JMMe8qcCM+u1JkJAlpRrr2aN6QTjgnXcvSmYnn0YV6aWdaPEzMmrZgLhflG1dXOfzFTT+GrAixAlp2ibqhGIeKP6CgQ9fakndfEC8GvzQzUa89x/h0r2rq36mKdzS5Jo5+sJSPpW/7VUfUPg0CMWk1v3QFla5kDKNdimmlIPyIvXcTAkpFP8q89dt9Aq+m0QYsRT7NeSIhDw06W/d+02weGY8NDXH7UfBd1eu19tj8R07IQh0956++WzHC7OSxtUHV6sr18+mDNK9ugoa0bne6nQPwPhTgl+XxAqivhPJpo/8r8SPWqXiYZEhw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(261009221227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjQwMnNhK0Q2aVpjRk95ajNuWEowZUNCRXJiNzI1a0tPcWs4dVArYndCckQ2?=
 =?utf-8?B?cEJWOHhOV1pVSnh6aVdYYnZ5QUltQ3ppN3gxTTl3N3lFb3ZzMnVYVzFoZHlY?=
 =?utf-8?B?eG5oc0x6T2dqT00zc0RldWpOMWZSNCtleEpTSjFvTHlGWUszd24yMzlOaGlU?=
 =?utf-8?B?S3Y3TXpoR3g1YTlWWnYySW5ERFN5aUt2VHN5VnFzWDUzNysvaUZBRzkyZGls?=
 =?utf-8?B?eGFEN1lmakxtam0vSkcrZ0ljbi9LMnRnTzgxMWszQXRMNCtIU2N2bmZ6Nkk0?=
 =?utf-8?B?MHc4bXdJWDVOaUQvUElWcUtCWmRYS2xvWTRqUVQ2dUJjMk8raHkwdFlKUTdR?=
 =?utf-8?B?bmk5aFNlNjlEdXFqK1J3VWJXUkIyTTNjMEZEb1JnTUhBamFOejgxQWtUR1Ez?=
 =?utf-8?B?bDNjK25lT3k0dWtTTW9Tbm90L1pWWDc5ZldnQ3BtdjFwRUxuZ21RVVJFb2Uz?=
 =?utf-8?B?aEJ6QjhSbEVTbVphNE5qRDFENXlDSXlZSHV5NVdIaHJmRnVxMjFqYUxhaVRQ?=
 =?utf-8?B?K2NmRVRRNHpWMkJ3NjlwbEVKZzBZR2hTdzg0M2xHTVcwSVBickc1aHpGNDBn?=
 =?utf-8?B?d2lHWDF3aGU5YThGRVZ0V091KzY3RHYvM2g1bGlDSzBSY3RCdnNiTndVU1Vq?=
 =?utf-8?B?cEgvYnFtSW5FMkZOcVBYcU9VZVR1aHhRQUgvM292NmlIRDBWa0VrNXRIR2lq?=
 =?utf-8?B?U0FTMkNaNlUrV0NHQnUxN3h6WmczZDZodlE2dUI0dFc0a3ZMdmlSd3VIK3ZM?=
 =?utf-8?B?Qm4rd0ZmUWhaU3ZOMnhMcUJ0MUd5ZXZHU3VuZW1OK0dya2Z6TnVxem9BdmJy?=
 =?utf-8?B?K3VIVHVuYVMyVm1RZDJMMHJoRkd6aXlrcmVETk9obmJ4TU1CeFJFOXNlbFcv?=
 =?utf-8?B?RUNNNERKVjFRNUt2REhVeVFDeUM2Q0xoR2NjV0EyTGgvVHhoQjhUaWtjL2RB?=
 =?utf-8?B?RGhBWGx6YURPL1Uya0gzV1A2ZlV6Tk9lVmNIYlhXL1BlOFN3V1I3N2FVL2F2?=
 =?utf-8?B?YlRxVytpSVlEeHRQS0dDZllLQkZVT0daeGp0SVdiSnJFcmtoSGdyT2I3TXBE?=
 =?utf-8?B?U1ZnbFdnM1kxM01KY1RZL2JJRHc1L0V2ZkZEdlgvZmNQakFhZURqaUhERU9z?=
 =?utf-8?B?UlRER1dCc01Ld3pTb2loWjhyUFExK2tvUHF1eXA0WkhaVzBYcWcrb1NBOFYw?=
 =?utf-8?B?dXlTS1F0eG9PMmdaVFp1Vi9pbHhSWEhuYnJLM0oweE9tQUtrZmo4TFRXaS9y?=
 =?utf-8?B?M3l6QWpTQW5kaWxEUHRrakdUaG1xNHFBeDlTVXB6TU9WRDZPRkdyUERzR3Jp?=
 =?utf-8?B?Nlp2RC9BWWZMamIvQlRMcEhXUlZYUktZWitJNzhFM2JIazRibElYeHE3bW4z?=
 =?utf-8?B?M1JuT3FXdWVXRDVEaEk5T0NSeTNvR2dnZ0JGWlhnems3Sy9wUDdCbWJYbjBN?=
 =?utf-8?B?MitIK2RrUnZVNlJvWFcyMGh5YkJRMlBRc0VvT251bVh6L0dDTWdoZzJhV0JV?=
 =?utf-8?B?a1c1RjV5RHpGSUZXdWZyencyRGliMHErNTAzNnBMQU5Sc0VRcmlaTmVSaWpK?=
 =?utf-8?B?MnhleVhud05DVW1lMThpaERUUDUwRlNjMGNpdlJoeFB6RFphVmxHZ3FwaTZL?=
 =?utf-8?B?QWdlVkR4NmNMNWRDOXVOU3ZSYWtoWEtJMzlXN25jVkNpYzBPcmtzZkJoYUly?=
 =?utf-8?B?aUl6Ym4xRDhoV3MvU2FJN0VibC92L1ltQ3hFU2hzL3E4U05XVGMxRHJXQTFI?=
 =?utf-8?B?ZHJ4RHRnVmc3L0tMSU1SaDg2WTFCRWIvS0RKcU1IR3FNS3k2bm9zQmN5Zko5?=
 =?utf-8?B?dlYxV2ZIZ2lQcG5Ub2ZGRXdBSDUyYnVTb2lYbEFQOXZId0drOFk5am15MjBB?=
 =?utf-8?B?ZkRLYytSa0hrcktZNjJQaFY0WG9pdDNSa3ZSdGRQdStaTHU4aGZHczliY2dE?=
 =?utf-8?B?d3R6N1ByOGdvVDNoSGgwT05YenZHU0lucFVtVmsyOFRKTXp4MlF5d1ZVaHli?=
 =?utf-8?B?NEEzcVcyaTNiUnUvL29ORjIwSU1teDZLZm1rTzlJQk9RSkszSXBhbjhJZmh6?=
 =?utf-8?B?cFlONzgxMW5oamdXQWRTVnFub1E5WTJLT2VEdFZ5ejF0RGRjcE0rK0xteGll?=
 =?utf-8?B?MENLNVdZVzA3eGwwR2dtRzFVQ3NQTDlTb2RLRTBVdTAxVThuUGh3QmZ0cjRP?=
 =?utf-8?B?QU1XaEpHU2xlS3pad0dOV3lwcHFuZWlUckVmeG8xRG5reHJmSW5MSitSZ1U5?=
 =?utf-8?B?LzIxY04zdS94UnF5SEN0a3lvRHVtRktlR0NQRlNINEdlRUpMeFcyREVpcFVt?=
 =?utf-8?B?UGgxZ0REMkFYTTFZbFhLdDVTaTQ0L3hjN0daTHVQaUV5TVErZ0l6QT09?=
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
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf9f1db-75fb-4d15-cf09-08df49469f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 09:46:17.7185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qI7+xoqkBQ7pCy8kPb5QP3tNbGDMf3ktcx79jcDSwdJb/1wy09yC0/MNwsFgTl5ZTjwEqU/E5NWHBgipheeJKLwxC508UJNmeTzTJwBeIx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7938

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAyMyBOb3ZlbWJl
ciAyMDI2IDA4OjA3DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGNsazogcmVuZXNhczogcnpnMmwt
Y3BnOiBTa2lwIHJlLWluaXRpYWxpemluZyBNU1RPUHMgYW5kIGNyaXRpY2FsIHJlc2V0cyBmb3IN
Cj4gczJpZGxlDQo+IA0KPiBIaSwgR2VlcnQsDQo+IA0KPiBHZW50bGUgcGluZy4NCj4gDQo+IFRo
YW5rIHlvdSwNCj4gQ2xhdWRpdQ0KPiANCj4gT24gMTAvMTkvMjYgMTU6MjUsIENsYXVkaXUgQmV6
bmVhIHdyb3RlOg0KPiA+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBi
cC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFdoZW4gdGhlIHN5c3RlbSBzdXNwZW5kcyB0byBzMmlk
bGUsIGFueSBvZiB0aGUgSVAgYmxvY2tzIG1heSBiZSBpbiB0aGUNCj4gPiB3YWtldXAgcGF0aC4g
Rm9yIGEgZGV2aWNlIGluIHRoZSB3YWtldXAgcGF0aCwgdGhlIGdlbmVyaWMgUE0gZG9tYWluDQo+
ID4gKGdlbnBkKSBkb2VzIG5vdCBkaXNhYmxlL2VuYWJsZSBpdHMgY2xvY2tzIGFjcm9zcyBzdXNw
ZW5kL3Jlc3VtZS4NCj4gPiBSZS1pbml0aWFsaXppbmcgdGhlIE1TVE9QIGJpdHMgZm9yIHN1Y2gg
YSBkZXZpY2UgbGVhZHMgdG8gc3luY2hyb25vdXMNCj4gPiBhYm9ydHMgd2hlbiBpdHMgcmVnaXN0
ZXJzIGFyZSBhY2Nlc3NlZCBmb3IgdGhlIGZpcnN0IHRpbWUgYWZ0ZXIgcmVzdW1lLg0KPiA+DQo+
ID4gSW4gYSBzdXNwZW5kIG1vZGUgdGhhdCBpcyBub3QgY29udHJvbGxlZCBieSBmaXJtd2FyZSwg
cG93ZXIgdG8gdGhlIFNvQw0KPiA+IGlzIG5vdCBsb3N0LCBzbyB0aGUgTVNUT1AgYW5kIGNyaXRp
Y2FsIHJlc2V0IHN0YXRlIGlzIHJldGFpbmVkIGFuZA0KPiA+IGRvZXMgbm90IG5lZWQgcmUtaW5p
dGlhbGl6YXRpb24gaW4gdGhlIGZpcnN0IHBsYWNlLiBTa2lwIGl0IHdoZW4NCj4gPiBwbV9zdXNw
ZW5kX3ZpYV9maXJtd2FyZSgpIHJlcG9ydHMgc3VjaCBhIG1vZGUuDQoNCg0KTG9va3MgbGlrZSBh
IGJ1ZyBpbiBjbGsgZHJpdmVyLiBNU1RPUCBpcyBjb250cm9sbGVkIGJ5IGNsayByZWZlcmVuY2Ug
Y291bnQuDQpJZiBjbGsgcmVmIGNvdW50IGlzIDAsIHRoZW4gTVNUT1AgdHVybmVkIG9mZi4NCg0K
U3VzcGVuZCB0byBpZGxlLiBDcml0aWNhbCBjbGsgaXMgb24sIHNvIHRoZXJlIGlzIG5vIHdheSBj
cml0aWNhbCBjbGsgcmVmIGNvdW50IGlzIDANCmFuZCBjb3JyZXNwb25kaW5nIE1TVE9QIGlzIGFs
d2F5cyBpbiBzdGFuZCBieSBzdGF0ZS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg0KPiA+DQo+ID4g
Rml4ZXM6IDVjZDMzZGI1Njk1NiAoImNsazogcmVuZXNhczogcnpnMmw6IEFkZCBzdXBwb3J0IGZv
ciBNU1RPUCBpbg0KPiA+IGNsb2NrIGVuYWJsZS9kaXNhYmxlIEFQSSIpDQo+ID4gQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xh
dWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2Ns
ay9yZW5lc2FzL3J6ZzJsLWNwZy5jIHwgNCArKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9y
emcybC1jcGcuYw0KPiA+IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYyBpbmRleCBm
NjI5M2M5NjhiY2YuLjNkMjI4MTQ1NjAzNg0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Y2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6
ZzJsLWNwZy5jDQo+ID4gQEAgLTMxLDYgKzMxLDcgQEANCj4gPiAgICNpbmNsdWRlIDxsaW51eC9y
ZXNldC1jb250cm9sbGVyLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ICAg
I2luY2x1ZGUgPGxpbnV4L3N0cmluZ19jaG9pY2VzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9z
dXNwZW5kLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvdW5pdHMuaD4NCj4gPg0KPiA+ICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3JlbmVzYXMtY3BnLW1zc3IuaD4NCj4gPiBAQCAtMjY5
Nyw2ICsyNjk4LDkgQEAgc3RhdGljIGludCByemcybF9jcGdfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gPiAgIAlzdHJ1Y3QgcnpnMmxfY3BnX3ByaXYgKnByaXYgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsNCj4gPiAgIAlpbnQgcmV0Ow0KPiA+DQo+ID4gKwlpZiAoIXBtX3N1c3BlbmRfdmlh
X2Zpcm13YXJlKCkpDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICAgCXJldCA9IHJ6ZzJs
X2NwZ19kZWFzc2VydF9jcml0X3Jlc2V0cygmcHJpdi0+cmNkZXYsIHByaXYtPmluZm8pOw0KPiA+
ICAgCWlmIChyZXQpDQo+ID4gICAJCXJldHVybiByZXQ7DQo+IA0KDQo=
