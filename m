Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CDAC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 06:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiI3GYp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 02:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiI3GYo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 02:24:44 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D744E3883
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 23:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJ2n89YPV9hHEamtpTOq4uy0i5j6fB0M/yl4tAh8ABANXjM3jAH7NFphr7IbPjmCGa5UP7Km9JuUk3u6w3BYEO3Sx/rHE9GfLb4ZbcfHw5/POHXFlEJfYDQtBigjvizSuBstOyXiQgZ/egmGLjxb7X76UHwvEznwmTY8AyK7xqiGHERdoIL5PNoNW5vxCyf57815AEBR28HAZEnjVVUErYHeMzahASAXRodKQZwYKMCiKGzCXL3Hyagl4DRMY0noQkjCNlKv5PKilbH61jh8Ye+Ik4HXtFHytgvFqUDk00HQWwq6A1geD+g2LQiSNPMkUutfqeDZ9fCHBenTtc7hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOEJJFnZ7mO45VpxTcBDT/x9pLW15DxA83Ld5mzI7Bk=;
 b=YM/ox1Gobw+vghXNGFxSFf9/HkLX1blvJc/oAgtsjoaxm9ociCr4fMf62pENuj0zQHAth53g5IzOG2y1A1yzpyzGA4aUN1H526VDFqn9dfqsCDUjpoilVZiT8LdOSwFzmdKnj15K36w9aa/Lw9IvdJ39X20AiHnu8fJdA/w1VHToPCX85fr1E83Bsh1Hb4QIxENZdU99BOE5LbQC1mRxc6XBHtXTEU2pnPaU2UQpzeGEiQipKkNh1nq9Rhed/ZQoBKSmZm9jGQiI+7uQ5ip4WUT9+jQoarBVNyV1ZtWREXzByyTK3RS7Z04UdmIgOPcIrXrku3l5418omqgE+3hJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOEJJFnZ7mO45VpxTcBDT/x9pLW15DxA83Ld5mzI7Bk=;
 b=TaNheZq+5/6pMn/NhxPWW6scUpGcY1Vtm1S3vlzp9/hZ6u6/vDrf9xhhfejk2RiZ+/+3XkezCsf/x8743+kVsYTRlzweVE19zdNz+H8BqDeyYnh/vEm0NTLEVnhzGtwON+VhgWPZNIrieM0xXWSLrRa/qsLZAwBYG/5uASde3gQ=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM8PR04MB8035.eurprd04.prod.outlook.com (2603:10a6:20b:248::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 06:24:34 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1eb:dcf:8fd7:867]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1eb:dcf:8fd7:867%7]) with mapi id 15.20.5676.019; Fri, 30 Sep 2022
 06:24:33 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Bough Chen <haibo.chen@nxp.com>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH] clk: imx93: correct the flexspi1 clock setting
Thread-Topic: [PATCH] clk: imx93: correct the flexspi1 clock setting
Thread-Index: AQHY1JTx5xdUz/+68Ei63J1TIeGMWK33gTcQ
Date:   Fri, 30 Sep 2022 06:24:33 +0000
Message-ID: <DU0PR04MB94176B764AA9AD0AFFFD1E1C88569@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <1664517759-19807-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1664517759-19807-1-git-send-email-haibo.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM8PR04MB8035:EE_
x-ms-office365-filtering-correlation-id: 73c08783-1235-49e0-6c46-08daa2ac70de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XUyT+0fHGA2tp4gRsoo+c9lotInx0rQ5+CptebpZKgNZttuuadzJz+nckKa3CXJF/v9n/SIbANGsyvqHVyJQVrHDZlQIzGEYkJtNuj3SN2Uok3fsTUXVIq1ZrNQbnGGzuJQ2KyhK4/6SD8yMYNkIrk10MOJFWI4sHSDN2LJlrl1LX5AogMrGqgs/PUp3n0bqPc7rXrhsFCjTI3iUKG8fPTdaZdgZOWg+3/TfNOmctiAp8AsZNULMDjETIgXGrEUnN1Rms+dybbbWN4OXbDG3fSKu9kysHn2ICmSG7rHMrvjz7uN98TK9CjsmMweK9sHdwHQgWZsKevVKvOVr00+xzpXaBtAx+SUkxRP8hM/kIECNHUtWyXrDUc49kSRsKks5Fyrj1giz8dUTlLBnLpCxroUV7vGnSop/lH9Szyln4W64xgLm0iOgOhoOJLFXTO9BDf7UFmWc6/picNF/4YLS44g89UNneo9y73Qre6HqaiTjg9RBBi01ei+eUXhOR1QA25JsBdK9f4iltub/4CUEB6qfBsuCSUKR7s3YFnvwK2ywCANcx2MHu3ncBYFmT2HhQCSAFd12zHSMa7ZJ/aDx1AmSKp51LmzDMSZmuDmO+Ok1DovcWhbNiseDcW3KNvJizuEC25DJZ+Mp/DG/FiM8mv9BfV9VugJalj+JHra8XKhqb/DAWQC1VghskWoQkk3K6OtudnUTeoSSpJb2KEo90eLfHbO55IQTAf6vpxkOV35qPeF2Lopg+1e1eXRZM40ybv2ve/lFDX/qEfYlheQ8mw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199015)(110136005)(64756008)(54906003)(5660300002)(7696005)(316002)(478600001)(122000001)(38070700005)(6506007)(186003)(66446008)(4326008)(66556008)(66946007)(66476007)(33656002)(76116006)(8676002)(86362001)(8936002)(44832011)(55016003)(41300700001)(52536014)(26005)(9686003)(71200400001)(38100700002)(83380400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iGcrkWlqLCzwsOJniXwE8AmrVXJBv/hvTgtF+ewYIi5MCmRoVD9mbI0/veOy?=
 =?us-ascii?Q?+7/SHh7L71plCfYOU/n4ugKcbTVv39+IOPZdkzwq0w//I/QkwBlaDZmZiztC?=
 =?us-ascii?Q?s1JJk6kzg/N9yazaVYE6/ASffO+lNprcVz+Cvh0XeGcxPTv7CejFuMzNtt3V?=
 =?us-ascii?Q?ISHrBWUQMbxTl/SQrjJT6P9Lpvh1/4WZoV8Zj02UaRbJYqq3AmeASZLwcfAQ?=
 =?us-ascii?Q?FXjCVk44rHzymLfnbodRHmCZt6IF5wFRDEU9rFzyCHd13vSOeiP4WLCG2jdR?=
 =?us-ascii?Q?1g3TeePeczjGAq/05zcOBQMvbrM1byff2k0+XdXH7/G7CdEfoLuNxceqeTKJ?=
 =?us-ascii?Q?VUK1biv7uHiFIBO7Su5K49xgkid8OdAr+jMbY6Q/P8i+hh7x6Ae2FtyJlOyM?=
 =?us-ascii?Q?LvrhN5OK+u8pB9Z9t9zer1VJ6pD58OuBwUFydKPqhfkm0GgyHbnVzdEDW7kH?=
 =?us-ascii?Q?NA12b4OzyvhWuvgscDqQsjW8RU/MUgOLWtOWVJJRU3NZrShco4lay/jIMWC8?=
 =?us-ascii?Q?jpwp4TqT2TseA9ILGbIvmfygmWhyDWjnrVRWB2b/0lbl57MhWOFuiUCdG3es?=
 =?us-ascii?Q?KzDIDxnRvHPtTJLkxe/8kGtL7L1A0WoiEIzfUB6N0rS0AWhpn77R1CORlmdS?=
 =?us-ascii?Q?Qm8g3NaIm7dIZpk115CoKX7VySe3feU8Gl1YIiAeVU/9L9CSCungryS2cLgg?=
 =?us-ascii?Q?JhFKIfyYKK38xQEM0qrt5tOaca9MGauV4u1DTxMjDw2D+dK2/dnCaw7Xh78n?=
 =?us-ascii?Q?9Pxewj04AvR4CZTpJUhPLns5Pt0wUEVV6hWz22LFqjEVeUOY9tiAQpOGtakb?=
 =?us-ascii?Q?jqz28T+7NkyboGFwaeJ5C5Lr1CYeFWADuUOShJ/qKLb17QaoPa1+P+hs5QSX?=
 =?us-ascii?Q?+eKysUCDR3APa2a6K/c996kEsLwJsMVQmQ+Tteug02znpct7EYrqNIF0wz19?=
 =?us-ascii?Q?hsOumf8fbw0yDPl5W8VH/bRgnX/TM2mIjbZEegQ67zEeDk0ZIEWxSQStgAIA?=
 =?us-ascii?Q?O9f2blZHVuzd3xSzbKz4LgGudfF0z8+E6Eboi4Z/mOgnQdjt5flH/JI5BSOb?=
 =?us-ascii?Q?G3WWvZELxzW8iYENxY083sDWP/0RuTUUMzyU18EZfpYv9pRsxjKbIYQzN2lG?=
 =?us-ascii?Q?2jL80hfTfY1cVNHFexqonSsSaxBnW5QjSTcJ2R4apAYnyiu5wE56Jys/rsSA?=
 =?us-ascii?Q?fXl+Ls8uhP8791U61oKjvEOWfedWrucJRaEHAZRnMln6g3ZRw9zH/+csgNzW?=
 =?us-ascii?Q?ugz6bOtIlWSWgQvpuDohkMHdVXeuMpb75BSjhOTz9Cb3dkGPyxvGdgWeRRr2?=
 =?us-ascii?Q?NBJkfuxdPq7yww7iT4lB+tzsGHgCNm+b900vzlKSPBo7sJh8C1EDTGDjfQsy?=
 =?us-ascii?Q?iIhDIcoiTMefI38pPcLVt1gFKiXTLYtrwSGkvTfNbHsvAi8JLiSpoMzf/lN1?=
 =?us-ascii?Q?U9USaZWW9Tg0ANnMA4C6z8U0A3w3UjlLRcq/fFNPbKe8cutXms4sb/NC95Ec?=
 =?us-ascii?Q?k5V9KFecuEds5hfJIiGaCk7CdDFOpGNhE83iAFXqsNhlr2dkTMY3S/fce3X9?=
 =?us-ascii?Q?isbohnSvodExMSRemB0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c08783-1235-49e0-6c46-08daa2ac70de
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 06:24:33.7566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0igYgo9InHD3Y9rSyAanL5Ge6boicUirYqHNi4gT2nkAUsp0j1LKRUo6phtTc3FnO37Rj9QlhsEtshXVNexpKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8035
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Subject: [PATCH] clk: imx93: correct the flexspi1 clock setting
>=20
> From: Haibo Chen <haibo.chen@nxp.com>
>=20
> Correct IMX93_CLK_FLEXSPI1_GATE CCGR setting. Otherwise the flexspi
> always can't be assigned to a parent clock when dump the clock tree.
>=20
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

Regards,
Peng.

> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c in=
dex
> 99cff1fd108b..40ecee3b5e78 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -170,7 +170,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",
> 	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
>  	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",
> 		0x8540, },
>  	{ IMX93_CLK_EDMA2_GATE,		"edma2",
> 	"wakeup_axi_root",	0x8580, },
> -	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi",	"flexspi_root",
> 	0x8640, },
> +	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi1",	"flexspi1_root",
> 	0x8640, },
>  	{ IMX93_CLK_GPIO1_GATE,		"gpio1",	"m33_root",
> 		0x8880, },
>  	{ IMX93_CLK_GPIO2_GATE,		"gpio2",
> 	"bus_wakeup_root",	0x88c0, },
>  	{ IMX93_CLK_GPIO3_GATE,		"gpio3",
> 	"bus_wakeup_root",	0x8900, },
> --
> 2.34.1

