Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6217EC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 20:45:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 331626103C
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 20:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhKCUsd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Nov 2021 16:48:33 -0400
Received: from mail-eopbgr80045.outbound.protection.outlook.com ([40.107.8.45]:27473
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229893AbhKCUsc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Nov 2021 16:48:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcYbSYf8bk0druheMKs8W7rpXWG5LmWHjZUTuR9za30bnjffp3gRKEFisuQRRVSgzrvuihpk4EoyWA6MradpPTmVMOplIvdYjQ/DpQ89I8acbljTXJHstBrvO/9qVE5YdShjHVBP8kPcIzNks3xU0UwhuV5SGngQnS7Hprdlwj7r1Xl8/LQjNTvP2P58ChWvr1MeIqki7PQp89N5giGaVy5n16mwUvF0wjn6/RDTTz+AfODQO7L96bCOw8qB+Cex+4M5JV1qFjxxBt+q2d1AcpicdkljSl9q0IJxRrvp8a0e8Oxv8bXuUD2NGifwnQLYM/VLWUg3tJ5GaFdKP2c6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN4BiYJeQDyuDuAXH7qeqIX1pABPckBNht/WHAxtVhc=;
 b=NQmM1lm1C8LXq3H4TUBLt8z/FRSwN/H1DlpFwFgTCfQM/U+mE9Cd/Ql9fZb5EYx9UecMOhKTE/XrWsK9RhHwDyvfu9OUapz8vLhwZzJk7BFsSd04a3b5NBqUV+h3gaFJilsT9peUXAHNkKNSqAzD24lWukArK6jI9XbgkckqbFZ1QaHeDFKUXRc3nTw9upoVAXaL97ksqyA88Y+a4ZMZ4O2zVXpZqK81Nz76m4YlO9RbKtWP64BwY36l3bpNguYBEknLAwotZdKJY3JEaB4QUro5hZyqa0iR2SrjJBS0q5+CPasjDN8qKLTj8+ssUBss3ekdyXNg8ZkEjHRsPQ32+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN4BiYJeQDyuDuAXH7qeqIX1pABPckBNht/WHAxtVhc=;
 b=oEDohIGCJKE33Oajx1ajyPQYerTEV3Z5kPPbu52yox6CREdl4+OkrYaPT17nSaR5Qf6CfH4Zn5+82tKSTqxOiwQ7URqtusajgq6+xM+ZURFmFs1FEenZsHuBHJe27vhS4pEjH3MZjXlWqM6//xG1XNUzAiM8zDTwagBPepI/wn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 20:45:52 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::885c:ddee:c614:9787]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::885c:ddee:c614:9787%7]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 20:45:52 +0000
Date:   Wed, 3 Nov 2021 22:45:50 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/1] clk: imx8m: Do not set IMX_COMPOSITE_CORE for
 non-regular composites
Message-ID: <YYL0/hpn83XI84LP@ryzen>
References: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: VI1PR08CA0212.eurprd08.prod.outlook.com
 (2603:10a6:802:15::21) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (188.26.41.202) by VI1PR08CA0212.eurprd08.prod.outlook.com (2603:10a6:802:15::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 20:45:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a98a480-0636-4391-198f-08d99f0aed01
X-MS-TrafficTypeDiagnostic: VI1PR04MB6942:
X-Microsoft-Antispam-PRVS: <VI1PR04MB69428F4A5319AAB033E45D0BF68C9@VI1PR04MB6942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJrLF1zj27fVPweNkGRJHZlfTi1V+NJazdmVnP4+kudFv/VmkMKB3xWSCN6yh/u76RvbLIukjHXnM2OXwsNhmKCVtOmFx6CSp53jAwlH0PXrWuiU1VAxBM+LxuKoQinUgIRm6vdqdA8/+/5Mex8KfzUdzuAd4eWNxEJMd123neOQJh40mw3bKju4RiFUNfSCw9vKsaufkYyW6/t9EwKvBmFDnTH/kLWW7va8euZVS/xirCjNxhZ+q10sLOugql+iTOp9MreuwhkzHc/ydKey5pW9Pb1epWnD1qQeXqCKwBu5Z4hp3U22BZdt/K5wm6pIm98AWPlo6Tq7wpAhR9aSkGQ+GnjDqs0781tdfpeiaNDU0Ofkte5BA4gRz0UQC3He0CyqRKBfi1SiLixPJOnqyg95BGTCK0kgrfuSvYQ4GCItiOPWxrMP7XRw11W2DilUwwtKwp2OT0kT6geruuQkks8sfJIute1F8LntA96be9jQTMVvwcaMD4pPw8IfRg/KBMskOGxNohju+knd+3XkCCXnjdZZ4yzYQY5x3697vXfU4LAmymxQQBav3KId80iAKdQl9hyysXJFq6zlgTd/E7qxjA60q3v+AzNbIQFP/vLOQdSpV46aDE2Fbz+XMpAfdcLYtxP5TeSo2iCEiKShUhB+/4RA3Xbct2e547NTWGVLd31xM0VjdN4j7jF+mBXXpKfbKRy1NJoq/SGk7fPeQb1aTvSmLqt0iZ3da0WVVL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(83380400001)(26005)(316002)(8676002)(5660300002)(44832011)(110136005)(6496006)(508600001)(38100700002)(38350700002)(4326008)(8936002)(54906003)(55016002)(66556008)(186003)(66946007)(9576002)(66476007)(2906002)(956004)(52116002)(53546011)(9686003)(33716001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j7Iym9nWZh05yZhK3AQQOZksuCt6wTkv7NE+GSg9spA06EfYtHQevYmobnX9?=
 =?us-ascii?Q?umLVqnUtCJWJS5yb2hT2zvDdjZGl6TYWQ2xKt9G89YIcpIyCMLpj9A/vrpWh?=
 =?us-ascii?Q?2FWFXnJkWOro9d6Jc+bW0KtbDmJprTLUkgeKmvlphXaJQT8j+7eJH1CljCd9?=
 =?us-ascii?Q?uTsP+X0AjIHmpXhRt7/BMUqRD/5VO7XCOFQa1FF8skiGBHtfjEvZcNdvWnyz?=
 =?us-ascii?Q?uSOh6j0KpwBYJb0b4au67ioQxNEcSIIIL96BebFdB7YDLKFW5TTQ102lgmL0?=
 =?us-ascii?Q?0hE+OaEmh6QZi+IVrZ8FT6jwWoOD0Jig1MPtaqMpWMx45QDMYUExqNnNeaKN?=
 =?us-ascii?Q?nvEOPdM+mioldAlqHx9t3MOJPDCCSo4K+mDF7twO69K6SBQE/TjVS3/YfzGh?=
 =?us-ascii?Q?QM0bl10o3FO8C//Qp5uBXsigRCL+aA9JMAyZObJyk2Oo/VNSTv+u7upLnoGZ?=
 =?us-ascii?Q?YNoNnuc+3wW0uyuHNu/JWEtxGUF6yIWkMJTID1PikoSqndFAdU7f+Lb/ecPs?=
 =?us-ascii?Q?L91F9xBgniv4WKZ1yrU90+BMCk0GlkkTt1nlwgVI2G0YQQSX2Xjfo6BZ6t6d?=
 =?us-ascii?Q?7a/gHgWWvp2qOUa3JEe9FBWQ2MJ7caiEXsAM0/ESD8SvVEpN8i5OSVLLPp6/?=
 =?us-ascii?Q?vRPgGO+ENgtvrwNuayjdD6WVZpi9GlhB7qxXjV1qJFAqLXw3bVo9X25+bman?=
 =?us-ascii?Q?+aJD9mmDUkXzifouDJlxhxEgzKoo2QWcEgMyLESFVrD0VJ9XA0qJRqoLHROP?=
 =?us-ascii?Q?wcZ8j+fcyxlOuzUMeV1bMl2csrufdAzNY5NzqlV97H00GKOt5aI17GZp/V33?=
 =?us-ascii?Q?B7j0uDR4scM7zu1KhtjY4VeSjFp7TFJNeipD+BIcAkEXXrt9vY9NO4Z4dgtf?=
 =?us-ascii?Q?jevDctnyOnon+jV1kW5hl2F/uYFpMWe/MGuhpUg4MAHFJeApxe0wgLUkTpZv?=
 =?us-ascii?Q?EMUjcQiwNyfZvXvsXEyhKQ6a3J1CkmgZOJlAMZeetU73QHwqLd4QWSorJFa1?=
 =?us-ascii?Q?J/70Xlx+kDI1qAGbIWGR55yt3+ozeJNxphYlicntY4lMGDYefCn4bpGuBIIG?=
 =?us-ascii?Q?zeXsLai3NJ9bY8eHnAMoAH9atEU6nfonJpoIP5biYU+CAbJbHxHIMk8urpFO?=
 =?us-ascii?Q?uCmBfvSThLBmVJ55OcStKOdC4Y6pQBIWnAymKKBKVUqdfbfm9Ov2iP6bnhqx?=
 =?us-ascii?Q?W/CuoNtYziK16d/0dTB7SS9qRWb7UrOzlgfTY8j8pA1eo25I1Vq3bOAzgFjz?=
 =?us-ascii?Q?3aos9YP2t9UxE9pytkoRRIxg1lPOKW39x8LQwCLxPDTzU59HJEsSwSTQ7ZGj?=
 =?us-ascii?Q?Vny0cI6/0VORWTNO873m2tYnpIEuyfLMAuSUkA9Ctry6KxqgBkmnkTgJKUfu?=
 =?us-ascii?Q?xetk4BL2WiJFGGuIuqQvhedh8CGFOPvN6M0rWGlj40jidZY8wXtlEpVnlnys?=
 =?us-ascii?Q?LorZn5+ovP3++fPhIDTZ0wFfLshdfvWjm5nj8GV8vUB0C5v+3ahWyOl22gML?=
 =?us-ascii?Q?lF0GSmi6KXnzTjQs8mLueVat5vVqJKsRgZhqwVs4t1G9BPUF/BGV4QPwg3mq?=
 =?us-ascii?Q?ow7xeHniCXbh4gBJugl2QoeUiyzkKr9KdTVJemVFRKgwDFS3odmWm/Zjh+Aj?=
 =?us-ascii?Q?vIdMociffkJR7HsNnlkUaMw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a98a480-0636-4391-198f-08d99f0aed01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 20:45:52.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgQ2RgNemIC6qyWkaTlFPNRyjKqfZEWSLeutXWl3leMvLmqp90oQjKtcMv94xsc0GAaH7f4EsHFyDyMmGY+adQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-11-03 13:39:47, Alexander Stein wrote:
> Only imx8m_clk_hw_composite_core needs to set this flag.
> 
> Fixes: a60fe746df94 ("clk: imx: Rework all imx_clk_hw_composite wrappers")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Looking at the commit a60fe746df94 it's obvious this change reverts the
flags as they were before.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Stephen, will you apply this on clk/next or should I send a subsequent
pull request ?

> ---
> This is from clk_summary on a imx8mq custom board where you can clearly
> see the before the divider is limited to 8 (core composite)
> 
> before:
> video_pll1_out        2        2        0  1031999997          0     0  50000         Y
>    dsi_phy_ref        1        1        0   129000000          0     0  50000         Y
>    lcdif_pixel        2        2        0   129000000          0     0  50000         Y
> 
> after:
> video_pll1_out        2        2        0  1031999997          0     0  50000         Y
>    dsi_phy_ref        1        1        0    24000000          0     0  50000         Y
>    lcdif_pixel        2        2        0    68800000          0     0  50000         Y
> 
>  drivers/clk/imx/clk.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index 819949973db1..7d220a01de1f 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -391,11 +391,11 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
>  
>  #define imx8m_clk_hw_composite(name, parent_names, reg) \
>  	_imx8m_clk_hw_composite(name, parent_names, reg, \
> -			IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
> +			0, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
>  
>  #define imx8m_clk_hw_composite_critical(name, parent_names, reg) \
>  	_imx8m_clk_hw_composite(name, parent_names, reg, \
> -			IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
> +			0, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
>  
>  #define imx8m_clk_hw_composite_bus(name, parent_names, reg)	\
>  	_imx8m_clk_hw_composite(name, parent_names, reg, \
> -- 
> 2.25.1
>
