Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8904C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 19:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8436060FED
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 19:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhJFTXr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 15:23:47 -0400
Received: from mail-eopbgr30075.outbound.protection.outlook.com ([40.107.3.75]:30081
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229926AbhJFTXq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Oct 2021 15:23:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMVsG2aZaVliR90Uu6v6JcKQwOOljnUdY3P3SjmAGUliUDjACu47KYqjJo0byJRNO7ZhDP4TMok/z7L0pCbEhGk93ZIrigZqQ14fC8DzFotGuoW/dK8vXn6YIQlpbpU9dGtojCWO/5mKUnpiqUgCrPKn/LXW4E8JplVveD738e+1ueSaYeDP8N2wd44Z738C8r/UlFkf+q5hlm5yDozoYmL5+AHPfDWedVQQfLQYf7ekXkS0h4q9WfbjgQtMGp8lNf67pCqVy3o3k1RmjSotl8AqPLyBcVtDuqYYpe4Orm4pgUyOO9MkF/iY8CaEE5w0FEFHtQsHCWhlPlWttMcPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvcNQRtVatBfEUzd/ETlP14vBCk9DpIQNlqM91XfApA=;
 b=itq6UDxMpo8CDWbnxZUnF+G7zZ/sfGZ0IESVk6PJzXP84AGQtikb63EBC1xPqRLMvzbz710wq/J003iiX41Ts7TwH9z0OfHRLA7hVjZcmU3MPpoZYdYv/o3tHRUH9aTz4FEf2E8hJUhHr4rKidvSpnRQJ9uQO0clssLWV6mx06U/WrHT6tNnh3XpokH+Zg60CdOpdYX98tza40LMUfIh5DhOWBvjfx0m5vnBy6JG1xBOGx1lk4SxWdtzOZKT9eKVpl2goTMZ6VilyT+uNtdZjBPxewBGl9PreDOCUp6101ACzQjcN0dgQhKxL5Zvvh1cxnJkM/XXhpkwehMPXho5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvcNQRtVatBfEUzd/ETlP14vBCk9DpIQNlqM91XfApA=;
 b=QarLlXV9dxQuQroiiq3Vi6FDbkGe5gHvtPnvA2BWeSumU6Axzxv4elai7ESaUWPGbSYG2mvm3PyKf91xSPa0/52K7O3rHXgYNRIQHo5XkXfcBOLAbF8sm6w9RvLBTyjb41Aj8opjqFdlYdXFIsmYrVsV32JoxfmywPuQuia1J1s=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB3021.eurprd04.prod.outlook.com (2603:10a6:802:f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 19:21:52 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 19:21:52 +0000
Date:   Wed, 6 Oct 2021 22:21:50 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     shawnguo@kernel.org, rdunlap@infradead.org, ping.bai@nxp.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Make CLK_IMX8ULP select MXC_CLK
Message-ID: <YV33TgGoZMw6Ae5y@ryzen>
References: <20211006190008.1935051-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006190008.1935051-1-festevam@gmail.com>
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
Received: from ryzen (86.121.85.242) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Wed, 6 Oct 2021 19:21:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b74173d9-a624-472e-0c0e-08d988fe8cf9
X-MS-TrafficTypeDiagnostic: VI1PR04MB3021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3021303EFFA0A82D89419EA2F6B09@VI1PR04MB3021.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1T7NXiZby0xe7yGBn4ipeV11+40R+2A/Wx5JtBllN6ykmAh8qnwzgOQ7nI1wGC3tzdhpNR4ZhFZFyJNCkTVcVLupNUF9j20YCnJCgYHwkoxMy9PIJ8MKyhoQr6DZZmcAuFrKOfiIGfiV0aKO+itfr4BWjpMJ6W+xOCUkLAvjF7rVF1H4MbhtEuEvibGMXwt4tnqVowf2negyPXgE756WlV/B42/nwu58hVvOxieIHNZroygweBbeT6KJ3oEq7/jseB/05DMGjwrsLVZpJVKM+hNr/PdgxY8vJw0zaPugGjrBJllCRmZ3Y+fTVbRa1SyFMHd3s8XiVZDxt6ePpVkbOxuZgsAGPwophVAwl/r/utJ6r76q7/H8UYyowUVXUStDr48YmN01yPp0oVljmikhiku1+LMAihEoEFwWFO0+eW+cyrdQTFcuTb70Ui6yyIfqSMHYtR++OunQ/anKHoWGA1/m0bddSVfS04zTPXSKV1NksQ+/N0ldGf8Fq3V9elmtMhkVVx3eV+50ltUCQHhXpcIrvp4i+g+0f7Nt0bJ/H4ocntMqSOXNirnX3+z1625NdsKVCTLox4VN6KvIDt51VWgS00rvRxHuoIwKVheiE2cs2gBqbzHBb4tJMB3SCrNB6SG9b8hDPJsCx7UYFeBQDmc4BZM4YcgkAO7VxXsKWYWE+HY0A/jHMarmIJlWgtPfu+wyn0kAT26MnsK7/pFCrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(38100700002)(4326008)(186003)(53546011)(9576002)(38350700002)(66556008)(33716001)(66946007)(66476007)(8936002)(508600001)(9686003)(55016002)(5660300002)(52116002)(956004)(2906002)(86362001)(316002)(44832011)(8676002)(6496006)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E5rZhaW4aPglWCXHj+nP5rJa2KtTXKNh6ZQCBSQLoS81J7zI+bdGwzbldCrV?=
 =?us-ascii?Q?rKVV9LQlaLP3pVX+lkLGsmj5uh56oOiyO43aCtug/3RKtAi3Ls0jY7jwOQhC?=
 =?us-ascii?Q?ghxvdV5qOsa6ey4jopgxCgrB1dOJHsx86ZsEIHqD6cfVYtjenJjSHIg0tDPx?=
 =?us-ascii?Q?xKJUObFO5qdIph8Cb0ht2cj6JITHYt/i08yDtsfroMqSF/ZBqoqeX0kpCg6v?=
 =?us-ascii?Q?WsRn6AOlf+1nC7PS82A3nW4VdaoesFpBPW26ZUoJ2OlRqYFudkyn4T8VU3l4?=
 =?us-ascii?Q?W2TFIG0sFdS0+SzAIW/dDrTSNINWvlfyAt0ZhsKa2X+OjK3JuW1XezGtZhXe?=
 =?us-ascii?Q?2mDpquE0j8PeTHFlTWx/fZAwfBx0USpguURNXhWDkKJPHvycgWlfVT8m03ks?=
 =?us-ascii?Q?hCaRBokDW1dq55kWP7e58jE9oUY8Z/uKMjeEzDCLFLkUMyNlEIrUtCoCMQKH?=
 =?us-ascii?Q?PpMWcpGnTJPou6wCxBwWTKZM3rNSiry9g2GauBS0vCY4jnn71c8G0lTbeymf?=
 =?us-ascii?Q?J6ezuIed0/DOHho0t8CmhD7JCprhlXbf41AuugpSQfUbcsrNcTSmZhPO7f0v?=
 =?us-ascii?Q?1gdKbbom/utCrFUaUMSTfnRAdjw8skofaqPBh+xhtbPt+TAdB3qgiO1rM5M/?=
 =?us-ascii?Q?W5pdv2nhL/tFmEZDD9tin7nnpC57O1TpUkmQzPUGcJt2z9Z5GIVzJWxM3jWv?=
 =?us-ascii?Q?CAvRy+RVN+8z+bFIY42xdGVK+ohZiVtVf7SKU7YK/YNg9vi7P0MKT1NGjgsJ?=
 =?us-ascii?Q?fK9EbKzj6AM1h+4iZ4JKAuTARc5jQ1rU9nnSrHxi/easN7i9vSXWbWPYlxYy?=
 =?us-ascii?Q?xdngKcrP568mFCi5m/0gS0TKpGy4MjS3meFDJvM3uIJhDS1+BMA0tWv9tk19?=
 =?us-ascii?Q?kKG/mlsRRJp1qIXpPGMG8UQqWSDFM3fbDWaG1Ikwh5bI919iJvh7eNe/q0bh?=
 =?us-ascii?Q?FWu3uAnFlXsQNcfomj9az7k10/tI1Zhbgof9c+kplR5BDKO06B4enQvq9QKQ?=
 =?us-ascii?Q?VsbtNH5Ot9DfonFG0MLTzf9myE4IOR6qleyEN+z0m3Yk4rPbEmh0yBrHKNO8?=
 =?us-ascii?Q?dQlW0gXYqR5BGZeMg7h10iJsmaG4a8Q8zDzJWEqFRZqk72We3ThDf/bGIgh0?=
 =?us-ascii?Q?nyrAsdx2IY6h0UepojkcmjVNamh4x+ob1HxtecAtcgNO7wQ4bMUCZNplaQCr?=
 =?us-ascii?Q?krHRlconWJoDN+2lall6EpFJ212Inybe12DOMp326PgQG+JRdbFVtPb9DLcU?=
 =?us-ascii?Q?KXgj+AX3snHN3Zv/YW3JgKLQks9fScabW/cO5qfQFWipC+jwfjiFPa1ueTtO?=
 =?us-ascii?Q?gUBLUB3IfdRk7vapio53eKDF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74173d9-a624-472e-0c0e-08d988fe8cf9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 19:21:52.0237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+QgCdgj3CJJLSEIIw/cFD/bm/gANPv47Q8CQc63VOGhzZE1ew1tJL1OBsNaULdhNw/DXNCrRxhLugjsMY02RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3021
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-10-06 16:00:08, Fabio Estevam wrote:
> Building CLK_IMX8ULP without selecting MXC_CLK causes the following
> build errors:
> 
> ld: drivers/clk/imx/clk-imx8ulp.o: in function `imx8ulp_clk_cgc2_init':
> clk-imx8ulp.c:(.text+0xd0): undefined reference to `imx_ccm_lock'
> ld: clk-imx8ulp.c:(.text+0x14f): undefined reference to `imx_clk_hw_pllv4'
> ld: clk-imx8ulp.c:(.text+0x15a): undefined reference to `imx_ccm_lock'
> 
> Avoid this problem by making CLK_IMX8ULP select MXC_CLK.
> 
> Fixes: c43a801a5789 ("clk: imx: Add clock driver for imx8ulp")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied with Randy's ack and my R-b tag. Thanks.

> ---
>  drivers/clk/imx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index b81d6437ed95..c08edbd04d22 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -102,5 +102,6 @@ config CLK_IMX8QXP
>  config CLK_IMX8ULP
>  	tristate "IMX8ULP CCM Clock Driver"
>  	depends on ARCH_MXC || COMPILE_TEST
> +	select MXC_CLK
>  	help
>  	    Build the driver for i.MX8ULP CCM Clock Driver
> -- 
> 2.25.1
> 
