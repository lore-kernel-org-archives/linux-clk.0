Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4C9C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  4 Mar 2022 13:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbiCDNhR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Mar 2022 08:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiCDNhR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 08:37:17 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DB61B7627
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 05:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+kyv69dqHZ1XZQahUHDYmmMFHAyh8Awfw8sEjVkcZOdXf6QvwZLMCduLI+gaZqgDRq77c4C1l8jVaVZX4MHan4EYqmh5DHBUlTw/U1o+eDoD1nhatJ3XvlH/PKZax/rn9fJ/xEvV8vKQJ8vEVWxCQO1CWSYnMOmu4BAdZ3JBPkuQDK4ECXZwirXoqpAwwBH+YZRCFQ+P04XSCsbFHrqF5nUtPmkUbVgHNBPeJxZpPqBdNE5zt8kLHxAbUWs+rVeIL5xtaqUBCiurPv9k9gScpMdeBSvnL0WPW9ECB0CYmNImGvbWWBgsLpSmC0sjyoPoJH3gxz2J95nJOKtclgeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak0w4uLszAzjDj3xc2Tbvc0AdxUuFJNPFfKSvsxi48g=;
 b=IVd5eVF5ccJMdBFsHJKuKT+9le0VDnUJkG0jUQ4WrvyKlezgzxi88LN6SblvwJp9l3BbHvX2ofeQDj7rltaO5UZpvzkyqAE7DHG+2ThylBjaIGU3F3HhcnKBPwg+/5UX4SczDUFbdJSmwKqnBT43n+jL4QFqGHYHFSYY0L7NgbvWr/4E326SkcmIYj3P8GmUqM6pefk5AC87rvfra9eCe25jkLTMKbK90WVKr8WnroC+kx7TN7IgNhrfNuButyhbzD1cCRKob8U6nrZu61vuglM2y0SFzt+VNoalvJz9OrHrRU7m7O+iUPha9Bkg6CZWNbnAdjFWl6CsEujltCvFjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak0w4uLszAzjDj3xc2Tbvc0AdxUuFJNPFfKSvsxi48g=;
 b=fpeDdVsChKKz5kantLFPjbOOmvbL6TUXQYN3VwRqeUfqly/2j5HsyexD4Uldz6u7Rmkn3NUSADjEMXyqdiWQhCC4ArFJQO6cDDk9mSVmDstZiMnWPwKjABIaS4DcNEWyRPfUrcZszj/LzwqyjgaZN10JOdFJJpR+s3C/W79ZCG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AM4PR0401MB2369.eurprd04.prod.outlook.com (2603:10a6:200:53::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 13:36:26 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e%5]) with mapi id 15.20.5017.026; Fri, 4 Mar 2022
 13:36:25 +0000
Date:   Fri, 4 Mar 2022 15:36:23 +0200
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
Subject: Re: [PATCH v3 0/8] clk: i.MX: PLL14xx: Support dynamic rates
Message-ID: <YiIV1ysyLn6KGKBq@abelvesa>
References: <20220304125256.2125023-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304125256.2125023-1-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::16) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ba3743-8035-4c10-9132-08d9fde3faa1
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2369:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0401MB236978ED8E1A9F15F7CE7046F6059@AM4PR0401MB2369.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KWfoalR09kH1hxaFOgJdHREJ1K6yNi2ON6DyMUVwAd23OC7s6RGO/9EDn4tF0kiT6k9XyjDHvC532L8JwiL4mOGbTvyputyEX8/jFpEKKW0O0MQeeQgtGkDqTrcAz+jJSQfXnuHjhXI8tcBU6QaUl5E0os7v3PyTHtfQDQgCUb7LnD7xqD24N3a6wJzDZGuC0hEEkeO1IB8ovamVbzV/jyjug1H1ALBSmTA58OZ9Srue5e8eFSuQBBoMYOUt58EvLi3jZBlf/smon7f/BuActC4sx6WhZZLHfwiZccgK85HkFOfuOBG8Ey8+1qk496xQof+Hfw8Ht1Gh1TS9iuoFS3J/3c2A+RSCUvky1KWbQ0OZXjrM1fpJvu4Y4G+FIpaqa2x2RncGhUuP+0WiJ+Y2szcsSIp0O5YUoEi1vQOv2NlWEr2dRyKV21l1E3q5b/BWSD0kgjutkqu+ePciFWtMliPe3OnvfIKA+si827WIutnskwp6F8u4BwzZOVU50JPN/cDqS4/hyIRQOjIKicQoahKYtiS2ZvOl8fLfLLr6+cCcBNJTkZ35JmQP68RLqgEr0Y2f5/8Hs4mpl+J6ZiS6+jfaglTP2Qo3ypriQDKJ4yUit6mE91/yLJZSKE0pHZ27oUqHMIkRjKm2sut65HL4a3mXewq2f7rFO+3pZVEdevfv+XdZzyFcEGDfbq9gwiDokRUWBiBZm9pJS5Qang2blw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(66946007)(6486002)(508600001)(4326008)(66556008)(66476007)(54906003)(6916009)(33716001)(316002)(86362001)(186003)(26005)(83380400001)(6506007)(53546011)(52116002)(38350700002)(38100700002)(9686003)(6512007)(2906002)(5660300002)(8936002)(4744005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBg4fic2ziecfQmNZn9Yp8jLE5pREShZnpHcnalh8FaNuUqBm7mqHJFPNcN9?=
 =?us-ascii?Q?+0apmAH98TPjGxzScRLh51/jPa8pAG6EctFZuthLBnduJxqA6AV1Kus1M7ir?=
 =?us-ascii?Q?y1plIVFkstqkkU7ZpPXN9FKjOZ/OU/+kbcpoItdRjLYNROIG8UjIiQxC9Cv6?=
 =?us-ascii?Q?AnnXdkbk3cDuuRZANUTZ4GbQ52X9p3PEYQ/HtvjtbAh6wYBRFqIB7e1EvhPR?=
 =?us-ascii?Q?PVSyHCFRA4KDOWRiByCbYktm/Omkckfe0Y7fROogh39DVl/fxnb2UnsNZfpK?=
 =?us-ascii?Q?abg/TLupima1dgTrScIyWjv/04XyCMVVJlWvXlxJ8/K3LxIdkXQmdgJC+Prp?=
 =?us-ascii?Q?0jCGX5yKul7syV/dCgt2REoOx5wnwkKOoejb3BCCgjKxHcEb67dfRwvMoI4J?=
 =?us-ascii?Q?3S72Xb6bUMyHpeViiDJkvIOAflSu7yztIr68DoWqwjq/YIJwN1av5xI2J3GH?=
 =?us-ascii?Q?CPl1vZT+k7c1soIQ7n7vr2NFZoKJAkdLNlApq5jnX8XtHYc7FYTjIrfKPnWk?=
 =?us-ascii?Q?tXtc2ukuzWZ5Xzbivrc1sQUIv4QT/+Mrdr1aWFEsy50qpyO95KP4e2qiAMqV?=
 =?us-ascii?Q?o9+1WRLDCk32oDQmClwakY5DBTo7P3VDbnimSojUrtdHX1xagSItnfI+U+8T?=
 =?us-ascii?Q?BJNmoolJNQlorkg5z+RcfCS9i3PYEq/ljBybsPRrLpP3Gh+Kt/ikvLPNhj2k?=
 =?us-ascii?Q?lWMVMILQr0hEBzJ8+9x1qrdIJgw0EKGaBPI+oLrcgFFzBmLlvqYgVhwernpC?=
 =?us-ascii?Q?SvujP7LrAq95ITHsyPNS0D6S7qXlUBqfySrlHYhs6MUdS80sVmgGaqcIa3pQ?=
 =?us-ascii?Q?4Uic8Hk4IroYeREJbvkonV51lKR1i5Td50jM/lPcVSKFKm/flcOQd0XLbzML?=
 =?us-ascii?Q?J0LkJXwmiN2Lb2SJfoOo0zlSCWS4veWtG3nL3dIMmn/Pq8ZMKP605DT/7SzR?=
 =?us-ascii?Q?StFNmhIrRNmL9jxx9XAIY+5zS3VsG5SebqqSkdxIcDjzw/4RaGTIzmYx4vx4?=
 =?us-ascii?Q?iN2P0Y2RUKcvZCK166ZkTJcanMPZCIJSEvQa5wPJed6jjI20cULoEV+4Z4T1?=
 =?us-ascii?Q?/w3n7rV2OtvVQUH7mxR2qK64m7EOnwUKKFL/6aD7MnYHW8tIbyHXqkDQKenZ?=
 =?us-ascii?Q?WnKiOVZ6o5xG3G1I/NVJlDkuf2H2nDT2wlQc+CiktTMVgbppm+kaw2jJn1o5?=
 =?us-ascii?Q?fUNoLO+8K8OHXAJHyeFPzVBu+hfLILus+oHsSVQgQVVR9QSDipp3PNONmVx+?=
 =?us-ascii?Q?LbNzu/6/SsTUnDOmbqVhCkMDeHt0CGmgFMwQUFaaqAmrFetqWNUChIiMt59j?=
 =?us-ascii?Q?RTDj3Vk/oajEeFLPl2Bbf2zl1Qsno8rYlxLv+TQEwIKjnKL0mi/9n+YDLiZp?=
 =?us-ascii?Q?ar8u2kZMSY4fyCGBaXkP3qsjQDmjbfRTSRYy3D1n4bwarHbaqCyrfqGfQoar?=
 =?us-ascii?Q?4pu2kl7WBBgWDu92swbY1PRerzwR2iAU0E1Dll3ZTJLSOO6ESHaL3u4LrRDG?=
 =?us-ascii?Q?bPJMfJcOZvfxoaXO6wcCLdP5T0acvqG/Z2eEs7eNeQd/Dnraw0NQeC7wLqae?=
 =?us-ascii?Q?Q3yR+qoP2X4Ze98yizfH8B3oybmz30JWCPW7n8FR4IFMtFjAZ54AL/JhJqIg?=
 =?us-ascii?Q?B6PHBspCqewEG5ParIeJowY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ba3743-8035-4c10-9132-08d9fde3faa1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:36:25.6275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgwNI88PSjOr4s9Oo6mHyUgrwlfmYY3X3kt0aqbDAVT9PiItDPw76JY6hlAS4W5nzRcTfsXHfavHPpUAwAd6AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2369
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-03-04 13:52:48, Sascha Hauer wrote:

Applied all, thanks!

> Changes since v2:
> - Check for rate in table first before doing other calculations
> - Add more Reviewed-by: tags
> 
> Changes since v1:
> - reword commit message for 2/8
> - Add missing includes (kernel test robot)
> - Fix printf format (kernel test robot)
> - Add Reviewed-by: tags
> 
> Sascha Hauer (8):
>   clk: imx: pll14xx: Use register defines consistently
>   clk: imx: pll14xx: Drop wrong shifting
>   clk: imx: pll14xx: Use FIELD_GET/FIELD_PREP
>   clk: imx: pll14xx: consolidate rate calculation
>   clk: imx: pll14xx: name variables after usage
>   clk: imx: pll14xx: explicitly return lowest rate
>   clk: imx: pll14xx: Add pr_fmt
>   clk: imx: pll14xx: Support dynamic rates
> 
>  drivers/clk/imx/clk-pll14xx.c | 287 +++++++++++++++++++++++-----------
>  1 file changed, 194 insertions(+), 93 deletions(-)
> 
> -- 
> 2.30.2
>
