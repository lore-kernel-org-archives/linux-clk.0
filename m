Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818C0C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 19:15:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 650D561184
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 19:15:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239279AbhJFTRA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 15:17:00 -0400
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:17915
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239356AbhJFTQ7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Oct 2021 15:16:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLgQcb5dnn6lqhijsn9D+OHNKMvIcdoEBlM070fBjEkdpOAJEBL+YLyMh1zpAUywLWHxwq5N0FXdxfWWOkNeBJCXyAlX/AYZWvNPhBwWwUZcb7YuJXXPFcETeIh6ToFIowl/cOAln0xqyo/w1pMrDEZ8/MvNRbk+DpE2pRskZhFtJ/UiLnPzKVrjdQq0bOXwscXBtBxvXKETTqVW25o/WD2XMlUIKnWWRZ7wiQ6RB7BUMyB9SjSMI5fN1Ixo+goWpk5aZGy3s4ceGSPc/F0/pv52rwRvmWPexHIzJxE0+LGROjW0ehkDY+pbTfIDfbu28/EsCWc0gsvzcsWZHJG7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXAH1UX6DR8JCLTQQkWgKsfQPv9gWjNhS6Mm0+dpZso=;
 b=N53YBt5iP6cz+YmxWPr5SMrVDCkNICAOrLJf0FnQUrkkj4myEp5fPn9VVUQisRF5eVzk5LxS8K65ximn4KvdFKT80mnLg/DOvjDyKgeXQXS0IoLVzAz8Td8JYxXMPObom8xmMni43mBuoWU1jwc1jH4nTnV2RTiRm9HyFZNNvMbYzM6AdNT5QuJOtslWy2OvaR34l0ke1g5Yg4fL7utw3ZQPhmryQFZq9Fb72k8tIOg8iNtG878vKS6WUkfytQB6vTPlJa9845hxy2f57mtak1I8zSl8wMl/CaJ2xl6RzJJbpq9/LhPDSpYvwpPbWLp0WYX1qUTE4eRn98eAngXfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXAH1UX6DR8JCLTQQkWgKsfQPv9gWjNhS6Mm0+dpZso=;
 b=BP4iCtgKFi3lDDYaf+qtvmm87o/5uHdZNMsngMI9pD6xX4hh0uWrjHMCw1Lc2vbQZ/ZTHboEiW7snUP5/oAkZDnO59Kq+R/hW2mpdgvhB6EjDmjdRKRPrA1xZv5xiLAQyUgF3PsD70n7FqekD3x7ad13tjdXnPmsDAoOeJ2Q47w=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB3021.eurprd04.prod.outlook.com (2603:10a6:802:f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 19:15:04 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 19:15:04 +0000
Date:   Wed, 6 Oct 2021 22:15:02 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     shawnguo@kernel.org, rdunlap@infradead.org, ping.bai@nxp.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Make CLK_IMX8ULP select MXC_CLK
Message-ID: <YV31tv9BpzANqVqV@ryzen>
References: <20211006190008.1935051-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006190008.1935051-1-festevam@gmail.com>
X-ClientProxiedBy: VI1PR02CA0075.eurprd02.prod.outlook.com
 (2603:10a6:802:14::46) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
Received: from ryzen (86.121.85.242) by VI1PR02CA0075.eurprd02.prod.outlook.com (2603:10a6:802:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 19:15:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fa01edf-8798-4f7e-1b68-08d988fd9a08
X-MS-TrafficTypeDiagnostic: VI1PR04MB3021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3021080B796E7638C4186D81F6B09@VI1PR04MB3021.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9GQkbkNayOl6gRxyBFLS5X4xmJliLsVTLQaJZefozA9QpKKPlIyZb/zNz4LnDem5UQzUM8TERG7VmO3HrV4/Z96eW3rPNr/qwtVAvUb/CrgbezS9uShfzc+fCfYaRzPeo743vCSm+49bwaec62MihV3FRXEOouMp5cwt9JBFmJLNW5Tr4GQOO26H4A2hrlufX+1XjQM6J2IONU8VcX0NAfAvueyIx3TY8iQ31ycVIjoMWqZdidB0LpDe3oKxZt2y9RHF2oH1wAssoOJAbF2qqIyUd1UbSa5BWIVGEg/aV9kPBGlxIaW0To1cW/UvAwPjGXgjoqEe3/36JJJwBV0MRDqdieyHbwc/08w33ljCT8ThldQcaV9s3QrZtx56MPVzaZK2TlPnKYVS3IrWeRf3jIUSddQ3EfenGqUxxQtqi4DhcqK3pjY/AfLViJJpKIhCEij5o3Lr8QGOrlzD0E4Rgsoe2vkJaORQfic2I5QXorDvXTY3sirar9Mkdu9xQvQTLfrkBkXaGGCNsn5t6fSZpvm5GXsoSKSxcGrm6jPWgzqAff94Z+CppcbLh3WpGSYe8a1ZzDZEi2Y7ldFBUi+ttAnLZrCrmxKaVGye6bst5V6qmuQdh9CZcAXaIgYP2CLQpr1BvqVszf5BiL3QGZ3CiaTTM4+AVyFfV7k0f6C6Nu2pac4pbOgAUDN3GM3qXuwg2Vkh6fezZH8AyWNhwkDQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(38100700002)(4326008)(186003)(53546011)(9576002)(38350700002)(66556008)(33716001)(66946007)(66476007)(8936002)(508600001)(9686003)(55016002)(5660300002)(52116002)(956004)(2906002)(86362001)(316002)(44832011)(8676002)(6496006)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XeyFvQnrhozVh65WXySmV1spL8hs8qhIoiURC5v5If00iZUm8DxU46OmRJ16?=
 =?us-ascii?Q?Tp8fNIrRe+V8A3HIEXU3ql2MQKf8c1jT2UqtTuDsr2OwII1aMMcxnFGPuBOt?=
 =?us-ascii?Q?EyP8EI56C5rHo25iblZSGr+KjQ+wkudIGZYukt3+E6dxYO8BlU4+Rq6sHlIq?=
 =?us-ascii?Q?R3f+MAWF25yV+dFL5JF/Gje4SGn/u2aYtttzN30eLfo14nXLb135+CLpE+zD?=
 =?us-ascii?Q?9sGmcCyZTtOyOZewgwVxtIB9pPJDDmVvyvtqx09IEvsIrBi6pN7Cl4ocZrje?=
 =?us-ascii?Q?VfsMUlJ3V5Ie+9B0gs5P7HzodXsm1Ss2che2U9FlEsStu6k06etSLp06SJru?=
 =?us-ascii?Q?opOfMbwDj6n9JBGaoZ98PwwPThPLsmXck08e2E0PiK7kPjme7RLbWqXUjdQy?=
 =?us-ascii?Q?nXRLWBd85xgLBXR/TuI/P6pT3hhHvV9UaS5dca4+Q8n4gcu7eTyZJmeoPST0?=
 =?us-ascii?Q?StWZzq1ls995YUWp5dGOibkPcP5QF9dfej4gegm20ZgnPMG2vi140Y7YGuFc?=
 =?us-ascii?Q?9DEHOORuFJhO0xHNn6fGhggDkOYcWboZ0af6TYkwIiVTFv6aH7sFeeiFWGJP?=
 =?us-ascii?Q?LhNImiARlUH1Uj1A1CHJ2+c9OeGKVIaDw2C3D26HTXYb/WptYm3Zh2rz3ruy?=
 =?us-ascii?Q?NYmh4BbvRxCyZ543PCGw9H5j6WsAQsa/rXM0zIN9yk2T3oUOVlLZwMglvSKx?=
 =?us-ascii?Q?bQ34pPAnLOVz4mBvuZRIfUEYjcKYGx8atiQ1dTjr4E10+kzGRKoZPTNBpExP?=
 =?us-ascii?Q?eSL5xgC2bc0QTCdmJK/2+XVzYug557QssGCiBOet5RG4N8q+3Y4uVtYDjcht?=
 =?us-ascii?Q?Ict9otn80HSRCPVFGgzCSzAU5ELGu4LAnJiOuh2Vym9JXDlglXWVxlb/Dqll?=
 =?us-ascii?Q?3WGHou/lydBv8rQvFZux+TCPAPe9G9ZRqMLFjRimoBfjEkM7a0sXRss582bB?=
 =?us-ascii?Q?fsl+ahvsO8XJfJEIgRsG6WfrnOip3pE9xcodz1soFz7jP+k4M4Ip6rJf4Oem?=
 =?us-ascii?Q?nNz6D6wsWshVrPu9u4A+n7s+dOg5WIMk6AM7njJtagLcKipV0qIHNZTKvzbb?=
 =?us-ascii?Q?+v04QFj6t5Iq5lH4yzuoJdByhVuh2R6yyZE03MJKfrlnLcCZ4kBi+niWSqEY?=
 =?us-ascii?Q?Ujqwx2oAD0pxkZomfSC9sMg6Dh/iie7R9NcZpavr4lLQFvyrYFgUIkL0XU+T?=
 =?us-ascii?Q?SkQRJ2PYdKHVIVLeJ4GzvQP1OZ+1qhi4vgBFICUZIf/NCAIuHhXuowzwevUh?=
 =?us-ascii?Q?x7C9pnjtCOF10QLvr2+IyGA2xjKkFQphWBhyFAbTVrZLdg8SmjA9XeYfnInC?=
 =?us-ascii?Q?7rWLMeHjZvfwFoU8qwApVPpG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa01edf-8798-4f7e-1b68-08d988fd9a08
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 19:15:04.5320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZVKWOF/EL+PRNA0V5IcaE3LLvbKNQsHMNVtCmBj5Gcp4xH6kJM7D2e8b777FlpldHsjizeAfNQXx3xzjkgu9g==
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

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Good catch, Randy.

Thanks for the fix, Fabio.

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
