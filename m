Return-Path: <SRS0=Myif=3D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B776C33CA9
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jan 2020 00:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04C08214AF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jan 2020 00:41:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="e0MTToNQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgANAlW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:41:22 -0500
Received: from mail-eopbgr150070.outbound.protection.outlook.com ([40.107.15.70]:2380
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728778AbgANAlW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Jan 2020 19:41:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzJgm49MshEW0egw+Q9Jt190XGTlnAVW9KlpuP4n84lga3vsQ88p1iUgiEOBLfCft13N6WXA+Nfl2yU5svp/ajgXxpEFXUYLS2pxaIxV+gkyTUIkt21cd+5pQnnmrTa83cFb2NAd/oheysah6bJPyz1HXMsl35dxeJaVMhWD8Z6TkB1DcRjB4ONdSt3pQuVqPhbMbG5ksDDqOUeoEW4OyxjK+0/tJyQV1/HPgmOombln06aLgmhlGwOZo/HCRwWfwM1WD7fzkhk26egf1qcDoajvkgFdS/9Wksl79w8y3SiUDKpghRsypTAwrIwLiYPhPVrfdVJwOwcB52f5XuS7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcGIBz/db69OYXmirLcCGh6Pw5Tk43KXUKpR/bTbRsg=;
 b=U5CNUjKR2JigTneFRcGIAuVFJ3CmsujtUwZXHr4cLlfBbjlz8uh92HBFMBKM1El6/Bf+kSpinGy5J09SBiHAcMQBfshJNX4hfi6L02QYlhynxjIDxtOuJLuQEHmEKXtD7zSV4ym+lchT/5pA74wSN5YMFEWP4NSYRAOrNwDKu09S6a0DO0oSCSfds6OWDMAPY+rPH5oqX1eJD2jYb3gmpQ5MJZEMcHC15U9Qhvxn1vaKep2sdq5iVsTEkKqAhwWZ/JZIc3JMSp0z6P44zejpfmJLaf9T80xpaivbZJCwLBSyKjCd3+tHjzX1X9L4ZYTHYF1AoFCPkUjNX+WdA7mNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcGIBz/db69OYXmirLcCGh6Pw5Tk43KXUKpR/bTbRsg=;
 b=e0MTToNQb6kuSxE7giaHmMmsgPhTUcGOo/0ddvATG/n+KIWhCWj4kwHvxIyACTScf3zSFNhjrqXkhbLqxI0HVS/OLVKyQigaFzhpjvFG9ML/3Z2pkqqVj2Go5wViQpMd7bxJqPCraKMixIaaw9md5I1VbNb5bCr26hkp1rTyAR4=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4515.eurprd04.prod.outlook.com (52.135.148.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Tue, 14 Jan 2020 00:41:18 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2623.015; Tue, 14 Jan 2020
 00:41:18 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Abel Vesa <abel.vesa@nxp.com>
CC:     Jacky Bai <ping.bai@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: imx: Fix imx8m_clk_hw_composite_core flags
Thread-Topic: [PATCH] clk: imx: Fix imx8m_clk_hw_composite_core flags
Thread-Index: AQHVymsgxSNPh4gp0UOGSwdBPHiohqfpUaiQ
Date:   Tue, 14 Jan 2020 00:41:17 +0000
Message-ID: <AM0PR04MB4481E14B1E82DE106F6D579188340@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <7d118c8ad52e87a7cadb438097fcdfbeeb822dd7.1578958643.git.leonard.crestez@nxp.com>
In-Reply-To: <7d118c8ad52e87a7cadb438097fcdfbeeb822dd7.1578958643.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0dfbd3d0-d923-4b88-95b1-08d7988a780e
x-ms-traffictypediagnostic: AM0PR04MB4515:|AM0PR04MB4515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4515F27513F187553EBF5A7488340@AM0PR04MB4515.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(199004)(189003)(186003)(44832011)(33656002)(4326008)(26005)(6506007)(7696005)(478600001)(86362001)(8676002)(81156014)(81166006)(71200400001)(316002)(110136005)(55016002)(5660300002)(9686003)(64756008)(8936002)(2906002)(54906003)(76116006)(66556008)(66476007)(66946007)(52536014)(6636002)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4515;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GrZc9GOXp95dOuglAlhzyON7alkZYfwq7wGa+gltOOicqVfgbhWq4rRHbaq0pfPhahv1xdJSPJmNy286llZZqknToZO+dVGBiUHX8iOW/DiqjIv3uyvZaWv7v+XdgKxbF2LgXHt0pcQN6dT4PcXuj2XB0Ki9bnFZ7P6NKzqcKXyL4OITusyXeccZKy0CNcFxsHK/Xuj/7+jHYdxXD3aO3DMc2etRDSSWiSCJWbEB8SfRHpvUHMK2+cRHpSmCwcwctW/o2ALGOf7smbx5Zy/eUL1Nn48U/d1xAiYoem2X7tsk+MOeGWjjqOPpXoQMl6YDrvhUTCzdCA1/9BPSznBiviaez4IrP5+PCdUZsCDjZLUfmHn0Qaqnc8IxQUhCO+UAmtimrwHUaw3GTmeXZ2nBFpfuALGTu3HnPPf/xQA7JKyYVH9EkdRek7J6gyzxHaBD
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfbd3d0-d923-4b88-95b1-08d7988a780e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 00:41:17.7728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 889SggpDWVud6hP0HbOzXie1LOIGvZXVocicKECqzhaeVOHHOKhZDklK3ejTfPRdieXe54mpqOHKXrEi5d1YIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4515
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> Subject: [PATCH] clk: imx: Fix imx8m_clk_hw_composite_core flags
>=20
> Just like other imx8m composites the "core" slice needs the
> CLK_SET_RATE_NO_REPARENT and CLK_OPS_PARENT_ENABLE flags. It is not
> clear why they were omitted.
>=20
> In particular without the CLK_OPS_PARENT_ENABLE flag the system can hang
> when attempting to disable a clock whose parent is disabled. This current
> happens for arm_m4_div on imx8mm-evk, breaking boot.
>=20
> Fixes: 5fcdb45497a0 ("clk: imx: composite-8m: add
> imx8m_clk_hw_composite_core")
>=20
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

My bad. Thanks for the fix.

Reviewed-by: Peng Fan <peng.fan@nxp.com>

>=20
> ---
> Since this is a very recent breakage (just next-20200113) the fix should
> probably be squashed.
>=20
>  drivers/clk/imx/clk.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h index
> cd2a60c10a71..17a66a4290fb 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -487,11 +487,11 @@ struct clk_hw
> *imx8m_clk_hw_composite_flags(const char *name,
>  					    unsigned long flags);
>=20
>  #define imx8m_clk_hw_composite_core(name, parent_names, reg)	\
>  	imx8m_clk_hw_composite_flags(name, parent_names, \
>  			ARRAY_SIZE(parent_names), reg, \
> -			IMX_COMPOSITE_CORE, 0)
> +			IMX_COMPOSITE_CORE, CLK_SET_RATE_NO_REPARENT |
> +CLK_OPS_PARENT_ENABLE)
>=20
>  #define imx8m_clk_composite_flags(name, parent_names, num_parents,
> reg, \
>  				  flags) \
>  	to_clk(imx8m_clk_hw_composite_flags(name, parent_names, \
>  				num_parents, reg, 0, flags))
> --
> 2.17.1

