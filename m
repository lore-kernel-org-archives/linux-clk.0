Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6050C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 18 Apr 2022 09:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237190AbiDRJ6Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Apr 2022 05:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236553AbiDRJ6X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Apr 2022 05:58:23 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2EA167D1
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 02:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPQZmUAvyVhR0SC/fx8mSlqDKe7UOxmXpwSzrJOt1wdWpeS4TwOKtfK/CJDvMJhiNW1ArygplJZJUxYVDHdMiux8aNVP5CCm2u6K5jm6WZSWBDG/kjhWPhifbcBLfrAw4xVdUCCwQnAOOZ1+OZqd+rx/Ya75eKwv1zRCssbd9Tcvsqd2wAQRRe5HycI1Ski1r0P8b/V/MwUJAxj9IhgeFxzjCi+YSiSVas3sUMbanpYv64J6+A8zvpaJuc14t8wCPSq3LMHpmDAT29Qgg9z2dW1oHE/Uh+Q6ng4JQog87HwoVMSKpG/cmLpA+vIcbTcm02Y0DeA3jNIEgG2z9hK5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucaAgk+OqgkdguacH1hBw61WYn6WsBzmkzXZpK1MQnQ=;
 b=VBwHR4YaZ9vAlivnv48Apd5xoJbXgkBVnj/rsxSi3XSYE+nJjrZ4AWi1t12CqKZo0Knq8jBrf8rfrY5VmdRB3gfGnd3Kz2Qqd7TsAn142tevkRoGMR9N+4VbHlBff0kB/MYUuXGm/Xb5gouTT59zgjKhqU3VYpbyb6H/70alZiC8D1g7ACM3r9/24aIKiOnGszivjhQJv4AFcD04p2EQc1z7jRnvO41MLtHm6mCOl9xBkJ4MJIaNBzX0XvrI+5VluGfjw/S4+AwRq4heYnzVkbB8McWKuOtmrqsXMOlolhhAOly7DDohz9oLjHk2hGHDSQA8YQ1VTXt3s1Xmm8xW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucaAgk+OqgkdguacH1hBw61WYn6WsBzmkzXZpK1MQnQ=;
 b=ItSloSlgISr+zPrgfWbjzw3cRBdhMiQNd8eMZTacqW7e7f8GAHK+8+6TwGUpkDFpxZs7XJifJWGa+nf0xdaDDmC+1yLfwfaZnpeVxUJUlVOIX0Sj9NbLuGMEnZnw1i5lJX4+9XD3Ge1HYBgYPuKUwW5Il3XKB4iRC+1Kahm0A9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB5966.eurprd04.prod.outlook.com (2603:10a6:803:d7::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:55:41 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::a9d1:199:574b:502f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::a9d1:199:574b:502f%6]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 09:55:41 +0000
Date:   Mon, 18 Apr 2022 12:55:39 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] clk: imx8mp: Add DISP2 pixel clock
Message-ID: <Yl01m14W3OHvHHTl@abelvesa>
References: <20220313123949.207284-1-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313123949.207284-1-marex@denx.de>
X-ClientProxiedBy: VI1P195CA0082.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::35) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b030b9ac-d577-41aa-dafe-08da2121992f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5966:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB5966196676E79EEE66DCCF8BF6F39@VI1PR04MB5966.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kGYCHtYqX2AD5D4sAKWwOzCNBdP2FriueuX22fnNCuRietmLiX/vGEYOzcUBQLke7uBg3oKpB8TkEajhPiXD10jRJO3Oqt4uM+hUL74PnGSGxKrleTU8ZanWDvsyWWovchyy5F8dsH246r7WCDZ5NYn7F6lklLDws5vn6Jm7CQQM1EzLGQnfDkCXDa72T145PMm5ZAn5DTpXS48++DdegES7xLhaLJgqd+VpBaXM5mQvEvGWj2sG5QGmQPOgLusw4GttM4P/TIpfPchTvlZT3f6BeS1xdtQpPmMEXOt6eQzLZUUI3jN09qzcqjUO1ceQ9sIyBcEVASrnliu8ydgX2xduhEcvXE8J8CTCsLOWdxPsvrlWuNe8cRlTCYu5bz0yjIJVcrA6F2TDCwc9g9F5ZjaMDZupC5grihaXHaZdC3zQRaqIEV3R+RA+xN4TcQ2aYHMTig6IV/4o/7QfBuKxzVL9LlgPKyQS1t4Ca1+U23eKZpyvVDrUYYMW/xNqbBetf62klBkZKxRhHdgLQ0BmUu1lhK13l265vueNVVC5KmEs/Ziy1Ni9lEKm7qgbwrlsWJveh9TCfJ8+AMfoLz2LL97hpbrZp3Ay3SsApQxt51hJQwCularnAMMGLxXqSoQnT9fp3ObaYARQnqgLaIR8MG2B6CbCIgMRwRd2KRvkMNsSjtLaSHSY2VMJNvUonxxZVF5JHuBq0eOmTLcj7ir/Tlrf+HTwgqdP9F9ca3buBNw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(6506007)(26005)(38350700002)(6512007)(4326008)(9686003)(83380400001)(66556008)(2906002)(66946007)(66476007)(508600001)(6486002)(8676002)(86362001)(44832011)(52116002)(53546011)(8936002)(33716001)(6916009)(5660300002)(316002)(54906003)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQPg4IhRVlO/BAx1hpcmkQzc+Uq4/RgQ/7CsAbxGRB0elGAQVXnOWQzqWQXd?=
 =?us-ascii?Q?xWRfYiuzkm0t1tT7DzHB2birProEqIk0uApz/By2ngNgoSh76GFiUwQK6YgL?=
 =?us-ascii?Q?6bSbZzklo8S1485cElK+qASrm71ThHAfMQz0nC0fY5ov54qy5+Bwy4YKQSsK?=
 =?us-ascii?Q?OvMIRdwlt/EI0V/FVJ9ztI0ks/r97w4dNEF6Xwb/ro5nsvE4+hadQaXgqI1x?=
 =?us-ascii?Q?iPfyH1wnr7dqtb1jeEXYcDrhV1IKjAvfDT2rWYINHuA76jVYW/O3m/x5rEOw?=
 =?us-ascii?Q?r/FygGSGlGQgeqsGZq7AUiwk1u9I8QYb+HCEkoxPHE70fRd4DYHRDWz3sv4g?=
 =?us-ascii?Q?WhuY67YROTKiDmU0KF2mYR5CY1Jec51qZ7gc1p919wECmvFdLkfQA+CNQWM5?=
 =?us-ascii?Q?JDar8dZhIRjbQWi0Dsl5HfuqgTawPFOKPtHtGUKLThIHKtg2fLPdGxD432wn?=
 =?us-ascii?Q?d7mBeVXewj/BV9zEX4ha2yTra+X0fyri0QyFtt42TtR8ghgOzZJCisyZlUNK?=
 =?us-ascii?Q?HqehNX8hq9uXDwVMRvZJvgzwPx1VMjj3iATjCADPMtv80lRx0CjotMNyu2bR?=
 =?us-ascii?Q?A4++qrPB7bwtr+VvJVKS3/1SnOcMAffWfXgw1lwtgpMO8SXRb0g2t2xXkvPe?=
 =?us-ascii?Q?LlR3vyqz3JuiTgDuVUdbcHfYcdCWhx4kyYbMU+Ixfymb8y45cueI6VBwfzoU?=
 =?us-ascii?Q?80ONC0vqZ8UgW7bWTrj7h6RJAYa1cy9DF6JB8t+J4J7lRWan2mvkijLa10vv?=
 =?us-ascii?Q?1ne6PFsNNrYdYCCeR6Dr6PJM/uvmHgwmq4MgVJUA7TiDIJ4UYahJ1g6UdY1A?=
 =?us-ascii?Q?zSt1qilusJfqn91+GUV3a5zAV5jr7NrPR7lUqZ9QksNMrPidptrf6cjoTXtH?=
 =?us-ascii?Q?NQCby4wVM+fJYlSxPvGEoROUWB9w0k0Nc6o7H8dZX0dylHl5wJfDyYd7A56U?=
 =?us-ascii?Q?AF2pqVlLL/4X8nAq8Ls3aRQtpS0dRIl6j5K4UQ64OMpKzXGN4BtVAD52y4GF?=
 =?us-ascii?Q?6+lKhIpUWFjHB+NDZwj+/RklTReKOoDWJchyhqwtbxvkis49eO+/sAvQ0BcS?=
 =?us-ascii?Q?CZSIauJ+8iZ8T+ST6popuBtXABNS6mHhBS8yHeCKEN7ziEVf1ISya+fZglr2?=
 =?us-ascii?Q?eelMsJmjXETGhf5WmwiAgIwzbP0KwPIn7eM/1GhewNEmyagAJtU94UJwvKkE?=
 =?us-ascii?Q?X5CFDCcKmCsC0PyMNVMUJS/EzD6OKfhq449CkYlXX2HGaoAjcWxcXSWOgLjs?=
 =?us-ascii?Q?07cZ9y+Pax6b0M7oGWoG18tPs7jG5YltS7z8+TjCNOBcj6506+1eMdrfTb5n?=
 =?us-ascii?Q?wPQZP7CFOnEJeT95inEZJhS9Kq2Gz+HKfZCFz75+q8J/bJvbGs7YIumYITMg?=
 =?us-ascii?Q?WIsS32wtp4qiX9x3gg1H1hboGjzDkdZp19mcyw5gSflHwO/wIM3To5o8VyBD?=
 =?us-ascii?Q?Li/m8M1SglUMiTLybGJwJ5OjkbW5DRNsJFOIeNu9zXKIS/3qdGP2bL5Hskbx?=
 =?us-ascii?Q?GfUWR1+TeSpzJxu3BaIEr/Kx5wb2+MC5HrBFUj5bI1kQ11imaPiow1bfypqo?=
 =?us-ascii?Q?xI25obJW/3gICz5n+QHqJ0Jo6DtwvijeXf88DyaDYTav7PmM/70/u2EdhYFt?=
 =?us-ascii?Q?9XLR4NGHa3mdfuuY4dABIjQ2ryYPiakciFH78q59GUXs0V4jVEjzvg86AfJc?=
 =?us-ascii?Q?ndYnjshxvKieL9tAq+rqGAiBsyJEd3OlypWvRj+0GEhRcOS5+3FXC1xUgaDK?=
 =?us-ascii?Q?Hy4If/IVuw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b030b9ac-d577-41aa-dafe-08da2121992f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:55:41.5752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /R3gf22M27W0hFQois46mPwohBXgi4p3rAABVJanPh0uUE6rqU3L3Szv9FrzOTr6EiyvtfM0kxTZUF5JbaVBlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5966
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-03-13 13:39:49, Marek Vasut wrote:
> Add pixel clock for second LCDIFv3 interface. Both LCDIFv3 interfaces use
> the same set of parent clock, so deduplicate imx8mp_media_disp1_pix_sels
> into common imx8mp_media_disp_pix_sels and use it for both.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>

Applied, thanks!

> ---
>  drivers/clk/imx/clk-imx8mp.c             | 5 +++--
>  include/dt-bindings/clock/imx8mp-clock.h | 4 +++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 18f5b7c3ca9d8..d7a0339ae76ba 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -358,7 +358,7 @@ static const char * const imx8mp_media_mipi_phy1_ref_sels[] = {"osc_24m", "sys_p
>  							       "clk_ext2", "audio_pll2_out",
>  							       "video_pll1_out", };
>
> -static const char * const imx8mp_media_disp1_pix_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out",
> +static const char * const imx8mp_media_disp_pix_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out",
>  							   "audio_pll1_out", "sys_pll1_800m",
>  							   "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
>
> @@ -538,6 +538,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
>  	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
>  	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
> +	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300);
>
>  	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
>
> @@ -600,7 +601,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
>  	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
> -	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp1_pix_sels, ccm_base + 0xbe00);
> +	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00);
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>  	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>  	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
> index 235c7a00d379c..e05d21bf7813e 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -318,7 +318,9 @@
>  #define IMX8MP_CLK_HSIO_AXI			311
>  #define IMX8MP_CLK_MEDIA_ISP			312
>
> -#define IMX8MP_CLK_END				313
> +#define IMX8MP_CLK_MEDIA_DISP2_PIX		313
> +
> +#define IMX8MP_CLK_END				314
>
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> --
> 2.35.1
>
