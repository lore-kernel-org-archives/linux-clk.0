Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D7FC4320A
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 10:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13D3760F00
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 10:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbhG2Kpq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jul 2021 06:45:46 -0400
Received: from mail-eopbgr60082.outbound.protection.outlook.com ([40.107.6.82]:7654
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235607AbhG2Kpp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Jul 2021 06:45:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXCuxto4IBl418vIIvyICXUQtdxcbaVCfDed5x+yf6AcDS7wMINvXRxfj+LVruHtsZk53bDNC9MiYO5FiyleaW89iGkqX3fQ1g2mHYrnKfZwzadU1v+JiMmQHh0lZQ2OCfP8/H4bCFGZvJYM+muT8yzuryJ4d2Su3HZkqY3dsmxyg5Vui9kmbFrX3bVBJTIHR5hFaRvozziKlfUCIeQUaUf/gKqPCC/McyERXq51+awE1CcRqLxjGpQ2PfNxtVkCIdbAXxgiJqTT1Y1UDZ+eJFZiv4nR+IUXVMRN9jLSFUafizi0B71b4Ir3UhZjsQsOwi/vhy3DQHWIPn5F90RzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8iAD/1r20urPCvptVEGF/CEDhIfTpgpvggcznk/su8=;
 b=j0CmUwzihBUEEt35Ri3itkLVrEA/cm7KAE5SNv0wpxa2A715ONOGeoH/nh/SqF3ta6G+IGv6PtjMr/BL+VhyivEP/bdFQk9ygUq+ZPVc1ecDVS3d7+2RMGivOHjQPnUcoLf8abJnOXLPH9h4HX7W9QGXk0I4MeHO4tlwYfTp07JJD31H9zVK5BuBH3hLT+ujDboUzcn6kvWfc779QYQA1PO8bUHgicWW8ZQ/5trFr48bn1h9/0eur3brViRD1dCB/16MTK9FyApcHdfyRQ7En9WcyeqLylPO2Yz+ZZiADbgnGQOWxGD7RjIEVq+mWKAgGVI08bD9xxvmNmJ6DnMrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8iAD/1r20urPCvptVEGF/CEDhIfTpgpvggcznk/su8=;
 b=gy4ZP9QRWubXzkPTh5HvZL74XaPSeuL6qsN0Igsrj/Tl/ZDvayVDGjSIsqpGNNB0EC3ajCMut5nR5ro9EU6tby0UH1orHFr3cu9rVydThMZ/VFeluq8DBdQFroBoNCPLha6xT7/EsiW9+1c/1h4buQK5udmk+CBMl/Eir5wJw1Y=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
Received: from AM5PR0401MB2546.eurprd04.prod.outlook.com
 (2603:10a6:203:38::12) by AS8PR04MB8279.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 29 Jul
 2021 10:45:41 +0000
Received: from AM5PR0401MB2546.eurprd04.prod.outlook.com
 ([fe80::c532:c933:418a:cc5e]) by AM5PR0401MB2546.eurprd04.prod.outlook.com
 ([fe80::c532:c933:418a:cc5e%5]) with mapi id 15.20.4352.031; Thu, 29 Jul 2021
 10:45:41 +0000
Date:   Thu, 29 Jul 2021 13:45:37 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 1/2] clk: imx8mm: use correct mux type for clkout path
Message-ID: <YQKG0WzgFsEgeiei@ryzen>
References: <20210628211554.2510238-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628211554.2510238-1-l.stach@pengutronix.de>
X-ClientProxiedBy: VI1PR06CA0125.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::18) To AM5PR0401MB2546.eurprd04.prod.outlook.com
 (2603:10a6:203:38::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.26.184.129) by VI1PR06CA0125.eurprd06.prod.outlook.com (2603:10a6:803:a0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Thu, 29 Jul 2021 10:45:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 282348dd-5242-4832-149f-08d9527e0246
X-MS-TrafficTypeDiagnostic: AS8PR04MB8279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB82791ECB2164F3C9782AE3B4F6EB9@AS8PR04MB8279.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5YPJCFKNEkY16tuSW11q5qUx/XcaYQVNWeq9fQ5ibqqM+eFfvXsOK4kb3uENL3pNCo0ylT/kbSAvGNAAFQb0ACV99GECy6K5QxaoCOdOrc/sTKeR2Usdd7Al3OAj1ONh+4DM0WvjwpboYxR6b3oO+WsehdlpXnwKSLXL0LumHa8FQNYM7GkoqIaWpjlaMKY/f063DT8rScY6DeJAga4cAPcdVsqSxq6F8N1q/nRcyc/r9rkozM+Fy0Nv02/G9L1fvhAdnhzulBdpruSiY35MNhJuNwU6vWyIebymUlhUeEerDq8EoHVxHW2Gy5Qylhrd9x14m5vYuRFOOp2yqw8TS8tTtfkdQi3pXxsDFi5YV5JfHrM+z9AhQ6BP1ZhkOCj3EOXI7idmJS5fpgfhrxBV1CLM5xvMdqdgzn2Kq2FNyi411XNkA1GDu48nQ/hCYhH+8sTxR1VfLLfunEtWc9ZvRf6XKNt6aMfMXDhPnDN1ojTQyfMJvp6hpenUrYnnHjrxeQo649bGSt+0KESambNxMbBOpzDbcE0zxk86cWtboBXiL6hI0/C07YwYItVPWMujj/2lR+Y55d5snmPZUQND29uBdjrVTlxz28PEJVy1ScZIOXjEszigd2OyiAzfeyBx6SPp24Ix91ckpj3nXEmD9noZJlFjNHdb8hXGy0P2AhD8kOIBI1L4JF0gzl13/icC7CCpfe0cxlIfwFFVJDgNrDKIFfX7zCKzsKTyRhRF5tk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0401MB2546.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(52116002)(66556008)(9576002)(55016002)(6916009)(956004)(44832011)(2906002)(66946007)(9686003)(6496006)(508600001)(186003)(6666004)(8676002)(5660300002)(316002)(33716001)(53546011)(8936002)(83380400001)(26005)(4326008)(38100700002)(38350700002)(86362001)(54906003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYYw9sKwLRESiGVM1F8XK0L6/RNj1P50Rn6Vdp9Kk5GHIntQRGKayCh0WbLA?=
 =?us-ascii?Q?jYOQeEwp1euMjHWxWoMTG0OHgm6FwPf0qKs0TLx1wrEEbc47XE+3PFTk3tlb?=
 =?us-ascii?Q?hQo+xDVpaS8ZpPOsWfVqQw72FMd/+i7XVXbJIfrwmG2OFcX3plPWg2CAG9FE?=
 =?us-ascii?Q?IeloURA8Zp4eOc9lAX8m1kpcZd7iaUlr/MiPxt9FvA7el+62/ppU7QjcpJIu?=
 =?us-ascii?Q?cYKuWCEGGAhgKCQqC6R8hfX7+zDJDiCc52SNp1WCWcobqykAF11/77Smgxi7?=
 =?us-ascii?Q?1HbwNa+vxGIg8O2pwndtZd4mdze842hiLHWBVWVNDxe+nycsLUNdFoWWO2Ua?=
 =?us-ascii?Q?IYNGnwRHtXfZ4FBps5vw0KokNYThjdwoSrC3HkAlIreFF/dOWECzE/vLHAdX?=
 =?us-ascii?Q?Nr4y8L8hHO8QT+kDIWVS1pNEfHElFVZYissSSY3P+Tyn25KnRkfB+l93spza?=
 =?us-ascii?Q?ss0PgG9Ppl/GcBfO+CIYqCous8xEq1WBm0xbzkjVPjz8c1f/TMjc5c9HbbUI?=
 =?us-ascii?Q?EbB7wK/sOUe1p4751bRWt23TS3RoaSdzLBG1UewgesusWTDTK5mF/aMyPO7K?=
 =?us-ascii?Q?gJNVaA0jSAw57oE7F8WLrjd/f3Q6KEu9VnNT54n+QLV3m9jATsucmcuXeS4s?=
 =?us-ascii?Q?bsTaCp30QCiQlxDj0kZPCHJRb4p6IZ7uqvYyR/jbjCOz+MzWkDnZojzaEJvC?=
 =?us-ascii?Q?0icbs1WEmwh+ZzIf0/EQxVpqpqIbLvpbJ4dUUxIYjh1mGZVoh/Qj4KWngECr?=
 =?us-ascii?Q?t1JKsaF4r7J5v9UgQ/sSfa7/LR5EpLpSzMCtZgHQd4RSP+tJ7iIDw+EGsRgq?=
 =?us-ascii?Q?2XLCctTVXguMG+hJEEc+tz8DD1Ph5HlTRB7aXYmpMWzoMUfwqiGJYeY8haU1?=
 =?us-ascii?Q?SVeTfYPCjzVPGUQzOqzvc5fBQ04fOmmLoC09ISWFRq1Pne6nTtTYdqA9709G?=
 =?us-ascii?Q?8BI57iyY0ItF8jobDU8AZmsUoaNXJe2hZwjlvH4VnIxgFpi5OP0TQzpkJaw6?=
 =?us-ascii?Q?Zhc1eX46LIQ+j1Q7hP25nJTmWCieTUaRAB8x9Gj2LT4GnLuA66O7UJKK6jm1?=
 =?us-ascii?Q?Ga/MTHxv7gMrxpUwwsO5ntCIzxJeyQlT/2Cg7pY826b1viWe4r+BfNfGsC92?=
 =?us-ascii?Q?AHno5r4d+34piFrkzkRpuq3kvNGSKBXOe5rbjHvkP90FH4vOzuWcJE65cqIc?=
 =?us-ascii?Q?voiHAqGiUNhUwb7DOIv1NGYaUFW84p75Q4f+xXoaH3uDER33nXQ5hz1l5R8Z?=
 =?us-ascii?Q?v59nrCyOybARg4r2buUVjyuP6MKXiZzq54MCDFu3HW5+r9KTHLWjIY/MmTSp?=
 =?us-ascii?Q?c1vau33HZR6tfzl0pYCMJtNJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282348dd-5242-4832-149f-08d9527e0246
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0401MB2546.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 10:45:41.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pnbye1HqItn8C/7bRS/4fXvMxPHBtf8AfvFtdbdbyxT7Layhm48pRQl49UVJkfGSbVDbc61O8YyPe53NjgPhlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8279
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-28 23:15:53, Lucas Stach wrote:
> The mux in the clkout path needs the current selected parent to
> be enabled for the the switch to work. Use the correct mux type
> to have the clk framework take care of this requirement.
> 
> Fixes: c1ae5c6f789a ("clk: imx8mm: add clkout1/2 support")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Applied both. Thanks.

>  drivers/clk/imx/clk-imx8mm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index f1919fafb124..ce7127ccddab 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -407,10 +407,10 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MM_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_500m_cg", 1, 2);
>  	hws[IMX8MM_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
>  
> -	hws[IMX8MM_CLK_CLKOUT1_SEL] = imx_clk_hw_mux("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MM_CLK_CLKOUT1_SEL] = imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
>  	hws[IMX8MM_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128, 0, 4);
>  	hws[IMX8MM_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
> -	hws[IMX8MM_CLK_CLKOUT2_SEL] = imx_clk_hw_mux("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MM_CLK_CLKOUT2_SEL] = imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
>  	hws[IMX8MM_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128, 16, 4);
>  	hws[IMX8MM_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
>  
> -- 
> 2.30.2
> 
