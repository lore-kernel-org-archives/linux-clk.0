Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5663C169C4
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 07:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F55C20881
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 07:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="V0EEzeEU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfAaHdX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 02:33:23 -0500
Received: from mail-eopbgr30083.outbound.protection.outlook.com ([40.107.3.83]:39316
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725880AbfAaHdW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 31 Jan 2019 02:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNxwZZSrUIaJr+erOSLN/Q9PaXYNVysAlewc4V70i0k=;
 b=V0EEzeEUku+G7XYD9725DvSTPaK6rrxNQAK9nFDT3AZXTRqQAApsey9n3KyVlbBSYQtcbcfY4q2P3i70JCvEm2IPQU9OGJtAA3SyLfjScHjTwnR03D+I4OWkMyVWsN22P6jbgg6YMwX74StgMpNMxypKv4Pwk1iGVoXk1s6xPRY=
Received: from VI1PR04MB5008.eurprd04.prod.outlook.com (20.177.49.225) by
 VI1PR04MB5344.eurprd04.prod.outlook.com (52.134.123.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.17; Thu, 31 Jan 2019 07:33:18 +0000
Received: from VI1PR04MB5008.eurprd04.prod.outlook.com
 ([fe80::2d2c:455a:16e9:cd4f]) by VI1PR04MB5008.eurprd04.prod.outlook.com
 ([fe80::2d2c:455a:16e9:cd4f%2]) with mapi id 15.20.1558.025; Thu, 31 Jan 2019
 07:33:18 +0000
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
Thread-Topic: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
Thread-Index: AQHUuPrfJwsyV+Y/+E+X0mJVuu2CrKXI/ICA
Date:   Thu, 31 Jan 2019 07:33:18 +0000
Message-ID: <20190131073317.zk746ynrse2dbps5@fsr-ub1664-175>
References: <20190131002056.12024-1-festevam@gmail.com>
In-Reply-To: <20190131002056.12024-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abel.vesa@nxp.com; 
x-originating-ip: [95.76.156.53]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;VI1PR04MB5344;6:fRza+YPmZ61ZdaDtvViRg6kuDa2yMzr4zN4NzLyvHhHpG9Y5yefMG7+j8sBN+DEE3hvIVXgBZy3eMI7FcjPeGywubPexUTp4y3X0AzqXUw1s57YG7B7Yk7eU2uqiDVj5JCHH3GDaEVXzpuFQtzt9TI9HBtqiCbVLg9uC/WygV/YH420hbY/KkXnUud/2CodnYQP3g+Cy7UO40rn7JuNuGIxvl3Lm4WKIUhJiZ4ZkJsqAOYJspepi+ffHHEAnHIUawsNJvPSaEWLz5tI0qkkYyonp1sNu6nVnFps6+vP6FiRLRKYssy4hQQelEBIWiKhUVwkDBtutUsrBRHN+Ij2kJ6GU3rpLdcw5j94tUyL6iTJ3Mw/3CANSNJHEWWxN9oAiOtnE4b4WChqVqpWfBJOYFu42Vyne7oPfGK5BtnAgPjEUquTx0Gowizr9mN3xWcDpmGk0NBkFG0HjzHatojuS9w==;5:kZxy8nq0fvwLMYZFMUG9+XexGxKzZmxWbK3r6c4GS+U1EMWAyj5BFsFUgxw/sFhbPRU1nI+IxEr7/qELOQHMxrBnDg18giRAN8+tQYBmiT0Kvewy+b7sAoChLD5UtoV8wIostAAn2EqYezHd6lHvQ9hFNn+kftwUnfjL4tew03IROVp0ej1/Ocaw1wQcaz/6DY8bDhOrv5GLdHACkWb/oQ==;7:ztsdl/ZY3kBwuZlzn7aMfiI1FDVb8J3kDCYkpVBTz+MHDtizFwGzIQMQXJJ7+HSGD6Z+01iGcQ7+TPd09shkZhkuY8Z52vN+U0w1f5QKqgsbl97dP1ISu11V2KXI12ukqYmBh4F17F08Q0O2Bynswg==
x-ms-office365-filtering-correlation-id: 4a167f8c-3180-4a22-9853-08d6874e5ed0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB5344;
x-ms-traffictypediagnostic: VI1PR04MB5344:
x-microsoft-antispam-prvs: <VI1PR04MB53442EDAF152B70519452697F6910@VI1PR04MB5344.eurprd04.prod.outlook.com>
x-forefront-prvs: 09347618C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(396003)(376002)(346002)(136003)(366004)(39860400002)(189003)(199004)(6246003)(4326008)(76176011)(11346002)(26005)(33716001)(54906003)(33896004)(53936002)(186003)(316002)(39060400002)(1411001)(229853002)(446003)(106356001)(86362001)(105586002)(6436002)(102836004)(476003)(66066001)(53546011)(6486002)(25786009)(6506007)(14454004)(8676002)(256004)(81166006)(486006)(81156014)(14444005)(3846002)(305945005)(97736004)(6916009)(6116002)(44832011)(2906002)(68736007)(1076003)(478600001)(99286004)(6512007)(9686003)(71190400001)(71200400001)(8936002)(7736002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5344;H:VI1PR04MB5008.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fa3fUoz6zUj+7m/y6dd66kIle7dFngOQGE96z4sQkD8waBatjfRd1PmC2Rp+MRJoe23f5+Ahf2Mf7k6QjQ8JdlW8/wc0Chkg84ky9fPxHsqZOFvqvzbAX8gvu8MGyQD2h1qWGKQluAF+4rD77VIMXc4tzARoZI7N+XzcEvue9oUVV9hyRiGBikJ+4DOpk7SzkWwzoEXYOr8+FAK8aaDDAjR8P/GVdCUqWkUE+Fi5gJ1OeSrkKO2ylhbbyq1AULY9agsN/LOErrcfIgw4b1GgSLrsUABCKeTTLhT5JLBfElJQO9pIqfC4zUSjMQkcXuhKDt9/yTNLN61EXtKE3qZl64uyvNo7WYF3Uq9ZkT/OdYPJZlRqqVvycBWb+PvDKHblmLA1vhEp9lKQeUzm1tS6eR9MStc7B9bxtM6Pr8tG2JI=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C9CA31C7190A545BC8BB4CAF551DC8D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a167f8c-3180-4a22-9853-08d6874e5ed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2019 07:33:18.6181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5344
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-01-30 22:20:56, Fabio Estevam wrote:
> Add the entry for the CLKO1 clock.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/clk/imx/clk-imx8mq.c             | 3 +++
>  include/dt-bindings/clock/imx8mq-clock.h | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index 63001bc891d4..a2f8a8d3585c 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -264,6 +264,8 @@ static const char * const imx8mq_ecspi3_sels[] =3D {"=
osc_25m", "sys2_pll_200m", "s
>  					   "sys1_pll_800m", "sys3_pll2_out", "sys2_pll_250m", "audio_pll2_o=
ut", };
>  static const char * const imx8mq_dram_core_sels[] =3D {"dram_pll_out", "=
dram_alt_root", };
> =20
> +static const char * const imx8mq_clko1_sels[] =3D {"osc_25m", "sys1_pll_=
800m", "osc_27m", "sys1_pll_200m",
> +					  "audio_pll2_out", "sys2_pll_500m", "vpu_pll_out", "sys1_pll_80m",=
 };
>  static const char * const imx8mq_clko2_sels[] =3D {"osc_25m", "sys2_pll_=
200m", "sys1_pll_400m", "sys2_pll_166m",
>  					  "sys3_pll2_out", "audio_pll1_out", "video_pll1_out", "ckil", };
> =20
> @@ -479,6 +481,7 @@ static int imx8mq_clocks_probe(struct platform_device=
 *pdev)
>  	clks[IMX8MQ_CLK_GPT1] =3D imx8m_clk_composite("gpt1", imx8mq_gpt1_sels,=
 base + 0xb580);
>  	clks[IMX8MQ_CLK_WDOG] =3D imx8m_clk_composite("wdog", imx8mq_wdog_sels,=
 base + 0xb900);
>  	clks[IMX8MQ_CLK_WRCLK] =3D imx8m_clk_composite("wrclk", imx8mq_wrclk_se=
ls, base + 0xb980);
> +	clks[IMX8MQ_CLK_CLKO1] =3D imx8m_clk_composite("clko1", imx8mq_clko1_se=
ls, base + 0xba00);
>  	clks[IMX8MQ_CLK_CLKO2] =3D imx8m_clk_composite("clko2", imx8mq_clko2_se=
ls, base + 0xba80);
>  	clks[IMX8MQ_CLK_DSI_CORE] =3D imx8m_clk_composite("dsi_core", imx8mq_ds=
i_core_sels, base + 0xbb00);
>  	clks[IMX8MQ_CLK_DSI_PHY_REF] =3D imx8m_clk_composite("dsi_phy_ref", imx=
8mq_dsi_phy_sels, base + 0xbb80);
> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindin=
gs/clock/imx8mq-clock.h
> index 04f7ac345984..74f80b26f679 100644
> --- a/include/dt-bindings/clock/imx8mq-clock.h
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -391,5 +391,7 @@
> =20
>  #define IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK	267
> =20
> -#define IMX8MQ_CLK_END				268
> +#define IMX8MQ_CLK_CLKO1			268
> +
> +#define IMX8MQ_CLK_END				269
>  #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
> --=20
> 2.17.1
>=20

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>=
