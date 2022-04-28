Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EFDC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 14:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbiD1OY1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 10:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiD1OY0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 10:24:26 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10042.outbound.protection.outlook.com [40.107.1.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEDEAFB22
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 07:21:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6cXf6OSaBbJsvnur8/f05t7uw5xLCa2SU2QE3WycUtW2/ceEyOaNOViEv4sMwnDvF/FEM6+hjXkFeDoOHJ26dzsNLtx/21tXDzAfr7jMt0v/mpXPhc+zSRPGsob+f5hJh6HZDp2ZxArdFGM2agmKU4QuGQZv+t7Y7v7zUD2BTxP2MBgyBnSPwm4wZUqIsYzSb9G0ohr56am9BoFbPGzZutj6CE6CKVtwWGTiL3wvHHevHQV7VsRahaXUoqpXaLKEmp3Sp97q7rckotru+8UUyMvc1ZUmEOJSQV7gexa1lJVIbh5x9YI5CYFyV64h8r35RIAOrOAUkbwq3ufcSMyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhkZ1OsiKco2IA7rYjsn3jtDIQWB4PGLyxvk1l1bVvU=;
 b=X4T2h38lQd2tIrjDE4mtCU5aGaMX0Snn2MYP5oLwCblxI99a/ePDWI/9uXH0S3JYPOQa09KM5JmMgX1pkfLNaByHXD7NwAPIwjSYRsoG1lTqUZ+dSe8KK3FtrVDA+tL9GTo7qbDNbFFfXFhPDzbt50gDpP8QbjeMOjiyn2kn7whTLwQpFQ3jKiq9/bWy6IAq6QCXDpXWSBZVFYLmuYxLy6zPCr6uBImIxJVRG8Y8JCh2Ttkj2+0uk8RFmYxeh9HGHGuwcXwHxpWTnXpHCJstFjQ6CcE8u/3heO9P0t2UePQWHmWohQjl9YuNgbVNzXw04dGGbKGpYAgRKviNSGV57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhkZ1OsiKco2IA7rYjsn3jtDIQWB4PGLyxvk1l1bVvU=;
 b=s+bz1qeSMqrVm1CSshj+uYnvXze6siy/ik5D5eIN2aW76G5jFMQzgilsFCEHJ6XlhrHDb48/kTJlzEyJlhk6u1+2+dBK+OvyPtvpaLR8jsX7/+o9vttS+itParml7mfoCDMMIhkGMOyt1vtz8dCz2Q9srZv+U2ppsYRmUBWut4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AM0PR04MB4818.eurprd04.prod.outlook.com (2603:10a6:208:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 14:21:05 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::78d8:955a:7946:fd78]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::78d8:955a:7946:fd78%6]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 14:21:04 +0000
Date:   Thu, 28 Apr 2022 17:21:03 +0300
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
Message-ID: <YmqizyDmX5GqD6Kh@abelvesa>
References: <20220427162131.3127303-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427162131.3127303-1-l.stach@pengutronix.de>
X-ClientProxiedBy: VI1P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::14) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b0bbb62-9513-4e6e-e271-08da2922544b
X-MS-TrafficTypeDiagnostic: AM0PR04MB4818:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB4818D6E9F0A1EBB446E45D99F6FD9@AM0PR04MB4818.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FWP+dYUUppOVCLAfGV26SKUZl84ftqc2/CNtybeYRHoCUrewJQfqDV/JC7uVlfaY9hrLNa2A03jih8/3fUAJqj2lLkiAU0cjYjl25EjKboEPeq/3qZfzPCXSFwby3HJr8jlBIhrGij4RXFJZwwJfRcNuTiTJx6U527YrMYp4YW13AR5yT2LHknzPvEJjOK01pa/o8x79FZ+h+9XB5AezeIhcGeEZTwru/MG+e7il1Gk2eMVbhPRydYcPxJ7D/zOAd4LztFAiCEs4i0DSFAzaPRsSed5t5JgKJZVN5xhrgqjvkog5sTR25UU1tbUYYX9MJA3XKt5NkN7wPDmOnPGWgojaBSOY9JyuOVvT3YP6sNedoINS2YOnNZMMlGFdn5OxWPCxo6RPv9u0Spgun/2ks4DjydxRXRhqDXUo2CGKwtyZJn40bL6qgNCQrDYkbKU1pkfJ9c5/pDXp0ii8QiRZAHFeIGni7PZ1Tjp8uo3UJOWK2A04dIx9NmBKhKjwd3yivEllKY/cEvGQHjquIHtjT6zeN71iYWPlwzhd95+bFaOI4RzG5/YOqQy3XVjSjRAvqgY1TBUc/I5YbNtuvpw/qpQWGeqYm2EJxZC3C3dGfBtrcjguZ5VqRegdZKCdbOMiPcKiNjz0WHRxHPw4eVsDgMMNYuluxQWgSo4Cf44po9pfEONfOWRZiXhLp5oM5Vhxwe/yOGegjTewLiBKLPgepZmnt8BbqxI3NW9cVV18b4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(66946007)(8936002)(8676002)(66476007)(66556008)(6486002)(508600001)(44832011)(4326008)(5660300002)(9686003)(6916009)(6506007)(6512007)(186003)(54906003)(26005)(316002)(2906002)(38100700002)(38350700002)(33716001)(52116002)(53546011)(86362001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cK+O1MO7ViMDalQWAzYxy1TroGH6/OmvgEVB3s9j8L1jH36Ngdb1HCnDj2+a?=
 =?us-ascii?Q?7QhrcblkODLWSeIPJrkM2gJXFpj5sEa2l9sSr0/9Tf4J/voaRnE/0XBDwd4w?=
 =?us-ascii?Q?825MUq1XGmuVjJrdJ8oVjIwAE6+g7LqZNFTtqyXwpzVQMa/XUVzEL9mMxgbD?=
 =?us-ascii?Q?91MQLElCh/G5CNdIyzKfLiKnJxsaQ2y0kUgS1KBGxzBD6xt3yeiBsxcurLoE?=
 =?us-ascii?Q?F81q5Df7sDoIhE8eTd+4Pzl6JHUYTsUWtLTm21qe/zO9aI8Ua0shXygF1Y8D?=
 =?us-ascii?Q?DBORGu0WGd5TYvISsMv4/pZqnUiqHwEqKSRxpfM5zcT0rZNq5v+M9COZ2yPW?=
 =?us-ascii?Q?2J5W3VW4DfnDuiPwG4degrvp5PS/HgxxChPW7e78Z/l/04S0rEaoLpzM2b7m?=
 =?us-ascii?Q?Y0BNehxT4vDllNvYj4aUADQhEgIr4i9VW+K+fVNw+ooCH+eaGid33SmAz65D?=
 =?us-ascii?Q?N75spK3Hmx32xJSQH1dViyKvQU02yfvxkHrBmqf5g3gKzCvKis5SXfu6Ok4X?=
 =?us-ascii?Q?+CtkMPD0UmnkJa1KpySA7qcXV0qwZD1DdnVndvQRSWCz5VmHQpfdGKhMVdBt?=
 =?us-ascii?Q?FhJ1lHPS6zgX2/NED9I1aMrVlOPQQpKIe93NOvF0k1nyitAVF/qzzoxQeO6Y?=
 =?us-ascii?Q?cxymTqEUOUGIY6y9Ed5MrbjIyiW6q6Lc3U+MJT2XsNSZbcG97AHDnLKaLnuN?=
 =?us-ascii?Q?2CIeyxUIOt8OlDpSbcSgaHI4W4QsEuFPQt0EoZYt4UtYupYXLndJVpuDfqky?=
 =?us-ascii?Q?6ALo5zNQjbG4IHmdHg+deiTz1LpjLzjTgDtpveJOwfXwuqZL672ksL3g6biZ?=
 =?us-ascii?Q?SDoKk3kMzbHNE5GEYaQeLZgi9RWRoHN+mA8mmGbqpKAp7mQWXLJU2XTIF0mp?=
 =?us-ascii?Q?iEfIxzUNRpXapsiWeaohIuXJjrHCY/EQLZDxAFbHAQVl9JNUkVwWg0hUCehs?=
 =?us-ascii?Q?NjYeZJu6FbsrSCm4jORiKZ3OSF/84RraEhzipt1/DuOe6QYLTXscKv4aHbn+?=
 =?us-ascii?Q?fWrdY4pBfHKP5hF+cxIGKTsU7AKiXTXNYzt+vFzAGvglzpqcPIjFogDIqg8O?=
 =?us-ascii?Q?sVKS73ROxaCdDQ83I0TawGyqAYZOERxATcuTrZTf7hzkODV94+qapRZi+uVh?=
 =?us-ascii?Q?GkwK20EuQ674xBTSK63sSIo5tw4xyIdPbTt61KRJji+UPStRff0wxPL/clwT?=
 =?us-ascii?Q?lidg8TmA+rrlh6JpfbQaO39PmUaSS8/PUrevpCVjavEk3g3Gl2DTmDNQAlFf?=
 =?us-ascii?Q?++qaPfKHTryoiu6EVWOhnltHmRlglSqiAYc5hqPayoavSiA+3HuSQ2zEOIAk?=
 =?us-ascii?Q?F+rHqGU81IdQBJZLvpqLFVb5f8Ik8LyMByzpTQr1X4U5ANq53KxNvyRBlo8z?=
 =?us-ascii?Q?T0WNUCoWVhXalzsm262CxqU9/0mcLx/tDMLDuvsMYAYxtJozR1af7vg/qaP6?=
 =?us-ascii?Q?xyJF3pXTi75XoUClAu7HcG5yaeEPBm1BhJodfJjyH/tWfehKsv0Pj61KZatr?=
 =?us-ascii?Q?FwY45nOURbL1kPUxEEjN0E9lQ111CkAzw3RRihom44Y1Embxc+ExMjYEfXvQ?=
 =?us-ascii?Q?SDVVBRhKAxX+uph5wTJ9r4xYoFjij2VYEeTQcC+lO13X4YtfHpfZjpV2q089?=
 =?us-ascii?Q?qflzc0QIdH6nmQ0qz/g/CxrQWVsNv6BR3layk80GYsgpfIxp5Od2s+1WRLNF?=
 =?us-ascii?Q?spZggEg6WyAQNkBuFpN82/dQoHNOBl7GRbQjsuFIkyKxoPMGUsi6AyVVnxbq?=
 =?us-ascii?Q?iDKAhuDrhg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0bbb62-9513-4e6e-e271-08da2922544b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 14:21:04.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDyYnAUNFAMamcPOAthH551YrzmIgoUGu+0fGPXoEyq4iOTy7Ys7uiW8yolWCHbQUJssj6VJAEAtP83UkoUnKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4818
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-04-27 18:21:31, Lucas Stach wrote:
> clkout1 and clkout2 allow to supply clocks from the SoC to the board,
> which is used by some board designs to provide reference clocks.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

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
