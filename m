Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1437CC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 13:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236348AbiBYN1Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 08:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbiBYN1Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 08:27:24 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3CEA2796
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 05:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpS4drM/rV+jtZjxfMvx5JZ2GWRKbrWoQE/fnt0FvLeuwoiZTcQkq4OQRtx+qBn7oB4m3qTk/RTuoLSW9j83jCPZTuE2TIlwFbZFwa7uHIPB+xoUTHa4Q9fm0U17NUAlmtI6hPz1FZXWldn4RLXKFruoteyako777Ro7rdVo6PkhuSbvTn3uzQSri4DOvYmA5R6PlQnm/h9VNe3HVWekyJv9M1KV2cXO3V+jkjiyOnCUJdYUocYOCz/taaG4dqUB3sR57pDN+3BGSU4lacR0IRZCuhFa0QMAQGKo3p+okfoQmXAmdWifSElEfUG6Iqe2z1fMLeAKwSNtdnTr9oNrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyHn8HHG6XUUaIHlqt0vdlUgtZ2H+bwISlwkJ697YRU=;
 b=HD9gZAd+hWshGckstljMI3FokJLG+MJrzZkJjZEnFr/mmSIRd23rKTJEycIiwBCYFDRnZwfpGWeQFoHaf1ofBdo2BafN29T/JCug4f+9sq1uhiE5w10aNxs8pbJn9C3/rGjdHoBgqA3h7alcDLBJEpEynbVOrOLGEK4WqxcR7p/u/Jt92Vqpw5Vcz7cvlaHE5rAFhTEUvl9r18MRzInfbZb0OKPhDAc0JdaLBkLn8mpwUkDpq1kDWFL0bWFkb4iLfblLx4Db1f4iMoj0ruX6M33Yg++IgEXl/6+Dp//tcZ29o/ZEgSAaXsCPXL/jITyLa9obG59liGKaW7g/2xT+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyHn8HHG6XUUaIHlqt0vdlUgtZ2H+bwISlwkJ697YRU=;
 b=lgscZat57WbfuSo2o7ZybIn3n2Hl+FBPTSgHsmeRDZFSRgkaydRcsjH7sfeIw/iXPqd8IYhGSy/qnxNgIAjyMcqoIJOkG5U0cXon4BuiD1u+/kFdWRKJt5XUUkDH0BnrdhGTCKJBQdZ+eBgCOiq2NNvTHpy8t1r0sgJjaPCzsK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AM6PR04MB6661.eurprd04.prod.outlook.com (2603:10a6:20b:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 13:26:47 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 13:26:47 +0000
Date:   Fri, 25 Feb 2022 15:26:45 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        Mads Bligaard Nielsen <bli@bang-olufsen.dk>
Subject: Re: [PATCH v2 6/8] clk: imx: pll14xx: explicitly return lowest rate
Message-ID: <YhjZFRLeGdsI41qQ@abelvesa>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
 <20220225082937.2746176-7-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225082937.2746176-7-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR08CA0274.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::47) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09e7b8b8-76fb-4390-2bae-08d9f8627938
X-MS-TrafficTypeDiagnostic: AM6PR04MB6661:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB666152531F29FA8B293EB903F63E9@AM6PR04MB6661.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JR8npKq4DKZLAi9OP1k4patkjuNbAXUl+HCzUiDo8sUQ4decr9lBgIZ7iBIQGIu+4IF64Vr1c00MENmrDuccZNuY8rFH+nbyYQoGPON10+z1s8pVsxu04D+9Tb2TRoqctewPN8wCWMMLl9RmzsawrAWjnW6nA8w2GfnH/5YrbIFtcO4rKFKkX4Ss7ETfXF+tkGuxk9zyXhKZCcfWCnGyj1MORLxfYoX7KMUtzZJXYooooMEZY8wQtn2uEyJF+PFx6oHPsactnbkPqEF8+dx45Y1JerA7vl+Qdo4yJi3GJ82N2ixLCq+xgONSAfq/EPXrdmbOO/7LzEOMg1QVRGC5844ohVtW40DTVX8pwUZ+fb+slf7RhvgKRo4WSX2HtOEjlgKRlx2ekUq8JY/PqFQbKn9FUnObBA3HozGuMYXUvYBq0vYB9ydy6RfVvhvBOvL2XwhxHIVHXqAtnb/EEogl/7L9AumStWOm7V4nZH22gb8R95VCLCGauSm+N6t7ilneD1BW8oFrhJTT2gTLMzzegfiFsp0IxYtg0qt5U28QEDdl8pztzJ7JbJCyLDHdGwpfUhHQlx9VZBIYAwwFcbazEgbTIn2AVYN0ZGD2zc059vmW0cRssiN0+kOWVAg2Cy0Q86eCGxd6u9b/VJ0uL5zYiS9X1lnnY2jSwesNCLzNYYDSuNWxxvkhnM/m6om8MWH8bkTxIKdX8rCUQi3uv68GNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(6486002)(54906003)(316002)(66946007)(66476007)(66556008)(4326008)(38350700002)(38100700002)(6512007)(8676002)(33716001)(86362001)(508600001)(8936002)(186003)(44832011)(6506007)(53546011)(52116002)(9686003)(83380400001)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RoMyiGMNuNXpoany0eZlbh2u5vZ/LvmhWKlvTUwBIpRCbAE52kcwsELgQWPG?=
 =?us-ascii?Q?HPxVu/Xd3yXqzzSD8kagYKV6WT7ofEWVrpKsgMg3kQ5AUGyXJR0WrsEe0ABP?=
 =?us-ascii?Q?AJnkalqXdfwLf0BMfqamUkWcXNsQjiwzAhpvFUbT0Y+8/muv0KXYFkzsNPao?=
 =?us-ascii?Q?gZaWU9tdhEHi8rgfKnnhj4+WLLTKgh8vONO6nIzJLJ/0fqsi+hJmpS6gYs2C?=
 =?us-ascii?Q?W5H7s0Qjfre+U5XHtcN0TWiQV8WIlLoMJ6ZgfCL0I+UKpYU2Pk07Nek1mmZw?=
 =?us-ascii?Q?RHYVIFSSZQ1tmuc8BgWHRup9LGMMlPaw4BK1Gr25NiID504ol1rrEiEruf4n?=
 =?us-ascii?Q?q7LliL0Inpx/r5FHlOBE/VAm14TkG0bHcoLw10MPgCzheqg7HDRD2k2pWWYZ?=
 =?us-ascii?Q?lkm5BGcWeDnU8QlOm528XQNEJf2XgaGYp6gsAbEJwnTZOnG7iFbn2TOuO6+B?=
 =?us-ascii?Q?UjVrjJ/KMcuWE+OGeZK4DpIvOeR5Q76gj1jFj4bq4v7lVFCslOIQX6AbHvoU?=
 =?us-ascii?Q?CpcpCzgkn9ggJ4TVabhMuLdPVfveVjGKgAt2D6xL3d4deYwqvrkUYfVMbWd9?=
 =?us-ascii?Q?PiYu96SJHXiDVL6XMsijNak/gzuMadsxf8Cm7XMjA21fphnGOr/xfemsncbn?=
 =?us-ascii?Q?erkzwZIUvuZKTFpJuCcp2yrl8KXGmmlzQik09d43ZewITPxjt+//et7g2YDd?=
 =?us-ascii?Q?TXC1491luCs//eHvTIvk8qqqeCxRHiUQmXblT+s9qTtoerI3U0PH9G8zFC0E?=
 =?us-ascii?Q?3EsZy4OJo/2qtOsx0p7RE3Z/rff4oEgu02bZ/0UskevDmy4hY8UJKYX2/MLN?=
 =?us-ascii?Q?u3p3b+5/unLiso2Vi572H+NqQ2hRJ+5AaYo3PXJwPvuFAFSzA2Zihif6aQHm?=
 =?us-ascii?Q?ejD9RGb9LpMtxa/qdpp/eLa1UZ1rGmA2oecMhEmbb8DDTqJ6Vq30E9IuIVfe?=
 =?us-ascii?Q?J9k4w5c3VL9/WsAc9jiijdpGl4qz6ezdVIGylq/OcMXk1lRCt3Cypg6+MOh1?=
 =?us-ascii?Q?371SDR7Eh6ccM6aY5VfS+SLPXmEG9BhWf8Aq5CvQ404Wq62h++GuMId0oYQn?=
 =?us-ascii?Q?B9hqopUZxhIMM7YynL6hrqqYnhysQ9VOKl+9m9hUZ/JCvjiYHofojWSRR3Li?=
 =?us-ascii?Q?N7vdV7GFK4QA7/G7xo86KXOgT1/ZTA40Ax4AXujxGRA+ho7m1AYNb3HRgRE8?=
 =?us-ascii?Q?XajZqV5DwFgloq1sEbv4K3q/fz413/F9BU5Fev/MITBfbNJEqgSJ0T5dG2p/?=
 =?us-ascii?Q?YkhB0mSvyp18HifE3Fu0VlcasqMRE+PZe7WGMLIEU4dY+WAHbWohu7IncIFy?=
 =?us-ascii?Q?LtxOFTKUhA1pFFytQFSq+e05ZL27E0TqD9Om+fcDczCFUTiAhbu9fBqy1o8n?=
 =?us-ascii?Q?IiUF9RZYChWOymgbLqqrZg66ibFtRKrnwe5cecbZVuYiw5EFABLLVAQCSm+L?=
 =?us-ascii?Q?xlMACXyebNGzOB8R1LL4YVDLGzIos+AKjuUDLjMvTEI3jZQuMuhhn8D2jYLJ?=
 =?us-ascii?Q?Sq3+mRvvMJst3mgEbPxXAHL1bjHqDQcb0E3KmTsQKQzoIm+qtCzumPcCmTrj?=
 =?us-ascii?Q?66ZBU8g1n9c2auJ3skrv7x6JfGkLyo+tI2Xl/VzxpjDJWRRPa10vjjqBsne1?=
 =?us-ascii?Q?XMmWfk+C3ksQ34CfESu/MiQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e7b8b8-76fb-4390-2bae-08d9f8627938
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 13:26:47.5093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c49yN22FCXQBm/tUy9GYXoLoEujxtO8fa0pMlBKDTRLALOqjI1y07Wcs7EHj5j85U4SYZRZztovUiiXH69fDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6661
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-25 09:29:35, Sascha Hauer wrote:
> clk_pll14xx_round_rate() returns the lowest rate by indexing into
> the rate table with the variable i. i is actually pll->rate_count
> as this is the value we come out of the loop with. Use pll->rate_count
> explicitly to make it a bit more clear what is being done. While at
> it fix a typo in the comment. No functional change.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-pll14xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index b464e1155e25b..af4c979e70a64 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -118,13 +118,13 @@ static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
>  	const struct imx_pll14xx_rate_table *rate_table = pll->rate_table;
>  	int i;
>  
> -	/* Assumming rate_table is in descending order */
> +	/* Assuming rate_table is in descending order */
>  	for (i = 0; i < pll->rate_count; i++)
>  		if (rate >= rate_table[i].rate)
>  			return rate_table[i].rate;
>  
>  	/* return minimum supported value */
> -	return rate_table[i - 1].rate;
> +	return rate_table[pll->rate_count - 1].rate;
>  }
>  
>  static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
> -- 
> 2.30.2
>
