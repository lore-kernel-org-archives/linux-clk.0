Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3F1C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 12:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351701AbiDLMLc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 08:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354715AbiDLMKU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 08:10:20 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED522186
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 04:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvEJv+cO2ZiOcdLN/QlnBcLdEHYCUWmN8+cM6YfvErO4ozOAObf3Lc9J2qZePO2b/Yb0j8VYi1B2KRWEWaAwlrInADiuvznY3AODpoJEtutrpeHrl9faE9XUz/vXVk+OIhnAXohyOf6QqNYi79cgT5LLthYXEX+Q1viNMXwjfHblrs5OOk2OITE+OCSZFM8Oy++0N6dsFyDedGbSsCSNg+rXTbYS1FKADR6mfc177vR4HElKaoqgm+64I6z33iOGiEpOzRhvnZuSRs1ZWr0yj9bX5AJKc1KhYMmDqh/sSCTb2yPpQk3HT/qBQfRJ/XlI7U3rjlyFzVw7/XVJMRY5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXjI0f70UNwCmbb/RCmcVODEIdyUtKLDAq7KO1Rpybw=;
 b=CX03662OqLTjhiptNJjRWLkaT6Z905TeePhbQruxYjEejSCx2IdkvfIcFmAENQ3hGbXS/vK7t5wQnebnNEL7f9L8XJLT2/lXIUEwxepohieEoMCd8BIwuO8xh3jsfSik73TuL0WSxiqee/13Ds5izkOhPjbXK/TAvvnl3PwGj6YtZ2cUqWz6xuWC9+vkVyXtvD06RlpFkRv8TlSLg4N//qa/xrOkkCeWpyJa8NVP77SrHEj+wNPKJGB2dxvzVw8LTR5FpIBL4u6rpZiM8JAbnw47vgoz9lKAaSmZ+O4nJAKFeFQYO/Qmh/zFAMtsXPe30fASCMmQ1J+8NLigkZ/IcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXjI0f70UNwCmbb/RCmcVODEIdyUtKLDAq7KO1Rpybw=;
 b=fSv4Iyiw/X8GE3DAHsmv0NYbinulCTIWjX5wfnyOp0IApioYhzimVqeETjvy31r+5FuQOenGyVa/YfPYszZ4OEgZp1qWR1p/cG+7atRCr3b0sinSUkJolFscBeyEiIrkQBToHIoVWRd6QOz6fwZo/tikT/jwSKWZsqGKrC+0t3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by DB3PR0402MB3867.eurprd04.prod.outlook.com (2603:10a6:8:3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 11:13:03 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::a9d1:199:574b:502f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::a9d1:199:574b:502f%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 11:13:03 +0000
Date:   Tue, 12 Apr 2022 14:13:00 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] clk: imx8mp: Add DISP2 pixel clock
Message-ID: <YlVevMcGSCO+19Qi@abelvesa>
References: <20220313123949.207284-1-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313123949.207284-1-marex@denx.de>
X-ClientProxiedBy: VI1PR0202CA0029.eurprd02.prod.outlook.com
 (2603:10a6:803:14::42) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1671d27-53a2-4b86-361d-08da1c7568e1
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3867:EE_
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3867012D05B2834C46D118E0F6ED9@DB3PR0402MB3867.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S3xECRvocakO70qoeLtUmE9vgR+Q28FX7sUWMPOmBpuioskvvsvgCshusdqUjDVzgsMkEyhEHuBznzDRcjZVJYtZs48hmfS7KaPWAaR2HIKWe7C0dz1Na6B/I7vaCnYZh5+R/f4hQx1ZqRRiOYPiIsnESVnL6IWoHj9heXsQRxqsFdbOmk44Zw6HRD8mL2cUiHpf8cxktk9mUe9KXjb2rLUDema+eLeDATWClBHAipU+ujlIPCifx/C6n9hvB7kYwM9NIMJgjsvNH6JS3Z3IqcGw6J5oKlPTx24LIqRAm91PV6sY6nosJAsnZn2ZRM7lCD91DEuTCfaDCCNws2RKDfkKPUOI1rXC1OF+rmGYZzZz0SCh1WaqN6KkTxpEUlUxHidDx972GgOMke5XUZkip9Uv5vfZWRpYrNfkgFdhSUrMJg+gvH62uG4fii5p22eW64dbCUzIfsIyo6Z7HpJZ+M18fbZ0FLl19jO0JURBAK7t4WTPOcYTdre803YcNQnq1CxB5b9yTO8PYUeNdu5vYQwy8J/KIfxyrj9BSQodBkXdjsmHC1XIdmCl4dRb1loVGmIPRviuvdoD2bDYx4eyfx3At7LkTCRdFtSMrEm6m05cgnFjLKlsTk885svKcyV4+z8rReuwohYnZlfZLum075HNV379kojcd1HTk+IC0x18UPTS5SINPFY68xyITsnf7ZgknSoFSJV0BSsj88WRTBAt69YNLS0VijjvTFIe8JzZ6JTBWO0S0v1mfsw8/voF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(6916009)(54906003)(83380400001)(38100700002)(6486002)(66556008)(26005)(86362001)(66946007)(4326008)(66476007)(8676002)(508600001)(186003)(53546011)(38350700002)(6512007)(9686003)(33716001)(52116002)(6506007)(8936002)(44832011)(2906002)(5660300002)(32563001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cideA5Jk/RxDQFk8bW2fKFzwedkUFEMNmIqrhplHCD/Usyn8XC6l1L3M8fCZ?=
 =?us-ascii?Q?OUPHbeZ1s1iDYzZH6LQcCvWY9i7jAPWMryisluyTeraJ9E9uYGnrTR4Q6Ysg?=
 =?us-ascii?Q?Oh50NLB8a6Nln8C3oK9rziyoGol1KYUpYg4umnQaqS7DRtnNsygAIhmlkD8N?=
 =?us-ascii?Q?3QlT+CRtyBxDXIltu4YxhTxdjcTPb46Mj9L9Zk+Vw7A3IN4xFa3ZD1hXdCXB?=
 =?us-ascii?Q?6Zx5AyD/trQ2oN9IlVLP4LgaEwaaifs/gw3TnpmG4lH4ccYy6xr0pAWkS+3+?=
 =?us-ascii?Q?+YfZH6wCvKZtuRqq3Lwprh2blXZna4WYXqX6JzkO51pzraMG/0E5dZ6ax60K?=
 =?us-ascii?Q?95PsUMPKBQT1zQhuDvqVXCUNI5eZU8vlpTfnLn4SjKWsVqP/8W8yeCCGSWct?=
 =?us-ascii?Q?TRe+wHfODw7ywQRJPkLRbiFVD+veRAVttUpUXXDnyISH8Z/ESQY/xCgkYOz6?=
 =?us-ascii?Q?MdF87lbb85wHPGq8Wtz1NZQkJCmn7JdLAOVfraqlRyYu3/jk58abATE6n3re?=
 =?us-ascii?Q?vCNQDG1UhsYHDa29Z27bGxzPJlocPegoj5Wv/eaPOACjRZDH8env8JjUm42J?=
 =?us-ascii?Q?hFTRW0FpvEEfwcyd/fi3GYVInM0X2sJ+9W463Xb+OllhbgHhs1CfDOHGctUe?=
 =?us-ascii?Q?+zvDnupRz8gxiR8phZM2rrQ5fTb4ZKHNu9eLC6IHbTihVxLzWmWB9Wq5jX/x?=
 =?us-ascii?Q?ybJUszWuAFfbocqsXQkmNQIhBdtzLVaItdJgBCr8U3pxEfSgJFTSJ6pNULp9?=
 =?us-ascii?Q?jcaLSkNM/DBQWJ0+N75c3y9OurTd81s3U8ZKfAwP9+8gCYctt+vuAYI6VDRR?=
 =?us-ascii?Q?BkJ8o4ZIsltws4cjOEbN9/pLvuvM4oApa8J3yPvlTQGYzuWHv7wLXEYuNKeH?=
 =?us-ascii?Q?CykRWmAq1PxvCXcstYAPmQqx8WKCcllKMLW78Zf5ZmfAwEciJhGTemfWlU+c?=
 =?us-ascii?Q?fgiecL9lgRPChiS+eDHpnstIJz/JvdVy+UQrLw76jicsZKMm+CQmmIef6+Vc?=
 =?us-ascii?Q?GB1jsayroFGorKSyD3uXK1bsf4qM79nY0z9b9J8LxMTyH4JEGMTimudqWORc?=
 =?us-ascii?Q?Lz25km1lSS2vgIKxR2xIEOsu3/QbiqcBPTU/arH7dKVF94YN+zykb5z4OlXn?=
 =?us-ascii?Q?3NwgiAbST6KlridkFzfVbYm2GGm0wMin8lHynd8i9Lwi19tG92NN+qHfNSJz?=
 =?us-ascii?Q?htYSi1Xto/ieNu7L9Dswa5TSgVIK9sQbPNlx+sfnxuP3GCIEovwuIfyloRzf?=
 =?us-ascii?Q?EpuwpRVUWfsDh+zkk6QOVo+aGRQPRjrxNhHLVpV+rQHsn0oWrGBdtWwxkg1S?=
 =?us-ascii?Q?5X9+YTuZizR4KC5e8yxYcbHt8msb2NFBlpLVjN7qWv/iFqN37FtMMegqUhcH?=
 =?us-ascii?Q?QZWfiy72MSA+w3SIYxBXwiJkkSVl3dfbKMiyuwX6JwXVC6zADduDIJnQmpex?=
 =?us-ascii?Q?suZndmnuriG+403zBiC2f7aJuHwcr9KE4pEK+aw33qGYH6L0yW97st6K1KuA?=
 =?us-ascii?Q?WJTVqleGrncwfWOvutYge2U3pJ2uTUIUrsBZKi3tLLfctlpNwaFxhCu5Qijs?=
 =?us-ascii?Q?Zmt89D+GvEcPmHtB1tJUzzged8Ky5qlV9xYuZz4OIbpPE4pk7PfuV+oW487p?=
 =?us-ascii?Q?je8x1yDDCEP73X2U/z1s2Hh0h90VSY7iMBfvvl6REWZECspp8voGj0M+pIJK?=
 =?us-ascii?Q?GSM5GgGm5CuJK6TcX09YjY5cRL6erHGUOzlRpZ1O3FfbMB+oYd/6B1dtTmFB?=
 =?us-ascii?Q?jExxDBG/sw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1671d27-53a2-4b86-361d-08da1c7568e1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 11:13:03.4249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: au3kFkmUh+qHYD1cbA+VA3Js0zz+IxQSdxQe0rLz8a0l4hFY+vVx3aPLHRSkL7a1vXsKC7t/lsZ1OOSINJClgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3867
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

Looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

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
