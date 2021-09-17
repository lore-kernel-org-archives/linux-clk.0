Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663D1C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 07:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43DBA60FED
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 07:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239272AbhIQH2I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Sep 2021 03:28:08 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:22944
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234295AbhIQH2H (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 17 Sep 2021 03:28:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzG1MH3/zbAfzCvNxlyAOCq3SkYj9ayIPDSh/frjV95Te/SvQDc5RDLR+/DqXzWOyjWfcxlfxXLd3lyOB0hWeDanFUcG/+tFnl1q5GHFNS98TbMmdCrWEYtwSazuhzzJccvWc5jsNxkv4ilb+wBg0H/K9f5UMdU1USxqipZ63+MsIggWZdMG1i/XrpBE3I1+GS4E2Tg3XMasuOPhUPJfT0tGmOIBBn5hWAwfTmG6lRfHYl6wtLWCe8Ts3HBQ3jLb/1dE467W4MFxMwfcnKya5cdr3FBEzdaMXFaAinAOGx6ElYdVo3XxKiE+tmm08x7dx+jaK4gcbNqUEK7YA3TcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=k91NFfFa6WyqLxaMN2OHbh8QG/s9zezAWGOxq75F9Jo=;
 b=JmVyN0PmZYz6sOVDWUcbXCWSwu/aCfBJCQWUrnq0d0wjdNSMSsFRj6NKGZpgsk2CBUvTbZY9CSduIpbD5m/Kfd97P7aN306SEcSq8vHwAf3Wrimlb/Zr9hamITBDlrpAvfz4Ax4zc0WD9w4QODsMkGzzr8pVQzKLMm4jWTXAcRvXpos985XxV36Hc4DCessldtAuBUykgLvCKk4rU7sQKwKvIm9yTGUQ9A6P9a3NwWjh8Q19gGMciGN36ugvteVag5rMf/Va7ZtVYfkKESq29Tq3KS/6AkB9s8qX/Tb4Q6PSw6FISDhHpl1GEz+AkYGKF0nqfCSdeUZF6QRqh+/tBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k91NFfFa6WyqLxaMN2OHbh8QG/s9zezAWGOxq75F9Jo=;
 b=aLl1Wx6i9U4D1PBEjvB85Zp5D5B43WvIk2i3jdsaNCHN926KsqPNvPvv7EIl6Znl33XR5rZN9JKkvKiA2qEVZKykgTL6LfKlta1HHYLYm7sN87qBay0UMOiBsl7G9JA9zn2trrj4ruwmyXKybARKgqhFWpVOzQsrmf4mYqXPV78=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VE1PR04MB7357.eurprd04.prod.outlook.com (2603:10a6:800:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 17 Sep
 2021 07:26:43 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4523.017; Fri, 17 Sep
 2021 07:26:42 +0000
Date:   Fri, 17 Sep 2021 10:26:40 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     sfr@canb.auug.org.au, shawnguo@kernel.org, sboyd@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx: Fix the build break when clk-imx8ulp build as
 module
Message-ID: <YURDMG/rhDoud5Xm@ryzen>
References: <20210917061629.3798360-1-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917061629.3798360-1-ping.bai@nxp.com>
X-ClientProxiedBy: VI1PR04CA0096.eurprd04.prod.outlook.com
 (2603:10a6:803:64::31) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.25.164.198) by VI1PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:803:64::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend Transport; Fri, 17 Sep 2021 07:26:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac1aa0bc-c130-420f-c20c-08d979ac7f02
X-MS-TrafficTypeDiagnostic: VE1PR04MB7357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7357CEDAB7E88383C57FD266F6DD9@VE1PR04MB7357.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hh8zUJ7sVgwZtqYYFp+3sd3XAPqsCxbnJ7Ry4uorgSQ9Xv3iZdyuSU8si2KfaCIw3PJkTcB5wQpAqTvWGqjvQ+xgXqC6xaM894J7qUq/Ov8ONyXk41iay8GMLNpTWIfDXjAQK+ZxRjdvwg22tz9jw8RzBN4z+gG92X0xp1ToxceZtwYRsk5ETMEDPmvXmqYy6og1uN7K38KcKYxS+0dYiRb8f5pbVt6Vsi0LrO6CzLK/XVlHxQDDVeXrC/FATCeSZXzlRjXLv6NFP3GKL0+JPtw1E6RSE5EkHWVkm8PlKNDBinJHgzKpPh8xzGyKc5Bv1zwMR2RzmuYBWaTvWcL7VuKq6a21tl4gg33Lo17wfT1Esn/gj9Nyg2xAtXc++ovpIGPAgOQG8vy8UxpY2Vc2mdfvEhb09wnPIEdwYy5cmrKZg8kOhLTQH4SWm5Nn1IK321dmooBpRa8frWzkbdB6mkMpu5IdJKfXahfQzUYFS6YWatDeLzhN/r0+iCsHDYXoZ7TMVQEPVyNk8wjK0dSQzSTiZT9+/bzsOrm83OH9FDzSrxBeiSpNnQSa/m/CvAbt7VlEzIEe5pRxEzYg7FyhVARLFbpiqkKsel0mjvfc7oiCyGtMaJ4LzLDembj7L+myuqMb02NiCokqPAsqKh3ivVLVwijKvyVsqWnfqDjGaoSl4ocnVqfAxIaLJV8VDgeX6V8WZgHm7qNq7gWwszb5xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(2906002)(316002)(4326008)(55016002)(6862004)(6636002)(6496006)(186003)(66946007)(5660300002)(26005)(8676002)(8936002)(33716001)(83380400001)(9576002)(956004)(38350700002)(38100700002)(86362001)(66476007)(53546011)(9686003)(52116002)(478600001)(44832011)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UuHtMKgPgcZEMYrEknLjkWdItU22RT6bcSA0XloiiN6T11CCetU4sUzZMNJl?=
 =?us-ascii?Q?gUPlxrX42A0CMo+OoX2tu6taUHDY2S9Knazxiv5ElrmSOqTL9U/Lvc4uxoTL?=
 =?us-ascii?Q?78+XcCAjmKHh/cn2m2NkLFtCOJ/yTOVv1XpsndyeF3S/XezhJHWCpm4JHXW6?=
 =?us-ascii?Q?Qst+LoB64gEqhgGIE3YQ/2qHMHu3ELRNSmb2fvGgafly99pyc71rxrfooogm?=
 =?us-ascii?Q?4ZD1Fv8dURJB50N5jWbSkemZBmxYIc0MzfNvD3vyVhWz7Ksptk9CB447/vS5?=
 =?us-ascii?Q?dC7vEFsJ4RjPeM9XCGzEuqPr9gKvA1GBQxq0ee2Wyqpt2iH9vH5wcgxldXYB?=
 =?us-ascii?Q?U+xv2QMTsnzVqqY4k8dNkMY1yIomvgfp3KGO7P1g+JUQ0dfr0th1VY3mSCdM?=
 =?us-ascii?Q?ieea9E3QCDW2DCRhNImY65MTxHKByfhUkZmnE0bsl3J8xXfdZQbP5ZZAzufi?=
 =?us-ascii?Q?lQ5dNw/nqwGnHJ/JDHz62ByJO8/656tT6j5asM8KVU+f4Wg3bSvAZ4iiydEF?=
 =?us-ascii?Q?B5i2wRXe4qqjGS25KzthoAAhSJcZvCMkvD6VLbmL2RJOuQGAxxJivYtC4J+p?=
 =?us-ascii?Q?nPToerUkNQCV6zLJZmHnXQdU5AOCG5XAo/cy2+aToEBOVvLQMw38RzQTFmDo?=
 =?us-ascii?Q?8CMIzsBD+chhcOrkj0iDx1AnR8C6FgVq+psPS/0zhPDyyNExMeevIBbimfo4?=
 =?us-ascii?Q?iw/NgArU2WBz8JT7khfBb78eF5GFq5AlQXjfRFYhAX7yH/mGMGot96ts6kk+?=
 =?us-ascii?Q?O4fCS7vHFsPY4upJ94SZRbIAtnNtB8mXUASwReKiFI0SyV15OP4W+RS8cY6E?=
 =?us-ascii?Q?nAtoIHsh1q/5yuPTdzfNZsJ4RBt8g2Ug0bSyLLkRTVX7jMCdkILWqeNmd2Dr?=
 =?us-ascii?Q?Z3QVudjBiupTMD3u3R6WhRVnfdDlZeZR0QdFVMNEwKkvA4tLhbZB+gOp560S?=
 =?us-ascii?Q?kX584nBOnJZrln9f6iQtnNbfvqecGylYwbYKYuWGwNDPDw+5B4Sz007ZMVju?=
 =?us-ascii?Q?uX0jLrFHXgtZnVVfFxzeGMZkEAA8bshW6knxB8WuFUTvos2CCx1w6YgWVmPM?=
 =?us-ascii?Q?xwHC39kM8f0bHK1kdJOIe2kjwI8GZVOiAJVYKiPcn/NtKekG5hYYvYQfvPTG?=
 =?us-ascii?Q?TiEq/YZvJ/rLGvKG9eO0AvjW7RWIUEjA2OYZG0MagstJB4TEVSHFealXeMNI?=
 =?us-ascii?Q?2iYQCrj/DEVC8VIXcTGQt6uP/6U/2XDoYHNx3mdxLwnV/juUMNf5DOK1xOmr?=
 =?us-ascii?Q?lwgnNugj9cm0s6bxDqU4ygQE6hUHwuQzTf0/VKeFGoZ5j4NyyWxz9K5nsikD?=
 =?us-ascii?Q?QovZYdTixuQ2L4fVTb9t3cdm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1aa0bc-c130-420f-c20c-08d979ac7f02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:26:42.7236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjLUKrcK+MmgUirIcfAsl9qM7vrNrpUo2VJQUebpzRyCta91jfKCQ3oIGsj5hQOaFasRg9/27edLPwxwjwchUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-09-17 14:16:29, Jacky Bai wrote:
> Export the necessary symbols to fix the build break when clk-imx8ulp
> build as module
> 

Well, since it is only in linux-next, I'll apply it to my tree.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> Fixes: 86ce2d393ff7 ("clk: imx: Add clock driver for imx8ulp")
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/clk/imx/clk-composite-7ulp.c | 1 +
>  drivers/clk/imx/clk-pfdv2.c          | 1 +
>  drivers/clk/imx/clk-pllv4.c          | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
> index 89106de16a3f..4eedd45dbaa8 100644
> --- a/drivers/clk/imx/clk-composite-7ulp.c
> +++ b/drivers/clk/imx/clk-composite-7ulp.c
> @@ -166,3 +166,4 @@ struct clk_hw *imx8ulp_clk_hw_composite(const char *name, const char * const *pa
>  	return imx_ulp_clk_hw_composite(name, parent_names, num_parents, mux_present, rate_present,
>  					gate_present, reg, has_swrst);
>  }
> +EXPORT_SYMBOL_GPL(imx8ulp_clk_hw_composite);
> diff --git a/drivers/clk/imx/clk-pfdv2.c b/drivers/clk/imx/clk-pfdv2.c
> index 42505669cdfb..6ca53a960eb7 100644
> --- a/drivers/clk/imx/clk-pfdv2.c
> +++ b/drivers/clk/imx/clk-pfdv2.c
> @@ -239,3 +239,4 @@ struct clk_hw *imx_clk_hw_pfdv2(enum imx_pfdv2_type type, const char *name,
>  
>  	return hw;
>  }
> +EXPORT_SYMBOL_GPL(imx_clk_hw_pfdv2);
> diff --git a/drivers/clk/imx/clk-pllv4.c b/drivers/clk/imx/clk-pllv4.c
> index 3c750ccbee25..6e7e34571fc8 100644
> --- a/drivers/clk/imx/clk-pllv4.c
> +++ b/drivers/clk/imx/clk-pllv4.c
> @@ -254,3 +254,4 @@ struct clk_hw *imx_clk_hw_pllv4(enum imx_pllv4_type type, const char *name,
>  
>  	return hw;
>  }
> +EXPORT_SYMBOL_GPL(imx_clk_hw_pllv4);
> -- 
> 2.26.2
> 
