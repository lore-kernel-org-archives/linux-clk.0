Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00409C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 12:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D764E611C9
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 12:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236676AbhHXMOw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 08:14:52 -0400
Received: from mail-eopbgr40045.outbound.protection.outlook.com ([40.107.4.45]:41143
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237149AbhHXMOv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Aug 2021 08:14:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgsePrdFMxje/iC1wIWvN6Ez5UbRH7FKu+k3nN/hlOtRyTxor7+Cwqbeiak6GHh4Y+WoczsosP/NwiXDwtMzpR772a/Q5pqcuOZtnmtqbnsc7QOvvuv16erpKgPJB5Nkko13/e/XTCq2i5qc/Bqulc8GMzJLDlpkACHSQuCCJa6cJAS3BFKdn+7s5WAYEAVIq8IcJfXmLCnDv0wanqcRUHn7u/MMvKZYCQbG/47DlVL+qpZ/nF6xYhxJSBQZ8tu6CMSAmk4q8wS2ndhoy6tt00wYh/rNjsEylY++BMnsO6dnApNsvSlOzL2sfcFm5fS62LPQIzYzd/reBqpoghbjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTi8fMmjqRBQIeZaeR7ft7Iibv1zqo9u9z7sdDGpseM=;
 b=XUSntlR1dLV6Q92WI5b1xTbV/n8T8mx9iK/5crHLOsmqqqIb3eyI79ym40puR+/zciYeymyxPcA3VH1g0mr+m2hy0nwj4BJ9afEal615EvuVDYBzRb3uhKVbvfU2OHPDV370xKlx3daaovyS5zYS1M1UM2CHUZWrukH2tuPGuM72lPBNHJAOROQi7bVEW7vQByteLcAG46bpDAJavn3WvRA3GNr5SPDw8sWSlr3FCZRMJ/kbnLwJmF4gMpqd3lBADOqKb8GawQnF09+rZF9s/WI5okwHaGsRU7jQaS7pMNInOszrgPqxQ1buKkKQnHIviuiGaiPbLVzXKlVQOKOEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTi8fMmjqRBQIeZaeR7ft7Iibv1zqo9u9z7sdDGpseM=;
 b=VMGvdw7w50G/epBPUwywSO4qQaoQ+oT6/a3Fp0AOwnUEJEDdX6vf4YGXUetBP7ieiiQsriJinu6Ox3oQVMEOQfI28j/k9Pu66GXjrnhD88oXdlcnsOfRMwoLmlarvrf0SXPjca9ZId/XsA/oSfphS3OVdauCkzBEq3h5gMlZkiM=
Authentication-Results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0401MB2560.eurprd04.prod.outlook.com (2603:10a6:800:58::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 24 Aug
 2021 12:14:03 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4436.025; Tue, 24 Aug
 2021 12:14:03 +0000
Date:   Tue, 24 Aug 2021 15:14:01 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] clk: imx8mn: Add M7 core clock
Message-ID: <YSTiid0DyCebErn0@ryzen>
References: <20210819202036.2084782-1-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819202036.2084782-1-marex@denx.de>
X-ClientProxiedBy: VI1P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::30) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.27.180.28) by VI1P194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:be::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 12:14:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c0690e-a093-416b-7a9e-08d966f8a98e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2560:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2560406C216151EB564F8432F6C59@VI1PR0401MB2560.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1B3lz4UTemgPyU8Sc9OLYeMb2x+EpMzt+tjwRJOOg2ks0emafIwX4qUM798FDT6+hYvchyK2k6Osj++HnbdONdgvaCRwuZgDS38Ks7m+NgBGFAvmJrbO+O8R6ex2cZronV5cUn3cAXJGY/lP7C25UsS4UlVEHg8euCgJ72Pl9g6YsLpxMuttLChE4bHQrDYRpBduSMsFa7f2FalKu2Iqpy44CSOyA9qA0KxyWeBFnoDogzdcpan4k5pvBUOLpJ2HRQjB1O+jgvlf4NqLZxtjR3hMWdlbGW3GjHWU7CDo6AdfAiLgEiNjXG0hVbfGbv9MnYczYMdjAAdQaC+mfmWZmDg/s9ddbX8ORCMc9NuUcuX1U8YN3ZxYx+WEaCOlUhpd3uUuxllLuxgETINAjaaBh5EfcERdcK4gbZ5qvEpMRa8v3izPdIeZQcMkCtxRxtn5E25VOxVEuKwUlEdyxPBITKxADEHYwQi6dN0zFYnbt7L4QQtopv8NKZrPJDHcDub2+Km1UG9u3ExLhlg2u64dSWr4OZd3j4RgQKpXrsDWrWoEvA+7Hy1sTlHoObhL6DKgIYWqbuwz9EJupG8TT8/Cv+f/bRP3h2tTGC/j4isw/d2AIyYCOwzvu67k91SL/rA+LdJheu4W0UiF2Yp1wwUFuRbKnJu9stNl05jCcT8pWJohkjkIbQdc+o62Yvbg3MS30qXPbDwXjDzMMcTWTm2zngXR4a7mtchGsCW7fIvWD0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39850400004)(346002)(136003)(66556008)(66476007)(53546011)(66946007)(52116002)(4326008)(33716001)(86362001)(6496006)(5660300002)(316002)(2906002)(83380400001)(9686003)(9576002)(54906003)(478600001)(55016002)(8936002)(44832011)(26005)(38100700002)(38350700002)(8676002)(186003)(956004)(6916009)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bWYmmfA/wx85XGrfX70v+3gAt6CIus6OMMeZ5BP7/lfs5HSs5EFz2UHXBfab?=
 =?us-ascii?Q?ZvVdUNRjoREGkIiA7FjlIbwxNxovfeDatn9yQ4CuUbQfdPIymHvaocu9NSCQ?=
 =?us-ascii?Q?7SZ5XJjUTCE0DD9OT6GpJmoSLmDUlpCoiUifgreSAH37tqOIynWdFG05DgTw?=
 =?us-ascii?Q?RoyyekifDaUv89kAxT8AvCkZtiRSBUycZ+FOEM57ClfbztuJUeHEceA2DQt1?=
 =?us-ascii?Q?+xtB3mF4e2Ld+62v7mhwYfnqdRcwyQr8CSAk41eAwFQ1I36eFD/DV3J/W7Xw?=
 =?us-ascii?Q?VNP3oZAfmvfp7LyLcT7nb/s5EpK8wWVD1FiFLi6b25Txqvyr52riiMNEkKTE?=
 =?us-ascii?Q?kRGSWY5sz0ubHk5w40/Oax8e/LTQbTonqRURs6tEfc/vPXrHr0i06Dik3uGD?=
 =?us-ascii?Q?FVJtWF9GDgqKrSob+VBOistegrl9fPMBh4dlhvuQf0QxWcUkK5+7rN5o/Gj8?=
 =?us-ascii?Q?V2s7nqITbGVdi2hgrWPJiSclZ/HkDjxvX2x496/UsptZeUq/WNUhZFIQ9ikn?=
 =?us-ascii?Q?ylMbCOO2E+735mA24+8IsnJQ6f0XjzUcjPFUPd0UEWU19nzGehQd/RMxdR1w?=
 =?us-ascii?Q?o1xqeDKPRAdRJvKrRX41v2jEtZKSfbn1VhFVHruF+/TxQyuBkEfSZ2wiw5P0?=
 =?us-ascii?Q?Y/TmpMTtH1DurMCVKUFoP3tuPJEvRvjJRDz8yVVgyuqGZSfFSGhW14Reb8tb?=
 =?us-ascii?Q?cy1v1zuNlee2sS2h7/sjw+pIMClFJ560Zpr+Ar8JeRxeIVM654zL0OjcIPgf?=
 =?us-ascii?Q?x1I+1oHMMNfOMehPtN7mV6TFvRoNGosipcTML4FAkX2Oxknz5oQl8X/qUI9g?=
 =?us-ascii?Q?BkiINxRl4nlmTuRRd7GZRwaVQpyhXUcLFJEltxNID4L2+mqcHVaGYGjYcBj2?=
 =?us-ascii?Q?oWEltObwV6vtTpT3zBicXh4rkF2YBhwMGoSgrDc7oQgiSEhjK5m+s1bWClfm?=
 =?us-ascii?Q?rStYwcDvNNLcy3yx8Gfd5Fk9rOkZTH4jBapO42mH+0M1tPWIB9rq6QxYguM/?=
 =?us-ascii?Q?U8WbJCnYx2Ezg70NYNU2Aph1s6UcWbaWhM1ssnp3VMfW/hYyLctRl0jVtkLk?=
 =?us-ascii?Q?HY+dVgdYGw/z99V6n4KdJetSzZm4pKYkqe8rp3jz3CpvzxUiaI3y+LzcWXnJ?=
 =?us-ascii?Q?dbOEZdGOpQ4TTRTzTXMPPjXfv+RzjBD81+C3/dZ3y2018Wzpssn2x9M0mT7O?=
 =?us-ascii?Q?JxNsCtf7AEw2q78KlnXklZnenAoLx2hbRI9BMDE49R+FCoczWqLFv9XAe0i3?=
 =?us-ascii?Q?hHp7Z4MRo6V7dRedEgZzsiyoJIXtFW+f6duRJAQyBjiUS2Y37dAx/RSPOrNf?=
 =?us-ascii?Q?j25qfjoxBbc6jfqebbuIDFeb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c0690e-a093-416b-7a9e-08d966f8a98e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:14:03.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R4b2euV4Nyb8tmp8VkN6HL2VOdjy3qxGeujCuD6BjSwwXcmBh7aHlQ8mnDws1PKEM/qitSom07SHhO1os5/Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2560
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-08-19 22:20:36, Marek Vasut wrote:
> Add missing M7 core clock entry to the iMX8MN clock driver.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>

I'm OK with it.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mn.c             | 5 +++++
>  include/dt-bindings/clock/imx8mn-clock.h | 4 +++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index 212708e9388e2..9dba4eb643ab9 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -40,6 +40,9 @@ static const char * const imx8mn_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pl
>  
>  static const char * const imx8mn_a53_core_sels[] = {"arm_a53_div", "arm_pll_out", };
>  
> +static const char * const imx8mn_m7_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m", "vpu_pll_out",
> +				       "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
> +
>  static const char * const imx8mn_gpu_core_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
>  						    "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
>  						    "video_pll1_out", "audio_pll2_out", };
> @@ -421,6 +424,8 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MN_CLK_A53_SRC] = hws[IMX8MN_CLK_A53_DIV];
>  	hws[IMX8MN_CLK_A53_CG] = hws[IMX8MN_CLK_A53_DIV];
>  
> +	hws[IMX8MN_CLK_M7_CORE] = imx8m_clk_hw_composite_core("arm_m7_core", imx8mn_m7_sels, base + 0x8080);
> +
>  	hws[IMX8MN_CLK_GPU_CORE] = imx8m_clk_hw_composite_core("gpu_core", imx8mn_gpu_core_sels, base + 0x8180);
>  	hws[IMX8MN_CLK_GPU_SHADER] = imx8m_clk_hw_composite_core("gpu_shader", imx8mn_gpu_shader_sels, base + 0x8200);
>  
> diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
> index d24b627cb2e71..01e8bab1d767a 100644
> --- a/include/dt-bindings/clock/imx8mn-clock.h
> +++ b/include/dt-bindings/clock/imx8mn-clock.h
> @@ -241,6 +241,8 @@
>  #define IMX8MN_CLK_CLKOUT2_DIV			219
>  #define IMX8MN_CLK_CLKOUT2			220
>  
> -#define IMX8MN_CLK_END				221
> +#define IMX8MN_CLK_M7_CORE			221
> +
> +#define IMX8MN_CLK_END				222
>  
>  #endif
> -- 
> 2.30.2
> 
