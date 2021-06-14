Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6505FC48BE6
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 417976128A
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhFNIza (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 04:55:30 -0400
Received: from mail-am6eur05on2056.outbound.protection.outlook.com ([40.107.22.56]:2528
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232528AbhFNIz3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 04:55:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dU4J9CbzoIrhWUh56959Xz6D9Bymh9gGaVqF4roQyZiPC3mi5Nmyvxv3VM9/LyJlSAZI6Kwpmm2mRA8NniK/YuohtpyqtMl19AOwgKkd9V/8J3v5ULc7OvJMHEOnpj6wKOt3bpZA2g5peeqY/0mTQ5WMjSf8mc2FJADH9O6G2Xo4UyKOK4nE2+IPxPCHN4U9T3vPpFkqMbMDq4kEyUGJ0RfoZn5Z8xpJDSPkkiSV3uAPLzzj5UmI6J5SrbEbTbWblquu7ZgFHKCyjgj051Qp+pZhVgOehQ+HEZZujvsZPd/E+qlbH2dYG+6lzDyluuOvK5QyeJtRvG82tvNpb35Dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2N4+dC29zqzXi7oqMEFtOzu8Q+Bc3xKA9Grh9vmekk=;
 b=d0pygCQQwmUbauAQ8ZWDku97aBSXOSjD/wCOczeZds5FUomN51Ix+b2nQ92Z+V5kp4WLBbhfQurpJrMrL5TyXi/KO3nfPNRHesCDJADdgu019GVGP1PSp3WMfQtEUJhLVku7jElvYzuvYh6Z2E+1kf4zgVa/bO7Ft+OZTfuE4FVvx28DiAaUcJ1IudU3s0i6Gj+54TdIJAXlTuBDUTjPGqeiY1/bwUixq77EQ4x3ysCHQgoIngyfu3dDfAry0n06VLXYfNzQvP29TCHR758UULGlXz8+qb6o+nNJoGStVyoQw9QkpIyBcjR/LbJEHQIg8Lr4dcdSXkToXK9e7t/wVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2N4+dC29zqzXi7oqMEFtOzu8Q+Bc3xKA9Grh9vmekk=;
 b=bFLtBk3ezeygPeqax8+yU3JSbzBV4GUzMRw2M2ilkylmxI8j/7hhrPPwR/GRY5YejfL8dm5FfM7h4b4F1AJCm940qCVzZ6FeJSEt0lE4Zf6OP9jFqkysu6WG5pQjTMxwfTecXEZZnJdKvKERIxRLIV3row+6nzaAzyG2E58zPAk=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0401MB2557.eurprd04.prod.outlook.com (2603:10a6:800:56::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 08:53:25 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 08:53:25 +0000
Date:   Mon, 14 Jun 2021 11:53:23 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, dongas86@gmail.com, shawnguo@kernel.org,
        kernel@pengutronix.de, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 02/10] clk: imx: scu: add parallel port clock ops
Message-ID: <YMcZA7dQd0zT6eml@ryzen.lan>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
 <20210604090943.3519350-3-aisheng.dong@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604090943.3519350-3-aisheng.dong@nxp.com>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR07CA0307.eurprd07.prod.outlook.com
 (2603:10a6:800:130::35) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR07CA0307.eurprd07.prod.outlook.com (2603:10a6:800:130::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 08:53:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2a497c7-1015-4b99-4ae9-08d92f11ded3
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25575212B116814C6474CC27F6319@VI1PR0401MB2557.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DKlY6B8M//+dLlh0Zsb6CUr4ToRy3s08srRQg58nGENowzj998N8XdIaijA30HkFnFCMqRp0AojGmWST+ZxbornfqF3hJYrkN1fHRSMLmyTvnkMrt8eit0YUhQhPKq5r8NWohNYh47ILq4CIq7+qdNc6ORS4JImYrSNXaBeb0nCjAhnGbI6ZbDg90tvXkQ2KpQtaIT+8eVNQ2c30DsZUFGeX/8RHDf+HqQVWtBqpDHTGQqNSyf2LjTwU4zUeBi4r/hV2TihT3yVDXESyRxG9P0hP+1DO3s8zbkemM59jWFFHYsxubi0myUcFAhnK5vm+D6VH01PoOs4g+15dvKyCy2OFuQ5rAysr4eWzWHO15oJPzHKNabe6+e6entv40U8FxHB/Jf+472UbzDXkEpP7zhCK+3OiLdaNK73fmStYPiT8GS2PYL4KYmPZDe1YxfpWEwt4oqKbqwMdeNnuU7ZBcSUuYbDrrrZ6ig/4LyNENHtXYcbjBKYIKx3m1eObsBmYyZrPH0i/FfssDhqhM/K5K0fYOYfz0WeUQZNzYgoMGlmx0O7X1vjzD4eC3D9+CA3FcjXWhb9YOyOaTL4HDrRwLlkL/7LxkfKe/qhmSMPoI2gy3rgdl/GXavrYnDFqPj/9eongno6FbvaZknYgrl0i//59EsOyBMdD07iYybhjF/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(9686003)(186003)(66946007)(6862004)(2906002)(16526019)(8886007)(83380400001)(44832011)(8936002)(316002)(86362001)(6636002)(26005)(66556008)(66476007)(55016002)(38350700002)(38100700002)(8676002)(6506007)(53546011)(5660300002)(52116002)(956004)(7696005)(36756003)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PQoOH5R9iPWrixIvPCGObmcs1X8CJ03TG7xH5qJsi0nb3nHuUsf7k8j4o7g6?=
 =?us-ascii?Q?IplRvfnssbXtSRrBc4xbA/nEUeN6lyvTOQtkVwkKAe7KAnM0Z13cwUBDh47k?=
 =?us-ascii?Q?qABHOZ1EnXtEhclv+yAyRzhzqTUfTyPyb8072J+cm8Mnw3H5sKqWsjgOdjV9?=
 =?us-ascii?Q?T3cPMJcTcEsdVsiI5onzkOfFFAlD+RVcQpSZVUfZY0drLL5JYXHEwIlDCXwS?=
 =?us-ascii?Q?rfVAyOl91nZ1d5c38pw5guSqGm0cjKjPwOIl2XhGEjUOdg1F9BYQAL8Jogp+?=
 =?us-ascii?Q?p4ADua9d+1RmefL6OZcml/M87J9GRPf9XT7JIJ0qKoAMqPIkNQQ6Nmyt3Fpv?=
 =?us-ascii?Q?3mpTs3Xd6yRD3cTF9KGKfrDU3BAjdkuc4Js4NrKl9IfkSvX7SroI/zPloAQt?=
 =?us-ascii?Q?wU5afGMRwEoNMB04yo0hHS9W82L97jEWwixunWB39AjmwBdJe5s4ckYPj3qB?=
 =?us-ascii?Q?8/kt0z3kDtG8tyjlUoI1GND3uAnnrXyHjgsiJ527jwATrehjz9/d0AD3PTxU?=
 =?us-ascii?Q?F2acY5bSCyckAjCwMdUP1UQUlraTeFzUR1rDZw7uqziIEXUDY3bLVkeOy5z7?=
 =?us-ascii?Q?Dow8I6ctyWlFkNZM/n/moMUFLtCnv4duTw+0XnCxl2OMW0CNGfzkUPaRC2sk?=
 =?us-ascii?Q?XlG6p7T7S3/ppjV8kcU0G/6/GnI+cPrPdZlG2K3729rT5csX3aAj3GjA4jTK?=
 =?us-ascii?Q?+WjQVaaiPuleJH0xqsC+f/AFMuqblTLzy+ZQRpcY1PzFUn40V9cIUB3/Do02?=
 =?us-ascii?Q?oTHxBSVC9v5dkweSea792W+9vCL2mVsRYLsZ8S6YVsiRVCFsH0dF18Hx8Evo?=
 =?us-ascii?Q?Gu7ZCFlgTX3eZaeRnYUTSPEmaeKnp9VW37BMGKErqc7fIqomeb7qT6KkhCej?=
 =?us-ascii?Q?tdtbPfQISgwM79qBsjQ2D3UldqBJUPR8zVWLU/Mvti/xaj7dU4CawutjLksT?=
 =?us-ascii?Q?PQE90V2f6/2jcUe93UEB2TKrhNvJPB1i4qpp1c2Hlk/7IHNH3916ak4BjK/b?=
 =?us-ascii?Q?iB9u3SPTyB6aY4FLKemGsYnAWcZdk3NoZ43aiEUshqoQcuV5k9ZqKTLQBJiw?=
 =?us-ascii?Q?tt3XKjIimkLphz4BsJ/AuwftfmYlVrOinFjIhp76pJQug2b/GkdFl1FsUt7v?=
 =?us-ascii?Q?cgTHchSEqVFfM9Wma6vBTPZOFz9hgBcfJ/g1z2nTnuOHJFoifLWbQpIUo30g?=
 =?us-ascii?Q?WmY6I5ufmS4X8VfFHP8hTSh0pFWbjWy9y5lrcVGPZLILtNk8/BDrAJvg04B6?=
 =?us-ascii?Q?hOqXVdLE1JgtoJwr7QQWk07jYBhPcmLd6Jbq1Ik4jWGSQuKYJaw1RjFQOutK?=
 =?us-ascii?Q?+FzgFKTpF2hyqtKK3eSRTuHO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a497c7-1015-4b99-4ae9-08d92f11ded3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 08:53:25.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kgU2gxL8OAHVbVlqGrd0/M1Bh5cxqsdjW5FFLZFCSREaL8aNtq7vcd1Knrbg2lje4A24nwKoP50ntTk8CL1SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2557
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-04 17:09:35, Dong Aisheng wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Because digital pll for parallel interface is on by default, and
> not provide enable/disable function by scu, so add the related ops
> for this kind of clocks.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

This looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-scu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index f4efb3b76c86..680b2650fd45 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -425,6 +425,12 @@ static const struct clk_ops clk_scu_cpu_ops = {
>  	.unprepare = clk_scu_unprepare,
>  };
>  
> +static const struct clk_ops clk_scu_pi_ops = {
> +	.recalc_rate = clk_scu_recalc_rate,
> +	.round_rate  = clk_scu_round_rate,
> +	.set_rate    = clk_scu_set_rate,
> +};
> +
>  struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
>  			     const char * const *parents, int num_parents,
>  			     u32 rsrc_id, u8 clk_type)
> @@ -445,6 +451,8 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
>  	init.ops = &clk_scu_ops;
>  	if (rsrc_id == IMX_SC_R_A35)
>  		init.ops = &clk_scu_cpu_ops;
> +	else if (rsrc_id == IMX_SC_R_PI_0_PLL)
> +		init.ops = &clk_scu_pi_ops;
>  	else
>  		init.ops = &clk_scu_ops;
>  	init.parent_names = parents;
> -- 
> 2.25.1
> 
