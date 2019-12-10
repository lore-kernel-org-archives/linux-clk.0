Return-Path: <SRS0=Y6WK=2A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6222C43603
	for <linux-clk@archiver.kernel.org>; Tue, 10 Dec 2019 06:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A7B2205ED
	for <linux-clk@archiver.kernel.org>; Tue, 10 Dec 2019 06:07:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bvit9jIC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfLJGHf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Dec 2019 01:07:35 -0500
Received: from mail-eopbgr30048.outbound.protection.outlook.com ([40.107.3.48]:30223
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725942AbfLJGHe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Dec 2019 01:07:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i97F74nnFNAxbPJ0HxeSOmokGIl/k4zkPRD3GdFbu+6zeVQIkm49if29kcz5ldu0RdAizuOS/97o9j2th+6sL39rV+7sXb6t+Q9EMdkKsVdv/vCIljX41ZaWR18a2RV7BW/I+U53HreuMVlTveL0TyStzhNNh9jXKgLZ3ic1ecrD8ZG3J9gk5ZWbDlH/dduMcb2ibh6XCqDpfjfPgeD5LojxjBhZOcwhr5dZn0G3utEJy2pvyQ69VQQl43lv9x0G27qca2LCqq4bV7QuXMTb7S5HQ1vAwS37pgleCKneg8pczu/VUeSyYyrMaXKDEAHhgYV4sI3AskdsvXSNw56gjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hqnbI14WHkcr5VUoBWLgiQqzowhOoft0GDJuGrNCo4=;
 b=VfMyXIvBqL+Si1be/iN0MaPNxTlKwR3LgrEM7m9bWjbat0UTkX2n6TMrNp5MGA7Xatcug2E3GuAbTXUQJHd/4hqcLcHHfBagnoX89fsG+XKHnfe4cL8+IiBOgxO7W5ujTWKyzgZM9GKQsj9mbxKLE+Bw0FlKkajEuCb4jIIEWys8RDD9M36hEHRVVioV4OHwfUo2mYw8NypOmkox8FuxKY/crqQd7bDTv3m92xjHOZ6HcmHHLculRROUmNrxi30mbwvTlfIxHkY4H32ID4tP6RudV11CkRrqaUIjRii/4zPlR5yh4E9kBjkgV23L6PUJElqdANsL4LI/tYcZUby/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hqnbI14WHkcr5VUoBWLgiQqzowhOoft0GDJuGrNCo4=;
 b=Bvit9jICu//IUnMe0D/BtjghZb+UKL9R2dGcPaBuf+342f48VVmYfY/Fgbjblo+quBYMGjHjBf1LJhMZh3E8e/B40sp879WcpM/sz3qGnNnrFbbH3rPgvQI2lvE2B/8q+lroJ1vHjVmGDatpRZ+Bbac7UHuWwZ7+ddjIW/Fxpxc=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6258.eurprd04.prod.outlook.com (20.179.35.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Tue, 10 Dec 2019 06:07:31 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 06:07:31 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] clk: imx8qxp-lpcg: Warn against
 devm_platform_ioremap_resource
Thread-Topic: [PATCH] clk: imx8qxp-lpcg: Warn against
 devm_platform_ioremap_resource
Thread-Index: AQHVrtMiGjV8+r6RA0KzZFABaAlgB6ey4ngw
Date:   Tue, 10 Dec 2019 06:07:31 +0000
Message-ID: <AM0PR04MB4481421FCFF6AE90813572AA885B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <329ac54993d5eb955249d037241a7213faff508f.1575924858.git.leonard.crestez@nxp.com>
In-Reply-To: <329ac54993d5eb955249d037241a7213faff508f.1575924858.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7582e97e-077d-4aab-3de3-08d77d373e32
x-ms-traffictypediagnostic: AM0PR04MB6258:|AM0PR04MB6258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6258B2468395248508A93BE1885B0@AM0PR04MB6258.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(189003)(6636002)(71190400001)(9686003)(7696005)(316002)(6506007)(478600001)(86362001)(81166006)(8936002)(52536014)(5660300002)(81156014)(66556008)(26005)(55016002)(66476007)(66446008)(110136005)(186003)(33656002)(8676002)(4326008)(54906003)(229853002)(2906002)(71200400001)(76116006)(64756008)(66946007)(44832011)(305945005)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6258;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cZ1AT1zNUvoE+aQyU7gioThUVNGp2HxlrVqrdbi4c5l0lqYJ0r8hKuof/0h16TH82cF3os8oJYrR+hULZgkqN3NDukWDl5Tuj1jbU3Hx8G7MPR9Sk85nFP1zUFw2QB+xMMegaG/mWxEPLdq6Z3Y2uCXKgjrA/6Tno1e0HgacyC0dKvKksZytDcBmX5RrbQc6hgku+mgihmAYSFAgKhg/jAY2RT0xX7lOsi+F2hhe9BXOugUTATcwV//eyvEWSjMo3UqPhFQ2NMBizFcLIzO56SQWF7Fc08PJ8IJxDnEYK6suP7yUjWzfqYnMTYKj6053FHiCfYKyYlTfA4BLTBUQQTrwIztP1uQUMli84/rRzoQghOG1LrLUKjCsuvY6zxSxQz79BG5Z7w4IsDlw3UbNgofFomH9x3sho9eB9BfE8/rEsAT6C1QoC0XvCD5GLbbEI6lxg2kdh/p7hlwIwaX0GsoLoLwnI5jlEKx9tXf3veuUkHqZSI2NcbL8qRmjfRWT
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7582e97e-077d-4aab-3de3-08d77d373e32
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 06:07:31.5808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b4pDZDL8G+lspQ0ztAEobC0hUCGNHxbLjnAYgooLM71YNWlxBrmETIz1sgd+4IRmAPdTnqdysl1Qm2FjvELqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6258
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Subject: [PATCH] clk: imx8qxp-lpcg: Warn against
> devm_platform_ioremap_resource
>=20
> On imx8 the LPCG nodes map entire subsystems and overlap peripherals, thi=
s
> means that using devm_platform_ioremap_resource will cause many devices
> to fail to probe including serial ports.
>=20
> Well-meaning but boot-breaking patches were posted multiple times so add =
a
> comment explaining this issue.
>=20
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index c0aff7ca6374..04c8ee35e14c 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -171,10 +171,21 @@ static int imx8qxp_lpcg_clk_probe(struct
> platform_device *pdev)
>=20
>  	ss_lpcg =3D of_device_get_match_data(dev);
>  	if (!ss_lpcg)
>  		return -ENODEV;
>=20
> +	/*
> +	 * Please don't replace this with devm_platform_ioremap_resource.
> +	 *
> +	 * devm_platform_ioremap_resource calls devm_ioremap_resource
> which
> +	 * differs from devm_ioremap by also calling
> devm_request_mem_region
> +	 * and preventing other mappings in the same area.
> +	 *
> +	 * On imx8 the LPCG nodes map entire subsystems and overlap
> +	 * peripherals, this means that using devm_platform_ioremap_resource
> +	 * will cause many devices to fail to probe including serial ports.
> +	 */
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res)
>  		return -EINVAL;
>  	base =3D devm_ioremap(dev, res->start, resource_size(res));
>  	if (!base)
> --
> 2.17.1

