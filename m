Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F6EC0015E
	for <linux-clk@archiver.kernel.org>; Thu, 17 Aug 2023 03:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242617AbjHQDhE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Aug 2023 23:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347922AbjHQDgv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Aug 2023 23:36:51 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2067.outbound.protection.outlook.com [40.107.6.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CCA2D64
        for <linux-clk@vger.kernel.org>; Wed, 16 Aug 2023 20:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI4lLtAwBNjXZtwyH7fP0L0g/CScT+FXopcOTVy+fOc3rBAfzemVEKIoS0uNik4OUHr5hN1mGqLb5HrOPYrUUB2KiJAmNaaHcWunaNBc7JiQUqf2v8H4MmjnCT5c7iybYtOzpINd7+MxMMA80NC2rPdSy8iwT1S3s60RjMwkR5yTl0f4NAulxdQ0BY/3ajewFAMcwuQjSEAE/hJ4D8PvI21XBW/jPAwRJOlwvC8joqEywbR3/l5LINesZ97dvDvReRqWX8awMD6F4VXcd4cEI7WE3Ry+KYD4PLBh4/9Rrct7HCBdOyrb5MzLbZkmnx7KLWinWloVHsUy9kuHq1zG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1reJPrKuvFfXsJukYyf2PygTEorVDK0guSLbcRxfE3c=;
 b=fY2/2BeahLG9PyzAy48dXpQDvdlbOTNuw6fMOMWXN4ucWiktbjwqgjV+tNuK2N0oM6UKuguKCtiBwuIKymq1TUoiu7drha1RrK7uaokOZEFgpznWJgztWe9WwjBX77KzMzKXLsDXUE6Q758GyLZYNqYzxXbGrC0+hUWMcH66OikSRpynjbrWkWfT9itEfsSO8QqFASoVY3UzCNGCJCNaEsK1pdmxXlpIY5R7Zde/m4Z07oPXX5nLQTtAmiEsk7jDAruLie841twy+5DVvthZ3tEEACg4rAcBdiwnI3WG7A7sodDZYJebvkNw36HwSUbnGI0Ell3phkWl+XwCcb87NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1reJPrKuvFfXsJukYyf2PygTEorVDK0guSLbcRxfE3c=;
 b=l71Q5tzpsl73dSVSR0vpFaBoFWA7XjKfyUnSdBLb6M8HUND+/vgaa/N5QgWhTkBQbwLstJ8OKgW68mbAe7xtUNaAkHyHm61EZk3qljjpaQMCNvBeiq4DdWlNpPYcUQWT9IbaaekR2ZaQtz74boGu/LEx4JYtAdyCveMriWhrpvI=
Received: from PA4PR04MB9248.eurprd04.prod.outlook.com (2603:10a6:102:2a3::14)
 by PAWPR04MB9909.eurprd04.prod.outlook.com (2603:10a6:102:385::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 03:36:47 +0000
Received: from PA4PR04MB9248.eurprd04.prod.outlook.com
 ([fe80::cf13:31a0:f65f:592b]) by PA4PR04MB9248.eurprd04.prod.outlook.com
 ([fe80::cf13:31a0:f65f:592b%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 03:36:47 +0000
From:   "S.J. Wang" <shengjiu.wang@nxp.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "abelvesa@kernel.org" <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH -next] clk: imx: imx8: fix some error handles
Thread-Topic: [PATCH -next] clk: imx: imx8: fix some error handles
Thread-Index: AQHZ0LwMXRPgN7QCGEKSYgviEa9TJA==
Date:   Thu, 17 Aug 2023 03:36:47 +0000
Message-ID: <PA4PR04MB9248B04F1822A1637DEFE317E31AA@PA4PR04MB9248.eurprd04.prod.outlook.com>
References: <20230816034800.4081842-1-yangyingliang@huawei.com>
In-Reply-To: <20230816034800.4081842-1-yangyingliang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9248:EE_|PAWPR04MB9909:EE_
x-ms-office365-filtering-correlation-id: d1e5d318-10af-4cd6-6954-08db9ed32f3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kRXaFpaRinAsAQe8lE3IOrWXAaczh6ZAgBIC5l8dj+7lb5/i6jT8NhOaFa7J5uE5F34A7XDoJrg6pptQM43u9pdU+PMnMEw/2DKLjQvuVph+UzQzG17MP7c1KV31GIZmrfPERPaQCndN2Hhmdja3yaeWzLMFjB6qtxyDm4P5whye0SJ2MVNMmWlgmKulEeUXR5uztWOTXiQD7NpfcHB+0wzyR5ils6dh/GlTW1B0X+RNFSRNti96K/GO5UGEVdIJRDmCgVIuhTQV+4E9UUNdAsMUMqEXCZl2mVrIHjPzn6G/XXnXnqRc/glwGv0r0AWx5DEmn2O2r5s21vgB6hShIJquyVU8AQO88UMsQlngUZ5NB8cnTgqwnvrc8sjVjmCKK03hOVWqdyCB7KYle3GttbQbUsxGhdV/RagUaCcxkTSffSjZ+72WyAVlZ7bhEHOchF3CoeCZzBChpDCLDVnc6gSv0eXVjGimX+68cJZqd+su5H/15pRLIDYbzIOehspBLJWKeROvx8Qy3IeERsrDNJY5tqdRqrn8gnQSEo5doeBE151kveXzpRud5yOTl2at5J1yI+prncp3EqZRPLJfL6vGQYac07/wRLsKUFm7rFpAdnGSBBo5DhD2OA5nd4AB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9248.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199024)(1800799009)(186009)(316002)(110136005)(54906003)(66556008)(66946007)(66476007)(64756008)(76116006)(66446008)(122000001)(5660300002)(41300700001)(52536014)(38100700002)(38070700005)(4326008)(8936002)(8676002)(26005)(2906002)(83380400001)(55016003)(478600001)(86362001)(9686003)(33656002)(7696005)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sVOV1mzgQKzhVxlSRlMajiW1dBlUudtWhWM7RJYxbordQzVX9i1XUUJxK524?=
 =?us-ascii?Q?jAbFcLemZGXL6pFmNUZFgoIPgOKx8FBcgNHwyybkznYVgbT6OrIQAnAfqtOf?=
 =?us-ascii?Q?gHc32clQdqKk7MnGOwYicLnxKRviYCTOPFJ8YwA9adkaM0dcZ/siA60RgA4E?=
 =?us-ascii?Q?501JPahGA5eVG8y1C9Unt1mQcE9QiAl9xUSDwOQ+rKlb+a3OdE2rJi8fRbpX?=
 =?us-ascii?Q?MFdwLTblLUqKz0GmmOJYd8kbh/IACuao8EQ7AYP8gfxfx1SM0K/p9260o2bJ?=
 =?us-ascii?Q?LdtCZVvs1k8zlfgnjisUsDvU5vKOHjvXQwnvYtFaMdAvNscfW+sPH/lyVhbk?=
 =?us-ascii?Q?qOrqWWuRNkDbrnXs4KODgP+Vd5QbnCY9/QatqTKqJQA+iXJRLJstbmqrFOYK?=
 =?us-ascii?Q?ZzrtGTDuSMyxtIZpfulM7/KXzPHvjTzEnsFic1eZiF0CkkbPrRLCjanpx2gP?=
 =?us-ascii?Q?PyJ3B6LK80oK4Yev8mlKg1Cim1E8h1Y9PjoUtx+JR/6eMEToZxYwAGWqfMMl?=
 =?us-ascii?Q?zInGZnj6+pdGteZSZUfDH4LEF5nHa8xUASHxh+exGvXtVsAxFJYtUhD5heEv?=
 =?us-ascii?Q?coJclHTV+Hlx6boIcZzHnERIP6t4cG3zJyJEm1pVdQ3Ld5emmtLPATgoX33y?=
 =?us-ascii?Q?NfOjuet1HX+o/iuNlZIT77iQHPy9YcUhxr7hU5TTvcWIO7gGQJOJvrPn/nXI?=
 =?us-ascii?Q?82gpdAcUC2FT1keHLG3oQgN5ypo6f/B9gPUa4/S4KG8p5ndBA8dWOUvZVGPG?=
 =?us-ascii?Q?XOZdlUJvgRsUJzCU125Xa8y4U1xE8L/QN2+AO/XX765vG2AlsvlSlFmH4Ozo?=
 =?us-ascii?Q?hFASaBXJAb+RJWOI12XbZQldNcu9ptQhCJg29rEdk6hk4LhLeNOKYOV4SiKk?=
 =?us-ascii?Q?65DlEncdfDqwgX2KJa6SBSSQXpreV7ZI+I3moAREumvtkBjl+EUnSNz20LC7?=
 =?us-ascii?Q?NAv+XAaqfdC/qhcc/wgulBsckj8AbP26B72NhFkVE/j6nO5NlXDxy84fGOBk?=
 =?us-ascii?Q?JecikRB+cxHnZBpwfEsD4daxxnsbsqShvJg/dzeJORfVIahzABezD6QRzOlD?=
 =?us-ascii?Q?Ty+RJFYAhdoMM2eBEnC1E+chy/f0Zbt7+yTF3LWFN6O+GOuROY7a+2mzjtj+?=
 =?us-ascii?Q?c0MsaSupBp8Ky4Xhv54gYZ5O8iOaV9DRvqvrD8W5nDbl8R7mftakVWzzYxMU?=
 =?us-ascii?Q?H+lAc5QrVywdTjH+9i/lEh1+nIzwwDiLqgKDiPJcN+CT49Y63XPLSU64JX8L?=
 =?us-ascii?Q?fez/R6YhaG2jnhSqkTqiLyHVin2By7OLBxyA5x1ew1UpZOWxgCwy2yFUmpYx?=
 =?us-ascii?Q?cEGropWlEkXGeOjp1Wt2uekAJPq2b5o6lLLYGd5/8R26rQg7pJimmbh3ZMSQ?=
 =?us-ascii?Q?3ggfzPpzQdt18bltLEAQRxTaCKMkjqZqFrRwEBlJJlZ0ON9kLMlEmtxlXs1j?=
 =?us-ascii?Q?Ja53gYfFwSdQ308RPGk3jKe6zLR0EasbIiuZKrg2N9IckmBzGNnKYHqabhdV?=
 =?us-ascii?Q?sRL07bDV7o4bUUFYffeQxNay2Mm8s0bbVrtOc5NN2KoLFJqGaqdZeo96AVwI?=
 =?us-ascii?Q?PRVnyFUpQthVb+VCPHuPlxiJM0VB5w7v7+rihDFU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9248.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e5d318-10af-4cd6-6954-08db9ed32f3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 03:36:47.0715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lyEa58rErxueOvFQP6NacizWkpxI6i3lkyzhBojQnCBT4mkPV5AGUPqrt4bPK7EhFkr7YdsTEnP165BWNsGYPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9909
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>=20
> device_link_add() returns NULL pointer not PTR_ERR() when it fails, so
> replace the IS_ERR() check with NULL pointer check and set the error code=
 to
> -EINVAL.
>=20
> Set error code in the error path in imx8_acm_clk_probe().
>=20
> Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu
> ---
>  drivers/clk/imx/clk-imx8-acm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-ac=
m.c
> index 1e82f72b75c6..550ceac45ff2 100644
> --- a/drivers/clk/imx/clk-imx8-acm.c
> +++ b/drivers/clk/imx/clk-imx8-acm.c
> @@ -287,9 +287,9 @@ static int clk_imx_acm_attach_pm_domains(struct
> device *dev,
>                                                          DL_FLAG_STATELES=
S |
>                                                          DL_FLAG_PM_RUNTI=
ME |
>                                                          DL_FLAG_RPM_ACTI=
VE);
> -               if (IS_ERR(dev_pm->pd_dev_link[i])) {
> +               if (!dev_pm->pd_dev_link[i]) {
>                         dev_pm_domain_detach(dev_pm->pd_dev[i], false);
> -                       ret =3D PTR_ERR(dev_pm->pd_dev_link[i]);
> +                       ret =3D -EINVAL;
>                         goto detach_pm;
>                 }
>         }
> @@ -372,6 +372,7 @@ static int imx8_acm_clk_probe(struct
> platform_device *pdev)
>                                                                          =
       0, NULL, NULL);
>                 if (IS_ERR(hws[sels[i].clkid])) {
>                         pm_runtime_disable(&pdev->dev);
> +                       ret =3D PTR_ERR(hws[sels[i].clkid]);
>                         goto err_clk_register;
>                 }
>         }
> --
> 2.25.1

