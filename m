Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392C4C07E9B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 10:37:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20A8E6112D
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 10:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236339AbhGSJ4j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:56:39 -0400
Received: from mail-eopbgr60071.outbound.protection.outlook.com ([40.107.6.71]:62126
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235440AbhGSJ4j (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 05:56:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJ+KGsj49AxnW5Wgl8mDUYr2fetcayvt4nwtWB/TS/YedoGvysGFGqtzUqg+SPf3EMzen/dSPWlP54gk44y1KVBKk/1O4sxYBqCA326f0qCbw7/eE4dRM+y0ZZKGPJJffDDcynWT3/yrTBhJRFTY4rg7cPfvdT9uB2vrahMix2TU4esYD5qlr4WcTsBdkrb9WDs58g0yz5fid09oUDrePJ2VWxT3YIh/X+lGDHtwk+p6hWchWCPed8asXkelyn3MY2nNJC2S53+MfbOJpW3aR6gqUdq+fdhkKKSEFkvM5JtzQ2ASPsaMMjsCkGeMKF/WLomWriCMNOlcbqKLtGM8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxHYfl9KWTcDQf+znKkj/ZhjVIM/yE74Sg3AdOI5aBQ=;
 b=YhO3l4LZQArUC/7NfpDdF9yWileb+RMj+bHr4VyLRnypO6JB/dMXLIx/ZlBGwMj/qq88PHFdXdO+XFMc1Gfkfi7UXsQT1IG0U1MmOQ+rA2yc2wsRheg0D9LSkFs2bbKWEC4/B8qjx1PEsunuMRWGBmkDUkWwoRxd8EvvQ6Tq23S7bEJkUxfuV4406avYf6N2Gd5972smjPaTETCFzEO/lCzkROXi3xzFgPSBlL4cz93vl+5DxXBQQvyKnxWqAjCJ/KkQq5K8gLdpPZeAYbXnW4TGHFUO95GmBoSWP+FFzIZXmIw84Mf9EIvjPDs9gXsGg4th+gLzjjwtBt2PoVzsEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxHYfl9KWTcDQf+znKkj/ZhjVIM/yE74Sg3AdOI5aBQ=;
 b=bY3aorw8Po8mw3VRUpM7q3f7fIWkB+RdUjp3NeyFSsnTxtTV7feuhNcdt0LRuY0aAauw21EZ9c568nprBsGRcdm6qhFo8ACY+0wwYf/OrnrXLG97uNDCQCnoW4du7t5YdymBTC1jxr3aJJsMgPNxNNKajJHv8SRxm4iHHPO795o=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VE1PR04MB6493.eurprd04.prod.outlook.com (2603:10a6:803:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 10:37:17 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::1dc0:b737:bf34:46b]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::1dc0:b737:bf34:46b%3]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 10:37:17 +0000
Date:   Mon, 19 Jul 2021 13:37:14 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 2/2] clk: imx8mn: use correct mux type for clkout path
Message-ID: <YPVV2m3n79XtGrQa@ryzen>
References: <20210628211554.2510238-1-l.stach@pengutronix.de>
 <20210628211554.2510238-2-l.stach@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628211554.2510238-2-l.stach@pengutronix.de>
X-ClientProxiedBy: VI1PR06CA0177.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::34) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.26.184.129) by VI1PR06CA0177.eurprd06.prod.outlook.com (2603:10a6:803:c8::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 10:37:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43c076c-b73e-4acf-74f9-08d94aa12e01
X-MS-TrafficTypeDiagnostic: VE1PR04MB6493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB649305390618BCE5339028F8F6E19@VE1PR04MB6493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ViWYoS8Nyou0079GbGw3leyHAulP0bOoVpr/Kq/VqvfoKHf7wAjXIkg6WODQ2VwbQxaIkjRyXcesEBTuQ3Y1zHFYjLW05ZW69yJUcgRN7X1Eh7sOB223kFKNEiN4qXFDxJDm+MJMxuztwrIeBkW07WEW5xefyVsTvIyImOkEz2zvDkW/6INKsxSVc2xjXg9LS/8ZEI9Tv3JUPvvKpHNnBk9AuzJkwsTfG/7pCMBWAQ8oBVE+B41BMbZW+eyZBewg/08W2cPCMHyplvp7X7Rki0bG95esg58mnksVcVbot2OhSueP3wgXT64E7uG/Jv7mln/Bvc7B9sfC4s/Rm3eNtFobR04YlCW1sru+OvdJfqpPZ/zcuRvWwnMdKVq+FQQolwJOKNITrzFfpxwF0/0swOLDjh30B1ewb8XyuTCfw9ijtpGSjYW1ziVMVW+ZETW6BPz8oGbpydG5vThNkl3qo2H+jcg6JSdOH/6Umb3j1cPkqnxvpMhNKNh4DkhosanhBKXwPVD7c7+HgGy1v1OjqugJc/r+leH9gXPPQGP1rXY6kHTa8a70BRtFWbDZNNZz6/F7WO+2Wk2P5VbTnmmzMZSckJaIK00ezIxcmuaOK64mLF0aGHjSzRLxSMJkA76XE9uW/Wb/PvUdHMqmZsLhguRi3r/L0kAnMve4W2JgMQtgjCliXkCuR35hKyvOdQ/V7U2OM0XMPGVaqGbXLWRFxNv8tHpHUwhBSP+9qzjB+MI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(478600001)(8936002)(52116002)(6496006)(33716001)(9576002)(186003)(8676002)(66476007)(66556008)(66946007)(26005)(316002)(83380400001)(2906002)(38350700002)(38100700002)(53546011)(55016002)(956004)(5660300002)(9686003)(44832011)(54906003)(86362001)(4326008)(6916009)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KK9HuYRONZDD668+nz49zXjNcmBLvktmG6y47RS/YOvvw1PsLhVrmyGg74DG?=
 =?us-ascii?Q?Mc5sQ2xqBiuArvqsq6yAe6aEeHcqUksnGkNJXEl1qqR2JtbsPMN0rjZocLj2?=
 =?us-ascii?Q?hl1MdS3UBTLYjoZsHROX+vvKVE8ycAScuBRGKzMrEDMHdD+z6flGtuIj/RR5?=
 =?us-ascii?Q?zJIUGAJQdKQcnpEhCqd02/xvmI/66+Wmtod1bvKeI4d+B8r3logTrGeJLCOU?=
 =?us-ascii?Q?/kgE5GZseeNKrUJBWfTMGa8P6F9wX2ruq61k/uFDo8Xad6adaXgodDtsAfAj?=
 =?us-ascii?Q?u7XZl3FpiycIWYK5+jzYokfQnf7XJUhrTiMk0HQT4NdFolCy04/bgTcDn0Jt?=
 =?us-ascii?Q?ZSJTNeeNguQdWsUkrl7hk6RqFL2R47RYU5sQ/tOG6J9v51Cb+n/2GU2YvDOA?=
 =?us-ascii?Q?u2JDxRYYh491tk93rLl7dL7kSKLGEfR1NEyJ9zsdapxsaWeqFLoOtXwNNopP?=
 =?us-ascii?Q?WyLnluyx/iNi3ZpT94A2TZafxhzJcOH4JSYarv3TTCu8oL0kbAYQLL5WsI13?=
 =?us-ascii?Q?tXe7mmlC26Z7W50kNzGueQwrZzzEr4z/TmeJAR83uJx9cahP5yCzacolDLYF?=
 =?us-ascii?Q?8grKhpTf+hPsCrUgwKduZTxDAofgDcJT7KswC6FLi9aHYpFKEpAmt4S+rRuD?=
 =?us-ascii?Q?ov+/aYC4nPH/IJMwlMYBA2WZCewh6RGKqOAYQkHkHULVg5NUpzTJ+j2L7CgF?=
 =?us-ascii?Q?yqIujLfG7fmXfIAY0tsJOmR1DmWOlgwmOuJQvETW08qw4BIS/lzWJsicCi0L?=
 =?us-ascii?Q?cbs+x2M2lRjbmU81CtZRRlsWZEG+2vcXQcuABLprHwgC2rm+5GbjlCBUGqtj?=
 =?us-ascii?Q?t6xtVfZEBhEdLoLVrrhMqozwzBZi7TvpHxygFlxCwgK2T1cbIr9SxX9sWup0?=
 =?us-ascii?Q?/fCy4fyxYW3q6mbrHiPBE+owxd3yppscEwhNikeGAg/l5yhUXksTNC/yCVRh?=
 =?us-ascii?Q?yAiuWJKrHLoGeCN1PgExJZQJeYru/jLbfIEpkkXu85Vb7fQZsO9EqeRvu/b1?=
 =?us-ascii?Q?BAmXEifF6sS+zYlAXMenHQu+7Q86sP8TZbX0FSiamW4j2Ls1TJtV7L9jnAAn?=
 =?us-ascii?Q?6ychq4QK95PfOs7v6RdUHkkLiG/ABhiBlmvbmwkay6laV98Zg/JVXPFJieoY?=
 =?us-ascii?Q?jDySHisOrtsK4FogAfG3DNIy5bladqLyut77gTlZXLjVL2+pajr6APZK/qoW?=
 =?us-ascii?Q?cn/rDe3wVsfAhm8Syp/q3wXM4Qms4diz7r17CXZJDGq3rV909F0ZKMO2qKRt?=
 =?us-ascii?Q?CnRDIl2tdr9N2vwEDUP6IfJArPoT4AEqvnOczyCT/H0JvcITuyMqXMvMETCz?=
 =?us-ascii?Q?BnSGhrL21Zk6PFG8PKUbP/Fc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43c076c-b73e-4acf-74f9-08d94aa12e01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:37:17.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xfa12hjOyUuEqcCsgPAwSpLJfsBbsiyJHY+fKIu7HNRoGKPEmzMq1c6iWprznibt3Yzx8cglA+zI4KevIlHlGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6493
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-28 23:15:54, Lucas Stach wrote:
> The mux in the clkout path needs the current selected parent to
> be enabled for the the switch to work. Use the correct mux type
> to have the clk framework take care of this requirement.
> 
> Fixes: af4df655040 ("clk: imx8mn: add clkout1/2 support")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

I'm OK with this one too.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mn.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index 88f6630cd472..212708e9388e 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -402,10 +402,10 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MN_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_500m_cg", 1, 2);
>  	hws[IMX8MN_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
>  
> -	hws[IMX8MN_CLK_CLKOUT1_SEL] = imx_clk_hw_mux("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MN_CLK_CLKOUT1_SEL] = imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
>  	hws[IMX8MN_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128, 0, 4);
>  	hws[IMX8MN_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
> -	hws[IMX8MN_CLK_CLKOUT2_SEL] = imx_clk_hw_mux("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MN_CLK_CLKOUT2_SEL] = imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
>  	hws[IMX8MN_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128, 16, 4);
>  	hws[IMX8MN_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
>  
> -- 
> 2.30.2
> 
