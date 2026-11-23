Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795416958;
	b=JbQybCrhURtDAKNwiIQAz/GtUHZbZBVxRjoChGOwJD9bd5iSaFfGNIUTxZcldsBKLZ4H
	 gMpAf4otrqD44rn4Iu+dp5cRiQQ7eZj7WY4ynXycbmEIxn37uRewZSZJaiC+wCNcj6N4N
	 IkA99Tm+HMcCofvDv+y0JnIYNWTEYIEG5XF8RlmOqhCzvZCOKom/ZFGlogxSdIIVPt6IN
	 Nzn20K6gFjWeDRHBHMewVaagbPUdS7FgFnnfB13ulmm5yuRIHJeHeKJt+yc6ptzuCuYpN
	 v/cIXRKWYVR0q8SahGgcafB4LBybHbMC9bRlDWOnX+Kwgi35yS5s4KkDGrnUDdw2a1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416958;
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
	bh=cWu2fjBgRMu6XotY4k45TD39wYOY8o3RUdYExEukgBg=;
	b=I1K8jB6fDcTPtMHaL8mHfk5ptip27fz5kfFkcS+bzKKGQiLkKzkqoWmp9UwEL3vvPFcU
	 mZUdEwPHHYaYXnW3fxb3xR99hNdgl/lC6TNvMOd11/iPQzbFN7ET8WAFP0qZh9/o5s6Pi
	 Hj1hndZDFSRvJhgYxRm3GnP0LzP04lwdeNTnHl5aaq9HYlNLlRLBAuaziAdkAgiI5U1gQ
	 61iatNwk+BnvkunWb+KoTv3XlsRhfRfdpgjgF7sC34CV3Z++fUGSTA6fZj6K9gLYSxThD
	 W2n0pVtpXEi1ND8tZeH/OPfFFpyEgGlsYIsUVEsI/heobQD6nHpMWC4BMao4RXU5/dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.99
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2099.outbound.protection.partner.outlook.cn [139.219.17.99])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D0606A31A;
	Mon, 23 Nov 2026 06:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31D0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZxJ3tpZnTLnUKrRLQ/UQeAxZFOR72un7R+rPzbJLab5ArtM0eQBPyMB+wOL7lHqi22jwybo56hZiXTE5Q7OIOyv1zEO+lSz6SRHbRuxW3PLizIAz3eMKGrLSN6BevrhYx2BdfzrB1ThMUzJRnO9lEPn1kH5hB+0+6BigFyzqA4kunSC2JhiNur4EltrI8sUFO4iPevp1eqdTSXl9vsjLLrAqzPdh6cJVoSQg8tj0K39KMp3gseHerU5Yoq3S08x9VdkYejqYr4arZvcAdZw++uFp6xPowDyCSd9SizXBVfT1pZm63K7wFmBU87kadh1Ao0B8qUP3FVd3Tbt05H47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWu2fjBgRMu6XotY4k45TD39wYOY8o3RUdYExEukgBg=;
 b=Y56C2Zb1mD5J+APz3hHYbjFKDyI55YXyqZ6BPQFZVyucucKE3GndcfUegISif5swyxsx7oVR7AR/F/yBB62jkltx9JnFV//66trQyQIIM+2C1ZgP2CA4QSiYjqggbsKoLh3MEsBK3PhYYHHDe39uh4cKrnQMhkvauNYtq3iVzb4wArF5bxwCQkWD5exDEz6aMg6RfVULqvSvYu4tvtHteUOxAjApwoKvEH/Lnal1RGJISlzrDSpGP25N02guUwR07qQigplFDMLCEyzA7mHzMfVgTLAwMAOS5A+PXfnI3qOAud7OLH3BlKDKWyl3Mp/sWiSobAUJ2SqeXrOkbRga9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1101.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 06:55:45 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 06:55:45 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney
	<bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner
 Berthing <kernel@esmil.dk>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
Thread-Topic: [PATCH v2 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
Thread-Index: AQHdd0Rce99/kSz/EUK8g4P+8hRztrc7QHFQ
Date: Mon, 23 Nov 2026 06:55:45 +0000
Message-ID:
 <NT0PR01MB1102513D2CCEC7C9DC93B796E6452@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-2-changhuang.liang@starfivetech.com>
In-Reply-To: <20261118100523.11395-2-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1101:EE_
x-ms-office365-filtering-correlation-id: 012f29ec-cb0d-49fe-9dd9-08df492ecc21
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|4143699003|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info:
 m6kBYAzYqQ/Nu0wCNpLx/P7Z4sD6TlsIhT5fPMrLvMOzeVHw9oKiI8uDQ8kh41Hz1y7ujQrf1MKisB84PVP0jVcM8xSR1uD9LRVyhu2LQwiSLi/BEJBrSkEZFr/XUSK/EexC/xSzknJSLyiEnbV5VcMQIxWYzOOAojMG+SrhjCHjFDR9FxuwAnNFOPBNO7KtC27Wxh2hXBsqQXsmm65yvDWKICccVxbevlJzYYch/V1j21WUQFATOlzBgwzVOWaxooL0Ki1LsS9B5ugpg4q227f+1wgnU+qTFuA6Yhtch7YnQgkEu5R4FAM03Oo/PgD4I5gwQCivY3gDnf0bXG9PkPOKqdZuOdLQ0sbyNX+Sn7c86irZwApeT14/JnwK/ODIi96/1vkmETps9f6hl1RjYbKiECAeUev8owkT1sRHiDr2JPQz9jgS0OK4LCn6omfaZydAMTbxyQQkTlNuzRAQopYEDqXuE4RFImIu+oL45TSf15JIyAf+j0AsF/jMCk7dPqIQUT0GZ8p3PpIlCIcdm3nbxIVU8NQY1lGx0ElN8kPvVK4+4uq+vKXh2xcxWBf5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(4143699003)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sAhVCh/agPmVJIq9RgSzAlNWcv3cs6RY2AztRd2TmOT409V3Cje9hq5TtGH/?=
 =?us-ascii?Q?PAdmAWTsEOViEoZDJTY5vEyqBj5tOQh26NrZmi54Ldq59DpBfrsbJJB9KGXz?=
 =?us-ascii?Q?uwyjSZO7OCJOCQUsTevhkfonNVQNa/F9+S7xUnqLApOUlnBqS82NETg+R5I7?=
 =?us-ascii?Q?T6diEGhzWGJruG1G/C8Jg9b8pWo73G9iPUqwzwLherZoFex91yMBzMwGT4Hj?=
 =?us-ascii?Q?FUT+8CtHJvBvQ05WKxfgjuDmYyu144A/AW3PxKj1IkSo+hUjOvHuj81vD8KS?=
 =?us-ascii?Q?o6TgKXIAP6SG+wCy0lf2omALuP0jp9J9OKKh+BVllSEXZfEhKmGQ8qiDktPk?=
 =?us-ascii?Q?cyXOSNE/tseAjjeSjT23M8r1NLna/RZZj2do1i0bNLjsTemze4ugS/4r1Rwb?=
 =?us-ascii?Q?i4j7H6G9cs3SmWaWHqsVMV+z1ys7e4HJNO3MTr7V5GlJ7USyZBd+7BZu3McV?=
 =?us-ascii?Q?10HgTaQrtotX0hRyaAyKd72KOgjbMqvoDV/zmV1jX+IOcosB9GbOPHvjP2l1?=
 =?us-ascii?Q?aP/jYEdKmYtya4p2N2/HpW22WJfXQubj5IKrTTRkU9S6taQFYM4ZyTQiDr3A?=
 =?us-ascii?Q?wHAnqkSi93n0y6omKz1HybW4heTWq98qDfqVOHq38PqDLe/geYMAYf9zZdcc?=
 =?us-ascii?Q?Nq5OhJwI/VTxyj2+mXA5OAVMCc8hctRvjByC/6qjZvLPRV9vLEUS3vvTQgK4?=
 =?us-ascii?Q?33A3FhqyymVnVt8j1AkvPDTVnT1zTQgU40JDXQeDaXJPIrwJJ8LxbWJr+18o?=
 =?us-ascii?Q?IEcxz0WuzNQt8sZtgE5qGdK7/AasXnvLy0CyPo6OiYD9S0qUuaovCqDGWyXJ?=
 =?us-ascii?Q?u6UMsq/8zPfiZytF/hQ0IIntUdF247ve+MMByGMXwlkVqPnEj1jKKh0JxfAH?=
 =?us-ascii?Q?ZPqqj8Jtv3VRW31yOiloUrwFc9HCDnHoxTcw+cDs+HFZY3hTLlQm00sY8SCT?=
 =?us-ascii?Q?+zWwWYDABaqUm95hiQUF1sdyEtR1sLrOGE69ctm1iFmmPe/jIT1NFEkyPWuc?=
 =?us-ascii?Q?KEWBVnFKKvJVZsI+pnQzEy5gQubgRQcmg7BcEm9kAjnXvk6nktxP8Typ7A4y?=
 =?us-ascii?Q?cl00CmzyrhGLNy3V1zvMumdwFv4rNEdXNHOHV/kK4DbH3ERXgZkCG476toNS?=
 =?us-ascii?Q?2UEtrbdvLFCEN2/kpQWzQRGeRhxtuoa6jOIHP/QqZEHjFOJBU4MsoEDkZ/3H?=
 =?us-ascii?Q?HkovAR6CkmJ9vF4xMO7KZv2d4xCe98DKVQwfXXdD2H3sBeQ31biDPG2OX8OX?=
 =?us-ascii?Q?TVgG0zcmQ5iIxieNLFurhaHUcMgbES1I3LMUGN/BQueCtQIQsYG9ETOIaGa6?=
 =?us-ascii?Q?wl0WJiOfBLBfEqlLEWFl18Ndnol+Tu1KszQmj2R6qx3M9cneBGjbASCMqMqf?=
 =?us-ascii?Q?VNg7b/EY0QyoyrMX3G95jEUB5nmn2GipEin6NNQwq+0jncGTOdnRfHXmwsng?=
 =?us-ascii?Q?6W16Q9BqNEKmuiyu8OjZ/my2+iS9dD9j965S9GhxglgYtk9JHFkKRUWAeUsF?=
 =?us-ascii?Q?5kZePJKwSm2tBNF5ub7ztA5tFOm3m64OU/pzElQ6o7jU2FglADz6f8+Ygf4B?=
 =?us-ascii?Q?v/qVy5pBun5KKIH/f0Blb1OGXxzn6blLWorL8+wgqVtxA3tYfXOuWBO+slcx?=
 =?us-ascii?Q?VVhZU8sVEudj5UrkhLVNi+QWNy1cVvLr2SruzLZjLTxZDc+P6dWIp4gfOW5N?=
 =?us-ascii?Q?IFd2MHZ1c8FmFg4qld7tSyFRf8GCHerKLvTA+6Tfm4GHLyLLefCFSw1oj8aM?=
 =?us-ascii?Q?IzDzdlvt7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 012f29ec-cb0d-49fe-9dd9-08df492ecc21
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 06:55:45.1389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2kgTcwpyONIEvN32SEHWkJ/5hvzH0gN/oU00vxUuj9FX5iT5qTUT835nzoXrRgKOtpAInaRcyyqV7hgLyGRx7Ih7f9CVdvsImmvbm0WLps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1101

> On 26.11.18 18:05, Changhuang Liang wrote:
> auxiliary_device_init() returns an error before device_initialize() is ca=
lled, so
> the release callback never runs on this path and the rdev allocated in
> jh7110_reset_controller_register() is leaked.
>=20
> Free rdev when auxiliary_device_init() fails.
>=20
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock dri=
ver")
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 44766b094b60..c938c62a863a 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct
> jh71x0_clk_priv *priv,
>  	adev->id =3D adev_id;
>=20
>  	ret =3D auxiliary_device_init(adev);
> -	if (ret)
> +	if (ret) {
> +		kfree(rdev);
>  		return ret;
> +	}
>=20
>  	ret =3D auxiliary_device_add(adev);
>  	if (ret) {

Acked-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal
