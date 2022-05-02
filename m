Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F8DC433EF
	for <linux-clk@archiver.kernel.org>; Mon,  2 May 2022 09:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384309AbiEBJmq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 May 2022 05:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384289AbiEBJmi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 May 2022 05:42:38 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A512948313
        for <linux-clk@vger.kernel.org>; Mon,  2 May 2022 02:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyNakuAcdw4pIUzw8hxz7LEnL7RkvhV73po6FsZh2N9N/fjvZNLaQXlggWkFPVz3YEr1RLBU3BOJeApxMylqZgqY76gXYB/bBV07nt0MHMIG2mEqvt75/PrmRoomFjT6wa/ZxnGer3/WJ/JQeeWATS0Lsija+rsg868AM6EViEzFJ5E6RmQj2Fwz3LAqpmutTQzS8U71XnZwzx+1R97c+lvBQzORl5umF+2y6HzSb8/b2tZPWtyQUsgRf0GZ9qpJy6QCGsTlgNUq0kRehCzTb3mMu9C//eSqklJfSgjjTp/SbAHv+EX6YNc+/a1gE8YEe8KaMvzEbxXjZ60oNOPijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJNdMZ0d66jyVLZear35wkwtVEO6hdryVjJkUO/Y/sI=;
 b=LzcS320ti0X/ummgl+Vhcy4fU/3EZ2Oe0jCxNNkywevqMzhPoyIahG2dBcAuZyG2OVZQOqcmscheB2wmWzELBQc3cnw1sDHTVLtz7GNEc/Hkcu2cHOTBIrsjlfgCQ8Tr0fedSTLaceNXZ7D52yG1mC4vx4Bez48IWKvCptx9lQAJSiIFRyzTeyhWwEirk13+/8VFzBaF+hthTb+e10MnyCzZx+SlWkGRjzqCOMw2gzrn3l/iVt7cWNTPYgu8vrDuKokTCOSqq4ayX87G8BvIGZd+tGIA679kRFoHfJ1oKlNg1ctv+cgVzN6hK3NqrwiiO5abX9ANTKZ9J8CW7MjZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJNdMZ0d66jyVLZear35wkwtVEO6hdryVjJkUO/Y/sI=;
 b=hF5Km21tbcNu1/8JU4fceJJd3tGWGdUsGm7o+nAfOAN6A3bznBqIca5ufkERS0JUtfA0eb0Xni+lgIh00lmxWjUFsIXsnEOrvSZEb+97ltmtpsa09LK7tCAbUbQ7bV7uRLJ/ygSk1Nj1qNGycBBosN2RdfZ+Hg7Mj2uqkui+Myw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by DBBPR04MB6123.eurprd04.prod.outlook.com (2603:10a6:10:c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 09:39:06 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::78d8:955a:7946:fd78]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::78d8:955a:7946:fd78%6]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 09:39:06 +0000
Date:   Mon, 2 May 2022 12:39:04 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH] clk: imx8mp: add clkout1/2 support
Message-ID: <Ym+muLit76y0AYM1@abelvesa>
References: <20220427162131.3127303-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427162131.3127303-1-l.stach@pengutronix.de>
X-ClientProxiedBy: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 497b219e-286e-4c25-33ee-08da2c1f99a4
X-MS-TrafficTypeDiagnostic: DBBPR04MB6123:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB61232FBC93BD61509F851DDEF6C19@DBBPR04MB6123.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OKN7RfkZBZB++lngTDGJBNpCptpTalfwUPsW3cqG/Kf4zWZFZ4z1zyH0LU1/8YNhV6z4G+/Hkjn4ee93LRSZpoijVM8U8Y0eSz+dYPhXnh0ReFVyS/rWyR3Z3+wqy41o84lXiLRgZXkZ6kIJLueO4nYV8lqj/BvgT+N0iPz2qQxvm4FxCON3XKmQ2bHWo33p0zflx8n7OHtn6n+g1WV6IvJ6KOEXKPbNCmY8v7J2R/bmiKbuzM/eGzBl1y/9qFz6sbrtXDZ1Nk33MWzuZtnTyZkEr+j9aVCJGrjPHzlxVyokBTi24Bz67Te4EceFfae5ztayZtIAGGsjfn6S6ydtLR/Bi4pNW+V6eqsc+pFXQzaFM18N5FkSk5d/BFqwwtEmtUQjLkQTgAZfX9XqDmlqNSVFcPAoN3sohuW4KCx2PihtuYPM4FAk3TBTGncweK4Iwi1an7GJqei5qUGJhNXzrAFWAd/a+az5TN9G/BaxZ9drNbGQTXeTemDugdsa+k2TNms8K04n+eb5XiHQs+2vic9qBGx35YOZcnuV+ECltpq4AjNPzcSxRskS8mwoYJ013qFwbdknnakBgmUY5eHaclp8YbMwvMx+jWuKFyamzdQUR4wWUwjPw2tyPZXwuDn833IIMi7Gg8hWAdDn6B2nkE17WQ+o2sAz4o0sQtME9GHkjbM4JPTSrfM8zspqgOVkk2VFME3fTQMXkcH35PYwOgVuC/ax2HKyl0RUsKWmgU2sI9yV8/dkyTx+wnGkC0BO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(52116002)(6916009)(5660300002)(54906003)(44832011)(8936002)(53546011)(6506007)(83380400001)(6512007)(9686003)(26005)(6486002)(2906002)(86362001)(316002)(508600001)(66946007)(8676002)(4326008)(66476007)(38100700002)(38350700002)(33716001)(66556008)(32563001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B0uCu7cy4UbdsFpWxNjUzJaMvSrUJQOe5WxcNfaRDXhwvHA93Efqe26kdXyD?=
 =?us-ascii?Q?yN+K2YXIe48CEA/tbqORD2SWJ5RySR7z5gTkkpytaBvJ6yN+RXbA6JhClJj5?=
 =?us-ascii?Q?XVf+ML6mwsDY6wd9UVexaUS6NVV1tEfqTyNOR2N7eCGGDTxgi1/48wAzgwai?=
 =?us-ascii?Q?Ks/1Dx/nW7hp9+rTnq9Uqu06E1IUO9g/Ajcbtp9gN/XlJsNWQ+hgkooyR92E?=
 =?us-ascii?Q?6kIPhV0UtQkGd/MUMeyMIiBV4V3/xbyGW3FU1rjOfzClyIWKeLqAPQSasfpo?=
 =?us-ascii?Q?IrIdx7O/QLa/pwr1cxzDdlC30+MsBmBylt4q7t5sNv2LGQyDkqcZ7KUwGgMw?=
 =?us-ascii?Q?lQIW8jQ4hmTwsM8oBT0oY4hXnNAg4Qr1iBPNkx4jOWyyUTtboTCwao+qH2tL?=
 =?us-ascii?Q?rJD/Tdo87xJDtCzDoQXSuHM1KKiY0B2tKgCySyTMjxnUo3iqpGj7JhggiGau?=
 =?us-ascii?Q?7OEV3UdPojgv9baUcUWe2Noc1m4fQj00WgHLSClR6IW47MLCY1fIQJhc2Bsj?=
 =?us-ascii?Q?i1jzJX08Cqzm9oUihqH3CWkpfO86JCe27ENeLLgMYWKJS3t8HCIkjITyJ5AT?=
 =?us-ascii?Q?pW4ETH+YmqldDQpLYf832Kab6/zEqP17ZwoZ0u4TqUDXb77K2hrInwRcld/6?=
 =?us-ascii?Q?a5J0uloqvrIzWjmzMJnkxqksfwaonZJitUqNRk7MCFfudwWPAcMhqFDTSXs7?=
 =?us-ascii?Q?vz4BB8VRsnSjuURwCiu8TaLetvRUHWZ0rr5i+vzLeUGuPAaE6oDoaktvv4OL?=
 =?us-ascii?Q?L5W5PKTt6gkVDJ721lCIIn3XyinNkU5EetY9V8iU9rqoPzjYLmRKL1dtE+CA?=
 =?us-ascii?Q?2Pe5POtP6uKuJ5j8d7fthyuFiRMuMdm5dM1vEEbGVQQc/XyQexO4SIQX1VZI?=
 =?us-ascii?Q?l5NDwfr2dIVebGqNXxdKInP1WGGnQmHGyGm8chJTG24QGCF5UKRy69+xC0p/?=
 =?us-ascii?Q?PWo2kfQZh9y0t4F5gsBkZXzpi0oenMi2NEx8z3U49IERwOxsclqImu2X7ksT?=
 =?us-ascii?Q?zph/O4UIqEzGmHKviEEoaeAmPwLC0velN2pZo49UH7PAJVA/sYf1hBm8+C66?=
 =?us-ascii?Q?EoiiRvLiYVmolKLLoyojbQ/1fV75+AM31g65plI/UZbCUAI3bMukjHCwydgA?=
 =?us-ascii?Q?OcV03iH/MbAq7KXT5WHZvxLrzVmAg6n1Xoegt+1KFxd83M5qtsS6cNji7Q8f?=
 =?us-ascii?Q?L1lC+FlhpEs5L+C55X+x3FtbT7uhBpIi4Q0066Qe/+gbmQ/pSceLFpmOflrf?=
 =?us-ascii?Q?Ik6Il+KweejmSXRszmZKO+obX/xBevs3ITSnO8JCYJbsLTiSUSpJcv7yc+HV?=
 =?us-ascii?Q?8o8LT8EZKN+11NGNDYhfK2yWgHqbdRNpaTmvP4UsdKvJl5EKRM7JCp7eqdYJ?=
 =?us-ascii?Q?XbtoSAenBg07U5kuJJaeb86MepB9HT6FPiN6ingDAssV2AVpX4WV0M1tMCzF?=
 =?us-ascii?Q?n7i/esPYndJq/sInW2PcvvZ/RZYThYfO6xt5x3UCQh3rFlmqp4R/4RGO7xxK?=
 =?us-ascii?Q?8tjT4L4vA3ah6S6iDEqFa+u7xopLnYbtmU8MF6lG3XI3O1soHd4kR3HW7qIf?=
 =?us-ascii?Q?IYn9QNQHiVD/OWt7orJFyLAR0uy5V5A7TwsFFbAj4W7nWIXNlBta78sbSVD1?=
 =?us-ascii?Q?E59xxOuTzGdVE/ey8rqJ2C4g3LUjrMNMYGo1t62mMqALC35kwgyR0MU0ejLA?=
 =?us-ascii?Q?NcuQocXN2mUbiITRg3gRf1txp6xn6jNmJkg9ev8O1dO6jKrms5UZfGM+ynAT?=
 =?us-ascii?Q?PBuAadaUgQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497b219e-286e-4c25-33ee-08da2c1f99a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 09:39:06.1192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zqnH0y+sHtCQvZ7dnK9BXUpP6fwA+jQM6mFhBsSVmlCBmpWul4kSLKqMRLONG/4FO1Q+Q457ztEUK0091jhdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6123
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-04-27 18:21:31, Lucas Stach wrote:
> clkout1 and clkout2 allow to supply clocks from the SoC to the board,
> which is used by some board designs to provide reference clocks.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thanks!

> ---
>  drivers/clk/imx/clk-imx8mp.c             | 14 ++++++++++++++
>  include/dt-bindings/clock/imx8mp-clock.h |  9 ++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 18f5b7c3ca9d..48099a2ed6b2 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -399,6 +399,11 @@ static const char * const imx8mp_sai7_sels[] = {"osc_24m", "audio_pll1_out", "au
>
>  static const char * const imx8mp_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
>
> +static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
> +						  "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
> +						  "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
> +						  "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
> +
>  static struct clk_hw **hws;
>  static struct clk_hw_onecell_data *clk_hw_data;
>
> @@ -504,6 +509,15 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
>  	hws[IMX8MP_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
>
> +	hws[IMX8MP_CLK_CLKOUT1_SEL] = imx_clk_hw_mux2("clkout1_sel", anatop_base + 0x128, 4, 4,
> +						      imx8mp_clkout_sels, ARRAY_SIZE(imx8mp_clkout_sels));
> +	hws[IMX8MP_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", anatop_base + 0x128, 0, 4);
> +	hws[IMX8MP_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", anatop_base + 0x128, 8);
> +	hws[IMX8MP_CLK_CLKOUT2_SEL] = imx_clk_hw_mux2("clkout2_sel", anatop_base + 0x128, 20, 4,
> +						      imx8mp_clkout_sels, ARRAY_SIZE(imx8mp_clkout_sels));
> +	hws[IMX8MP_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", anatop_base + 0x128, 16, 4);
> +	hws[IMX8MP_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", anatop_base + 0x128, 24);
> +
>  	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, ccm_base + 0x8000);
>  	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
>  	hws[IMX8MP_CLK_A53_CG] = hws[IMX8MP_CLK_A53_DIV];
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
> index 235c7a00d379..7a6b45a04c24 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -318,7 +318,14 @@
>  #define IMX8MP_CLK_HSIO_AXI			311
>  #define IMX8MP_CLK_MEDIA_ISP			312
>
> -#define IMX8MP_CLK_END				313
> +#define IMX8MP_CLK_CLKOUT1_SEL			313
> +#define IMX8MP_CLK_CLKOUT1_DIV			314
> +#define IMX8MP_CLK_CLKOUT1			315
> +#define IMX8MP_CLK_CLKOUT2_SEL			316
> +#define IMX8MP_CLK_CLKOUT2_DIV			317
> +#define IMX8MP_CLK_CLKOUT2			318
> +
> +#define IMX8MP_CLK_END				319
>
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> --
> 2.30.2
>
