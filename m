Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86AEC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 27 Apr 2022 12:51:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbiD0My7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Apr 2022 08:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbiD0My6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Apr 2022 08:54:58 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10069.outbound.protection.outlook.com [40.107.1.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D3C2C38D3
        for <linux-clk@vger.kernel.org>; Wed, 27 Apr 2022 05:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSs74he1PX79AL3BNDj/jV8VZgZMLP4KmiyEsT3EOlUZi0L9kfzeN3AIqhih8mkWfja0LujteNUhEIljdkc3cVFMBhvqdLjTDTXNerS3Z7B471DoIgkNf4PrY8GCKsrYj1zUJXqJ2VGicAEAP7SJzVerDUZ6Ph9qhvMJIR6XVFd0Xuod0pOYavPT7EQzVyHNe3j7cMyoNXohhGDdHTL+DwCyQEZbExw3DeFUAPHQ1QucGmcc1J19U9mdLS/56wmbIXnLiimkCbohYKVXKEeaKxaW0eR8vBdOqbaZA02EACSSeqxDnH1q+TXP73boH5d6paSxZDO4HDD5vFlVtd8UXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4oCIRMus+LJTX4Qfde+NDqDyrz+5nI8P2962MN2wcM=;
 b=IoTYBG4vfPE0p1wbBs2sIk5SHDI2bG9RxjUdJOiZ6FCxfhm6Ml/miMgVcaCkknUBo3TeMpCzq3PffnueTeDdySspoat26MlaRDXC3o4RBpbAc6tBKR4PNxx7uP4mKxF2X2seRxdOtVc3/WqznGUvrutD1/F6qESy3h3OFGyiyiImGrXWuSrAIgOJpPrfc5wW0kSm6hm9GpnP0ty7YBpuuPnMrR3Nu2mGJUi/mX2k+ozPqEaOrds+mz5sfNqSDC6n4BE/WhZNWtXEoxTU8xt3uFyI/qcrV4TwCXScQ6/5m+yolKevOmR3W8IWPgaGnKlCNIdf46S3+7nIOUBV0h49dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4oCIRMus+LJTX4Qfde+NDqDyrz+5nI8P2962MN2wcM=;
 b=T3ssVrVHom62TpfNUVzdOy9nOIFN7VnS6yuBHRiQ7z/IX69Ykt2VuBxiUdrCRjUOVs+k1ZRZ2X0JmwDCl6+fsQm+7xbxfwy4oDEhLjIvBSNd7LpOmC669iewsw+BDuSMPH4oClNsK3ZA6WdP4dLTZWSjfQvd6d+5INojvzTVLDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AM5PR0401MB2563.eurprd04.prod.outlook.com (2603:10a6:203:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 12:51:44 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::78d8:955a:7946:fd78]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::78d8:955a:7946:fd78%6]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 12:51:43 +0000
Date:   Wed, 27 Apr 2022 15:51:41 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        David Jander <david@protonic.nl>
Subject: Re: [PATCH 1/2] clk: imx8mp: Enable no longer handled gates
Message-ID: <Ymk8XRS/BSCy6byS@abelvesa>
References: <20220425095249.259406-1-s.hauer@pengutronix.de>
 <20220425095249.259406-2-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425095249.259406-2-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR0102CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::22) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76a76703-1561-4cd2-c657-08da284cae6d
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2563:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2563AF960FD6BF3BD42A644FF6FA9@AM5PR0401MB2563.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VtvHtFgapxF9qFh91TM/Dx+Wk9fSkM+hNLKNAlabwWm4OZ3O619efGw7xTp2YDWp0z4vLnIxUbhm4J81oPTJrCWZy47MXoqJByX7f00xBF0zrXeYVyz58pNPCidxXROLhn/7B0qkrjArBAy+mmofJX/UFgfnpwDLcWtBIAhIw2Wc04yyNtfoto6742LEcjOv4v1jmkEleJAEE8T6vJK2Cjj9ctlp2Dba+FySIMyS/wP0UjFFraXSQ7tQoarL72I7bs52Ctbqu5dPthh7L4CTK8PMzTghpsylb1llhDTdaYqJBj5h1e8GWAxoh2UtkibgPEW2Zw88X5akuRLootp2F4KhjIVe/PP0fX2HUFNJmDZhafsDW/jJQItQaIIA6HeWAU5MnI6Nb9a2+rEsmgHtxIqWmcwLvtrQOL8MayB4urJlRDQc5iBDPmecOF8YVBg7rfdtT9TyqQm0unsa4xI1RyLdfnJ7S+hbvMawi8IV/HWlAhvXMxFdDpIeHTc+a8z2YbjIDhLMYiX0YfhaPu2To4nRR/NAmCXTOa1NyzM/Ul4DyWZdk9glkk6RT1Y5kG+D3MxIcQFiGhrfgH5Fr9UePL6cb/n753i1nutXOXERYPeTZYJL83y3sIMkYnQwO0aUxnyrsqZg8KmGTlnE3ZyyKyUKTRV9AAyIQtxz4ZKkrHJ4MDHB/OdGXzjZxsJsxzo9zoXCbhlPFM73lbLZpJxi0pUcZ+h7u7xUNHXrukjA2jQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(508600001)(83380400001)(86362001)(6512007)(9686003)(26005)(53546011)(6506007)(38350700002)(38100700002)(186003)(316002)(44832011)(2906002)(66946007)(66556008)(33716001)(5660300002)(8936002)(54906003)(6916009)(66476007)(4326008)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8f5xtqMuhLablKo1qAD1ucwdirWA5ru3L7UuhTOBqHyt4shdDvcgyxa6MFOM?=
 =?us-ascii?Q?BvL1Sx4DWxmxR3tsBQ8DnpBZ/lmxBXl5kY3Y9YfJhWxCv5STPfGoWoufWHBw?=
 =?us-ascii?Q?Cmb18RiBN1RA2e7fhmY8VcaL+OY1zXMJwnwr+8pOdzC7BxWiGtJWv8PAOJOx?=
 =?us-ascii?Q?MapT9iVqb4kcJhksJDSU179XUovZPah6GMA974Jp3tFiG/ksBqP400YpEQ8Z?=
 =?us-ascii?Q?ZpibK6xCQJlHSb7Z0hEIuIyG0/CJcPQsAyLkX8aEiiD+K/0uvsia+rs9iBNO?=
 =?us-ascii?Q?wAs+/XBH02duyKb5Fu9UGG5qjYhoeXCI7snkGFjqldd7uTsj2ow2nFj5q11h?=
 =?us-ascii?Q?v2pVcSPyXKENWjPj2P0j62n8gjaxt8ZfYVXLbSRE0Pnztw6bKgl2kFQJTFOX?=
 =?us-ascii?Q?asx+mJ5516zKt+HqteCw+ce8rpNswVWsyM1I2rgkOxYU2C8H/yB8WFNe7hth?=
 =?us-ascii?Q?kuHmLoYgyGHawvysYlXhaihbqATT4vwKwkyggHVBkuilMJDKFxz1XJ9K7vgH?=
 =?us-ascii?Q?MhFTm4o3iQffwMf0pNRyN18BNVUUOYplxsbLaH7MDH6soSo4knmIEIlPLL4R?=
 =?us-ascii?Q?WfDrteT6sU1eWUFpq4MxCNpHaHkG29eTRLWiG5IVF8MdKq9w5hWRmweOL5va?=
 =?us-ascii?Q?wnpxEJulu9XYnj7UOjYOwgzri3eDUCoEQvTtklvxUWpER/BT76Y/WIhsQykw?=
 =?us-ascii?Q?itsw2qiW9DSG5jUWC34jeBtkY7K4uvukTlgghi3gVathHicD5svT4o036EpT?=
 =?us-ascii?Q?bgCG0RctduIntISE+r5zl40qGJiLZDoHckkkHw0ZNmCPGgHauoF6Liret6Er?=
 =?us-ascii?Q?yXiID4r3CfNr1n9cVmllfMH+KejO4Owfx7tbXoS1jzlhjPIX/Mal9fwr7dcW?=
 =?us-ascii?Q?dVQEf1a/WOK0aeiNTVEdY4sd9hvsTwLoo3YC0icqE5fcuQvxFBiAbCLXq4M3?=
 =?us-ascii?Q?5myw8EcCjmh+BV5XGe1oxmpvuZSvmBghwRry7Lz8M7p8zA+wb5dm1CIE66fg?=
 =?us-ascii?Q?5DV/MVrNYNWh0nkCjB5Vmv7llLBV3ZKYPqV2rxbNDP/cANfLdvRTkLw/iUHg?=
 =?us-ascii?Q?N/b6SCv9MuH7AZ9En2iuWWdVmS8HxLwXjVG8V0IW/kx3cleuLsn63d+5bjXh?=
 =?us-ascii?Q?qF82rNQagZwtEoUJNORgnaD5ghCDwY5Y7KTqYxIl0dvuerhxdjV9uLj/Swvp?=
 =?us-ascii?Q?gDA2fSOq71tS16Vb8AM6ZIh2Ueur//Hc+/K+ujjOco+k237l1fbfeNK/yo/J?=
 =?us-ascii?Q?BCbaeQihzjyY5MNFwRGlbiY7GoI0G6Hc3RMT8erm0lAxDHnCCtdWfsmRbupJ?=
 =?us-ascii?Q?4Dnye3VF/IWgoD3wtTIPip9RrLdHcCrpXlNkTPlnfly3ljCVNO99h16t8DWA?=
 =?us-ascii?Q?VxPGovaettr/eron/El27a06zUhOGqkmraiJZ8Wuz1rCM4ngb/fFj/WqylUW?=
 =?us-ascii?Q?mjzS0LBN99BW6VkkiU2s3iIjpiS4IhS4W8hWr81WYD+poPcNKzFFi3nHOryx?=
 =?us-ascii?Q?T+kmgTGV8WnDIxrtMcp8WhQXTVsIhLQMRCTxRi679jd7MKRfZp8EXrmmXdh7?=
 =?us-ascii?Q?qUNVCDhYB97T7oaW00Dz1m3tL6ltgIT+PhxTkciM8TOGkaSUKXVrFpLtg6M2?=
 =?us-ascii?Q?LbfVEfYjYwLak7ds4CyoNNXyQyLVbYjAUS2aTvzppa7hfJM10+f4B0yz64iP?=
 =?us-ascii?Q?+WLH5FaZp5N7eLV4bxEsycK5DH4wJY73cu26CmDX0efIQJb5vLZB40i0gRAH?=
 =?us-ascii?Q?VYG9Gnyuyw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a76703-1561-4cd2-c657-08da284cae6d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 12:51:43.8526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++tTsGn+cKERkZMzzrKCGkS8sc99hhy9lUt/EmzOnzjaioJZQIV6uC51BEXCbGY7vXH22DRy0Yv38ZFVkjnF2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2563
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-04-25 11:52:48, Sascha Hauer wrote:
> Handling of the divided pll output gates in CCM_ANALOG_SYS_PLL1_GEN_CTRL
> was removed in d097cc045b649. We shouldn't assume these gates are at
> their reset-default enabled state. Enable them to let the kernel work
> when the bootloader has changed the values.
>
> Fixes: d097cc045b649 ("clk: imx8mp: remove SYS PLL 1/2 clock gates")
> Reported-by: David Jander <david@protonic.nl>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/imx/clk-imx8mp.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 18f5b7c3ca9d8..10446a1b509e7 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -407,6 +407,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np;
>  	void __iomem *anatop_base, *ccm_base;
> +	u32 val;
>
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
>  	anatop_base = of_iomap(np, 0);
> @@ -480,6 +481,15 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_ARM_PLL_OUT] = imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", anatop_base + 0x84, 11);
>  	hws[IMX8MP_SYS_PLL3_OUT] = imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass", anatop_base + 0x114, 11);
>
> +	/*
> +	 * The gates in CCM_ANALOG_SYS_PLL1_GEN_CTRL are not handled by the
> +	 * driver, make sure they are all enabled.
> +	 */
> +	val = readl(anatop_base + 0x94);
> +	val |= BIT(13) | BIT(15) | BIT(17) | BIT(19) | BIT(21) | BIT(23) |
> +	       BIT(25) | BIT(27);

The same bits are used for PLL1 and PLL2, so maybe have a single define
containing all bits and use it in both places. Might look cleaner.

> +	writel(val, anatop_base + 0x94);
> +
>  	hws[IMX8MP_SYS_PLL1_OUT] = imx_clk_hw_gate("sys_pll1_out", "sys_pll1_bypass", anatop_base + 0x94, 11);
>
>  	hws[IMX8MP_SYS_PLL1_40M] = imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
> @@ -494,6 +504,15 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>
>  	hws[IMX8MP_SYS_PLL2_OUT] = imx_clk_hw_gate("sys_pll2_out", "sys_pll2_bypass", anatop_base + 0x104, 11);
>
> +	/*
> +	 * The gates in CCM_ANALOG_SYS_PLL2_GEN_CTRL are not handled by the
> +	 * driver, make sure they are all enabled.
> +	 */
> +	val = readl(anatop_base + 0x104);
> +	val |= BIT(13) | BIT(15) | BIT(17) | BIT(19) | BIT(21) | BIT(23) |
> +	       BIT(25) | BIT(27);
> +	writel(val, anatop_base + 0x104);
> +
>  	hws[IMX8MP_SYS_PLL2_50M] = imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
>  	hws[IMX8MP_SYS_PLL2_100M] = imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
>  	hws[IMX8MP_SYS_PLL2_125M] = imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
> --
> 2.30.2
>
