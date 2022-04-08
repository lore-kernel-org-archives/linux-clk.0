Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD823C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 11:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbiDHLGq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 07:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbiDHLGp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 07:06:45 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B42CDCAB4
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 04:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hhxy5r++jsHPnpbM847/FT5KDACe4r9QYSroPoRUU2It01JNfjl7Ak5pUIU0+NLD2cWpb91qrO/jZVcrpWm1n6Q7p0x6qG7ZzOsBHB3LHNmgZT7WO8RUcQUZyXiibPgrjeWf5PZBQAgdi6YN03TTxpYVFumxq8RXWccZyheaNV9qQl+7PwZfSadNp6ntqJphKW5IVO5i3pTW4oKgKEK4MsG32EUlCzuzhA8mr4VF7zldQj/NGynhAjzWpzLCsf7l07bShiTAg0guYQqT/UnVAglKvO4/lk0bsdlCl/ALCaYgsTAjunmCUo/n38R+H0UwCbGKJwZFvfp4hgcvTpDpvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVnTjg2ursWKHwemqJRgflRSneWyAgctZye291MqTPg=;
 b=PaGy8Hox2gFk/fmxt83BINGdDTP1L7wBtPSBZryv9IK6BF5yi5QVb629M2EQIHsBeZZnl71ZWJk7ZJbp+pOme5JoiExSa9/3RBFHUpEuxZTYCHxxSXDRMBpnRG0wtImyj9+NlpUWY39YmCkMHPuEiZdgM0Aft0M4qpAY9hX4n2RkGxeEdsrAf8WvUPePtnC7KpMs3vjg+nV2eGSTHVEn1Bt0/sBYPQ7hD2yVzVVcJ1qUnbV52skqdEspw4LCrlUy9cLWuyWjC9dQEm+uPWBbCoEBrazcp5xRwNW3Dj+wF/wyIgsayLa0DX9A1DLumSnyTN26zmHZYFIIDfl3tlTJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVnTjg2ursWKHwemqJRgflRSneWyAgctZye291MqTPg=;
 b=X+G02QkBbWuuvEMTYQjltsiuTML6z6AkqNrvfCUUZ8nKyvTQrxdQA/ZmCRvk9sqq02nsJXrQddWZ8dIe1pV0jdn+Nsrhjm/hqNNV8ipPqr6TDL0PnpIwfpGoWlZF9aopWXGc3U2rlOUyh8IFKiiBOUX5SDJDLsfta1MY0ZSvVMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB5806.eurprd04.prod.outlook.com (2603:10a6:803:e8::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 11:04:38 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::a9d1:199:574b:502f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::a9d1:199:574b:502f%6]) with mapi id 15.20.5123.031; Fri, 8 Apr 2022
 11:04:38 +0000
Date:   Fri, 8 Apr 2022 14:04:36 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx: Remove the snvs clock
Message-ID: <YlAWxC23BzrU1tlg@abelvesa>
References: <20220310093404.236966-1-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310093404.236966-1-ping.bai@nxp.com>
X-ClientProxiedBy: VI1P194CA0034.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::23) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9d14252-5c75-47e4-fd93-08da194f92c8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5806:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB5806503FC1679DCE36A16722F6E99@VI1PR04MB5806.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yghNnFlR2eARvXgVN3ZEdbnQwfm49KtB2HsFWm1nUK1kMrDn3FzLHKR6UTgixMn0aJLqTmi6tzmYewVCXVtiT6gKaJNZOTw0cpIv5zzh6XfgB3kRyIobhinNMfNpFxWj2Hpo5QG5/t1sUGpuJuMiWWzYN/NTrMlyNQCw1gX10wjixlR3SKa1juHf03BqrNRq7tHJzNzuB5mkHBCMJ15shEFdHkXWWuLtlWJMMKQH7JgkUSiUKwyyJLS1HdwJ9oK6mwS7+1RRlw/rDDNGDExgNzbtW2COP9sLpbzJ9tAFO3URrsZKe8K8FfhwoAXD9BVxLbGRguJPigkry7JSO+3RNuilFl5t7w8Qj7nKEMVt65wDT4OC5BODrB8qJmJpgnxp0Ae41T2MwWIhI0jDQJW4cwAeHOXMmrGb1ZCqUWNeCT4MNU+b3+h8DiXj4ROFxYETQdnhA1iRElIz9WRCHZ7q4kln8LfSwDDRDL8N4KJ+sSlxCKDbyCTv3Io3G0juquC3kjykdTt3vNMCGs0E4VmUDT/JEOh9WJCLb8ReXIvC/0CcFpsbG2sShTEfKvdltqWpPP6meWTTrOTHMmO9PSKITWaZ4ZpsaFpDFvLREUkbDtcbT8M4tB9ncKu4zDYLQG9vjaKm5YsQuKHyTsXGsLA+1v9mzJLukPhviN/9lZGTtp6mr72Hd7AFJcAdOWPbqzRrLVPutHO5Mba/P6qYgK/hAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(5660300002)(8936002)(6486002)(66556008)(4326008)(6862004)(6506007)(44832011)(9686003)(66476007)(66946007)(8676002)(83380400001)(38350700002)(86362001)(38100700002)(6512007)(316002)(2906002)(6636002)(508600001)(52116002)(53546011)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sa8dN7q13Shc25Sg4SF8YNXiDLQRO4ZX/V0pkFp+mOrkz42t1b3T67V0H5rR?=
 =?us-ascii?Q?NlBKyZpHTpH31XACPtd6LK1G4FKouIjLFl62NPCBXoSR/C10fSw6iK2LvlPN?=
 =?us-ascii?Q?netFVX6eB2/E6o2fFA6tJrYqoq61hutu5BWhz69SK426AKXJ+EnJ6MvpjOBe?=
 =?us-ascii?Q?3sb47/zWIVjCLmtWtkDC0BpT0YyPmV6N178UGS4xei0S4rDle5WQSPvZjPdg?=
 =?us-ascii?Q?t02shRn8Ty1shE/z94aPQZmzAbDnJ2DMV8ikBhnhkR8nkcIzwA4iF7VSzd2W?=
 =?us-ascii?Q?bWQ0+eX9bYu3CjN6Fr29PWV+bc++gdTGHF6HI3YkFHEbIV0w/LQuBcMF/Bs+?=
 =?us-ascii?Q?Y2VsFbGeGVcWC56biledZvasTFi6E7ljvXN5G8AMIXXVhjAAmUEHgDtZk/fT?=
 =?us-ascii?Q?1ULjB+JBNIf63oRSS+rqPp8ABMsRCzp/zP6qPtbuHyR6iCBw/PHNG95sXRme?=
 =?us-ascii?Q?xMizy5NkGoiS6Jhy/5mORHNy6wKEm3+bmgyzYfwuy2dHVjApze+7BS6iTb/4?=
 =?us-ascii?Q?cLvR7+N3GOMq500P1/Ba3+cNK5Kt8VjMYQR9HT/PvQMxWB3hsmKezO4bBUyb?=
 =?us-ascii?Q?n1MXoHWaJoGyeJ3ana+dxAUBwanJ5gD9MYhnNE3g3PUKA4eTExfpd3xXrOXj?=
 =?us-ascii?Q?vtK5TCLXr0gTEV0Am+ljZ1/CRMnpqH3ctRrv5JREIJIkdukCIwLrz2Jq86I6?=
 =?us-ascii?Q?EcGltUoMGYerK3uPC9BQhCH2X7PXmAseu5Tl8BCnF68K7WEzu+ZS9fvVIKXJ?=
 =?us-ascii?Q?q0ELoBEWDw2tpnje68a+PnhlEH9mFtsiQxs10met1GzbmUM6epkVLgqUd+kn?=
 =?us-ascii?Q?f4zDhh5ygkw5jYLEmq+LAJK2F2L5cG6xV65NFiawaYRGpDaQXt+E2ioCn12Y?=
 =?us-ascii?Q?psSK0M7tVaWO/8F9yM50+fiJKjou1ZeeTAXpzVjGoe1L70UXiGhCZLlCY1ZZ?=
 =?us-ascii?Q?5L2xyv9HjCVpUFcviDeuG3io6J1JRUfqrjzkVn3X7E7gTT5SFqGv7T+47Mpy?=
 =?us-ascii?Q?rw4XkakndOI7OuNTYzh0ym32XevZ9co+QbT2lZW/VvCoLJMoNG42jCUQTjVn?=
 =?us-ascii?Q?VPJNxtyYpoEQ/VUGpOoN54WRCihLtt1rK8lpfAmZMyvJRlSLbBvVyqMN5XxA?=
 =?us-ascii?Q?PObp48C4iTfK7gh3vXxpq56FSjvPF5p3tHDaIk65XBwybrPdBaenar9Kb6dB?=
 =?us-ascii?Q?5hAB8UprPgQ4M+75usNANNxggvWguvtcHi7PaxA71ZKiPRHiC1ws1tR5iebY?=
 =?us-ascii?Q?LC4bFW5MgZalUlxegl/S8edSkGIAV6PrtYTJzn7pULB+dTnWADh6HCnjuy0b?=
 =?us-ascii?Q?1q1DJCo6lXSmqFDkDc0WJvHmguzQeNpwdiSEoI+JiA4pbeI+RWvBoiNIqrT8?=
 =?us-ascii?Q?uiAQYwiRCl/+5lkUlMdf97IQrctdKSPEYjfpKl/JtN38OAs1Nf4vDEa1d4K8?=
 =?us-ascii?Q?OSMLybiBq4lkY6T+CLPju6sqC9L+izSF6GtLN3bow49he4hGrmaZIC0d3z3i?=
 =?us-ascii?Q?GeSzSInXwdMYLhXJ3uTikfscIHYGXehGx8hpHJxppQ48AmkvfuYRKLqvQ08a?=
 =?us-ascii?Q?5BgQLxFt4GrEl9lQwjq3DpIiW42/MlCxVkROXmMRtmwLvM6nKs/Cfvwre1fy?=
 =?us-ascii?Q?IUmvGFw8BgPJJSASTfc6JpY+0eqDYnVI2JP3bscSIiHfjNIZHbbhZpKfkyp0?=
 =?us-ascii?Q?I2bWcWwKFiaPS2G0sAJ4Hf/2QbUdFsbCkuT/0HIjpWZscF7JNuthxl6FL+8P?=
 =?us-ascii?Q?iHKRZwWUKw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d14252-5c75-47e4-fd93-08da194f92c8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:04:38.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZmWnzcmpV8FDzB1dmdwk19XmwVEm+beWGidTCDccDNEKDP2ozkYiUfAFfvFvXgLP2ARDiaAlooFNE1H9eD0Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5806
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-03-10 17:34:04, Jacky Bai wrote:
> The SNVS moudule is not used only by the linux, it may also used
> by other SW component is secure world. No sense to populate it
> in linux, so remove it.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

I'm OK with this.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

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
