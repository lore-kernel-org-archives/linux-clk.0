Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17771F4C8E;
	Wed, 20 May 2026 05:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779253340; cv=fail; b=mHcVJAJ/nfpjq73tfBsS4U/gk3rAY6Su4UtgoMYKmwS0SxpH40z2n8+e814qO/WvbVZkOBBQ7Q7xJ+jy37Ck13wudIpJmccg7lsH9zIGqPj8fVutKHCwwVjj1Qi/u4n8peA3omsvgZgD4SuTWSwqpiPWOqERrwhEjXN8NHHXa7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779253340; c=relaxed/simple;
	bh=SbTa0nTmCtwqXNYvVsimUpytsMqrUUi4Pa3AZiIJmuU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VUWuTxwUBULTIpBGLE2bwwKy7p74JItQDpftI11K3xZyHCIN4hA/Od/1visvbvD6N4j8mPvmSLCV1uaFGCXRUDev8d5plDnzPttYIK3BmUkApqiGVSOxQql3Bzzm7AcBBT6SY2zljP/uaPa9FYByUYC+K5ppaXH6GofUCDO9yng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FW1EziSv; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FW1EziSv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDHZUcrJEfX4yUH88yXJxEGp40fB+UQzH7JUV9B704ztQ9iYCqYzKn3As07pSlg99n+j/Ulx6SVr2wTsBTfQ7uGuk4EI69fR71fXkTSqs3pDzeezFkGHCVxvrUxyA4GfphL6GfEh7EupcQ+qpPNkIOCTwC9CC+WR3EFVMxPTOZsVVsLndjoY4ceFE0Ng2vbgxmK7FHrD4mk4Ah87Nv0MjOk391Bz2RAqgvTcYPUzulQMNHjS1Z9VRoix2W4Uqi5L5NBNZ1oWr7uj+mdN4XpAwcOYoMgRfr62asqAzZDbvcO29PXuZhjKXDf1TpepNCt2gg6GojE34qoz+aCKEQrADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbTa0nTmCtwqXNYvVsimUpytsMqrUUi4Pa3AZiIJmuU=;
 b=NPhkkVLZ9Q2DkJ01wuFzAZZ1RAIN28xoRhWbXlimisA+pNBevAHeSMoJwFrK5b53TUdDWzTJbjIyBKiGbarR7T9uVs1MdTOiyLigsTDEeFu4+xl7Y+aieqWTDtJmi+Lb1sSlNjJfUemvKob2WKjH7gW2JqcLMf/kboU05/zpDvSC/6IvC4D8TOgBuFMhXMeaDOg6Qogkxy9M6hpDbmfndafyL8W+XdOtJapvee41X5xIowe36YatfmfZG9mhzHWyIw4Sz9OV8t7Y10kuwQVuiN9u2q1IbXT8sVKS9DMnrpXMP6Jyn2XKKMRL9MO7zoMA8vaorUp1naP07XiBbo778Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbTa0nTmCtwqXNYvVsimUpytsMqrUUi4Pa3AZiIJmuU=;
 b=FW1EziSvdc36zIRUWGsmCnff5U3MHsmrKEWUSFkOwWzN7pG0FG7irLO5x90uVX08JsuRUDLWyPvf09GaN1t3vrS/c3so3RkvIMQz1hoZfeQpvcsFroIt+dxDtr4LInQzIc9me+cv/FmeSrpfA8dmHn3lqsRK/WA2ueoLL0Tr2BdEj+ArafBM0Aj5BErg2jDapbdYTvYT0tA5923fb9mMQbpkdKRUb+ULw5aH6H5sAY2riuasWhUQBqXdhIntcHd05ki1yNbRU87VDn+kZJqh/pRZ8o2IMjFVa+NYyFgOgQ+Yr9IFEimD/tgNftiMElJ3r3qT7MuoJzaonSX606Df6w==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV4PR04MB11750.eurprd04.prod.outlook.com (2603:10a6:150:2da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 05:02:09 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Wed, 20 May 2026
 05:02:09 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Chancel Liu <chancel.liu@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
Subject: RE: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
Thread-Topic: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
Thread-Index: AQHc6BXPgNCM50qpqEmeoLzmqMDobg==
Date: Wed, 20 May 2026 05:02:08 +0000
Message-ID:
 <AM9PR04MB8353B563519EBC1AD6C5BFE1E3012@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-3-chancel.liu@nxp.com>
 <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
 <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
 <AM9PR04MB83538C4A07A6835FF8A74793E3002@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <20260519-macho-degu-from-nibiru-960af2@quoll>
In-Reply-To: <20260519-macho-degu-from-nibiru-960af2@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|GV4PR04MB11750:EE_
x-ms-office365-filtering-correlation-id: 2da22d74-15cb-4820-77a6-08deb62cf230
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|11063799006|4143699003|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 44++HgqiC+sPWnM7dBR9Iq8n01ABCGn23NuwzcIoZX/dUy6Mi/jt6/ygM1SUtTDh3BImenY9VbGqJLESvm1oTQuOaZCoHmTpfkgyDDU6AiicEPA4pHibhIPKjzPW54invPJQuwXXHs8oG0RGTmMgChoPet7EtbEOdAE6s/sLALSDXiGdN6pGO94DWoMrCZaPH7AKSKt6k0rKifO02LLBj2OJbwZt0xOsAL3+SeUAvky+7AEOWaS3bFtJAUQUpHIC0+vM0vHJvUWvKUgefZvYOQyldmCGTtwlKd6+tZYA+2Y4G8AmtVdSx8Ic6J5jJcIRJ8dShPjOKdqVYZXwba+Ej+WrZ9HGGxQNoZ7153Vv2y9GZSwG6GKT9oWCfKJYJraoM7AVwSgVC8HOMKvbp6vxfiLn5xieBLzIo82TeZ8EziPxfsB2TbELGYxE6nqRRABz0NajPiFBy9iiYKguoaNL3vyX2XtbOnUWSkQ/5TOHuSazeor2YTvq05hZjdTFaEuyxvaPKcol/wM6U6AcupLhdZBUp5OZE2R5cw0U5kVPxmnY4bRgSz77i7LpAONrU0qAyI5pBPy7FjT8tRvM/7aj+PerEOOAcle4EAm1mA6u6IjUV72jkawu71PxIHnwgZGDwJP8+kiENHPBuL9nxGW922NXrHuRWjyW3mD+aSG4s/bPUS3Kd5847XlY6mQJSktuhage1/NOOUPIs9CaifsaHAeA6zrglx3DXZhZoPc3Tw6//huQkxL/xXPDrE/uyq3l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWVrR1NOdmFoWGU4dHhBOUU1YjIvaURJZ1cyZFdpYVRwNkZ2UUdlVjZ3ek8z?=
 =?utf-8?B?RExPd0pBdk00bEF2QUtLZzR2SkZxY2xEMUNhQXNmd25ycmcvSFBidXN4R0d2?=
 =?utf-8?B?allmbDZNK1NDVFFEUjZOdFJDZFBSVUFPRXQvcnBYb3ZCWEt2a3B3dUp3YkRW?=
 =?utf-8?B?RXMrMHpJblBIYkRLMGMvOWRFT1k2eDdQQmFHQzZPWXhVTWZlRDBObDg5N0JU?=
 =?utf-8?B?UG9ZYVNvVHhXQlQzNVNPTnJnaGo0Sm5wekpEWVFaWHkvUUFCRXlNZEMzMTlJ?=
 =?utf-8?B?Q1RBK3hsdkNTanBZSmsxdWE5ZGNHT0FxcmJlbTBDc3JSUDZtc2E5NllKd1FF?=
 =?utf-8?B?V0pRVGVRakxYYUZ6RE02N2l0OHJQbm9QM1hZNk9EeXJKNUttYWYzdUM1cW9J?=
 =?utf-8?B?cXFTUnIvdlZDUjltNE1FTFZRQmZ4NU5ReEdDclA4R1A1R2hnNk5TVUJBQ01P?=
 =?utf-8?B?dWZ2cVZDSHNBbEg1N2s2U2xCN2FHdjFEL1gvYWpHUWFxZThCS21rc2lwMmVY?=
 =?utf-8?B?YWFqK21GclBVQTZrdmpUYTc3a29VdHM1a0ZjcXhEcnhhS0pJS0RNa3BWMmVu?=
 =?utf-8?B?aVdJQUdISkxVUStNVXhjaUZSeTEwTUxKVlN2cGJCSllTbEpQaFNtSWNHd29O?=
 =?utf-8?B?R2E2UU1ZQ1o4a1piZjJrK1lUdzFlNDRjam5QdzNnNnZtb1QwVXExMG1ySlNQ?=
 =?utf-8?B?d25lWXZkbFVoN0JEOUoyV3p5R1BZSnJIYmRuTGVoYlN5cDIxZ21FdmlLN2l1?=
 =?utf-8?B?SzZ0MGxsSDY4anhpclh0SWEyUDA2UkdDVGlsbERSUEJudmFHK3QrNGp6dUdW?=
 =?utf-8?B?bmtSakRaUmM5VkswT09ZYnpCT3E5RzMvanVmd2xPUzZOeWdzT2lqaEgvK1NO?=
 =?utf-8?B?WS9MWGJWMi92S1VscHJkZy85NjUrU29VZjM5YXYwZDYwbHFLdFdER01JaEtn?=
 =?utf-8?B?dk8xMk5hdU9XQVNudXNyTy90bUF0aWJ6ZTU4SVZ3U0JzTmFjRXlNeFlzbXV1?=
 =?utf-8?B?emZOWUR4cW5zTytsUHdFdEtoeFFaWDJuWHljREtIdEdtUVJaeE5kaE8zTXZ0?=
 =?utf-8?B?algrakRSZWtpc0xHbzlSQVZMa3R0eXZKb1ByeDFtTzVrWVRjUEpxT0pmQzUw?=
 =?utf-8?B?Yy92VEs1TkxWUStxb2RKRzE4NitEYklNVWxDZ1huWWVCQXV1VUd1YU92V0pz?=
 =?utf-8?B?Ni9yTFFua3Uzb1hQa2dkc3VDbmZpMHg5elZvZmtEb3FNVUNRaUdzd3AwdWJk?=
 =?utf-8?B?b0d3NHRHSXpqMEpjOGVUUEE2MzZCd1BjemdMa0dXTVorYm94YjUwUThpdys5?=
 =?utf-8?B?VGF3bkhjR0lGRHRlN1k3bXRKZDFaaGFYLzByTlJKYlhiMkdLeGUyNTBWaTI2?=
 =?utf-8?B?dTRiOTNpNURqNE1ZR09tQWNiM3VmS1puL2RMY1hOTDVidUErQmFxRVUrdnFl?=
 =?utf-8?B?SUxRdWVkbTVWcHJtbTJNSHhmamNjN2hWUVdrQndKYlBvTnNjZzVPNnFseDcv?=
 =?utf-8?B?cVFGdG9QVVMyME9TTW1ZcjRkK0JaQmxBdkhSYjZKRk1SUTYxOS96aHRyZzh3?=
 =?utf-8?B?WXU5bFRHTlp1ak93SmRURkVsY1NSbTlNR0V2K3VockVacE5QdDFRZktGNC9v?=
 =?utf-8?B?Q1dqRm4vdTVRaEllM2NoUE9Ta045dlp0NmU5aXJZcWtvY0l3L0RxdW1CTmNM?=
 =?utf-8?B?aEN6MkpQcWhVZ3JQVUVNeFY0MjlYM2NoUUpnNjdjRFdmK2ZYa09pQU1oV0Ez?=
 =?utf-8?B?S2xNKy9IYVFCUHVOMlBMSWJ3SGdDdTQ4dENXYjl4NWdjSzNPUmdZNzN3WTVY?=
 =?utf-8?B?SjBmWko2a1p1MUVzMlk0R0FtYkV2RldyRFhhUitmRlJjSDQzTERmSE9BOEk1?=
 =?utf-8?B?YTQzRkQvZURpVjJ4Y2hlSFhuREh3cUJWWUpkZlRLb1N6eTFhOGFHY1QvaGlu?=
 =?utf-8?B?SGRiaTg0Q0RiT3pnLzZYenBHcE5IU3Y3OGxxRXh6am1yK0cxZDdZVUFlZXhK?=
 =?utf-8?B?LzA3VzA4S2Yrd040QUdqQ2ZWc01ObjVMTmZlNlVWUHQ2b3ZETE5MaUJ1YTVS?=
 =?utf-8?B?cjFlTXovU05OdVlXOFlGRW5JeENQWURENDJ0M3VHeGlCdlVIdnQ4djJheFMw?=
 =?utf-8?B?VUNpaEdvWlhZVzNYZC9xUnVKSEg0ang3cjA3QUJMK0xyMks3YTVQVFVWMEJI?=
 =?utf-8?B?NHNwZmhIYkNHL3VNUlJhVVM1R2VWYVJZWUpaMWZqT3JjWjZPV202a2cxUFkz?=
 =?utf-8?B?dzhXTHRqL0tPRExrTlZXMlN6QnZFODdXUFlDOEJ5WG04ekg5MW44dHVaVE1X?=
 =?utf-8?B?dHAxMnVMV2JKOTVnb0txSkg3RDg0RVFNc2pNNHFxM0V5cm0zVlY0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da22d74-15cb-4820-77a6-08deb62cf230
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 05:02:09.1234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhneQio4H5xGwH8e2UWalPzikOWJ0IiVIiUcrMI/LbbwC+H+zUELD5Lf5yz7869UYQQS7FRbA1iIDpE7aGDJEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11750

PiA+ID4gPj4+ICtkZXNjcmlwdGlvbjoNCj4gPiA+ID4+PiArICBUaGUgTlhQIEkvTyBjb25uZWN0
b3IgcmVwcmVzZW50cyBhIHBoeXNpY2FsbHkgcHJlc2VudCBJL08NCj4gPiA+ID4+PiArY29ubmVj
dG9yIG9uIHRoZQ0KPiA+ID4gPj4+ICsgIGJhc2UgYm9hcmQuIEl0IGFjdHMgYXMgYSBuZXh1cyB0
aGF0IGV4cG9zZXMgYSBjb25zdHJhaW5lZCBzZXQNCj4gb2YNCj4gPiA+ID4+PiArSS9PDQo+ID4g
PiA+Pj4gKyAgcmVzb3VyY2VzLCBzdWNoIGFzIEdQSU9zLCBjbG9ja3MsIFBXTXMgYW5kIGludGVy
cnVwdHMsIHRocm91Z2gNCj4gPiA+ID4+PiArZml4ZWQNCj4gPiA+ID4+PiArICBlbGVjdHJpY2Fs
IHdpcmluZy4gQWxsIGFjdHVhbCBoYXJkd2FyZSBwcm92aWRlcnMgcmVzaWRlIG9uIHRoZQ0KPiBi
YXNlDQo+ID4gPiBib2FyZC4NCj4gPiA+ID4+PiArICBUaGUgY29ubmVjdG9yIG5vZGUgb25seSBk
ZWZpbmVzIGluZGV4LWJhc2VkIG1hcHBpbmdzIHRvIHRob3NlDQo+ID4gPiA+PiBwcm92aWRlcnMu
DQo+ID4gPiA+Pj4gKw0KPiA+ID4gPj4+ICtwcm9wZXJ0aWVzOg0KPiA+ID4gPj4+ICsgIGNvbXBh
dGlibGU6DQo+ID4gPiA+Pj4gKyAgICBjb25zdDogZnNsLGlvLWNvbm5lY3Rvcg0KPiA+ID4gPj4N
Cj4gPiA+ID4+IEV2ZXJ5dGhpbmcgaXMgSU8uIEV2ZXJ5dGhpbmcgaXMgY29ubmVjdG9yLCBzbyB5
b3VyIGNvbXBhdGlibGUgZG9lcw0KPiA+ID4gPj4gbm90IG1hdGNoIHJlcXVpcmVtZW50cyBmcm9t
IHdyaXRpbmcgYmluZGluZ3MuDQo+ID4gPiA+Pg0KPiA+ID4gPg0KPiA+ID4gPiBZZXMsIHRoaXMg
Y29tcGF0aWJsZSBpcyB0b28gZ2VuZXJpYy4gSSB3aWxsIHJlbmFtZSB0aGUgY29tcGF0aWJsZSB0
bw0KPiA+ID4gPiBmc2wsYXVkLWlvLWNvbm5lY3Rvci4NCj4gPiA+DQo+ID4gPiBhdWQgaXMgbm90
IG11Y2ggYmV0dGVyLiBXaGljaCBib2FyZHMgaGF2ZSBpdD8gV2hhdCdzIHRoZSBwaW5vdXQ/DQo+
IFdoYXQncw0KPiA+ID4gc3RhbmRhcmQ/IElzIGl0IGRlc2NyaWJlZCBhbnl3aGVyZT8gSWYgc28s
IHByb3ZpZGUgcmVmZXJlbmNlIHRvDQo+IHNwZWMvZG9jcy4NCj4gPiA+DQo+ID4NCj4gPiBUaGlz
IGlzIG5vdCBhbiBpbmR1c3RyeSBzdGFuZGFyZCBlbGVjdHJpY2FsIGludGVyZmFjZS4gVGhpcyBj
b25uZWN0b3INCj4gDQo+IFRoZW4gaWYgeW91IGRvIG5vdCBoYXZlIHN0YW5kYXJkLCB0aGVuIHlv
dSBoYXZlIGJvYXJkIHNwZWNpZmljIGxheW91dHMNCj4gdGh1cyB5b3UgbmVlZCBib2FyZC1zcGVj
aWZpYyBjb21wYXRpYmxlcy4gWW91IGNhbiB1c2UgZmFsbGJhY2tzLiBHZW5lcmljDQo+IGZhbGxi
YWNrIGNvdWxkIHdvcmssIGJ1dCBib3RoIGlvLWNvbm5lY3RvciBhbmQgYXVkLWlvLWNvbm5lY3Rv
ciBhcmUganVzdA0KPiB0b28gZ2VuZXJpYy4gRXZlcnkgY29ubmVjdG9yIGlzICJjb25uZWN0b3Ii
IGFuZCAiaW8iLCB0aHVzIGFic29sdXRlbHkNCj4gYW55dGhpbmcgY2FuIGJlICJpby1jb25uZWN0
b3IiLiAiYXVkIiBpbXByb3ZlcyBpdCBvbmx5IGEgYml0LCB0aHVzDQo+IGhvbmVzdGx5IEkgd291
bGQgZ28gd2l0aCBib2FyZCBzcGVjaWZpYyBmYWxsYmFjayBhcyB3ZWxsLg0KPiANCg0KSG93IGFi
b3V0IGJvYXJkIHNwZWNpZmljICsgY29tbW9uIGZhbGxiYWNrIGNvbXBhdGlibGUgbGlrZSB0aGlz
Og0KICBjb21wYXRpYmxlOg0KICAgIGl0ZW1zOg0KICAgICAgLSBlbnVtOg0KICAgICAgICAgIC0g
ZnNsLGlteDk1LTE5eDE5LWV2ay1hdWQtaW8tY29ubmVjdG9yDQogICAgICAgICAgLSBmc2wsaW14
OTUyLWV2ay1hdWQtaW8tY29ubmVjdG9yDQogICAgICAtIGNvbnN0OiBmc2wsaW14LWF1ZC1pby1j
b25uZWN0b3INClNpbmNlIHRoZSBkYXVnaHRlciBib2FyZCBpcyBuYW1lZCDigJxJTVgtQVVELUlP
4oCdIGluIHB1YmxpY2x5IGF2YWlsYWJsZQ0KZG9jdW1lbnRhdGlvbiwgY29tbW9uIGNvbXBhdGli
bGUgY2xlYXJseSBpbmRpY2F0ZXMgdGhhdCB0aGlzIGNvbm5lY3Rvcg0KaXMgaW50ZW5kZWQgZm9y
IHRoYXQuDQoNCkFsc28sIEkgd2FudCB0byB0YWxrIGFib3V0IHRoZSB0b3BpYyBvZiBnZW5lcmlj
IGNvbm5lY3Rvci4gSXQncyBhIGNvbW1vbg0KZGVzaWduIHRoYXQgZGF1Z2h0ZXIgYm9hcmQgaXMg
Y29ubmVjdGVkIHRvIGJhc2UgYm9hcmQgdGhyb3VnaCBhDQpjb25uZWN0b3IuIFRoaXMgY29ubmVj
dG9yIG1vcmUgb2Z0ZW4gYWN0cyBhcyBhIG5leHVzIHRoYXQgZXhwb3NlcyBhDQpjb25zdHJhaW5l
ZCBzdWJzZXQgb2YgR1BJTywgY2xvY2ssIFBXTSBhbmQgaW50ZXJydXB0IHJlc291cmNlcyB0byB0
aGUNCmRhdWdodGVyIGJvYXJkLiBDYW4gd2UgZG9jdW1lbnQgdGhpcyBraW5kIG9mIGNvbm5lY3Rv
ciBhcyBhIGdlbmVyaWMNCmJpbmRpbmc/DQoNClJlZ2FyZHMsIA0KQ2hhbmNlbCBMaXUNCg0KPiA+
IGlzIHByZXNlbnQgb24gaS5NWDk1LTE5eDE5LUVWSyBhbmQgaS5NWDk1Mi1FVksuIEZvciBleGFt
cGxlLCB0aGUNCj4gPiAiaS5NWCA5NSAxOW1tIHggMTltbSBFdmFsdWF0aW9uIEtpdCIgaG9tZXBh
Z2VbMV0gcHVibGljbHkgZG9jdW1lbnRzIGFuDQo+ID4gYXVkaW8gYm9hcmQgY29ubmVjdGlvbiB0
aHJvdWdoIHdoaWNoIElNWC1BVUQtSU8gY2FyZCBpcyBjb25uZWN0ZWQuIFRoZQ0KPiA+IGRldGFp
bGVkIHVzZXIgbWFudWFsIChVTTEyMDIyKSBpcyBsaXN0ZWQgYXMgb2ZmaWNpYWwgZG9jdW1lbnRh
dGlvblsyXSwNCj4gPiBidXQgaXQgaXMgYmVoaW5kIGFuIE5YUCBsb2dpbiwgc28gaXQgaXMgbm90
IHN1aXRhYmxlIGFzIGEgcHVibGljDQo+ID4gcmVmZXJlbmNlIGZvciB1cHN0cmVhbS4gVGhlcmVm
b3JlIEkgbGlzdCBpdCBoZXJlIHRvIGlsbHVzdHJhdGUgaXQncw0KPiA+IG1lY2hhbmlzbToNCj4g
Pg0KPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiB8ICAgICAgICBCYXNl
IEJvYXJkICAgICAgICAgICB8DQo+ID4gfCAgICstLS0tLSsgICAgICArLS0tLS0tLS0tKyAgfCAg
ICAgICAgICAgKy0tLS0tLS0tLSsNCj4gPiB8ICAgfCBTUEkgKy0tLS0tLSsgICAgICAgICB8ICB8
ICAgICAgICAgICB8ICAgICAgICAgfA0KPiA+IHwgICArLS0tLS0rICAgICAgfCAgICAgICAgIHwg
IHwgR1BJTyBNQVAgIHwgICAgICAgICB8DQo+ID4gfCAgICAgICAgICAgICAgICB8ICAgICAgICAg
Ky0tfC0tLS0tLS0tLS0tKyAgICAgICAgIHwNCj4gPiB8ICAgKy0tLS0tKyAgICAgIHwgICAgICAg
ICB8ICB8ICAgICAgICAgICB8ICAgICAgICAgfA0KPiA+IHwgICB8IEkyQyArLS0tLS0tKyAgICAg
ICAgIHwgIHwgICAgICAgICAgIHwgICAgICAgICB8DQo+ID4gfCAgICstLS0tLSsgICAgICB8ICAg
ICAgICAgfCAgfCBDTE9DSyBNQVAgfCAgQVVELUlPIHwNCj4gPiB8ICAgICAgICAgICAgICAgIHxj
b25uZWN0b3IrLS18LS0tLS0tLS0tLS0rICAgQ0FSRCAgfA0KPiA+IHwgICArLS0tLS0rICAgICAg
fCAgICAgICAgIHwgIHwgICAgICAgICAgIHwgICAgICAgICB8DQo+ID4gfCAgIHwgSTJTICstLS0t
LS0rICAgICAgICAgfCAgfCAgICAgICAgICAgfCAgICAgICAgIHwNCj4gPiB8ICAgKy0tLS0tKyAg
ICAgIHwgICAgICAgICB8ICB8ICAgICAgICAgICB8ICAgICAgICAgfA0KPiA+IHwgICAgICAgICAg
ICAgICAgfCAgICAgICAgIHwgIHwgSU5UIE1BUCAgIHwgICAgICAgICB8DQo+ID4gfCAgICstLS0t
LSsgICAgICB8ICAgICAgICAgKy0tfC0tLS0tLS0tLS0tKyAgICAgICAgIHwNCj4gPiB8ICAgfCBJ
L08gKy0tLS0tLSsgICAgICAgICB8ICB8ICAgICAgICAgICB8ICAgICAgICAgfA0KPiA+IHwgICAr
LS0tLS0rICAgICAgKy0tLS0tLS0tLSsgIHwgICAgICAgICAgICstLS0tLS0tLS0rDQo+ID4gKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+DQo+ID4gWzFdaHR0cHM6Ly93d3cubnhw
LmNvbS9kZXNpZ24vZGVzaWduLWNlbnRlci9kZXZlbG9wbWVudC1ib2FyZHMtYW5kLQ0KPiBkZXNp
Z25zL0lNWDk1TFBENUVWSy0xOQ0KPiA+IFsyXWh0dHBzOi8vZG9jcy5ueHAuY29tL2J1bmRsZS9V
TTEyMDIyL3BhZ2UvdG9waWNzL3BjaWVfaW50ZXJmYWNlMS5odG1sDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KDQo=
