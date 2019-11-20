Return-Path: <SRS0=ix8R=ZM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02833C432C0
	for <linux-clk@archiver.kernel.org>; Wed, 20 Nov 2019 08:40:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7C8121852
	for <linux-clk@archiver.kernel.org>; Wed, 20 Nov 2019 08:40:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Oaehta9T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbfKTIkS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Nov 2019 03:40:18 -0500
Received: from mail-eopbgr130070.outbound.protection.outlook.com ([40.107.13.70]:56038
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727831AbfKTIkS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Nov 2019 03:40:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNcKCPNYrFkAj6fA5MhFA4gDhM+PlHSF6jdVW0nje5nZNs3uBMaHL2oHjdD/8MHV8w+zQZKZyIczpWYhKyntXz8Jk7e/gY/pS0YPtIzIQscpEtIxrfmFrRswpqB7XhtT6IDTBC4WyLPSgcmfv5qeYZSUIEEoD9yny8YHRpi6TBXzLHYcxrNagQzkKEwvUTp4Cbz/3Pfa/kdi6/aXTJFYC4siVUdt9MiNAV+sAKofZLwZosGiuBwHyLRJGdMv+/mrSyToi0nBYDm3uZRDioAfROw58PhYPs/jeebryBBC4u8Ce0f2ryCjMYsthx59jjddkCtwbimBkYpvmDsQuR9pbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQkULa2DSOehrpCmKS6aTixsahZzsKTnjpBzLbKY8C8=;
 b=mzK6yNEJYKPeNcRu1qnwlPvNW+U1z3b+CeYPOHtNXoRc0HxoFYsfVpHlmswlH4QCZJJHinarJGnK9hYcNZPA4ISzoFi+G6F4fysFawTVSDos08Amrj4XIodvtre68QtD4yyF7PvmSBy07lErsmCRrMbfZ5IErQC+Vg4oEwUn1rPYap/+UkHsLFsrLB6FSGMNH/hzvrBuWUjUOm3ZS1CECguMdTQe422328uwtZJN2/VWiMtHSxjfUI+xMd8LUJp39s2aUKIfzracBaQcNveXzWZTCQvdtqLsOY8Wrimzq3MhAsQMzacyM3eNkalgGCNP1X6sctehWTWPc5ey/fYcNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQkULa2DSOehrpCmKS6aTixsahZzsKTnjpBzLbKY8C8=;
 b=Oaehta9TUeykgu6oVE5v0eHage/KLI4yNyWL6LZzxUYJrabWn9kVGZ6ih/AUfwj9knk7sSDsWYjhvIto2GjhY+0f+dRLVgHz8CVnhV2vT0jxpLC+aIRWzu8H06+cPbBQhAF89qoCHgBdk2YMl4Un8Uu26176DTAaxWI5PJfNpAE=
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com (20.178.202.151) by
 AM0PR04MB5426.eurprd04.prod.outlook.com (20.178.116.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Wed, 20 Nov 2019 08:40:14 +0000
Received: from AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::fd44:1b14:587c:9fde]) by AM0PR04MB5779.eurprd04.prod.outlook.com
 ([fe80::fd44:1b14:587c:9fde%7]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 08:40:14 +0000
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: imx7ulp: Fix watchdog2 clock name typo
Thread-Topic: [PATCH] clk: imx7ulp: Fix watchdog2 clock name typo
Thread-Index: AQHVnw+XPHLkiuoZD02mXvP11DSi/aeTvh8A
Date:   Wed, 20 Nov 2019 08:40:14 +0000
Message-ID: <20191120084012.4tifdgzofgejfvmr@fsr-ub1664-175>
References: <20191119192848.27043-1-festevam@gmail.com>
In-Reply-To: <20191119192848.27043-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0902CA0009.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::19) To AM0PR04MB5779.eurprd04.prod.outlook.com
 (2603:10a6:208:131::23)
x-originating-ip: [89.37.124.34]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abel.vesa@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e212e33b-7d82-49c7-560a-08d76d954306
x-ms-traffictypediagnostic: AM0PR04MB5426:|AM0PR04MB5426:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5426D9ED3860CB7A51A5623EF64F0@AM0PR04MB5426.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(346002)(366004)(376002)(136003)(396003)(39860400002)(189003)(199004)(33716001)(54906003)(66066001)(229853002)(316002)(44832011)(99286004)(486006)(476003)(11346002)(446003)(186003)(26005)(53546011)(102836004)(6246003)(8936002)(4326008)(6436002)(6486002)(6506007)(81166006)(81156014)(8676002)(386003)(1411001)(1076003)(71190400001)(66556008)(66476007)(66446008)(64756008)(14444005)(66946007)(256004)(9686003)(6512007)(5660300002)(25786009)(7736002)(52116002)(86362001)(478600001)(76176011)(6916009)(2906002)(305945005)(3846002)(6116002)(14454004)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5426;H:AM0PR04MB5779.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NihSCSV+7TjdvniEHYM5TKZi7m3QWpFqBmJ0A7mo798a0pJnPDteRxZPFooX0k3+7efcqbrsZi9mHKvqZpFxTIVuiQiDJx+wg1m6pvOvfv0Yso2SIF2eajasgZzQV1D615CECWlW6jdzToA1mczUGB6qUROCeySACl8PrJK9C47UNOayZZqqOAL85ST9krL8cIj4imJd7bC8ngEosDDKwKA+oluLbux5jca02DurIW/eIYIJ/2FGBJmLoxoBGWGJugv7bL2k9THqB9/lUvtVGJK8mPV85jyY0PwaOi9veUCi1cI+FX4xkBVCpTLhk4m0s9PKlOeggFsIgAZNnYrgJsgQkrMqwo4q2bigqsKKbMhDv59wEkRnotYXOsoSQL79zT0D+rllO8Z+xOTYMJIg10Y3kt5cf/h6bxept5figSlfwT0opyOWA2pbgvUJ8nE/
Content-Type: text/plain; charset="us-ascii"
Content-ID: <252FED626B613347939FEF774FE8DA84@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e212e33b-7d82-49c7-560a-08d76d954306
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 08:40:14.4114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwSxPpRPjCE2EmdCAQFWQMsyebeiPaadynTF1Ea0sPluxxEack7Hzq0hkWXpmVhXBV5RCf7iHbs1aAbtrT0m8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5426
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-11-19 16:28:48, Fabio Estevam wrote:
> There is a typo in the watchdog2 clock name.=20
>=20
> Fix it by changing it to "wdg2".
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx7ulp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.=
c
> index 3fdf3d494f0a..3d9673cb1270 100644
> --- a/drivers/clk/imx/clk-imx7ulp.c
> +++ b/drivers/clk/imx/clk-imx7ulp.c
> @@ -181,7 +181,7 @@ static void __init imx7ulp_clk_pcc2_init(struct devic=
e_node *np)
>  	clks[IMX7ULP_CLK_USDHC0]	=3D imx7ulp_clk_composite("usdhc0",  periph_pl=
at_sels, ARRAY_SIZE(periph_plat_sels), true, true,  true, base + 0xdc);
>  	clks[IMX7ULP_CLK_USDHC1]	=3D imx7ulp_clk_composite("usdhc1",  periph_pl=
at_sels, ARRAY_SIZE(periph_plat_sels), true, true,  true, base + 0xe0);
>  	clks[IMX7ULP_CLK_WDG1]		=3D imx7ulp_clk_composite("wdg1",    periph_bus=
_sels, ARRAY_SIZE(periph_bus_sels), true, true,  true, base + 0xf4);
> -	clks[IMX7ULP_CLK_WDG2]		=3D imx7ulp_clk_composite("sdg2",    periph_bus=
_sels, ARRAY_SIZE(periph_bus_sels), true, true,  true, base + 0x10c);
> +	clks[IMX7ULP_CLK_WDG2]		=3D imx7ulp_clk_composite("wdg2",    periph_bus=
_sels, ARRAY_SIZE(periph_bus_sels), true, true,  true, base + 0x10c);
> =20
>  	imx_check_clk_hws(clks, clk_data->num);
> =20
> --=20
> 2.17.1
>=20
