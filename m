Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2124.outbound.protection.partner.outlook.cn [139.219.17.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A507A305674;
	Wed, 14 Oct 2026 03:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948736; cv=fail; b=P58zBhE9ee2L2D1lHeNPo96csBU3snJNRVJf/diqupVRRQBIi4IFYJyJtTJrBi0pMhN/5iiH7YMSTO1lbyaCfvjra7TBByK1gpKP2Vjv3qkWsVc/+xrrZ7L2ZjUIFsBHsRouIB8XZZWTGfEjGUFROX3cWH5V4F5oiCUyFyQgVxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948736; c=relaxed/simple;
	bh=L9BKYRgytyLAI6aAh4ayEyLeVwIuzKAlK9CQXkjyomo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IlT6+UFLexp7SvYqtutA1WrDFnvdaibqcaZjrwWxQUw1FBqtZ8y/7Bq1Hkwa30jbfP3v0buUKGJdTJG2SsVstEeQJnbOQel/6KDwXeRxSPikxio1pgYz4/qp/kmkFVlRHHDBfOcNMFA3RKZmtm19dhwoEE+RRYXYQVu4sSBskFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBHKbxoZ8MKyx8t2IIPPrzZ5viCKyh2H+jtDFDY5hV7ub6JFJuKszeLtowYP3sI8buzjk9UoRpROaTtVgc86uTAP8voe7px33ugbgyZxzHcYDFE6C+eRvBZFrDZij9eB7BVVLHFz4U4Qz6Hr1nqNpKbnxjuyhQqMCksmBPxeSzVV/fyad7Bh+QjC4/Yn8tOTWtRzY0GdMUAD2V+bSARh+QKWaBQbv+vB6XE1lIOHBqprNanAcBOr85MekDtF+CQEcH7aJRlZMp7M/bdKZdxG/v9Ocrmwgfw6IZYjEpLxm7DXUnbe2vZMSnX7EDY+7Rw5q42aKAe7pWgZLx5bEtReaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9BKYRgytyLAI6aAh4ayEyLeVwIuzKAlK9CQXkjyomo=;
 b=B77XTFBSwecAnWORYxTaTJ6eglbg5qFdyLrLrPQ+FHYnAfzf/aR/q7yyRWjFv+c9rAoC/48Xc6E4Og7XuyB3oJkTPzYfRRQMWISfXMZIpj+ErD2U6kdluhzUl0rQAUQ7QDlkcrnzOjFEU1sBX9EymZuMqswG6Nuv7nD0tGv+LapRa2RmhNG9fBYDBH0S/1nExOW/1WWuFVcWm2i0c2ca92TWnCTVyKqbT+tuOP8xGQq0J1SQDRLZwX80j7p+fovj3tj6v+rzBGJ5aB3WbP5uMCSU/kDp3Yd7dzj4TckCgyNU+C39vbe1/q5yGxDfCMIKNEUV24x7KPjWP3PLhze4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1217.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 03:16:13 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.012; Wed, 14 Oct 2026 03:16:13 +0000
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
Subject: Re: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for inverted
 divider clocks
Thread-Topic: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for inverted
 divider clocks
Thread-Index: AQHdVyFJ8jAQ4VCruUSgZzTm7XVqG7b5uLaAgAKtwRA=
Date: Wed, 14 Oct 2026 03:16:13 +0000
Message-ID:
 <ZQ4PR01MB12029910538E78B60432F9B8F29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-9-changhuang.liang@starfivetech.com>
 <179180050742.66744.154947682767663962.b4-review@b4>
In-Reply-To: <179180050742.66744.154947682767663962.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1217:EE_
x-ms-office365-filtering-correlation-id: 3dfebde8-80ec-4f78-5d85-08df29a1807c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|56012099006|4143699003|261009223027099003|18002099003|10067099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 ylp6664lxTbyt8PbZyWW+/5Q9OdV/R2DViGDJ+cQHWfluNSOq/qG5NKF7yiINjVnsOD4B3rq1P0+2+E+b2hhKKJ29UkOEKi0MzF6umb6Z27WhpOjWJRi/uSyoSs/PNBYlZ+7uuXjPz4rqyVlyPosVaeeJBBId89K+nLY41afR/c//H4TpkdcOQTXbC3jBSyO1LKKZQzqhShVCmuwXRT/obCtKbDZcdGJ0kkcPw64JIgkyRzywcdSxFDIiuDm0F3iM6JD/SSds6lwy9Nwd9/V4/dgTITzEjR0aGZsEp+NCRWPK5yetRyQIqgWowdF/E3eRMLNPRgSHSDbDYuOwMBgpMFpKEFAkFQYGrp1KlL5yFr8lhtZV7HGBymL7DveC4RVQgKtKy9Bkilvel/0q8r0hZPseN0mQE67AptUtX0G2BIuPucgzR67b2sNJs66VhadqYc0C2NgKDlJK8aOaVS21Iz0fSweyy1hURnW2HjLG+29B2e6F6HAAVxok541n4SBrFxc8rX9rgrCPmdaKsz2jQyPQx1JuXj4rSlWXYehlDJz2WoXH2mOZ428ob4MBZ3l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(261009223027099003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dngzc2d5TVMyTVhtSlhybmJPNW5FVHRwTVoyOTEyTlc1VUNCbnd4NGlTSVVF?=
 =?utf-8?B?ekpWRWR6ZlRBTk8yOUpGVUdGS2laeEhnODY2RVRUbXVMTXZCSXBPNTZVY3E5?=
 =?utf-8?B?YnF0UVMySWxCeExaS0VFZWYzUExUOUpRS1JWZEtWOXE2N3VLcUZFcGk3K3hK?=
 =?utf-8?B?UVJVOExBb2c0ZmtaMCt2QlY4UzAzczk4Rlk0cDF2d3RmVHhBVGFLSmFBQktM?=
 =?utf-8?B?Q2U1b2srcjVveDcwbFM5NU14NjBhQ3VxRTVSMHErUUJza0hFdk02MytVZ1ha?=
 =?utf-8?B?aFF4cVhVQVp6WmthMWcxcEc2NGhnRFJlamxzVGRyc3RzZDVwYitMODZzZHBz?=
 =?utf-8?B?TEs1VFl3M1BCa0VublRvVnFibjRza0NDZU9VYTdSNTZuY1NCMHQ4UkZTS3FY?=
 =?utf-8?B?NVZKaEVqSXpkektiOEp1eW9JbVB3SHlUWW5YbERTZHZmbDYxVmxaT0UzL01Z?=
 =?utf-8?B?QTZaZFR4U0xVaWxwRWhCYjVPK1JLQytJa1hHZUZjdFcraTYwZjYwUkQ2Wnpt?=
 =?utf-8?B?RVE1M1pMK2NYTC9vT2loRVhBbHY1MDFjRzhycG1Dc1ZCbzdvdjhpQVBIYkEv?=
 =?utf-8?B?dWtHUHdJdUpTRzY4RVNpTk9nSnliQzN5bjBmeFlDWnJuYTUzdXNVMWc0OEls?=
 =?utf-8?B?aGNYMkkvVVZkRG1ub2dobit4ZjdLSDFoakNSb3JmQm9oRVpaclFWeXUzZm1v?=
 =?utf-8?B?OXVCdzFsWFU2R1Evd2l3eFRDVUZxL1BJaHZHUGUvREhQRmhvTGpHUFk1czh0?=
 =?utf-8?B?RFVYdCttbEhRNlZtM2Vtc0VxSUFxb01kWUNxWjU3MjB0Q2tHL0RaNzJuL2JU?=
 =?utf-8?B?SktUd3ZDbUVPY01kbW8rOVVmWWEyL0psOWFoMmY2WTRzWHA2TXhTTUVPNWRO?=
 =?utf-8?B?ZzV4cjh4L09tcUVRdWNZWVc5OW14TzYreDdSNXh1bG1TY21mRlIzd2QveG5E?=
 =?utf-8?B?ajJOZW9CSEFmYVJVNVdVVUFwbEZXdTd3dGVISjFVeEZXS09neTJoTkhNTGVx?=
 =?utf-8?B?dkFORGJTM1dEV3A5Ui9RdXRCeG1qS0NZSG1EVnJHTWRKY3JaUzlNNXlIbENk?=
 =?utf-8?B?MjBsdlR6T1AyOXhuMVV4d3AzaGpzRlN0YWphcXp6OWx4ZEFTeUdOV3BKakZT?=
 =?utf-8?B?VHZaWjNzVy9CSDJXVkVXcmtwT1RvTXB4aExwV0RGSWV5WVZhN0VjNnFqYXdr?=
 =?utf-8?B?ejZWZURXYm9Ra2pWcWtQbjlod3hOZ2xlUWRIUTZ4QW5GODhTc0VqbTBkUDFv?=
 =?utf-8?B?UkFrV1VqYjdLT1VQTEs4b1FTQnJEdEMxWlM0S1BaUlNoeXpIam9MaE0yOG1X?=
 =?utf-8?B?NHFIQnlMbDZKQU5waDRHbGNXUVZwRVJMVjFuWHVKTGxHMWdWclc5VzRZSitl?=
 =?utf-8?B?aHRKSUJMMjhpV2lpRFNkSDhLME96Yzh3TDNiMmx2OUdBT0ltbmxOT1FDdXI3?=
 =?utf-8?B?eFFZTG5zeDUzRW1kT1psUTZwd3Nva1pPWFZnQ1puR3RxQnkwN29KZ01ZSlVY?=
 =?utf-8?B?R08wQWk2V21XLzJwTWdBT2NwMnpEVUx4UnFTOUE1TkFCUkVGcGViYmsxbFlC?=
 =?utf-8?B?UEs0aU1ZY0ZGbTF5ZEMwL25ub2dwVVlTaG5BUG9EMmxabmJCZUF5cW1Yb2pB?=
 =?utf-8?B?QWI4SzVPREFMR2RyUkZiVkNpT2FHSnhkUnhaaTJ2cVRxeENhYkZ3M2JaSjFP?=
 =?utf-8?B?RGpGT3RTWU5HanJRU1VzckRsRzZsdGJUSkZMb0NYci9aL2RHejRIR1ovcEJI?=
 =?utf-8?B?TlZNMDNXeFVwc2k2Y1orMUxIRDNWR2UxTjFnRk5TRUJZNVJmbTRIYTkwQVpI?=
 =?utf-8?B?anRGUGxzeFI5ZDhRclhuMTVrNTNia2hFY2VaVmxENGJVL3FvSWtoVERiUXY3?=
 =?utf-8?B?Nm1wVFVFcEN1VEs5TUpnM3UyWnd3bXJpMnFVWGd4NTA4NFpaMUFSbFZsaWlU?=
 =?utf-8?B?UzBtM1NqOXl3ZHlyNVNZMkNNYVc4aHJ1QUZ2NFZyS3pZa1lvWkpUQmdiOHNi?=
 =?utf-8?B?Zy9lZ0hsTEEvUU5abGt1Y0R5OU5hMU5wZE1jK3JLWUlGcWFxVnhUQTgzNkxP?=
 =?utf-8?B?MkNGZy9jQWdWdUN5QkpXQ1VIeTdxQjZsQ3JXVjNsU000QkcwR3dReWxMaDE5?=
 =?utf-8?B?Z0ZkNkkwUElDZDQrKy9ySWtZNFZRTTZPd3kveU8zbXVXaGxOWkpSSUpXSVRo?=
 =?utf-8?B?OVZOd0RBVnp5SlF0MUo5RFZ5VVdtM0dUbTd2UnFKMEFmYjZyakp3VTd0QVFO?=
 =?utf-8?B?M05EY3NGMDlOeE1ic0RaalY1QUwycjJYeThWSVR2NEw0eDM1VEpZZnlDTXRL?=
 =?utf-8?B?dEhHbFNwbVRtcVc1MlVocTlKSmV0dWoyZGYrYUVtSHk5a3pXTzBtNlBlRnRM?=
 =?utf-8?Q?IKP80DJrcYibO/qw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfebde8-80ec-4f78-5d85-08df29a1807c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 03:16:13.1926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p9k/d1Yba+RVMT04WU4X/rw4GtAnftpxtaj2kfnrmb0PT8ZSC4tMy+m7E3k5NGdIKN84AjJEYVHI88ilktKloNelSDDzrd6wh1S0DQZMGK6u++kBWuwFPv7G65REubeK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1217

SGksIEplcm9tZQ0KDQo+ID4gU29tZSBTdGFyRml2ZSBjbG9ja3Mgb25seSBhZHZlcnRpc2UgdGhl
IGRpdmlkZXIgYW5kIGludmVydA0KPiA+IGNhcGFiaWxpdGllcyAodmlhIEpINzFYMF9DTEtfSU5W
RVJULCB3aXRob3V0IEVOQUJMRSkuIEFkZCB0aGUNCj4gPiBKSDcxWDBfSURJVigpIG1hY3JvIHRv
IGRlY2xhcmUgc3VjaCBjbG9ja3MsIGFuZCBqaDcxeDBfY2xrX2lkaXZfb3BzLA0KPiA+IHdoaWNo
IGNvbWJpbmVzIHRoZSBkaXZpZGVyIHJhdGUgb3BlcmF0aW9ucyB3aXRoIGdldF9waGFzZS9zZXRf
cGhhc2UuDQo+ID4NCj4gDQo+IFBsZWFzZSByZXBocmFzZSwgSSBkb24ndCB1bmRlcnN0YW5kIHdo
YXQgeW91IG1lYW4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hh
bmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2Ns
ay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MXgwLmMgfCAxMyArKysrKysrKysrKystDQo+ID4g
ZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoNzF4MC5oIHwgIDggKysrKysrKysN
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpo
NzF4MC5jDQo+ID4gYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MXgwLmMN
Cj4gPiBpbmRleCBjNWVlODJkYjNjOTIuLjIyNGZjYzNkMDhkYiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MXgwLmMNCj4gPiArKysgYi9kcml2
ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MXgwLmMNCj4gPiBAQCAtMzAzLDYgKzMw
MywxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgamg3MXgwX2Nsa19pbnZfb3BzID0g
ew0KPiA+ICAJLmRlYnVnX2luaXQgPSBqaDcxeDBfY2xrX2RlYnVnX2luaXQsICB9Ow0KPiA+DQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBqaDcxeDBfY2xrX2lkaXZfb3BzID0gew0K
PiA+ICsJLmdldF9waGFzZSA9IGpoNzF4MF9jbGtfZ2V0X3BoYXNlLA0KPiA+ICsJLnNldF9waGFz
ZSA9IGpoNzF4MF9jbGtfc2V0X3BoYXNlLA0KPiA+ICsJLnJlY2FsY19yYXRlID0gamg3MXgwX2Ns
a19yZWNhbGNfcmF0ZSwNCj4gPiArCS5kZXRlcm1pbmVfcmF0ZSA9IGpoNzF4MF9jbGtfZGV0ZXJt
aW5lX3JhdGUsDQo+ID4gKwkuc2V0X3JhdGUgPSBqaDcxeDBfY2xrX3NldF9yYXRlLA0KPiA+ICsJ
LmRlYnVnX2luaXQgPSBqaDcxeDBfY2xrX2RlYnVnX2luaXQsDQo+IA0KPiBJbnN0ZWFkIG9mIHRy
eWluZyB0byBjb3ZlciBhbGwgdGhlIGNvbWJpbmF0aW9uIHRoYXQgY291bGQgZXhpc3QsIGNhbiB5
b3UganVzdA0KPiBjaGFpbiAyIGVsZW1lbnRzID8NCj4gYSBkaXYgdGhlbiBhbiBpbnYgPw0KDQpU
aGlzIG1heSByZXF1aXJlIGludHJvZHVjaW5nIHF1aXRlIGEgZmV3IG5ldyBjaGFuZ2VzLg0KDQpJ
biB0aGUgY3VycmVudCBjb2RlLCBzdHJ1Y3QgY2xrX2h3ICpodyBpcyB1c2VkIHRvIG9idGFpbiBz
dHJ1Y3Qgamg3MXgwX2NsayAqY2xrIHRocm91Z2ggaHcsIGFuZCB0aGVuIHRoZSByZWdpc3RlciBv
ZmZzZXQgaXMgb2J0YWluZWQgdGhyb3VnaCBjbGstPmlkeC4NCg0Kc3RhdGljIHZvaWQgamg3MXgw
X2Nsa19yZWdfcm13KHN0cnVjdCBqaDcxeDBfY2xrICpjbGssIHUzMiBtYXNrLCB1MzIgdmFsdWUp
DQp7DQoJc3RydWN0IGpoNzF4MF9jbGtfcHJpdiAqcHJpdiA9IGpoNzF4MF9wcml2X2Zyb20oY2xr
KTsNCgl2b2lkIF9faW9tZW0gKnJlZyA9IHByaXYtPmJhc2UgKyA0ICogY2xrLT5pZHg7DQoJdW5z
aWduZWQgbG9uZyBmbGFnczsNCg0KCXNwaW5fbG9ja19pcnFzYXZlKCZwcml2LT5ybXdfbG9jaywg
ZmxhZ3MpOw0KCXZhbHVlIHw9IHJlYWRsX3JlbGF4ZWQocmVnKSAmIH5tYXNrOw0KCXdyaXRlbF9y
ZWxheGVkKHZhbHVlLCByZWcpOw0KCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnByaXYtPnJtd19s
b2NrLCBmbGFncyk7DQp9DQoNCnN0YXRpYyBpbnQgamg3MXgwX2Nsa19lbmFibGUoc3RydWN0IGNs
a19odyAqaHcpDQp7DQoJc3RydWN0IGpoNzF4MF9jbGsgKmNsayA9IGpoNzF4MF9jbGtfZnJvbSho
dyk7DQoNCglqaDcxeDBfY2xrX3JlZ19ybXcoY2xrLCBKSDcxWDBfQ0xLX0VOQUJMRSwgSkg3MVgw
X0NMS19FTkFCTEUpOw0KCXJldHVybiAwOw0KfQ0KDQpUaGVyZWZvcmUsIHRoZSBleGlzdGluZyBj
b2RlIGhhcyBvbmUgc3RydWN0IGNsa19odyBjb3JyZXNwb25kaW5nIHRvIG9uZSByZWdpc3RlciBv
ZmZzZXQuDQoNCklmIGl0IGlzIHNwbGl0IGludG8gYSBkaXYgYW5kIGFuIGludiwgdHdvIHN0cnVj
dCBjbGtfaHcgZGVzY3JpcHRpb25zIHdpbGwgYmUgbmVlZGVkLg0KVGhlIGpoNzF4MF9jcmdfcHJv
YmUoKSB3aWxsIG5lZWQgdG8gaW1wbGVtZW50IGRpZmZlcmVudCBicmFuY2hlcyBmb3IgZGlmZmVy
ZW50IGNsb2NrczoNCg0KaWYgKGEgZGl2IGFuZCBhbiBpbnYpIHsNCiAgICBkZXZtX2Nsa19od19y
ZWdpc3RlciAoZGl2KQ0KICAgIGRldm1fY2xrX2h3X3JlZ2lzdGVyIChpbnYpDQp9IGVsc2Ugew0K
ICAgIGRldm1fY2xrX2h3X3JlZ2lzdGVyIChvdGhlcikNCn0NCg0KRG8geW91IG5lZWQgbWUgdG8g
bWFrZSB0aGlzIHBhcnQgb2YgdGhlIGFkanVzdG1lbnQ/DQoNCj4gPiArfTsNCj4gPiArDQo+ID4g
IGNvbnN0IHN0cnVjdCBjbGtfb3BzICpzdGFyZml2ZV9qaDcxeDBfY2xrX29wcyh1MzIgbWF4KSAg
ew0KPiA+ICAJaWYgKG1heCAmIEpINzFYMF9DTEtfRElWX01BU0spIHsNCj4gPiBAQCAtMzEzLDcg
KzMyMiw5IEBAIGNvbnN0IHN0cnVjdCBjbGtfb3BzICpzdGFyZml2ZV9qaDcxeDBfY2xrX29wcyh1
MzINCj4gbWF4KQ0KPiA+ICAJCX0NCj4gPiAgCQlpZiAobWF4ICYgSkg3MVgwX0NMS19FTkFCTEUp
DQo+ID4gIAkJCXJldHVybiAmamg3MXgwX2Nsa19nZGl2X29wczsNCj4gPiAtCQlpZiAobWF4ID09
IEpINzFYMF9DTEtfRlJBQ19NQVgpDQo+ID4gKwkJZWxzZSBpZiAobWF4ICYgSkg3MVgwX0NMS19J
TlZFUlQpDQo+ID4gKwkJCXJldHVybiAmamg3MXgwX2Nsa19pZGl2X29wczsNCj4gPiArCQllbHNl
IGlmIChtYXggPT0gSkg3MVgwX0NMS19GUkFDX01BWCkNCj4gPiAgCQkJcmV0dXJuICZqaDcxeDBf
Y2xrX2ZkaXZfb3BzOw0KPiANCj4gR2l2ZW4gdGhlIGJyYW5jaGVzIHJldHVybiwgaWYgd2FzIGVu
b3VnaCBhbmQgeW91IGRpZCBub3QgbmVlZCB0byBtb2RpZnkgdGhlDQo+IGV4aXN0aW5nIHBhdGgu
DQo+IA0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQoNCg==
