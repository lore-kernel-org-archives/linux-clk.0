Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9595AC433EF
	for <linux-clk@archiver.kernel.org>; Sun, 20 Feb 2022 06:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbiBTG7T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Feb 2022 01:59:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiBTG7S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Feb 2022 01:59:18 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150057.outbound.protection.outlook.com [40.107.15.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F31A35871
        for <linux-clk@vger.kernel.org>; Sat, 19 Feb 2022 22:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmeNH043Ja5SGcMRD7ZVEyEXMEsyqKEjznDJhkyzsasYHROzQFSZOPRSD5qDOUvOqzlwULyC9Yg1VGhbRD5i1r29Fx0PPGJtHikNE9tvVGOJ/hNSSrP7KZgdOPjX7MU85P7YHiUKAiDbruuTY1l/jtBb+JOaiinuGDFcZx4PpClznUE6qdzj/eLOMczVPwD2xV3CQpI8VmI5taWySKeWqVwlwIQOCGCjbPVKsB2peJ7BPaYOadTAzBd0iUJ4OplaO/ZGI7m2pWEf4z0WfNc2xWn7MBBi/nqesmic1v8CuX/gzAPvFaFH4+lBow7mgoJ5uKsksVYwCfyMqcqtRSS5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYd7+l9PQtuF1ETbZd6ZhpOB7rQeaKmDAYxm/rW2Da0=;
 b=K2I+MwGqRPNzOp48zmwCI6HfF38WVKugp1piaTWYZ3u0js1LoX1bPk/k3A5bf39YsLJsGSwQn/+fbhJ73DlUwoyk5Yw5JGxjjr8XGRmesGTEy36BarMKQrxmpXjVKE4C0FsXpKWH/TeVYiGdPYi6o1SLWoGqcnki+Ruse0XM2A4Ow/aUMNO+d1Y/jUYAt9ekoROBtWjClHnl3iSmUmeBiDPkjL0VraWFxuBWXMLUjyzN06zVptzME9E3lOHaFJZ5ruM+5NIiykcKZ23OkYLEYhGm/+OooAgov/q915NbVIR41k2RzreJ4dhX6c3FeBKIwXeadlXjyq1tSl9508YPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYd7+l9PQtuF1ETbZd6ZhpOB7rQeaKmDAYxm/rW2Da0=;
 b=lC7tcayKU0xvq5ZJUtSZdT5gWbLRyYZTTLnDPfelTGnHXR41sGK2Ptf9+OwmSZIe8ovUpeKS77eIUVT/WxgvU79ipmt3Zd6hhwIsoXmQf+4Aa5nGyhuYSb+qIVKM1sSRCmoee/E2VYEoANL3IUyDDhsN6RhLc2pbmggPuD6oAYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by DB6PR04MB3016.eurprd04.prod.outlook.com (2603:10a6:6:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.26; Sun, 20 Feb 2022 06:58:54 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f%6]) with mapi id 15.20.4995.026; Sun, 20 Feb 2022
 06:58:53 +0000
Date:   Sun, 20 Feb 2022 08:58:50 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: imx8mp: Add missing
 IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock
Message-ID: <YhHmqv5KhqNL6BxB@abelvesa>
References: <20220211091311.28146-1-laurent.pinchart@ideasonboard.com>
 <YhHPbacbIqZ3rEkJ@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhHPbacbIqZ3rEkJ@pendragon.ideasonboard.com>
X-ClientProxiedBy: VI1PR0902CA0032.eurprd09.prod.outlook.com
 (2603:10a6:802:1::21) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a1a63f9-ab58-4fc2-a675-08d9f43e7496
X-MS-TrafficTypeDiagnostic: DB6PR04MB3016:EE_
X-Microsoft-Antispam-PRVS: <DB6PR04MB3016F9CBE56FA50C5E4BDAE5F6399@DB6PR04MB3016.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFkQHqdustC8olCF0hX9ZbV16zBptEHso51KVGMhSPJyxDxlx4aYlByYv3GcX+YFuc8zlWwezEVrigGKsW6lwPavBP/zrJ3CQD4h7e8kogSgTDC8wxr+nQ+bOoLo3f79UEp7Q90a+IXXXyBGM+6hd8Dw2Er4ZmEXJsET72SG6LjkXkBt3q+exwihE4ABqKUUyxhBEn//NwcuBati+9hsQsN5bxkZjyAhNMqKzdygnpWZ/Jtq0eK19QuH+S0xDeZgr6JYHBL6BTAOEdrBkj2eAJR9rGUwqVGuf2/V47PoWtszLheEmMGgeKPP47aEeJi8FGKq69iFgkCA2lQWd37qkBUPNBu5aMYqps+BOecvcbpgI4UzHv6Z1Mi7oYvvur5tq6m7B15m+u0UApZE1ewl8hApA7fRu5qBkIvIimZI91bUr6hkAafrDCv1tiGp0+JCN0d8VjQDdEIu2b0f1ddWQiCxwFBLAs73ALXAMbVcHfHvuWGoHiDCLKe+naXlIKNfnMa11I4Mcmkv7KKxQ/rRxTak5gPDWIf0d2OjRdiZ34dvdswzAET+NstUmZKcjm/Zv/v8/bKqz02xxBA1dpK2U5A6GPxYL7rpWlFu4NyUnKjOC4Oe2VdRZoilG4hglZYnGifOUa8/QPRKRbVfCKHD2Q3fUZHqkAZiBBgONedWo9N8YhinHL+EvA0GtCtn++UU1y25l9BlkDHXP9CKggAFpzYRJU15UgFXVQ+nixbjwwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(38100700002)(83380400001)(2906002)(33716001)(6512007)(9686003)(66946007)(66476007)(8676002)(52116002)(5660300002)(53546011)(44832011)(6506007)(4326008)(66556008)(8936002)(508600001)(6486002)(86362001)(316002)(54906003)(38350700002)(6916009)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DsPngFjZ2uNeL+XK3MYtUFAlwyrTCQB2t+Opg+yqmZxScx5fEdlBAHoXJPOA?=
 =?us-ascii?Q?5udTFgckMcNt6bwC583ggk+tU1GNWg7HfJ9wSqh5wU0ESfp1FlbhMxz31FLP?=
 =?us-ascii?Q?IgmuFA/Suljh7w5iZlgyb9vg2wg9xLgHmVooAhvnkb90VuvAcSzbcSKW5/cX?=
 =?us-ascii?Q?fZG30wubYbH14g6v0qWALQMkm6w0UG5TnlC9us4uDVEw+2WM+Peh0Zww7VOV?=
 =?us-ascii?Q?VCXEhDxDyLlgYUi0y+WRs5y3z8uRQiRw+lBUP6yCkLCPrhSdsdfaBS7GzFgS?=
 =?us-ascii?Q?F8wN8JIZj1FVBxETBdRGncq45afyJCfXb8D004jpWUvifCqPSILpnuncfbM3?=
 =?us-ascii?Q?7N5PpN4X3+NKMGDa4iULNOZnkJFtL5exDkWKtYVZgDpMhRUnYqIfi8b83047?=
 =?us-ascii?Q?CPER0ZWLDSuj8oHzm29ak/oAgV2LNCPP0/Mylj03Abl3ccyldSOrwPOkp8pY?=
 =?us-ascii?Q?LjHUz3l4S7Ty1xLj7IG3owTNJG1cc51sqo0wNKUl5ELjZUYI+VvFm556H3NU?=
 =?us-ascii?Q?bMe7FDKCFFYhzBJXhGQAm8merFoYK9IL5UiZBGFmoDTI7LjZD7D3/UWMvxH0?=
 =?us-ascii?Q?T8IXyoAxuG3cYMEL5smRCnoK/52q2mPys41Gsc+td+HhCZ4vVxLz+NGicypr?=
 =?us-ascii?Q?sKYuKpD7AuGbL8YbtgNFr987/p6eNVrq9VtPeRz+zlX1tv6qOSaZcWD1Hyq7?=
 =?us-ascii?Q?wixgRrU/UeteqnS8lELD+Ev0Ly5fhoicrDM+ZCIHirS+402+Lzsj7dxyKRxX?=
 =?us-ascii?Q?ZyP9JKaATLlMDW2nvT6rCISSnkl41JvWbOicORCb/uG/TLJHRnxp92DVshr6?=
 =?us-ascii?Q?bNEb+gsNoZny3MU84OF+8DV3LPZCdk8n4YRCf0X8s/Mqr34O5AV2x2K9gXM9?=
 =?us-ascii?Q?D9ShzbMQWHHPuNYZzeUdDysMKcSt2AHP1pCz3HwRgSdLjwoqKWYxWosjJnj7?=
 =?us-ascii?Q?nj+KEBC5G8ejjYhRzwFWKOLHVkGY93yyHrcWnRkEO8q0hNJkh/K0DrHtVFqI?=
 =?us-ascii?Q?GRAoxONMlS2RTlp+Vzn+Q/WVZ3Dn0mv0HmDhdReJeajNuQ6mEh5fN7navzsr?=
 =?us-ascii?Q?vfw6VLzNQn1Wv8YpPYJ/vN91o8RaeMukINpfOq9U+Fy4ofldMstFGrE5nhfD?=
 =?us-ascii?Q?5U+t0347/sq4rIFo4g7olBtpfUmVMn9MRJye4vmqmi51K6IZyKiF+3heF4Fj?=
 =?us-ascii?Q?rlA+8TUndF4lXtAre+P2lpxElYOBw5QtsJKD9+6qSKlCBty2wjo3sOI8v5Ox?=
 =?us-ascii?Q?YlCN8BptwLzMaLdn9PLBdA2KkEzPQ89G3Q+A9sUBHIVvXsxIwB05ZzfSWlGW?=
 =?us-ascii?Q?3LVDFrJly9G/Ko9sdCQhfoH8qXfWKAbpmmYdu5BUq//EYrbFzSvOb9jYmHWN?=
 =?us-ascii?Q?5/LSRhHVLDamm6z8vlsekyOvP1NbeOPSPGovVlc7ZcCa99k25DgD41VWJRkq?=
 =?us-ascii?Q?UH8uxRnq7Fe/fyRoUXKpbNNh5rAKEWzKadJOxCB0HuvtSs0fn6FuGBbSv8x9?=
 =?us-ascii?Q?tvhUwnyZ/ivPZ4NNChKQSL0ygtMzKICixzYUdIPvRcIW9HIl3gsXDHJ+Emvn?=
 =?us-ascii?Q?KaBDLyORq7Lh3WHoWll1F6ZgOiN5tO76EL4sm9TqgmaR2CmSRlxsX1vAYk1c?=
 =?us-ascii?Q?fzbRWAuYf+4AtxpznSr4X+o=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1a63f9-ab58-4fc2-a675-08d9f43e7496
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2022 06:58:53.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KhSjTk5YKbe0Gi29K/n0RaH3Ow4NQn0p65rnN8tFMvxTSlflSbU/YOfij6uurkXnuwtmdlZXwkwQWq85m2UFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3016
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-20 07:19:41, Laurent Pinchart wrote:
> Hi Abel,
> 
> Do you think we can get this merged in v5.18 ?
> 

Yes. I'm going to apply it tomorrow.

Sorry for the delay.

> On Fri, Feb 11, 2022 at 11:13:11AM +0200, Laurent Pinchart wrote:
> > The IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock derives from the
> > media_mipi_phy1_ref clock and is gated by the shared media clock gate.
> > Its identifier is defined in dt-bindings/clock/imx8mp-clock.h but its
> > definition is missing from the driver. Add it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> >  drivers/clk/imx/clk-imx8mp.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> > index c990ad37882b..f23b92906d3b 100644
> > --- a/drivers/clk/imx/clk-imx8mp.c
> > +++ b/drivers/clk/imx/clk-imx8mp.c
> > @@ -694,6 +694,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
> >  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_pix", ccm_base + 0x45d0, 0, &share_count_media);
> >  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", ccm_base + 0x45d0, 0, &share_count_media);
> >  	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", ccm_base + 0x45d0, 0, &share_count_media);
> > +	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT] = imx_clk_hw_gate2_shared2("media_mipi_phy1_ref_root", "media_mipi_phy1_ref", ccm_base + 0x45d0, 0, &share_count_media);
> >  	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", ccm_base + 0x45d0, 0, &share_count_media);
> >  
> >  	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);
> > 
> 
> -- 
> Regards,
> 
> Laurent Pinchart
