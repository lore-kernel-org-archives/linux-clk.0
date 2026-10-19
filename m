Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955204A483F;
	Mon, 19 Oct 2026 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415236; cv=fail; b=qkHWWkmDPSaUkQ9Mk73SAhvptPweFb8CnKKO99+WYQr74eM1Eo6XDUogc4fSc+P7qCIVu1Fds5cVW/zinZxWnyRUnyEFvtZCeYd5FOrDOSWmN8EMab5PUa3vbaJPDRfayIbghmwr4CPZkUk9q5wEKNCZqPVUqdtDHVYQ2c0DRxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415236; c=relaxed/simple;
	bh=5QG5KfSRaMKtrrWA4okU/mfWVvBHEzzjHH721yZdXEk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qE4+4+WJpGl8YlMGegUyLWj43YyUesOwI7/Am+qhrAY51W0zxuvgPg4Z2mPK9/RDcg6l6cgLzdpiAkJQMkgn+OV6TBY7TOB4gHZ0cdFjTLyhjgLHEovO98ieQXZ/mo+2KEMVrOyt1CYYyUXJUXkvg9pCzZyOzDl79wd2ivZQcAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lmTQrbcM; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lmTQrbcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYcBPZgd+ZAKy3v8Sad/Z1YXftufwVw7TScTfFaJG8HieIMMC4uTAcMu5WgBgEq8sp5IfjjTOirxErCmgXpEPbunM+/Pofe9V2e4ZXk3ca5XDMmlAVevTT5m4zYzucDS5mFqsbzHDLTIoyIlanksso6HtqckaVtqJBfFs45CFy761B4cF+mL5vvoU0f/KJBv4aCfDmY4kg9/JD38KMallS4i4XPut70qEVSOfY0jKEg8mb6WKnetETdORHwWK5+liEAhULK8VHz/9nXx/4dwAHSsoDwb1zzVctlgfFsCv5xGNTW0tZi6KXjfk3cg7pIVZQ3YSC02fgq1//XOpBz1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QG5KfSRaMKtrrWA4okU/mfWVvBHEzzjHH721yZdXEk=;
 b=GUHX8ynJeqcMdToRXb1eLZsWMTcHB52BEl7vLO4ls6ou/sN1hcgncdsFnhCz/dMyTrMn2i1QN+RQY9MmyqBTQ6wcG5lrmnfYUsoslQgf3KJ+0ibgLXBGSXqmu/RgVIPZA/GTvi5n7wmuBwon+Epi+GzhTlrcpS5t20cP3LW2pzfQoAHfhJQsZsyUGhIXQfHugFbHu8IDoqozV6jLwcJ250uKmSBs9aFy394x9njJwZS0o2YfuxTlP5z1uHi2wJB15IaTvoGVCR7l7J2HphdMKrZUHmbPSAXFgLGqeEwRBXTY6GiqrTRgGD6RHcCMV8l+uEiC3SOIxwdv78LvgKCclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QG5KfSRaMKtrrWA4okU/mfWVvBHEzzjHH721yZdXEk=;
 b=lmTQrbcMccs3Y0OEcgVHaJK4ieqS/8qx4xXmTRp5mTCL7t1wV3LYOpvdRML+muDAwaj7Qy9YvhUtap3PJkA6wGpHvBoRoyOOfs08drAu5j0NZYiNfp5we6ahiErIIt5kSG6+r5DfdNtggLis3VJkCe+9YREM8XPtP/fnsn4AGS8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11315.jpnprd01.prod.outlook.com (2603:1096:400:366::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 13:07:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0496.021; Mon, 19 Oct 2026
 13:07:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>
CC: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
Thread-Topic: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
Thread-Index: AQHdX8Vug6f5sfX+VEyy26VSVdBrhbcEzKNAgAAHXICAAABz8A==
Date: Mon, 19 Oct 2026 13:07:10 +0000
Message-ID:
 <TY3PR01MB113460224F0225E29A7C5097C86982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
 <TY3PR01MB1134614C56D70F75D2C3214D986982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <fa2e9997-6124-42c0-959c-ec920ee9cbeb@kernel.org>
In-Reply-To: <fa2e9997-6124-42c0-959c-ec920ee9cbeb@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11315:EE_
x-ms-office365-filtering-correlation-id: db3c9159-46ce-4b61-5117-08df2de1e289
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|18002099003|22082099003|38070700021|11063799006|260925021911599003|4143699003|10067099003|260925022911599003|261009223027099003|261009221227099003|260925021311599003|56012099006;
x-microsoft-antispam-message-info:
 aStCTJWjwM9vkMkW/q1ZzayrvwMF0hvqiovNglWJHCHNsnTqcRHJSRjJcr/bdLVD7ygiWbycJbAi5DFxbs9B5KrMV5LEa8xZA+cHc/rd63s/MyVM8K9GuGxDy0uZfMDzQPPpm5mZsZ1QRGBAuQyISOOerGDcSTQ2mjYCRQfeaH1aXgiz87TjZCyrhFRGyu0CljMACcLXGgH+Gs56+M3CgMHyBUNd8kogBuMq4rORPO2vMVF6zDHMuC8G/Unl8QFdaL3/J+uIEiwbHUJnuiJN0cUANornu8Mp2QYkwZ2bdHEJ8a5v8XNxNRIhighLjdBw+mffBYkIgXAuNNxdwf6NzS3G9r5LF6hMtUuJkve7wcusDdBabRA40gQtNH5cmFk+NCeupeKyCgm3LBaF/+BECnhxPd+9XXs1sLtyQyGAsSBdWUa3Giq2VBuuAwLoL4LuVSAUwguqlgs5FO2HJ3JnRcSxdsS3MLFfp2URfKt90wtDMe8fO+EA66wru1ajSWCez/CmK9sYs7RhNDXYY/UjG3VuKCOsClzAeQRv/lOiUAMpO9RSMu6Sgt8ex7cBuKmvu7lzDdoFCuVxkbth1sY7zDCY6Ptjj1xejvRr0q58DIy6mhO7TlG6Lg7e/83SJBepzNG8wN1ehxkU7X4/dMnOL030S0JFy2INnxKRl7SMmzI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(38070700021)(11063799006)(260925021911599003)(4143699003)(10067099003)(260925022911599003)(261009223027099003)(261009221227099003)(260925021311599003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzQ3b2tEeW5VZW1peDE3NFBvWm9yL0dJb29ucEdQM3ZRcW1QNzdDVVhmaFpm?=
 =?utf-8?B?Q2FMcG82TFJWWW5aaDg0K29kUHMycm42bEFBS0s3OFdjNXpoU05KdXNpczdT?=
 =?utf-8?B?SG9RZmtGSjd5UlR2NGY1Y3Yxa054ejdiNmk1NzVjQUd3dmR0U216RW5OZnI4?=
 =?utf-8?B?aExtcWo3M3M3ZWNxWDhKR1BjZDNkK01PVUp3V3k3b1ZmNytPZXdjbDRianh2?=
 =?utf-8?B?R1doTUxZQ05UQXFYYk90TXBEVlJtbFpXL2o4UEdMbmtxU3R6b09aQklvZ1Ew?=
 =?utf-8?B?ZE9ZYitDZmgyaDZNalJjWS94RHJOd096d1RaV2tTcWNLOHFlSWZrbFIwVzBt?=
 =?utf-8?B?Q2YycE9weGJOYlQwMzdzaVhwRlVCNHdDSDRMQ2xMR3JPa3hTTjVhdW42b2ZL?=
 =?utf-8?B?RkM4cW82VlVTSXBzUjZRU1I5R09BbXlxbGxXaUFxOFVxV1JzV2JYSFM2Mitp?=
 =?utf-8?B?WVExK2tGYWQ1V3lTYWpKeExnNjN1Y0VXamJBa0p5NzlyUlJFRHZnR2FLZmI3?=
 =?utf-8?B?RzM1SVJzQ3B1cU1ZWUR5ejNMeVZGQmgzVUpwajJjeTFBb25odk5QSVZ5MVda?=
 =?utf-8?B?REtOd3hJbjNpYW1la29WRkxiWTBrUkVESmdLZ0s5SFV3anJMOGRDeTFnYU5H?=
 =?utf-8?B?ekVOYW9XSTJxL2YwS3dyTTVNUU1YdXQzclR5WXRsVEljVmVYMUFyb0RyeG5l?=
 =?utf-8?B?akJMQmg0bUx5WlFZZVB5RUtBWFRhV0Z5SXFWSWpnVFk2MERPVmY1Um1iVkVI?=
 =?utf-8?B?VSt5WkcvZEgrRjR2ekJPZXA3dGhObkNCUVRUVmJLQVJVa0FNS1dySnR6NEQy?=
 =?utf-8?B?bnJzV3FWdTdaMEZXQkJ1VDlxbUFXVUk0MGtqWFhJc2VON1J0NmRYV3Q4YVNT?=
 =?utf-8?B?cUhwdXo2OEoxejV5cDN6RkxFOFBXNmFGL25DWjNQbHN6RkptVUVRaGJvTlJQ?=
 =?utf-8?B?em9URGxyeUlNS2gxWFUxYXljTVZwVkhsK29YNzFkRmpNdDBLWjRqQTRuanQy?=
 =?utf-8?B?amNrU0NpcHpKUHZlR2dCK0E4UDFFcjJyaG53WnRrWUo3MlVtVExvK0Z5Uk1U?=
 =?utf-8?B?RG9TaDUvSy9ZOGZQa0lTUDlVYklURFZWYk1TUktGRmlCblkvS2o5b3N6dUNx?=
 =?utf-8?B?QlVZaXdqSlVWMFZWcDZ3WDNKdEdKM0dVYUc1VTZiY3Z3bXF0NmFOYnZkNjFt?=
 =?utf-8?B?KzNibnlmRE8rQVBDMHg1ZWFBcE1SYzJqMG50ZUd0TEhrNHZDek9TQ01mVEh5?=
 =?utf-8?B?U0NHb0p0VFI0dC9QdUpqNi8wQWVLNnNzU1N2S0xHa3BCOHpYem5nYm5NU2Ir?=
 =?utf-8?B?UDVnSTZMczA5d2docVJGc3VKL1RTMTlrZnFJSlJLdXkrbXhTTVp2bTF6ZUpV?=
 =?utf-8?B?QUZ2MnZDM0ZOV1FlK0RGcFRJT04yYmhKd2g5aElHcmVxbkpCZ05YcXRVbnhj?=
 =?utf-8?B?SThtd1ZiMTVaTXdVZnp5MTJtSHhJNkFHTjNLeFRIUFUzaDZOQ29udERZU2Rq?=
 =?utf-8?B?T2pzSS9uL3BIRG1MbHo5T3IreE10alErcG5nQk1pWmFJanE0OXZtcGhoSHdh?=
 =?utf-8?B?SDhJNFVVQXBmNWM0MlM2T1YxWWdNbTI5Zkc5VnlocGtwb1d0b2o3UHFEblNk?=
 =?utf-8?B?akQ2VmxOSlhaU3NDN01jdjJKakpuRDc0QU9Zd2tDWENhUUpYOWRSYmRRekdE?=
 =?utf-8?B?WFlCRFBWOEVJL1d2aW43blVmcktBTjVYcTlKZEpycnNJZVBJVVh1MmIya3Fw?=
 =?utf-8?B?TEdoZU91NlFLT01KcFFsdUVaUU5HeVdvRFpMaUF1M2Z1WDRhZmpNOFBrOUds?=
 =?utf-8?B?WWl0bkgwZlVpZUU4M09QRFRxaGNQcTA1NWZZSmZFVUczUS9SRUp3NmN0d3RM?=
 =?utf-8?B?elp2VmdzemlPTW5ZNDlPN2FOMSt3UmNJd25MMjA3anJnUzljQVJkbWVaNDBM?=
 =?utf-8?B?aXc2MUh3c1dJMnRYV0xYMG9LaUNLZTlwaWpoZjBJQ0RNS2xjWDNYU0FhbWV2?=
 =?utf-8?B?TXRyQTQrUnNNYVViTE8vd0tVTXFaaCt2dG9GM0djc203NFJoRTB5SFZhYVZl?=
 =?utf-8?B?T1RkT0JqNDVtMHo3STJ2bkRhRUdMeklKdE43MWNDZHNBdGNMRURvcytrU1BV?=
 =?utf-8?B?WHFCOUxQQkJheittcnRVU1JPR2Z3ME8vRzhHc1hmNHQvdmh2SGZSOFhtbFNN?=
 =?utf-8?B?KytQVzdLN1lOcXpzakhYejQ3NS96eWQyLzQxV2dZZzNUR241UlRlZFN4NlNS?=
 =?utf-8?B?UFBwNDRDTVF3VmlJelVTcFlkSTNQRmZ0TjVRRWpJMUlOUXpjRVBTK0MrWnlr?=
 =?utf-8?B?RVRjOGVNUHF6TDd1NzNYb1Z0L0w5VUgzYVhvbEpMeGpadStKdnFEZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db3c9159-46ce-4b61-5117-08df2de1e289
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 13:07:10.1060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLuY61mertTSNC6scwkT4Ua0H3kpj5YS2eq1O8ehe4iNWx+Ltehyjd2P8jbnFtRdGdH87FEd1u08s2pTj6BQtnjLRGNPoLVzc3XO7y5Vw6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11315

DQpIaSBDbGF1ZGl1LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENs
YXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUBrZXJuZWwub3JnPg0KPiBTZW50OiAxOSBPY3Rv
YmVyIDIwMjYgMTQ6MDANCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gY2xrOiByZW5lc2FzOiByemcy
bC1jcGc6IFNraXAgcmUtaW5pdGlhbGl6aW5nIE1TVE9QcyBhbmQgY3JpdGljYWwgcmVzZXRzIGZv
ciBzMmlkbGUNCj4gDQo+IEhpLCBCaWp1LA0KPiANCj4gT24gMTAvMTkvMjYgMTU6MzYsIEJpanUg
RGFzIHdyb3RlOg0KPiA+IEhpIENsYXVkaXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQGtlcm5l
bC5vcmc+DQo+ID4+IFNlbnQ6IDE5IE9jdG9iZXIgMjAyNiAxMzoyNQ0KPiA+PiBTdWJqZWN0OiBb
UEFUQ0hdIGNsazogcmVuZXNhczogcnpnMmwtY3BnOiBTa2lwIHJlLWluaXRpYWxpemluZyBNU1RP
UHMNCj4gPj4gYW5kIGNyaXRpY2FsIHJlc2V0cyBmb3IgczJpZGxlDQo+ID4+DQo+ID4+IEZyb206
IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4N
Cj4gPj4gV2hlbiB0aGUgc3lzdGVtIHN1c3BlbmRzIHRvIHMyaWRsZSwgYW55IG9mIHRoZSBJUCBi
bG9ja3MgbWF5IGJlIGluDQo+ID4+IHRoZSB3YWtldXAgcGF0aC4gRm9yIGEgZGV2aWNlIGluIHRo
ZSB3YWtldXAgcGF0aCwgdGhlIGdlbmVyaWMgUE0NCj4gPj4gZG9tYWluIChnZW5wZCkgZG9lcyBu
b3QgZGlzYWJsZS9lbmFibGUgaXRzIGNsb2NrcyBhY3Jvc3MNCj4gPj4gc3VzcGVuZC9yZXN1bWUu
IFJlLSBpbml0aWFsaXppbmcgdGhlIE1TVE9QIGJpdHMgZm9yIHN1Y2ggYSBkZXZpY2UgbGVhZHMg
dG8gc3luY2hyb25vdXMgYWJvcnRzIHdoZW4gaXRzDQo+IHJlZ2lzdGVycyBhcmUgYWNjZXNzZWQg
Zm9yIHRoZSBmaXJzdCB0aW1lIGFmdGVyIHJlc3VtZS4NCj4gPj4NCj4gPj4gSW4gYSBzdXNwZW5k
IG1vZGUgdGhhdCBpcyBub3QgY29udHJvbGxlZCBieSBmaXJtd2FyZSwgcG93ZXIgdG8gdGhlDQo+
ID4+IFNvQyBpcyBub3QgbG9zdCwgc28gdGhlIE1TVE9QIGFuZCBjcml0aWNhbCByZXNldCBzdGF0
ZSBpcyByZXRhaW5lZA0KPiA+PiBhbmQgZG9lcyBub3QgbmVlZCByZS1pbml0aWFsaXphdGlvbiBp
biB0aGUgZmlyc3QgcGxhY2UuIFNraXAgaXQgd2hlbg0KPiA+PiBwbV9zdXNwZW5kX3ZpYV9maXJt
d2FyZSgpIHJlcG9ydHMgc3VjaCBhIG1vZGUuDQo+ID4+DQo+ID4+IEZpeGVzOiA1Y2QzM2RiNTY5
NTYgKCJjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3IgTVNUT1AgaW4NCj4gPj4g
Y2xvY2sgZW5hYmxlL2Rpc2FibGUgQVBJIikNCj4gPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gPj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVq
QGJwLnJlbmVzYXMuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL2Nsay9yZW5lc2FzL3J6
ZzJsLWNwZy5jIHwgNCArKysrDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcu
Yw0KPiA+PiBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMgaW5kZXgNCj4gPj4gZjYy
OTNjOTY4YmNmLi4zZDIyODE0NTYwMzYgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcnpnMmwtY3BnLmMNCj4gPj4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1j
cGcuYw0KPiA+PiBAQCAtMzEsNiArMzEsNyBAQA0KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9yZXNl
dC1jb250cm9sbGVyLmg+DQo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPj4gICAj
aW5jbHVkZSA8bGludXgvc3RyaW5nX2Nob2ljZXMuaD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9z
dXNwZW5kLmg+DQo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3VuaXRzLmg+DQo+ID4+DQo+ID4+ICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3JlbmVzYXMtY3BnLW1zc3IuaD4NCj4gPj4gQEAg
LTI2OTcsNiArMjY5OCw5IEBAIHN0YXRpYyBpbnQgcnpnMmxfY3BnX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4+ICAgCXN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdiA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KPiA+PiAgIAlpbnQgcmV0Ow0KPiA+Pg0KPiA+PiArCWlmICghcG1fc3Vz
cGVuZF92aWFfZmlybXdhcmUoKSkNCj4gPj4gKwkJcmV0dXJuIDA7DQo+ID4+ICsNCj4gPg0KPiA+
IFBsZWFzZSBtb3ZlIHRoaXMgYWZ0ZXIgZGVhc3NlcnQsIG90aGVyd2lzZSBpdCB3aWxsIGxlYWQg
dG8gU0NJRiBub3QNCj4gPiBnZXR0aW5nIGNvbnNvbGUgcHJvbXB0IGR1cmluZyBzMmlkbGUgYXMg
cmVzZXQgaXMgYXNzZXJ0ZWQgZHVyaW5nIHN1c3BlbmQ/DQo+IEhvdyBkaWQgeW91IHJlcHJvZHVj
ZSB0aGlzPw0KPiANCj4gV2hvIGFzc2VydHMgdGhlIFNDSUYgcmVzZXQgaW4gczJpZGxlPw0KDQpG
b3IgZ2V0dGluZyBTQ0lGIGludGVycnVwdHMsIERNQSBuZWVkcyB0byBiZSBkZWFzc2V0ZWQuIFRo
YXQgaXMgdGhlIHJlYXNvbg0KRE1BIGlzIGRlZmluZWQgYXMgY3JpdGljYWwgcmVzZXQuIER1cmlu
ZyBzdXNwZW5kIFsxXSBnZXQgYXNzZXJ0ZWQsDQpidXQgYXNzZXJ0IHdpbGwgYmUgc2tpcHBlZCBi
eSBbMl0uIFNvIHlvdXIgY29kZSBsb29rcyBvay4NCg0KWzFdDQpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3RyZWUvZHJp
dmVycy9kbWEvc2gvcnotZG1hYy5jP2g9bmV4dC0yMDI2MTAxNiNuMTU5MQ0KDQpbMl0NCiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5l
eHQuZ2l0L3RyZWUvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYz9oPW5leHQtMjAyNjEw
MTYjbjIzODANCg0KQ2hlZXJzLA0KQmlqdQ0K
