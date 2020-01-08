Return-Path: <SRS0=n/Bj=25=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF83C00523
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jan 2020 03:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 980F92070A
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jan 2020 03:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AZlRQHIe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgAHDkd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Jan 2020 22:40:33 -0500
Received: from mail-eopbgr20078.outbound.protection.outlook.com ([40.107.2.78]:65143
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726142AbgAHDkc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 7 Jan 2020 22:40:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQLZSJaEH0x0iadHUMPGIHkHDEKe2ObrZsilF6sUB1qwGZkmkbD4nKQZYdQL7NbkZ9s9Tswq3CsDQMmXz/MAbEZ8r5ZWiSEwwPslX5pqugYwz7aoigJk9h5TUouFpEs592rOW29R+oC568earpDhAdj0y1lvR3WACB8qQaqAyZ/mM3cfBl5Zr/rMWZhzCI8gbf0KSkkyruSbMlKEMeBNEU/lS0FdKrsHM7sdkgtAL/6ZiGIgwJQcrnz/yozFWmJl0tsMVbEFk0J1IQYMvYvv1MVClWbI2ysuJC/rB1eYZn6cjvoqLZYU9CJU8Pf5YBKmGjWxbSOMiq52HmVk0IoeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5hANBj2zCD/9j8PGfxN3jnW8y/5dCtWLflZEDcS62w=;
 b=nIwNSi9hkllNDllXAZmfOs34hQFxInD9aD+jbM0JYF6v895AN5te2WUEXvlBcRCnAOZQwFUk1TPbMyoQMAygtQbLSatdFvr3ZntEpDxYDPzhMC4I79Pyioyb938jma9j00LaFEdmN4c/4qk39tp39Kx/6pDYGLvjebUFvQ2jePD0JJ+CxXhuA/oDFQarOp4Lm7/AU7BoGtYcpCkoxEBrv56SX6rAJFlExXW0EITZZ1LZuWyJdjWtqfH+mhy93OQeUvBiJ3xnRspjzluVBa7m8vGCrp2it+7+/0FjLhwXqn/1ksIOiO+Pk2xGZ4SLkm6TIlromgQdlR6azWPp4cKUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5hANBj2zCD/9j8PGfxN3jnW8y/5dCtWLflZEDcS62w=;
 b=AZlRQHIe8/7e6s07GZKxS6cr9i/tuyWY8VR29jNgIacYQonUdxawBtl0s95s2cChPDd2PHhMsIm8WfAfniIIG3sifOjpa6/R7Hkhm+Jo7VWDOAQgWYlzUdZmZbOCGbLZJ2CzHy6urmlB5O+vMHYCKcazVBpwNqPz6ZSD0csATEM=
Received: from VI1PR04MB6896.eurprd04.prod.outlook.com (52.133.244.76) by
 VI1PR04MB3263.eurprd04.prod.outlook.com (10.170.226.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Wed, 8 Jan 2020 03:40:27 +0000
Received: from VI1PR04MB6896.eurprd04.prod.outlook.com
 ([fe80::e0d7:8810:f110:3a60]) by VI1PR04MB6896.eurprd04.prod.outlook.com
 ([fe80::e0d7:8810:f110:3a60%3]) with mapi id 15.20.2602.016; Wed, 8 Jan 2020
 03:40:27 +0000
From:   "Y.b. Lu" <yangbo.lu@nxp.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
Thread-Topic: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
Thread-Index: AQHVs/ffqfd88pAB7UKZpNE3TX5TeqfCa1ZwgB3XIMA=
Date:   Wed, 8 Jan 2020 03:40:27 +0000
Message-ID: <VI1PR04MB689616FDFFA41E126EEBBB6AF83E0@VI1PR04MB6896.eurprd04.prod.outlook.com>
References: <20191216100111.17122-1-yangbo.lu@nxp.com>
 <VI1PR0401MB22374453B5D1AF0A845299CFF82D0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR0401MB22374453B5D1AF0A845299CFF82D0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yangbo.lu@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 25453cbd-cf43-4eee-032d-08d793ec807b
x-ms-traffictypediagnostic: VI1PR04MB3263:
x-microsoft-antispam-prvs: <VI1PR04MB32639050515385AEF6F18481F83E0@VI1PR04MB3263.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(13464003)(199004)(189003)(9686003)(8676002)(66476007)(71200400001)(81156014)(8936002)(81166006)(55016002)(110136005)(86362001)(316002)(478600001)(33656002)(66556008)(52536014)(66446008)(186003)(6506007)(76116006)(2906002)(64756008)(5660300002)(66946007)(26005)(53546011)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3263;H:VI1PR04MB6896.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: caHGt/Y+oc1jes/nSJQv/bsiDarbRSehVaC3TB8AVnd3Qn4oHsUe3oBqDt05pFLdG3SwQQOIVRTInbawjYr0VMYG/hMto/RXai6C234xVFpuHTesr+XlAyisxtkjsFR4G5lBPkfKzUNBgRCwFLYBPL54u1zmh24TPpLakWXh1LVFuPgoZ/C7DMPnxHn8dRz3yQ56nIgVjJJVGK50j7lHsnJoYx1UZHUi9I7LdbYMKJecmwB9r1we8BbRWDr7TOy73uZNjmhPlIWf96TXYb2L0rTIX1aTuQh4/uBvlUzAFsqiOPm6ZgnZSTot8VGtPT3na+X0XKuQAJyEBtXHNXZACQ32+SW0RsU1PAMGu0KPdQN9EnP/SOem/FqN5WcDnq8yRuffOrfB0+jg7jaeAdSoSDzrSKj9vwRkZbAKSm8H4KdvsHmsy3lc6o7Eut26H9NLVfNDTC2zET0Mj6Njw+ggrF7QL/Ggt3H7SnvAxr+dt7X+VcnEGEjKC7K7PbLDtwCm
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25453cbd-cf43-4eee-032d-08d793ec807b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 03:40:27.2697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qAczGOxP+sE/fncSvNHdl1w0wC4RlJQ9zcsac+c85OeRks1obVokQ6hDY/m5TWHE2EEou9wGIjFzHYDPBHkS2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3263
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Could you help to review and merge the patch?
Thanks :)

Best regards,
Yangbo Lu

> -----Original Message-----
> From: Y.b. Lu
> Sent: Friday, December 20, 2019 11:58 AM
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; linux-clk@vger.kernel.org
> Subject: RE: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
>=20
> Any comments?
> Thanks!
>=20
> Best regards,
> Yangbo Lu
>=20
> > -----Original Message-----
> > From: Yangbo Lu <yangbo.lu@nxp.com>
> > Sent: Monday, December 16, 2019 6:01 PM
> > To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> > <sboyd@kernel.org>; linux-clk@vger.kernel.org
> > Cc: Y.b. Lu <yangbo.lu@nxp.com>
> > Subject: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
> >
> > This patch is to add hwaccel clocks information for ls1088a.
> >
> > Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> > ---
> >  drivers/clk/clk-qoriq.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
> > index bed140f..d5946f7 100644
> > --- a/drivers/clk/clk-qoriq.c
> > +++ b/drivers/clk/clk-qoriq.c
> > @@ -342,6 +342,32 @@ static const struct clockgen_muxinfo
> ls1046a_hwa2
> > =3D {
> >  	},
> >  };
> >
> > +static const struct clockgen_muxinfo ls1088a_hwa1 =3D {
> > +	{
> > +		{},
> > +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
> > +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
> > +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
> > +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV4 },
> > +		{},
> > +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
> > +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
> > +	},
> > +};
> > +
> > +static const struct clockgen_muxinfo ls1088a_hwa2 =3D {
> > +	{
> > +		{},
> > +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV1 },
> > +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
> > +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
> > +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV4 },
> > +		{},
> > +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
> > +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
> > +	},
> > +};
> > +
> >  static const struct clockgen_muxinfo ls1012a_cmux =3D {
> >  	{
> >  		[0] =3D { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
> > @@ -607,6 +633,9 @@ static const struct clockgen_chipinfo chipinfo[] =
=3D {
> >  		.cmux_groups =3D {
> >  			&clockgen2_cmux_cga12
> >  		},
> > +		.hwaccel =3D {
> > +			&ls1088a_hwa1, &ls1088a_hwa2
> > +		},
> >  		.cmux_to_group =3D {
> >  			0, 0, -1
> >  		},
> > --
> > 2.7.4

