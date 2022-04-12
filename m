Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944D8C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 11:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346205AbiDLMAH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 08:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245598AbiDLL6l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 07:58:41 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50078.outbound.protection.outlook.com [40.107.5.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC5DBE3D
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 03:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuCx3mTlG59WWqQieRvXXh2PrDikLlUBcvHq539HY6SflvKck+zjC+SDl+VaIIbEtMtZBfLx1kA9l3/Vce8GhJuOdSxLphmHAcWhEo/IWWwYzLtwqmu+7fD9zeKCSQtU4Kxw47CQv90hOtNwOE0spbcrx6QWqk3TfXZKFR9ik1jOJ8ZIcQUAJ4qkInl8QPTq62AmYTjNvid7DCrFNs2qmnTb/JNUhO1821ZqKt7kJOxFPB15gfQAGum/UI5aWBkYAVWSuGZntEguQQdLhNIfrYtuDdvsXP3lHFs8ED1V+aLNSaU7aGJ/Wgk+U946MMk6A5q0pFHzAFooFM/LY4g9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV1OdvgB06aw8qsnEKdBXny6A381p4xo2B/j7z59nD4=;
 b=VkUPBNvZV3sesQxzvyis6Ps+ockBgLHtQQ/3sO7CMgbWLWpclBO6XSO6YO8hDsTzWzbijD+CkRRXz1E3M9JPJcd5r9qB59Igv4nUPcGbEUBqdNVmFa+1B2TsoJ+cY+RRTpLnuB7csmlmMo2S6NloG9kvdTEoZZtXv4brdKeh1925JmIRulOK5YBhVbVaWhppCfut6qZRo6jicNZRRhyaDVXpSXemh3f7aUPFnGAi3ZsLkQ4tQ0ReaYsFOIXAz45UHeomYFZUm/wdGMMxSxUqTPYXDYFHuerIOp9RRC7qFv9BSiDfhNicPsN3gDRl9AAVNp0hR4PzHFcfqycV38a5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV1OdvgB06aw8qsnEKdBXny6A381p4xo2B/j7z59nD4=;
 b=aRXwO23WItiKf1FP4ITFt8e7UFDqteihki0Vm3aNl5LGuE8EZm/CFTbJr6i3gGS82TnrTRcx05mWS2fUif4fdc1jU0gKzYq8Rl7fcEOcaSJUZWlROUIRX2cN2UL+ouW/pPAQ4ZtFKTYXRBwxR8YKr92VCV419buvvaFHON5qZ6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB4287.eurprd04.prod.outlook.com (2603:10a6:803:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 10:53:34 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::a9d1:199:574b:502f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::a9d1:199:574b:502f%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 10:53:34 +0000
Date:   Tue, 12 Apr 2022 13:53:32 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx: Remove the snvs clock
Message-ID: <YlVaLKhcUMTnj2DM@abelvesa>
References: <20220310093404.236966-1-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310093404.236966-1-ping.bai@nxp.com>
X-ClientProxiedBy: VI1PR0502CA0018.eurprd05.prod.outlook.com
 (2603:10a6:803:1::31) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 194e8ae1-ff2b-437c-f268-08da1c72b0bf
X-MS-TrafficTypeDiagnostic: VI1PR04MB4287:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB4287EC209D5F3F7718952ED6F6ED9@VI1PR04MB4287.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PPEjHjCyMB+IqAruPPdMpX0iTQto3wsL2HdAN23t5F4Js/yJkV5K327os0mBBhYBel0SO9RdJZn17ySBOrGT62TiFi1nHflCyg3XC2sbijZEpuSthIaq+EOyoe9zzGm6vjy3ySPSscma78yo5TclZpD1jmjaOetMFu/3ukq+FY/nfVyQtOgPRPRVE6Bpe2RBpZiAU8n4MA/sUkzPdBJZ/w2m8GVcQMlciJIN8LEO967YFu2+C4bpaFOX3lFnfR9aycpLJXeinmpRfkQYvkZF9+NebrTrfbXwxJtxdazL5iGkR4YpY3TSdShX8s3+mm3B11ePih8535ULoXeKG6RWL8xA9Gw8/NnPmvRWuljhojPqVGFHQfZLBOBliE1YgkX7+TcK4AYqLRuK6Wj2Cs532eDugC9l+Fy0qI23uFblvfoM5wGfL/Lt8V5kRgRiJyJYAnobFHgZ6OWKIhPFz8dGzzCy69rZuGS7NBs8WZ99jr2b+jSlSrNnA6oLQHNA00lwcE8xaphyyB17ulqSiXZ4sK8nR3hch3bXjjOs2wrwEzax/9R5x1GP7NM2i7G54w0ndpzak1c76opnffI/xLArVDpO0ldPyZmz5MBmejBB88wvSX5pklMqgIsExZvPr4oEiXIFfXLm6QYduOLOrr36fJzkygCOl2NJFAyxyYDYTK06A0rE8bsORHp+pCbFjfbDhMRCEqfwwgIR/QzL5LZF8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(508600001)(6486002)(2906002)(6636002)(9686003)(6512007)(26005)(186003)(8676002)(83380400001)(4326008)(33716001)(38350700002)(38100700002)(6506007)(52116002)(66556008)(66946007)(66476007)(8936002)(5660300002)(316002)(44832011)(53546011)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9+0zoVrCrc7UUi0PHJJVGL4QJ3d3t8lkwEwqhilOkesSQTR8bvmoD/25Ai3?=
 =?us-ascii?Q?R+87nYKwskK/PXCjlXrvRCb0yYu701RyKmWPkDDhntlJaNCgQwr1S+7GN9eQ?=
 =?us-ascii?Q?aPcjIq9h5S+cJV/vnJX8xE3lJ7ThaLc/uKPkjVC/lMRUTYRZ2pz3nGgmhoK5?=
 =?us-ascii?Q?zcB0M+4Qd+cWMoFiXlqXp53Xxo5Hfol8hwaEmEhwiElsqRDmIJC5QIayAbjN?=
 =?us-ascii?Q?iuwBgR9Dwd2qtGa+wmHCKuNX0A7wuXqC4U0ys9D+4RClCgBCHTuXVaWRw4Dl?=
 =?us-ascii?Q?z6xDSWXbJdLhOcLpOkK0/L+zVZjPNTZ5Q3AJabOPf0TrwvwojZBenrbCocxX?=
 =?us-ascii?Q?d+nO3e2xxS4z0UimZd/bbTPuZ+rly5bQYKmgCWas4QNOC64AU9po5abjQNTv?=
 =?us-ascii?Q?lYR/N+1lpPhKM63OCLxKmp9xDoWJbopc0g7A5nUzH+bUDEWhmw1aw3O3tsRi?=
 =?us-ascii?Q?QkfQm+PHqyXR4fbi7ZpotP2MSyl531OzBZR1WZrCieGsMvZF0+Esi8LQzMF6?=
 =?us-ascii?Q?TLmQB+anH9kpKENTwg5mzh5OMnQlrOqOkzAFK3qxJFyOdQNB0x7JpPOhdiJH?=
 =?us-ascii?Q?S85ySLr1/W6n6AczOs+56Z3v7esrXViSOAa7bXc6H7S7hjVpa+blG+o38dkI?=
 =?us-ascii?Q?jGl75gU/0hJznHVDUddp3djI7AZ6wwm2yf/BupsAku6Yhhaq3+2vp6SegQ94?=
 =?us-ascii?Q?8RSNtzkG22KlXCZX3NqK2LwTPGh05m7jk5kRl51EMzoZ8oEIgnOBZlo6pmK2?=
 =?us-ascii?Q?6hNoqFTQL8UpQR4CBJQiyJM9XALNvG1FGPkd5Tjhfwnd5I/WhuRhgKeghwuj?=
 =?us-ascii?Q?1hA2m85qM9k8QT1IsO46GjSsbPGemfru5wqEMNmzvwKlsmDHDelM2j+eIUY2?=
 =?us-ascii?Q?rEAQ6cGkUtPszD0EHoI+slzWfFaNmXohnOFjXn8xrY4rq6kxMBq6p/xG+C0m?=
 =?us-ascii?Q?sAcjJiyzl9Bn/YE3AinwYachd1ZsJ/cIFn7DXkmCbQ3b79w9IaJMzbDHEvxT?=
 =?us-ascii?Q?G7DJ2xSarROtqIYKZ1eix6dANE2bLcZMFGEaKaBrjEBZP7lqnI5gEqwkb2vT?=
 =?us-ascii?Q?/nwNl3x3hoEEH9AY3kydiFjHesIT79+E7Vbsrw2m71DUf5cUJuodEK0Jyl1W?=
 =?us-ascii?Q?ukUCAGG2DWd8XVWG9B2mdvBjYO6ytYOksibjc33ck6f1Xbp3BY2I08PDILgt?=
 =?us-ascii?Q?TSeUHrsSEbLNumYhDpdrQuBf4eQol4a4xTwqurMS1ZZRuiHOF3end5vfJbqD?=
 =?us-ascii?Q?Rw3hD/hvIqfroxo+R0yGeLf91FWihRaunSCDCJpJpxUaigvG3BLioK+UbBL/?=
 =?us-ascii?Q?lX6rpM6eNnfqfrvHX2nizrqK6HgrGRsh5kO3CrA8syvwIQk2YbBQAlIdOM4r?=
 =?us-ascii?Q?+DdLHDmru2YXqke/DUx4pPhUB5C3AK7C186mfqdQRD2t0QNTPz5WSaOVYM24?=
 =?us-ascii?Q?zCagDVYQaoDFfJaSW3UOC7mB0oTFzdbKvplKlzgLwteUvOe4qUSUkeGzatde?=
 =?us-ascii?Q?dezVR4s0VJhMUfs7sC9e87oHqoVDSpmpitWqlA38q2brMtXCqbKIIIE5goll?=
 =?us-ascii?Q?dL4P4uQKTj4A2U9aXehq9s8pXSfkf+v35NEQ7CxrgsoskzIO/JMwVDeTjCvK?=
 =?us-ascii?Q?bFB3tlvMoOxGAR/wURqB5GYInDok3sFNmEONajkit7RLOEYrY1bIU3CmZHcl?=
 =?us-ascii?Q?vEogHAlNCeWBUI89a+UlxAFaxurezNChaNSrgWQoeKzkFVvpA+8wV3GRyvNr?=
 =?us-ascii?Q?xYLEiIUzwA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194e8ae1-ff2b-437c-f268-08da1c72b0bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:53:34.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OECD2KyGRHfhwNz+YUkcWo0cYhhP0qHRQ5jLMugE6nBjxVa8odJP2NQyTMsmX+OSIw+WJlT7UcMyFJAeNsTHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4287
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-03-10 17:34:04, Jacky Bai wrote:
> The SNVS moudule is not used only by the linux, it may also used
> by other SW component is secure world. No sense to populate it
> in linux, so remove it.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied, thanks!

> ---
>  v2 changes:
>  - remove the SNVS clock rather than mark it CRITICAL as suggested by Stephen
> ---
>  drivers/clk/imx/clk-imx7d.c  | 1 -
>  drivers/clk/imx/clk-imx8mm.c | 1 -
>  drivers/clk/imx/clk-imx8mn.c | 1 -
>  drivers/clk/imx/clk-imx8mp.c | 1 -
>  drivers/clk/imx/clk-imx8mq.c | 1 -
>  5 files changed, 5 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> index 3f6fd7ef2a68..cbf8131c63f7 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -782,7 +782,6 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
>  	hws[IMX7D_DRAM_PHYM_ALT_ROOT_CLK] = imx_clk_hw_gate2_flags("dram_phym_alt_root_clk", "dram_phym_alt_post_div", base + 0x4130, 0, CLK_IS_CRITICAL | CLK_OPS_PARENT_ENABLE);
>  	hws[IMX7D_DRAM_ALT_ROOT_CLK] = imx_clk_hw_gate2_flags("dram_alt_root_clk", "dram_alt_post_div", base + 0x4130, 0, CLK_IS_CRITICAL | CLK_OPS_PARENT_ENABLE);
>  	hws[IMX7D_OCOTP_CLK] = imx_clk_hw_gate4("ocotp_clk", "ipg_root_clk", base + 0x4230, 0);
> -	hws[IMX7D_SNVS_CLK] = imx_clk_hw_gate4("snvs_clk", "ipg_root_clk", base + 0x4250, 0);
>  	hws[IMX7D_MU_ROOT_CLK] = imx_clk_hw_gate4("mu_root_clk", "ipg_root_clk", base + 0x4270, 0);
>  	hws[IMX7D_CAAM_CLK] = imx_clk_hw_gate4("caam_clk", "ipg_root_clk", base + 0x4240, 0);
>  	hws[IMX7D_USB_HSIC_ROOT_CLK] = imx_clk_hw_gate4("usb_hsic_root_clk", "usb_hsic_post_div", base + 0x4690, 0);
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index e8cbe181ec06..4f01be021503 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -560,7 +560,6 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MM_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
>  	hws[IMX8MM_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
>  	hws[IMX8MM_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
> -	hws[IMX8MM_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
>  	hws[IMX8MM_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
>  	hws[IMX8MM_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
>  	hws[IMX8MM_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index 92fcbab4f5be..44b697c9b2ac 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -522,7 +522,6 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MN_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
>  	hws[IMX8MN_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
>  	hws[IMX8MN_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
> -	hws[IMX8MN_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
>  	hws[IMX8MN_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
>  	hws[IMX8MN_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
>  	hws[IMX8MN_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 18f5b7c3ca9d..2cc69919b6fc 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -654,7 +654,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_SIM_ENET_ROOT] = imx_clk_hw_gate4("sim_enet_root_clk", "enet_axi", ccm_base + 0x4400, 0);
>  	hws[IMX8MP_CLK_GPU2D_ROOT] = imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_core", ccm_base + 0x4450, 0);
>  	hws[IMX8MP_CLK_GPU3D_ROOT] = imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core", ccm_base + 0x4460, 0);
> -	hws[IMX8MP_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", ccm_base + 0x4470, 0);
>  	hws[IMX8MP_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", ccm_base + 0x4490, 0);
>  	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
>  	hws[IMX8MP_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", ccm_base + 0x44b0, 0);
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index 83cc2b1c3294..fb7a8aef6187 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -557,7 +557,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MQ_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
>  	hws[IMX8MQ_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
>  	hws[IMX8MQ_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
> -	hws[IMX8MQ_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
>  	hws[IMX8MQ_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
>  	hws[IMX8MQ_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
>  	hws[IMX8MQ_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
> --
> 2.26.2
>
