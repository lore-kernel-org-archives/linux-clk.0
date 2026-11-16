Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794794979;
	b=gtvY4J2wdqf2q7sD/9KctzfP8OcubtgG+9WQsxGdKYpfqainWw/EgaKpc95nAhpxm3CV
	 bU/Uo24yTu3Ny9i0kArI7ywWlcRTRINCzhg+QAoOlUNu6SMS1zVcEuPGDJ1CERm8lMyIT
	 a3LhFqtEe1rtA1i9slXDea5RSmgh0j4ZsUHb0TB06qElPPRbrhh5SNl+V4czyqJZwodTp
	 wfziewxZnuwzStYTcVoo6/k3NZAeZwD3hVPBLMYlNPglwC6qhsU79NtGDI06KI4T6JOcu
	 9tzeBQaUjpaRgISxWtkyDpQDdC6dDaQy2AivAJKFypZJa/fV4fzXNn58vdRn7eIFYHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794979;
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
	bh=kguvMeAG+734dMSclFesJD0PaWewOZbvdI/0UhPwtJE=;
	b=34LFnnAh+1eNaA65B/wN3YXZ4EqsxABsFDghr/dhO54Lv/vZd4cTW8Mb2lmCSeOl3ZDW
	 LsE+r8nJzjP5ETyu4P5AY7a+NAdfUaHqvhYpUNiSWfhSM/kETSUYuUF6tMMKLWE6tUJR1
	 rWorhByTfe3Vn6iLxuWZp1aYkZxPXl9KyaDBU5zC0AEIhTn2EwWuIGvzefl4Zjgtam4/g
	 GD6yAHy8GLI2TaRL7OsAcvf++4w6oxxHbTM7D43K0TBhDmH9BlJaBRlt7ZV4DJwQf7a5g
	 Wan0RjW4Hbge82PFZWwwhWhfTs+cirq/LpupOMC3SUsMGSP/zEIZJNSV3185vwJFl8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.137
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2137.outbound.protection.partner.outlook.cn [139.219.146.137])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B74606A31C;
	Mon, 16 Nov 2026 02:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXchSpeCxj6SKS3obDqtTt+ov7DPeOp8wTgO63dW0HyF3HX+xuSZe8tY8+JlNbaeMhYaO5HlRSbJMTsygvda47ZNDdSfF3GQMKgBt5uie5XujrCj9vq/65g8/bU/fsw6HGN/lHrnmXHzmW4B0myMQJJJaUpY9wiNGW360KY0/ivMbVg7CKeict1ndMHLIer3eaWjvvjuvt6ynH1O4boeEAGV5WCt9WhzJxnu5x8rYbawuJHKlzZvVs1OWZN+hJ07R/8yxJ3n2f5HNqOXObMPQ/rxxVLvtid+5Y3XOvernloPWpoERHFP7LMhGW8zfh2R49w6JJOyeVTlQiuRxRONog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kguvMeAG+734dMSclFesJD0PaWewOZbvdI/0UhPwtJE=;
 b=SZ/uIKu5Caa56N1KIpsNeyF8hxrb5b1oRN8uhYlNKsyEzTMDJyK5sKSQ5V33uOpkzM4PmtVXQ7GzqFbUgh/PrN1RaymcajuB561dNc2u2o0FEPeakXYnNfX2CsnuPKEch3QZycbdyDakBNRXvI5tF+eiGG/Ast/3dEHHvwFliNSvRiQ1KC9Hv/lxLmTT00HzQI9j/6bjU9E+nRv+c/DLLsZiQq5+oyEd3LhKzsCB3x+rbdvCbgTM3vEEUIPk53H5FM2eW7f/YKJgRxj0/hofvobWSxYOjiFCB3PPz+Vh21xXsIfedxfAl//CfKtdCwaLh7hZyE4X5T7QEGL1+Op3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1266.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 02:09:25 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Mon, 16 Nov 2026 02:09:25 +0000
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
Subject: Re: [PATCH v1 4/6] clk: starfive: Add JHB100 System-0 clock generator
 driver
Thread-Topic: [PATCH v1 4/6] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Index: AQHdWv1vtBCSUoJXt0O7bBKqPZrfnbcvYmMAgADGoYA=
Date: Mon, 16 Nov 2026 02:09:25 +0000
Message-ID:
 <ZQ4PR01MB1202E4FEAE49C1FFC4705897F27C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-5-changhuang.liang@starfivetech.com>
 <179475230833.3873592.8310507156583636155.b4-review@b4>
In-Reply-To: <179475230833.3873592.8310507156583636155.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1266:EE_
x-ms-office365-filtering-correlation-id: e2d3495c-6428-4ac6-5d51-08df4386a32b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|38070700021|261021133027099003|56012099006|10067099003|4143699003|261022105027099003|261022075727099003|261021130227099003|261026140227099003|261026121527099003|261026135527099003|261022115727099003|261021121427099003|261026130827099003|261021135927099003|261028144727099003|261022113327099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 WQn0VZ7nSiaJ63XcFkCAnjAOzmXUG7IfgenJte0QHyfxapnWzF5880piP8XTbJ0Lgg5epk/CtKvET6O0eDT8iOt/b/iC9G2GjNDXXiq0O81obIABFY52FVkuJCwhuWyVCQfomJ2Deu/meCUqtz87BGv9UMObvjO1vfXJTC2CyfyTj3kFOpMil2j2DF0Np0sf367PTOS0QWWtRQCgboLrLafibpWQiESqshBF3kz08dF+N1E3PwjUROR171rJoWK51xy7QMTqujRH5TGjQG3brRv8O9Jf2vq9leiSKc3lzVp5ww8P7WgtnqAmguAQqDvve525Oc1ikTke/E/uG5RNAHW9Y2bPaJnsCmqTalMtLxRD8aNnyYJScGQ+bVF+tOR4ZqDHocEne7M0gpmfLeVycRj7OvJynblGEpGscg7P6MFY6U8yjdDEejqEA2hHdvHUNYcR+jBVpTdlz/nFj5yRAoXNoB+0MStTJYCbAMo0X33nQ1S0zizi8UmfTvX3pKq7pQNqfQXN90dwuXLyeBV1jnKqeY7KCYtAQtA406MREsVdd9dmnfo0+M22GUBf37KD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(38070700021)(261021133027099003)(56012099006)(10067099003)(4143699003)(261022105027099003)(261022075727099003)(261021130227099003)(261026140227099003)(261026121527099003)(261026135527099003)(261022115727099003)(261021121427099003)(261026130827099003)(261021135927099003)(261028144727099003)(261022113327099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0p4V3hHei8zb3RsMEd1WmE3RVZ1M2ZZZU9pcnZ1eUdiUXdKRGkzZmprZ09w?=
 =?utf-8?B?WHcxZWh3d1JycEZvR1kyTC82ZDdOQ21NOXh6Mmdqb1I0Mk1yMzhBSVVhMGxr?=
 =?utf-8?B?YzArYXlaQUJyUFVreGtUNjNMU1J2NHIzaG84Z1M4RVVzQm1LN3hTSS9qSGU4?=
 =?utf-8?B?TnpUN1M3YWxrZW43ZS9mSVMySW1rQmJzWTdpQmhsZ280WjhPbEZabkdrUWJP?=
 =?utf-8?B?QVlmUForZWtSNm1oaVYvWnArY1JJaUk4dXlVeFJsV1MyaGJSTzlObmFWZVZL?=
 =?utf-8?B?WWRUc2FyaEM4Y3U0c2JoY2R3MXhRSHorMFZJbUk1SXVIRnNabVBlSHZqalZz?=
 =?utf-8?B?RDRUZHhRSGszRUR3VTlvRzJIYURIMEJ5Rkl1RjUvZVNIQU5jamhqdVJucHM4?=
 =?utf-8?B?aWhWQiszRU9xVWFOZ2U0eHRZeHUwQUR1cGMyQ1RhUW5ueVdiUmV6L1RMcENF?=
 =?utf-8?B?RjRDNnFsMEJIZWU1RHVlZUNHRXFicDVCajhFcFM1eWFHeE90bTNJMFhmRW5r?=
 =?utf-8?B?M1RjY0ZZNGJxZnRCOVBYbzhUOUg4ZWw0STEwcVFwbzNZNTdxYUtPR1h2STB0?=
 =?utf-8?B?QUFJdFVVRU5Dc3NONE9nL1ZNd2NaV0dnUmQ2WnJjTXBsRDZYNnRVVGxRZXBB?=
 =?utf-8?B?Q0hnV040YXRNZ1JMVG54UGdlWlVNZ091cFZDV1M1eEJ5dVM5cmFnVERlekM1?=
 =?utf-8?B?N3F6eXhNSVpvdnkremE2c3lmUnRrSXpmbVAxQXFzcytzaDdjQThXMFBiZGVy?=
 =?utf-8?B?OUM0RzI3NmVHa3NvQU80WFRab3c2UHJIT1JTZUJsUW1LTWthN2RoT2JiTWZt?=
 =?utf-8?B?cng2YUpHZ2ZNQlVndG9PN1NmNGpZc0hlbHFIdE95eDh5dmVSWnBrK255MVVY?=
 =?utf-8?B?d1VVRHVmM01MMUJ6cUJCVkhSRDNlWFJhdlljbGUxbmtJMTdQc21RUHJoY2VZ?=
 =?utf-8?B?bjV2cXQvWTVnTHI5ejRtZktWdzBIM2NLNFZtRXUxVGY2VGdFSStveUlnVnlU?=
 =?utf-8?B?OFlhUVZoZVhDdmQvbENSTFlZNThSRTFnTUVHV3ptL25WNk5pUVFlYkVBYk1u?=
 =?utf-8?B?cTcxOU9td00rWWIxRFJhd0hOZU90NjFSRW1GYWNCQVR6QlRESnkxSlRJaml2?=
 =?utf-8?B?TUJGcTFBSGUyT1kyUWhmMUNpZENsQzBhZUZxeVh0S2FNSSsycXZuS2xLcHpq?=
 =?utf-8?B?OHFzVUIxamxWd0ZING9sYmxzb2xybWZPbFJldTY5b1lIS0R3Y3liZGRVT1NK?=
 =?utf-8?B?c2N5cU5NYldna3ZNRGtheHRROWNmZjBld1R3OU9HaGI0T1R4M1N1SFlQcU1r?=
 =?utf-8?B?RmpTTlB1Ym5WbUs3R1hSSnQ2VnpoL3FxbXA5cmZ5N1grQUcvdTBNUFU4YVZE?=
 =?utf-8?B?QXZ3cktkeldvSXBNcHE4N0lKcjJTc2NEajB4NDM3bDFMc1hVZmtielVuMTFR?=
 =?utf-8?B?UUlJOTByYUJOOVBkU09mTW5OVndhWUQ1L05vQ2tmYXcxM2xWOUpqbXlNdk1S?=
 =?utf-8?B?c1oza1k4c01oLzZUSU5vZkdnMlBxazYxZ3VUQnN6SGFZZnFkQVJsZWMrM2s1?=
 =?utf-8?B?QUh1dld4c290clNNZ254LzNZbXRjMG9DaEFFUi81T29PRTNZQ0Rod1E1bVF4?=
 =?utf-8?B?cVJTM0hPRTluVnp1RXp5UHREaG5DQjF3Y2NraDB6MmZHeHBQVC96YjRvNmta?=
 =?utf-8?B?ZldzRDhIMkFidzNMSDh5aDhtNXJuUGtxZEM3K2VIV3dmYW4yUVRzelJ5R1FH?=
 =?utf-8?B?TnZZWXJ1RXE3c292aEZKM0FYRVpyYkxUbm5rdVJtMEFHTmpoeGpNNWFJVnZM?=
 =?utf-8?B?RW1FVWFXU2U3OXhPMmdScDQvZ0ZXT3Y3RmQvVSsrRmgwOW5kSm1rcGNuWCs4?=
 =?utf-8?B?SjEyVHZ4NWJIY3NhcHozanMxSjNieGpwakR3aWp5N0NGdlRnSzJzUkpjb1Zw?=
 =?utf-8?B?T2xYYkVkSGpMNE5iMEZZdzFvTnZUY2tFeVZ4cWhrU0NNVm1TSll5MVhrWE9Y?=
 =?utf-8?B?MnYvcFVZeXhFcmRMTFhTZEx0WUhULzNBZ3Nmd2tMZjdtMTFadTE2S2h0ejl6?=
 =?utf-8?B?RWsxZVRFb1JPOGgyS0xPemp3NHZocS9hSzdvckgrb0JxNTRHZjlZM2ZpcUw2?=
 =?utf-8?B?TmY0amZuK2poTEpWblRsaUdnT29PbHpTbW5ZYitSVklJa1pJdnRBalI2U1pr?=
 =?utf-8?B?SzNvN2JPY0QvMWo5NkYvaWM1Y0QxOHhVbnhsNTdRRHA2WDhRMmdSazV0TDNX?=
 =?utf-8?B?OXlOekw3TWorb0RoVlBwTk1CUDNHT2ZkZEdKQWcyMDZqdytJRFd4elFOQXEv?=
 =?utf-8?B?SHlXZ0hQOGpaaTBaZnNnNFVNNXlkcFZPWjFIc1R3ZUxuWkpPazM3NDdEc0Yw?=
 =?utf-8?Q?MghtDxiBTe4nhX5E=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d3495c-6428-4ac6-5d51-08df4386a32b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 02:09:25.1809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVoLtPz40MfCa+D0aRbPU1tHGHMDqT9SiZUkLvqS0RUWNWrk4I1HzINr74vQ0URND9AZG12vtuuIX2oEwmWuR19Fe0sq0vZNQZHjcE/1u96XGFoA/2XQPwPMwwbAjU2b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1266

SGksIEplcm9tZQ0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gPiBBZGQgc3VwcG9ydCBm
b3IgSkhCMTAwIFN5c3RlbS0wIGNsb2NrIGdlbmVyYXRvciAoU1lTMENSRykuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZl
dGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNyArDQo+ID4gIGRyaXZlcnMvY2xrL3N0YXJmaXZlL0tjb25maWcg
ICAgICAgICAgICAgICAgICB8ICAxMCArKw0KPiA+ICBkcml2ZXJzL2Nsay9zdGFyZml2ZS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiA+ICAuLi4vY2xrL3N0YXJmaXZlL2Nsay1z
dGFyZml2ZS1qaGIxMDAtc3lzMC5jICAgfCAxNDggKysrKysrKysrKysrKysrKysrDQo+ID4gIDQg
ZmlsZXMgY2hhbmdlZCwgMTY3IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaGIxMDAtc3lzMC5jDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUyBpbmRleA0KPiA+IDkzYWJi
YjMxNTA2NS4uZjY2OTk4ZThlYjY0IDEwMDY0NA0KPiA+IC0tLSBhL01BSU5UQUlORVJTDQo+ID4g
KysrIGIvTUFJTlRBSU5FUlMNCj4gPiBAQCAtMjY4MzcsNiArMjY4MzcsMTMgQEAgRjoNCj4gCURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvc3RhcmZpdmUsamg3MTEwLXVzYi1w
aHkueWFtbA0KPiA+ICBGOglkcml2ZXJzL3BoeS9zdGFyZml2ZS9waHktamg3MTEwLXBjaWUuYw0K
PiA+ICBGOglkcml2ZXJzL3BoeS9zdGFyZml2ZS9waHktamg3MTEwLXVzYi5jDQo+ID4NCj4gPiAr
U1RBUkZJVkUgSkhCMTAwIENMT0NLIERSSVZFUlMNCj4gPiArTToJQ2hhbmdodWFuZyBMaWFuZyA8
Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiA+ICtTOglTdXBwb3J0ZWQNCj4g
PiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0YXJmaXZlLGpo
YjEqLnlhbWwNCj4gPiArRjoJZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoYjEq
DQo+ID4gK0Y6CWluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3RhcmZpdmUsamhiMSouaA0KPiA+
ICsNCj4gPiAgU1RBUkZJVkUgSkhCMTAwIEVYVEVSTkFMIElOVEVSUlVQVCBDT05UUk9MTEVSIERS
SVZFUg0KPiA+ICBNOglDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZl
dGVjaC5jb20+DQo+ID4gIFM6CVN1cHBvcnRlZA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9zdGFyZml2ZS9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9LY29uZmlnIGlu
ZGV4IDUxNzE2NjU1NTU0Zi4uY2IyNDZhZTEyYzA4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Y2xrL3N0YXJmaXZlL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9LY29u
ZmlnDQo+ID4gQEAgLTcyLDMgKzcyLDEzIEBAIGNvbmZpZyBDTEtfU1RBUkZJVkVfSkg3MTEwX1ZP
VVQNCj4gPiAgCWhlbHANCj4gPiAgCSAgU2F5IHllcyBoZXJlIHRvIHN1cHBvcnQgdGhlIFZpZGVv
LU91dHB1dCBjbG9jayBjb250cm9sbGVyDQo+ID4gIAkgIG9uIHRoZSBTdGFyRml2ZSBKSDcxMTAg
U29DLg0KPiA+ICsNCj4gPiArY29uZmlnIENMS19TVEFSRklWRV9KSEIxMDBfU1lTMA0KPiA+ICsJ
Ym9vbCAiU3RhckZpdmUgSkhCMTAwIHN5c3RlbS0wIGNsb2NrIHN1cHBvcnQiDQo+ID4gKwlkZXBl
bmRzIG9uIEFSQ0hfU1RBUkZJVkUgfHwgQ09NUElMRV9URVNUDQo+ID4gKwlzZWxlY3QgQ0xLX1NU
QVJGSVZFX0pINzFYMA0KPiA+ICsJaW1wbHkgUkVTRVRfU1RBUkZJVkVfSkhCMTAwDQo+ID4gKwlk
ZWZhdWx0IEFSQ0hfU1RBUkZJVkUNCj4gPiArCWhlbHANCj4gPiArCSAgU2F5IHllcyBoZXJlIHRv
IHN1cHBvcnQgdGhlIHN5c3RlbS0wIGNsb2NrIGNvbnRyb2xsZXIgb24gdGhlDQo+ID4gKwkgIFN0
YXJGaXZlIEpIQjEwMCBTb0MuDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N0YXJmaXZl
L01ha2VmaWxlDQo+ID4gYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9NYWtlZmlsZSBpbmRleCAxOTlh
YzBmMzdhMmYuLmQyYmE4M2Q3ZDAyYw0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xr
L3N0YXJmaXZlL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvc3RhcmZpdmUvTWFrZWZp
bGUNCj4gPiBAQCAtMTAsMyArMTAsNSBAQCBvYmotJChDT05GSUdfQ0xLX1NUQVJGSVZFX0pINzEx
MF9BT04pCSs9DQo+IGNsay1zdGFyZml2ZS1qaDcxMTAtYW9uLm8NCj4gPiAgb2JqLSQoQ09ORklH
X0NMS19TVEFSRklWRV9KSDcxMTBfU1RHKQkrPSBjbGstc3RhcmZpdmUtamg3MTEwLXN0Zy5vDQo+
ID4gIG9iai0kKENPTkZJR19DTEtfU1RBUkZJVkVfSkg3MTEwX0lTUCkJKz0gY2xrLXN0YXJmaXZl
LWpoNzExMC1pc3Aubw0KPiA+ICBvYmotJChDT05GSUdfQ0xLX1NUQVJGSVZFX0pINzExMF9WT1VU
KQkrPQ0KPiBjbGstc3RhcmZpdmUtamg3MTEwLXZvdXQubw0KPiA+ICsNCj4gPiArb2JqLSQoQ09O
RklHX0NMS19TVEFSRklWRV9KSEIxMDBfU1lTMCkJCSs9DQo+IGNsay1zdGFyZml2ZS1qaGIxMDAt
c3lzMC5vDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2
ZS1qaGIxMDAtc3lzMC5jDQo+ID4gYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUt
amhiMTAwLXN5czAuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi5kZDRkNjVmNGU2ODINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVy
cy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoYjEwMC1zeXMwLmMNCj4gPiBAQCAtMCwwICsx
LDE0OCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsv
Kg0KPiA+ICsgKiBTdGFyRml2ZSBKSEIxMDAgU3lzdGVtLTAgQ2xvY2sgRHJpdmVyDQo+ID4gKyAq
DQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBTdGFyRml2ZSBUZWNobm9sb2d5IENvLiwgTHRk
Lg0KPiA+ICsgKg0KPiA+ICsgKiBBdXRob3I6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcu
bGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiArICoNCj4gPiArICovDQo+ID4gKw0KPiA+ICsj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3RhcmZpdmUsamhiMTAwLWNyZy5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAiY2xrLXN0YXJmaXZlLWpoNzF4MC5oIg0KPiA+
ICsNCj4gPiArLyogZXh0ZXJuYWwgY2xvY2tzICovDQo+ID4gKyNkZWZpbmUgSkhCMTAwX1NZUzBD
TEtfT1NDCQkJSkg3MVgwX0VYVF9DTEsoMCkNCj4gPiArI2RlZmluZSBKSEIxMDBfU1lTMENMS19Q
TEwwCQkJSkg3MVgwX0VYVF9DTEsoMSkNCj4gPiArI2RlZmluZSBKSEIxMDBfU1lTMENMS19QTEwx
CQkJSkg3MVgwX0VYVF9DTEsoMikNCj4gPiArI2RlZmluZSBKSEIxMDBfU1lTMENMS19QTEwyCQkJ
Skg3MVgwX0VYVF9DTEsoMykNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qg
amhiMTAwX3N5czBfZXh0X2Nsa1tdID0gew0KPiA+ICsJIm9zYyIsDQo+ID4gKwkicGxsMCIsDQo+
ID4gKwkicGxsMSIsDQo+ID4gKwkicGxsMiIsDQo+ID4gK307DQo+IA0KPiBUaGVzZSBhcmUgdGhl
IGhhY2tpc2ggcGFydCBJIHdhcyByZWZlcnJpbmcgdG8uDQo+IA0KPiA+ICsNCj4gPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBqaDcxeDBfY2xrX2RhdGEgamhiMTAwX3N5czBjcmdfY2xrX2RhdGFbXSA9
IHsNCj4gPiArCS8qIGJtY3BjaWVycCAqLw0KPiA+ICsJSkg3MVgwX19ESVYoSkhCMTAwX1NZUzBD
TEtfQk1DUENJRVJQX05DTk9DX01BSU4sDQo+ICJibWNwY2llcnBfbmNub2NfbWFpbiIsIDYsDQo+
ID4gKwkJICAgIEpIQjEwMF9TWVMwQ0xLX1BMTDApLA0KPiA+ICsJSkg3MVgwX19ESVYoSkhCMTAw
X1NZUzBDTEtfQk1DUENJRVJQX05DTk9DX0NGRywNCj4gImJtY3BjaWVycF9uY25vY19jZmciLCAx
MiwNCj4gPiArCQkgICAgSkhCMTAwX1NZUzBDTEtfUExMMSksDQo+ID4gKwlKSDcxWDBfX0RJVihK
SEIxMDBfU1lTMENMS19QQ0lFX1JFRl9DTUwsICJwY2llX3JlZl9jbWwiLCAyNCwNCj4gPiArCQkg
ICAgSkhCMTAwX1NZUzBDTEtfUExMMCksDQo+ID4gKwlKSDcxWDBfR0FURShKSEIxMDBfU1lTMENM
S19CTUNQQ0lFUlBfTkNOT0NfREFUQV9JTklULA0KPiAiYm1jcGNpZXJwX25jbm9jX2RhdGFfaW5p
dCIsDQo+ID4gKwkJICAgIDAsIEpIQjEwMF9TWVMwQ0xLX0JNQ1BDSUVSUF9OQ05PQ19NQUlOKSwN
Cj4gDQo+IEkgdGhpbmsgdGhlIHY2IHRoYXQgY2FtZSBiZWZvcmUgdGhpcyBoYWQgYSBidW5jaCBv
ZiBjcml0aWNhbCBjbG9ja3MuIE5vbmUgb2YNCj4gdGhvc2Ugd2VyZSBjcml0aWNhbCBhZnRlciBh
bGwgPw0KPiBZb3UgZGlkIHRlc3Qgd2l0aG91dCBwYXNzaW5nIGNsa19pZ25vcmVfdW51c2VkIGlu
IHRoZSBib290IGFyZ3VtZW50cyA/DQoNClllcywgSSB0ZXN0ZWQgaXQgd2l0aG91dCBwYXNzaW5n
IGNsa19pZ25vcmVfdW51c2VkLCBhbmQgdGhlc2Ugc2hvdWxkIG5vdCBiZWNvbWUgDQpjcml0aWNh
bCBjbG9ja3MuDQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg==
