Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946B0C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 00:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiJXAjz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Oct 2022 20:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiJXAjy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 20:39:54 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60077.outbound.protection.outlook.com [40.107.6.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCCD357F2
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 17:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPq/k9tvTvdY7aUGgUuvZ3r41YIsGpZYwNngS9aGNhemltpXwjIlviphvIOdOwz1G+UPAg4r0wuDeeZ0+AMpiIth7Zpd2K0jywjP+Sf3ZEs3vTDtvoPbZSEoC7Jic7gus8/wU7amumjZvbs6VsLMZ9LSmDF3zuHFxO0rGnc3FkIUl2/SdBAybg+5kJ49gUikCoX3ZFjyEqk6wXCWwzsPMPoOTSeWlY0ZmeIqqjKmjd8BcVr/bBHCS2NeopirzZCoxT/nrUifb7ic3Nr9dCcXAgGsvVoiWeP5IbAyst97BrFsFaibeder4K+IJ8IiYG0zDkQsDMuMjOraPKqWlV0vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpLtcUTldcTYPzbLAAnA5C3k1SX2ZlfbsjNahQV+ahk=;
 b=gF+R4GlQ4ocBzCo8q2YKE1bw2p3/F6CFX3EYEZsP9lBEdlLyXoO3vyGBfozWCm1gMs6uBY07wX2Zxt52abpu8oY6VhDmLBqNxzfVbTTOc99SKpTck+BneXdAnxth1I7825S9Ojm+u9UtxTDyAQ4aFQ6vc+XUMyd3BOpjQ31mTzkDKbG5fiDtSSFwXK/IHgpJ7JqtEZjtS8gcJgxN0VZxV4KBWAFGNeAIHLDJLIPRrYBPKAJtRJ1om8SOavNs0Xid40PHSGEXQNwPU1yn2n8yIYVxQOkUY2TIMjO6qVtlAhu/CJErft/30LncZZzFxqMsdG1M3TadxtxAkXf2g1wFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpLtcUTldcTYPzbLAAnA5C3k1SX2ZlfbsjNahQV+ahk=;
 b=myPQZ32cXgllJzpoZ/Vy0FmJ9j7p+PH7umUQumC58+TXmYgpbUkRoSJCtVHfg0dPALKFGEKLBKiShWCXBA5l9Z2b5auRWleNsef1QpzheZ6a/apuhOr7tLWf8zsc5Tk4Xr/xl9WHwpG+ACbX8paEi6jvpo7VmMBEUmA0ge0pQys=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB8947.eurprd04.prod.outlook.com (2603:10a6:20b:42e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 00:39:49 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a5ff:3d28:4bbc:e1ed]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a5ff:3d28:4bbc:e1ed%8]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 00:39:49 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     Fabio Estevam <festevam@denx.de>, Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] [RFC] soc: imx: gpcv2: Split clock prepare from clock
 enable in the domain
Thread-Topic: [PATCH] [RFC] soc: imx: gpcv2: Split clock prepare from clock
 enable in the domain
Thread-Index: AQHY5v47pDaSe7tiEEqpU38h21iRwa4cs7sw
Date:   Mon, 24 Oct 2022 00:39:49 +0000
Message-ID: <DU0PR04MB9417315263B3A912BC37AECF882E9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20221023164000.555654-1-marex@denx.de>
In-Reply-To: <20221023164000.555654-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS8PR04MB8947:EE_
x-ms-office365-filtering-correlation-id: c35bcc7a-ba18-4ced-5c43-08dab55841cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wXSt4EvQW8acHRaKIJW1qSK+bVutHWSr56uMI6FannRzbXBj3pkI2hsGju+58IRColCweBbI3HCakMWemyo4xohZi8BmbHePH3wo1oP2ubZ/IwF9mFAAvBZLikVadgA3CH539+agJgT+MDKgXDTcNGKMF09gDpjoHcd3KGIbO+NOx4I4Of2wQAot/g5nWb3L3qUrDhlM9p+b3xLvorgkMQlfQpGuXPZjSCwT7Pe4g2R2cHemBUMc/lEhLi2D4Ql+9ueEGxR2xlgOsIUrQFP3C85OkIT6+0Sk+F8trVxh6NDrbQ1w8fggvwBt9XdYYDXXaDnJOwYMjn4mVj56tjrHo/ntMwpcsWNlXFUxRAAL5zN/ByNm9HYM4DX7XofglwXXPr1vMkPND6XLWmC+FGYuFXG9X22VahdSTYdJr1o93IAj2/F6SZGg4jbFdTRIjMQogYcfrcbn4B8hrzyhMmLwMznYGToKcOyVX+KMsbMbQxEkml6koEAYLlHmAJvB4IX8cLS4jqWxOT4XE4dineLLLKyJBEaJTD73fD/UiI/xsoAusiHHkjpIl0aOXp6clGtER/vwWG31QadecUR4j/KeRK0mS6///0NgBTXJzD1JAbDFiFrZKfRxjh02b+Ex0+R2Mer00LGtMX7zVmCDeSt5gZgBov/Xa9CD5SYj68FnNMV9uslgSOIegr/nEXo6IH7MWRiJN9wjWuUQ2jJebw2+vcKLVZPHJVoS/eMK7Wo9hyMuoQNwtKX/aWJGbdSIBZeKsl3LGnbJ3v+gtHpLeHJnTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(2906002)(44832011)(5660300002)(316002)(52536014)(4326008)(64756008)(8676002)(71200400001)(76116006)(66946007)(66556008)(66476007)(66446008)(55016003)(478600001)(54906003)(33656002)(110136005)(8936002)(41300700001)(83380400001)(38070700005)(38100700002)(122000001)(6506007)(7696005)(86362001)(26005)(9686003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8sXfdfyKZJtUsu2FZ/+n3uPv0zRMAAoqnhNFyZCHHc1uB2HdyPecNrxA+d/+?=
 =?us-ascii?Q?fJPQvEmNrx1aOjdJ95wXxVLcxpYM+OPFuetgDFJe2o/mQcHEbthR21zkAhz7?=
 =?us-ascii?Q?rLGg7QRBiPnjgZ+jHq2A5HEk7f3klXRgcK5U/AOBSx6DEH+vdfXP/foTYJNw?=
 =?us-ascii?Q?adrOA0zTiCj/cQUIEiZsJ9ROkHZr1aNE/ZVmSR68rPAOfroduPPe0wmSmcDc?=
 =?us-ascii?Q?50XllwPuGHqFGGLVaUTL8Br9wWK56xFRyHR3zDn4oi7xmbyyAjQigd5Tux9N?=
 =?us-ascii?Q?Z1HLKGcGMDYQotIp9LGUl9AbxUml+LDmwtHLrH7IHpnmh5jZqgih+C/32xX+?=
 =?us-ascii?Q?rNDAH+zSVDKssu7Y4yqud5Sh1kBDfjhH2pj6R3hjtWdv6tD24o4r+Jnai+DT?=
 =?us-ascii?Q?GvAyM05saC2H+xl0MkHAZG039SNrcet0avJGXzcSBsncoKYpGveB/4OjmslZ?=
 =?us-ascii?Q?TGr8RlnpU5CigiMCnYCAUWuyUMJ1VFAaXAguzKocZAg1fiFY7aA8Jtgy0xAj?=
 =?us-ascii?Q?hOJ7CVSfXMYItfQXgQPFpqwK9GDjVVWtVZkUysgxQNqPyRIKfflVxuXX3hxZ?=
 =?us-ascii?Q?HFkAwbZdiK1IXaisN/zJf5OuiHQCavg8w0Nq3XYcFJobiLJfHFUGB6z4AmBD?=
 =?us-ascii?Q?dMuP/8v5w9Qmf+me6ty1peQVfH28qJOTgKIK8djJVClgHhI4xhD3nmX1mpQw?=
 =?us-ascii?Q?4GS7tAfvpKGBmvZaSqCNEvLex8fhiRuedw/20xDtk24NbPLR+jw3oHSGbBdC?=
 =?us-ascii?Q?A85d7qN+tsoqH4z3Abp/o3EJU/i0d5YZXu/iwHMq/VmzJE/9b42nrBXFfKqh?=
 =?us-ascii?Q?13mNtpaFvZlm/ivcrBy1fVslIJlUsHHo9Bt6ItyXEairj5kt9YPkeIcsf8ZW?=
 =?us-ascii?Q?fmiMxlY2TpoYPQQiKbzCgJsGxbVxiOGOPOapmuIb+YdooE7ZDBfRiPWgG9wg?=
 =?us-ascii?Q?1uv2jnPsmk/89BvNkyNkFtPPsbrynojouis5lnwvpPXVEmCb2U5aH08FP0DP?=
 =?us-ascii?Q?Ewbk9QnJYB+TFJbivaZliY7mpjitKjq5cCwmcinOt6yP9sbnR+j/F9krbvIV?=
 =?us-ascii?Q?7Ot4FnHogaw85uGEOt6aN2r2701pNJotMnZ1fEymogiv4ZbcNDnccV6yW3m2?=
 =?us-ascii?Q?TLMLpYpqcpZtzJ8DWJtfh4JC3hPMFzOxGFIIg2F3LdQXgMTmXJCmhnifSC1p?=
 =?us-ascii?Q?VngziCyjwVJ3K1GgAHyj9WjJCiFFkmuH2+ZFHYvaKyPheDrqt2Hs67blQIqg?=
 =?us-ascii?Q?NeEwsLOVRCnW9FNFGoUgOWGRqzVnvoEmNlTiZ8r4bOjreYqZoVT43fHnRPkc?=
 =?us-ascii?Q?tzQESAoZlMPRSCYc0IGAoOq92+5IxO14hW4FrZ+8P50XYCiLEZBqCB/Fe+we?=
 =?us-ascii?Q?s3iFT9vhvFoHbM7G7YqzzAaOTDVIKO/yLt7kh2U8w55UUfvFe5Wde8bK3TRS?=
 =?us-ascii?Q?KZRwDD7zQTeZiq/I0JfDVO+jhOMCZ/ednnxuwK9XDFgSJq+zjq8a329VFscX?=
 =?us-ascii?Q?wWKzmkccZYSUZ6FM1H7BGHcBvQ2H96IPj6vZ8rViB04yXkN8hh7aR7ZJllLj?=
 =?us-ascii?Q?9MvWDI4mGz2Cn6SlH0M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35bcc7a-ba18-4ced-5c43-08dab55841cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 00:39:49.1851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EM1D2KBQFnE1QuIdoNnrEnXTlIvD2QSbkGmaO7VBshSON3YnWWOojx1sfy+bAfbFoNkm5lescsNLGcsCa9ZAeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8947
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

> Subject: [PATCH] [RFC] soc: imx: gpcv2: Split clock prepare from clock en=
able
> in the domain
>=20
> It is possible for clk_disable_unused() to trigger lockdep warning regard=
ing
> lock ordering in this driver. This happens in case of the following condi=
tions:
>=20
> A) clock core clk_disable_unused() triggers the following sequence in a
>    driver which also uses GPCv2 domain:
>    - clk_prepare_lock() -> obtains clock core prepare_lock
>    - pm_runtime_get*() -> obtains &blk_ctrl_genpd_lock_class
>=20
> B) driver powers up a power domain and triggers the following sequence
>    in GPCv2:
>    - pm_runtime_get_sync() -> obtains &blk_ctrl_genpd_lock_class
>    - clk_bulk_prepare_enable() -> obtains clock core prepare_lock
>=20
> This can lead to a deadlock in case A and B runs on separate CPUs.
>=20
> To avoid the deadlock, split clk_*prepare() from clk_*enable() and call t=
he
> former before pm_runtime_get_sync(). This way, the GPCv2 driver always
> claims the prepare_lock before blk_ctrl_genpd_lock_class and the deadlock
> is avoided.

Is this trying to address the i.MX8MP audiomix blk ctrl deadlock issue?

Thanks,
Peng.
>=20
> The imx8m and imx8mp block controller drivers likely need similar fix.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-imx@nxp.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/soc/imx/gpcv2.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c index
> 88aee59730e39..ee9294ad25ba1 100644
> --- a/drivers/soc/imx/gpcv2.c
> +++ b/drivers/soc/imx/gpcv2.c
> @@ -319,10 +319,16 @@ static int imx_pgc_power_up(struct
> generic_pm_domain *genpd)
>  	u32 reg_val, pgc;
>  	int ret;
>=20
> +	ret =3D clk_bulk_prepare(domain->num_clks, domain->clks);
> +	if (ret) {
> +		dev_err(domain->dev, "failed to prepare reset clocks\n");
> +		return ret;
> +	}
> +
>  	ret =3D pm_runtime_get_sync(domain->dev);
>  	if (ret < 0) {
>  		pm_runtime_put_noidle(domain->dev);
> -		return ret;
> +		goto out_clock_unprepare;
>  	}
>=20
>  	if (!IS_ERR(domain->regulator)) {
> @@ -338,7 +344,7 @@ static int imx_pgc_power_up(struct
> generic_pm_domain *genpd)
>  	reset_control_assert(domain->reset);
>=20
>  	/* Enable reset clocks for all devices in the domain */
> -	ret =3D clk_bulk_prepare_enable(domain->num_clks, domain->clks);
> +	ret =3D clk_bulk_enable(domain->num_clks, domain->clks);
>  	if (ret) {
>  		dev_err(domain->dev, "failed to enable reset clocks\n");
>  		goto out_regulator_disable;
> @@ -402,12 +408,14 @@ static int imx_pgc_power_up(struct
> generic_pm_domain *genpd)
>  	return 0;
>=20
>  out_clk_disable:
> -	clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
> +	clk_bulk_disable(domain->num_clks, domain->clks);
>  out_regulator_disable:
>  	if (!IS_ERR(domain->regulator))
>  		regulator_disable(domain->regulator);
>  out_put_pm:
>  	pm_runtime_put(domain->dev);
> +out_clock_unprepare:
> +	clk_bulk_unprepare(domain->num_clks, domain->clks);
>=20
>  	return ret;
>  }
> --
> 2.35.1

