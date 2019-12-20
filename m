Return-Path: <SRS0=nEAM=2K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4FEC43603
	for <linux-clk@archiver.kernel.org>; Fri, 20 Dec 2019 03:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41BAC24682
	for <linux-clk@archiver.kernel.org>; Fri, 20 Dec 2019 03:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="npx6nS26"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfLTD6J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Dec 2019 22:58:09 -0500
Received: from mail-eopbgr60053.outbound.protection.outlook.com ([40.107.6.53]:38580
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727135AbfLTD6J (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 19 Dec 2019 22:58:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzuNxChFCUBDyt7QBFC8Wdoqs201OFAAtYofoD+enSNOHPQ45tYae6EGLl8WEr/v4Dlj5lX+wSh3JfIhq0r7vUaUAnSY7s0xBZl+ONPzRf/FUg6O03tK4nn27T+AxztaMO2W3GmE+vfKu5jydaekwvGGKcywy8TMANtVFIYUy32m/kZ8Xw1h/jbPNNyrGfATkpWrvGgC4QfpUH9rdjIyUeyM9GgiAb8QAA5v/3ma37P2v1vijmlIDLdOQCR3Fktm8bV/eg4uKfAUUZssSRt1z75V1QbWpdA0BuW3XUzmbQf3kV2vInr4qYmgeVT1Uio48K9A4EQ3TIWrGPGDsbE5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F38sWI3Xnt6i9P5vqndbtjjfKNsAdZoVlvgGpOS04uU=;
 b=QRGSNPjvUc7OaihZS9Wl+EiAs4X/MAXictVDmJk5/6z8fJ1+yZ/Tixso2C7J36XaIZVHGRPD0x+mdxnGvwernQvoNbmTZm1glO99AHAkmOABRO5VWgPXu1cJUD6Yoy5C5xhjSyhLCD5YEfwQnupwoto3adY9La1B7oeJA3btBoTiuskLWIsXapwV5ac+OP21UEuRBjrpz+DR7GzWf0QtlKirTl/tRPKbVlDOdTXppVqbGMIsgh7NCDT+B2gF/dXevqxlYqpm0ey97kJHmo3ryduAFj3PUEHVRDfO0wf5Bn762jB1ovcFM1mC5myLpVnT94dE8v3MOhxP9XCNdx0V7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F38sWI3Xnt6i9P5vqndbtjjfKNsAdZoVlvgGpOS04uU=;
 b=npx6nS26E5bFpO0HUFJOwVGE6ZImL4T/E/QyoEXKRi+tu6SDN3VZu5xRsjcNaoTFR7Z5kr+CghdqXrjRH5MyYEq1JO44XII+iM5n7hJcjS8aUHfitEtEycvCCnKbOBV84tX8sgdEadH+UJsT2IMAB3UtmMCllWP9bDcM4OECunY=
Received: from VI1PR0401MB2237.eurprd04.prod.outlook.com (10.169.132.138) by
 VI1PR0401MB2624.eurprd04.prod.outlook.com (10.168.66.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Fri, 20 Dec 2019 03:58:06 +0000
Received: from VI1PR0401MB2237.eurprd04.prod.outlook.com
 ([fe80::b9ca:8e9c:39e6:8d5f]) by VI1PR0401MB2237.eurprd04.prod.outlook.com
 ([fe80::b9ca:8e9c:39e6:8d5f%7]) with mapi id 15.20.2559.016; Fri, 20 Dec 2019
 03:58:06 +0000
From:   "Y.b. Lu" <yangbo.lu@nxp.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
Thread-Topic: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
Thread-Index: AQHVs/ffqfd88pAB7UKZpNE3TX5TeqfCa1Zw
Date:   Fri, 20 Dec 2019 03:58:06 +0000
Message-ID: <VI1PR0401MB22374453B5D1AF0A845299CFF82D0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
References: <20191216100111.17122-1-yangbo.lu@nxp.com>
In-Reply-To: <20191216100111.17122-1-yangbo.lu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yangbo.lu@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 57788031-05e7-4286-ff26-08d78500d214
x-ms-traffictypediagnostic: VI1PR0401MB2624:
x-microsoft-antispam-prvs: <VI1PR0401MB262457307DBF91710AB5E901F82D0@VI1PR0401MB2624.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 025796F161
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(199004)(189003)(13464003)(8676002)(71200400001)(55016002)(52536014)(86362001)(9686003)(2906002)(5660300002)(7696005)(53546011)(478600001)(6506007)(64756008)(66446008)(8936002)(66556008)(316002)(81166006)(33656002)(66476007)(81156014)(66946007)(26005)(76116006)(186003)(110136005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0401MB2624;H:VI1PR0401MB2237.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DwklsvsofLyCbrtrLgL2he060g40ULPbf7/nGYLXuA/FntneiRoSgTnnUc7qLmjL6J56DIMWNfIVy1Q6KSXWQShU/1t6q1eE9AREseLClgNrGkMl0TgVScPmGHu0F4eAyftjWBSt2fQUxbZhECCG4nhygTEHpWNlu9Cz+dYVN5rMxLCqicangaS10FFPHM6WT5Pxu55vOH/PK5Z4J5zTZeykOnfwChNTq9XgRW0qAC8gXI5UE1CAqQKhJ7Cl8Q9xlmd/dIazfR8UY+6Xo1xhG4aRqbbcb/Ehk5IelNYvhQgG2QAuE8Mu47LcPclS4ZWwStAe4mPd/5DPobHyvDRfBg9+/Es/uMNHXnEQm/dA1UsVHJBFNDDcSzxGhg7getAenLzMKri1zjxxhvvDTJslTa34HANvQTRD72sv7uN99PSZj6tWZiBxd97Nt4/R4/T0BJ/aOOVBy274gt2985B+Q2Nu2NbgXYdjSu8C5iovBCq9sEFUAX4gnK+++lYlAPvf
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57788031-05e7-4286-ff26-08d78500d214
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2019 03:58:06.6030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b1sl5A2Tp59NTS36QVqQ+deW5W8lW3DhAIUYNRaTk0VXwg56i4oskSKIWbfku2JBW5HHrcSoOirhycyTv23pJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2624
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Any comments?
Thanks!

Best regards,
Yangbo Lu

> -----Original Message-----
> From: Yangbo Lu <yangbo.lu@nxp.com>
> Sent: Monday, December 16, 2019 6:01 PM
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; linux-clk@vger.kernel.org
> Cc: Y.b. Lu <yangbo.lu@nxp.com>
> Subject: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
>=20
> This patch is to add hwaccel clocks information for ls1088a.
>=20
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> ---
>  drivers/clk/clk-qoriq.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
> index bed140f..d5946f7 100644
> --- a/drivers/clk/clk-qoriq.c
> +++ b/drivers/clk/clk-qoriq.c
> @@ -342,6 +342,32 @@ static const struct clockgen_muxinfo ls1046a_hwa2
> =3D {
>  	},
>  };
>=20
> +static const struct clockgen_muxinfo ls1088a_hwa1 =3D {
> +	{
> +		{},
> +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
> +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
> +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
> +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV4 },
> +		{},
> +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
> +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
> +	},
> +};
> +
> +static const struct clockgen_muxinfo ls1088a_hwa2 =3D {
> +	{
> +		{},
> +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV1 },
> +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
> +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
> +		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV4 },
> +		{},
> +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
> +		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
> +	},
> +};
> +
>  static const struct clockgen_muxinfo ls1012a_cmux =3D {
>  	{
>  		[0] =3D { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
> @@ -607,6 +633,9 @@ static const struct clockgen_chipinfo chipinfo[] =3D =
{
>  		.cmux_groups =3D {
>  			&clockgen2_cmux_cga12
>  		},
> +		.hwaccel =3D {
> +			&ls1088a_hwa1, &ls1088a_hwa2
> +		},
>  		.cmux_to_group =3D {
>  			0, 0, -1
>  		},
> --
> 2.7.4

