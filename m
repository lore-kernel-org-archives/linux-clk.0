Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2103.outbound.protection.partner.outlook.cn [139.219.146.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3D038F23A;
	Tue,  7 Apr 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545016; cv=fail; b=dSeq0Z4xj6RzwLfTTq+HgsycKpcONYkv3+nDpm8JPjik4lnb+X2mlk7umfznY7+yCxN63J24dgpNKhFP5q93dTjce7Ox5Z2SJoYabR/8VP1BRlRs+ekbBWGaupg5ysUbFq1lhFSms006o4guc9mSV/FUw/nFO4O0dx8kSTl4UD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545016; c=relaxed/simple;
	bh=lLGt9MXahYDtEPVvXNWAq3e5AIjiqbZAY5gkHL+YDUo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I2jn1ycDhOvRiMq2/KUkEk8QSu9dU/kNs1OUm232GWzcEqULraw0rlHheIBh08fTMFGcDwL92XT1Rrto8pk8EOaTBQjZ7YswMc8McupiuO7mxvGNzf7DYYQG6AmWk0MZOXNLtuQNSrpf3KDX1RydOeJLL2AfS8xpENxyiNWo1zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUZ4GKZWqr2zfM7H8uApgyUhpehvj72SBZv4C+BF6AxON/AsSvR/uztI5xBh6FvF+0GIDv2cQnd8L4oQlMh2KOWRsB90Xx4Gvt9h/cmHXpJEkiTkYs79XYoeDdI5yKEqe434xGp3lIuxTqn2usF5/9rqCQSxNzNdqZq8zpUhoFdO7C/JkvV5pkViQ8uia09cbJFbx1YIJ0FfOgulskhah8k5VR3wz6iRXZunIqk+jYeO6HMWM+sVBU7n1UICQ0zRgfXCLo1r4FUXVC24iaUT2srxLkuIyLLI82h5goAv+qlf4+rHH3VkCkfFh6PF+cBdHWl4gTfmL05vngTJUFLOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLGt9MXahYDtEPVvXNWAq3e5AIjiqbZAY5gkHL+YDUo=;
 b=QqMuls/bx/sIUvhpgON0T50bF+d/fu0Kl7/HhYywJaoJhEGzaexukp92Gr/UHOw29J0TthQUdRCYXPihgMZezz/VO9OR4fqzbywHZtB2XhqcaqXEuy2FUjdnngF70HKWu1EM/6GrCoA57+qBQ/0SZl4tlZ5hRZWoBLA7w/R6mLdp6xoIs0/J49OPePSUySC7TO40P6GnRh1Lvanx0Zqr1tIxdLoA5DoCM+OoVmyZAm1dbQY3vQqgl3sxy429yAqlQNyHmkxoa5AX9oF/S+wbybkTHZfyaO8bE7gEMd+miqEUvk1z/QL9eYtEf4UzAyuoqiIJ3DxVDOLJVy5UEn4OUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1169.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.38; Tue, 7 Apr
 2026 06:56:43 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Tue, 7 Apr 2026 06:56:43 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Alexey
 Charkov <alchark@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 02/13] dt-bindings: clock: Add system-0 domain PLL
 clock
Thread-Topic: [PATCH v1 02/13] dt-bindings: clock: Add system-0 domain PLL
 clock
Thread-Index: AQHcwy22YPp12r/yEUmhen/Q/gxFdLXQEmAAgAMepYA=
Date: Tue, 7 Apr 2026 06:56:43 +0000
Message-ID:
 <ZQ4PR01MB120275BC5277C4FF18A738E6F25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-3-changhuang.liang@starfivetech.com>
 <20260405-godlike-pistachio-mackerel-7ab494@quoll>
In-Reply-To: <20260405-godlike-pistachio-mackerel-7ab494@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1169:EE_
x-ms-office365-filtering-correlation-id: 5d0d7a23-e1c4-4e99-c4f6-08de9472d3ce
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 jIiY8mgQlwAz9VTsR4IQy0tmTU3DvfD2fa9DhqcgEqq4LnyxvgxSGOrkjTkN2Idr1eYStnp0yTlD0RkLWoR1ua4OXqjQUB8y6ViDaodyeJjAuYQFZ1CqsA3j2ZfoQ8C6S6uc+T/KqqYVtWhKnilXrrSMqGAr0eQ5Q4+1HbbUpurBGmSirsxW8EB8s6L4dGuszZ4Qbwbi6hqZyysayhMIY5tYlqVgaCOi8RWUaJ6kjqnTKnHqrigL/Dz0pX886/U3dd1+j31JYEAinfmZbLon/uJTkyD7K3YPHRDRzaiLKNUqziCIwVTGw8yPauXeBs+Tf3XAM4ihYFsZ6Zce5Ax6Pi13pp/dXPtm/l5y135h3b9dFZYmNYgAZ9u6cFm+csOqeuogGuOVTy2Iq51wppXb+oIWRE+jpudlOFj+CoGguRVCeYJwlPW0rIkap+v/amhMTEYIe2wbdN2eHUaEm4rz6wMyjHNhT0Xvu6K1/0u8M2kELU3GajHQoZjJubXlKr2yCCbADyK6M8oSYyPWLk/yNWrO4tbeRcwPY92dlIN8VHg0CoctNfXeIJshdjPXuV3O3ABfD10l/dc/njQea+CgpMRkeZTZ13wbgL5nq6CzlrA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1lac2hQbVNFK2J5T0NIKzM4VUhjT3pmNWJwa255bHFNODVYa28wS0hnSFNM?=
 =?utf-8?B?Uk52ZDFudmFHUElGcWtPNWpTSEhnOFM2RzBCWTIrY0xReUFjbnBIUGxEZ1JH?=
 =?utf-8?B?TE9oVXRpcGtsRGFDRUw1SWpVNkU3Z1NqRnkxL2lXSkhOWVpNV2gwcGVEWDBS?=
 =?utf-8?B?bkxpK0RQN3A1b0RWR3BmR2hwakMwbC8yd0FHWWhXRDhoVFZWUk0zVTNlM2Vz?=
 =?utf-8?B?MVFDNWVKdXpORWlYSnhrd1o1aEdrWG5Lemw5bmxXUFRuMGNmem01eVBoM1Nl?=
 =?utf-8?B?MVhZNXFUR0c3dllvR0N2Q3BTNVZuSjRyM01wMDl0QzZjd3MzZUFncElRZXJT?=
 =?utf-8?B?YTUwb3RpRUNDbEQrUE9JdC9NeGEvT3BrNTk2cGYzMzhLWDJzWXdlTlNsOFJ4?=
 =?utf-8?B?UHBnUEtxQWJ5dlpKZHc0TjRabVdHbHdZcW8vRFBaT0ViYVNJcDh6UTZiYzV6?=
 =?utf-8?B?S3grTGdCRElOVENoRk1xN1pRRkl4NFl2TEdSemE2QVpVQ0ZVblo1ejhjazM1?=
 =?utf-8?B?ckxJQ3FIaWZubEpqUzkyV3BWOUhHSWw0QWJlVWk0c0MxdHl4UFFaTXJJREVR?=
 =?utf-8?B?NlczUWh0VlRsUi9lNEM3ay9KYWc0WDdBRWw5VERxdXJFSy9XOW9reGE3MnpB?=
 =?utf-8?B?TjFpdzd2UnRVUUFhQVJDckdSaTU1c2JqdEs2WDNTNlFrUEVMeWhTcXgyNHJx?=
 =?utf-8?B?U0JkbE1JRDR5WDVzOXUvZHBwaG5peDhTWkhPVVo1RFUrUmFLYjU2YkVTR3Bl?=
 =?utf-8?B?eFlDcTBBVjVySGk2eGcwUnlQSEVRWGs0UmFoTkdEclNSMUxlOXRsT3Bhd3da?=
 =?utf-8?B?T1NqZW1aZzNoQzhJUWliR3RaT2pkUlRyYy9mWXRaR3E4RTB3WDN3RFNISzVy?=
 =?utf-8?B?SER2VUhTQ0t3UXhUbmQxajI5VXZ2YlorNkRad3dJMjh3L3dxRS82cHRDb1VZ?=
 =?utf-8?B?OS9Cd0E1Nmp5Tk5ha0JCNXpaNlplMEd4aDBMYlN0VFc4OHlkcm1ZUVk3TEdY?=
 =?utf-8?B?K3BQUVFzSlFuMGgzYzFNU0RDc0hGUEkwbFJ3VVBlK1p2OFhNVlFMQ3Naam5v?=
 =?utf-8?B?a3lVbGtDcjd5aS81dFdjSGlzOTFlejJzRWRRZ1VyNnpTV0xTRldiMDJjMElY?=
 =?utf-8?B?U01WZDl1SUhTbmtONnRQQUFLd2JqczJSWWdtd3JjUGdqbUNIZC9FSU84dll4?=
 =?utf-8?B?RE01N0Q2VTRjRnZEdU9sNEFNVVM4UmhCbWtIWEFDRXcrT1c5QWtmdDRNRnpy?=
 =?utf-8?B?Szg5L2VQTDhlZE8wMWlGRlF1MllON0t5TnhpVkVkT3NuVWJmWlVyRnoycDli?=
 =?utf-8?B?UlB6cHE5QmtaMENSZ2g5ckdBb2tXWFBMVUtWYWNIem9qVjhQU1RQNDBPckZU?=
 =?utf-8?B?VzNDL0x1bVBja3NIT21EVnMxeCttUzBHUTE4bUVxRHVEeTA2b05RbjV0RnJR?=
 =?utf-8?B?ZVdxMmg5K1hHUm82T3Naczd5VTNMdDlOZUFDUXpvYUNLUkttN1dCSkUzNkx3?=
 =?utf-8?B?Y3dzMXM2Slk1a0VNa1h3M2s1S25WbFNVNjY1T1NpOWdyNEhvU1k3RHpNdWZx?=
 =?utf-8?B?OVdYY09QbFRJTDBQMXc3eDNTU1dxYU1GN3hwT2dEZGNEWStuTy9Wc3J1OXBs?=
 =?utf-8?B?TmU1eXpoODE0dGlDakM0MmJDZ2ZqMSt1TWRqb0h0bEdMUGhjOHV0T3B0L0hC?=
 =?utf-8?B?cnMvcTl2N1I5TUU3MzNhZkRka1hlUkJyVncydHNBdXY4eDJrSGNIQU1ybE9Q?=
 =?utf-8?B?UFBEdkh5czJYcnk5cy9PQUVlRWQyV3RpbHBtTVpLWVU3c3Z2UXM4SjZpMklT?=
 =?utf-8?B?T0RmZHhLT3lYMlpuczlLUGNjRnV2eUdibTBJN081Z1hWQjVsUldHcm84UStX?=
 =?utf-8?B?U0gwbGx2Y1NGZWFjY2p3S01TMnRJUy9VWjZpVzBneFlpMHdCbU9yTnJTQ2My?=
 =?utf-8?B?R2lmRDQraGtEVExabkFpNi9OVi9lOUtzYnNHQmlMamtHYjlHdllxOG85Q0Qx?=
 =?utf-8?B?S016Tlg5TDRQWTAyMXNaOFM2UGtDUlRJRTQ3QVdPejFYMmh5ZURDblo2U2pS?=
 =?utf-8?B?T1NmSjBYemJQT3ZIcHFTUTFQZUNNS3ExNGJNNVo5UTh3dmN1QjMySGNsNGJj?=
 =?utf-8?B?WGtLKzFDakdHR1JjVnMyY0dnclJWVkkwbitiMzM1WmRhdVRxdXF6cmY2a3Bm?=
 =?utf-8?B?Qlg0RHMwQzhZbkhwUmpGTk14SkxIV25SY2dlRThQOHhHdjc3ZGNHN1NXU3pt?=
 =?utf-8?B?MHlYMEJTMHJBZUlVL05iWWJtTDlQVnJWS1l4czN2ajhWdDlkSW5GbFVkYk9y?=
 =?utf-8?B?ZmNDY2dDOWFxZzJYY3I0NGV2TnIzdnBQOFlhSDY1aktDVllqcDlTbG91TS8x?=
 =?utf-8?Q?hAAISnvOVIKNglw0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0d7a23-e1c4-4e99-c4f6-08de9472d3ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 06:56:43.3388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 15uUCR7QL+bXAXAdTvWHovrKcKG1XdwMm/KtKX1MPoKiQhZ7jYo2P6D5kdvc1IX0t+TRnm+awDgZnrfC8G7ONHWA2zB5hL0uRC0d47jAVHmKd8Bw90eV8aQjR0s8AB96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1169

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gVGh1LCBBcHIg
MDIsIDIwMjYgYXQgMTA6NDk6MzRQTSAtMDcwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4g
PiBBZGQgc3lzdGVtLTAgZG9tYWluIFBMTCBjbG9jayBmb3IgU3RhckZpdmUgSkhCMTAwIFNvQy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlh
bmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL2Nsb2NrL3N0
YXJmaXZlLGpoYjEwMC1wbGwueWFtbCAgIHwgNDQgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAu
Li4vZHQtYmluZGluZ3MvY2xvY2svc3RhcmZpdmUsamhiMTAwLWNyZy5oICAgfCAgNiArKysNCj4g
DQo+IFlvdSBkaWQgbm90IHRlc3QgeW91ciBjb2RlLiBBcHBseSBwYXRjaCAjMSBhbmQgdGVzdCBp
dC4gRG8geW91IHNlZSBidWlsZC1sZXZlbA0KPiBlcnJvcnM/DQoNCkknbSB2ZXJ5IHNvcnJ5IGFi
b3V0IHRoaXMuIEkgd2lsbCByZW9yZ2FuaXplIG15IHBhdGNoIHRvIGF2b2lkIHRoZSByZWxhdGVk
IGVycm9ycy4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0KDQo=
