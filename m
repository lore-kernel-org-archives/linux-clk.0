Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2EDC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 21 Feb 2022 11:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349275AbiBUL1p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Feb 2022 06:27:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356207AbiBUL1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 06:27:07 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB607C14
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 03:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bx2eNIR1/PuLQyR42cgL6y5pkJVCEzcBiIhQINkOE5XypImlbg3pIksDjiUqHx7G2m00XNwihS7cjdMJpj7ZfOzEvA4hmZXTaqhQICxcn8h0DBikhNjU0J1CYgQcjCb3MMC2C8pKn9Sz8GuzAd37YIdRpHqZnlCzIBadr0hATwuNS0PM02HLkmY3uUWD9dNVwr8qt/DtSJkBPdNtVAh0G5a48V+3k1iDt+cuEtM/pZq5zwKRVRLjeuFLfnmYT+PoOn0/Pc7WZmzVpxkdqK2b+8FOuvfA8CayT0cNjRM8meYNhl9laZRspvIeg3usmC8ZNd3GiTARuqfO7sX0iILCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qyv2hvRe0OeR7UGBkDezI4jKTp6+kwpzoGc2m6gkpc=;
 b=nLfkYC7vWyo3f3UZ2iYfOWUAieHqKvT5wJTiEFU4BV9zL9GFt7KUFq7RQyht9r1ySIPmL8aICkhbgtOEHZfqcLYLw+dJG1Q0aTZvym7839ZoCvK0gBaSaApU+OLEnoxv5mt9tN1fHerZ+N8QCYlhNQYWGzayj/dCdJt1iFpahOv5rCNC5NW4vdBJBBdsXqEtrWM5JlEps5bMXozeup1cEU5LhshxHCPKzK4P1BRoGsh3n8NOjkAuf8ie2GXUrJjY+1PM16QSfsmcYKNpq00M+7rf+RnmImHrbcMxnQ6vwz6S6C2bUIGblYTIEvl5icmP4AlxXppe0K+RHOkqjy/EWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qyv2hvRe0OeR7UGBkDezI4jKTp6+kwpzoGc2m6gkpc=;
 b=I9/0ldSV6ZQA+NJ3/G1HaJymga5/g7u3FPRycXat9hFjl6FQLJ8JP+7m9E3AMaEiKLdwiUIurmNOz4+OMEY079uB+bANAyo3whwauY+mDxAW6B9sm6rKSGh14TOXCsQPTls0lOIEBmPxXZhRV1VOTn5PWLcXf/tIM+Cg8efeXj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AS8PR04MB8309.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Mon, 21 Feb
 2022 11:25:33 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f%6]) with mapi id 15.20.4995.026; Mon, 21 Feb 2022
 11:25:33 +0000
Date:   Mon, 21 Feb 2022 13:25:31 +0200
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
Message-ID: <YhN2q760tLTossu5@abelvesa>
References: <20220211091311.28146-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211091311.28146-1-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: VI1PR04CA0046.eurprd04.prod.outlook.com
 (2603:10a6:802:2::17) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d99cec37-49ec-4b84-9c9a-08d9f52cdfda
X-MS-TrafficTypeDiagnostic: AS8PR04MB8309:EE_
X-Microsoft-Antispam-PRVS: <AS8PR04MB8309F14751136FE4E55A19B4F63A9@AS8PR04MB8309.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mr9krles2m9UVzp5xwvQpr3ukA5Swghm0AaA9L084jurcwicaVY0pXpvcoB82+XQz8sKfUsrNRuPbxpv5WyJVWDbi3Nbt3xecEKpUrQRqOMuw5Cw2s8e8YO7AfkPml+I+8htUYmYoasCwq8sWlgmsk6QVfiGK+pajKal94SvDJMtuaD4ubvjMG57R/nrl5u+tHUJMuBeEpe0rQocws3p7calPMVh0u0b59/5lOItR+TjqRp1mP089aTOirbJ0+gJhJJz0WA/vf/GvLi1a7MkhqkfQ0iSWv5QWebimJDm7xXAIxWwBBRKGEobPlOunft5sRxzDkeOiWIsZy5oNyM3uoedBeI0F/LwtMxJakggNzq5KGoqeepDJSb6iiAsdnUYP0xTb6EwrVm5rhvZ4cBhTtZmonq3mR6LWsIjPY12Xpb3z9Aq3UPYzdF9YaVeToxtmTMmozxyL29xD+PNZ/UtXhnx524RPVU+k5zwc6bXow6G66H26FBly8Pz8x8YmYrBDevQqYyg7Hj1dHrLP+84iaoVe4LgaVFDM8tCnJ3lxgc1CALinDFJgjgGTraPgINsKM7Celfo0qdnZs/UxVnmNF6I66OWBsWSrjEbFTwEu8EzmTyvlWHZcTEnqEe8QlR4jj1W0n6tsR6YH6TpZZYp5BvUjqx1nRyDbFK4DBdBY31whciVtHDL9CVpheX6wsUalAsRsj1t2cUS1CumEMOk2wCFF8yKDgi4cPSnlcNfIMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(6506007)(9686003)(53546011)(52116002)(508600001)(5660300002)(38100700002)(8936002)(44832011)(38350700002)(2906002)(186003)(66556008)(86362001)(4326008)(8676002)(54906003)(6486002)(33716001)(83380400001)(316002)(66946007)(66476007)(6916009)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nWvx3Kos7cBlwXAlz2lrrSGOB9yRm6WDEP9nvQipRPa7es0B+ojtyBzrqXQW?=
 =?us-ascii?Q?10MXcWa8rCQYHfp3m+k7Wm0m2uPYG05M7ZY+R7GhztGbDs6KzKkSDJGnIrsf?=
 =?us-ascii?Q?DHtDq0yzl6rB6oQG8sfBx6bwIax8VzDJmsg6jvDF7+e/Xw9uYKU0icdX4DYP?=
 =?us-ascii?Q?I2ySTWGhA3XcM8UHF4EYciPQw9ZCBFMNS56ESmJj2Y08cmYEVFR7ffAHKg4T?=
 =?us-ascii?Q?+mRDGnq3/TtSFwXahWwUv9FojCWMdtDAa1YR2L5DKYPfvjcHjdpdqll4oYZu?=
 =?us-ascii?Q?gRvNAYh+4DgvnRoxrOfBslE99IV5AHM+r+rMN+w/rVZIzvFjg8G/NlmXEoGK?=
 =?us-ascii?Q?wqS2CJR4vEv7swe+j+5D1ueCBJnLeaptqrcAbCzKvNA0Nf8xih5LaYVmqEPv?=
 =?us-ascii?Q?dlMgAhhOSKGPpNrFy4daQI6N2vTHlF8z2VmIB72TXlNWrexiRP/uPycCAOHQ?=
 =?us-ascii?Q?1TA6fqmdbl5v90e6l/swDiR70xy3oQm0hYS3ZHofTXFvZ4h2zB9A71QwHtHv?=
 =?us-ascii?Q?NRUUfTaOF0lobWx7oIeHetqd4oHyGho6aUqH/G2zV7JA+eP04KTZYuu/5bVR?=
 =?us-ascii?Q?9ey7OkTrJbozXcQl6Kg89rY/dRSpDq+h49vAAywkGe4bm1hWhzdnyxjHx+b5?=
 =?us-ascii?Q?iqvo1qOat0sCrLTYYH8XMOSfvuPiUWuZqn2bBzwSgtkC7RD5iS+CdqypGoC8?=
 =?us-ascii?Q?ovNhDgm690qjg5nEakCsbbQZOQWAlGtg7jxdHC/rRyvs4wg0ThsxiD8Za8dF?=
 =?us-ascii?Q?Kux6yhX5Znsuvd/Hu7nSaU+H82BebTXdQeX49CoSAsjKP+INymqKvltyDVVn?=
 =?us-ascii?Q?v6KUzB/q7ZKqP0S5r2vy+v5zvYzJ2g0DVsnTSwrrjujarzp/5Se346Aj5C4Y?=
 =?us-ascii?Q?jZqxRkvZ8VC7uj1yuKFvaEsCUW2KhJ7Pm1rG/iFO7eVnIIiwVvqtiN0U0W/S?=
 =?us-ascii?Q?mpXcRpRiw+CrADubSYJSRaE/U5fmnXKHSrpRdl8IqgQ7M7tbbIs7RVmToV4E?=
 =?us-ascii?Q?d2YltKIHT4yDuyAvUolop/WHO9hc7/lBO3RVC2SZ6Rv3sZPzJwS71tmT6Cml?=
 =?us-ascii?Q?xknKuBPYINCrhYWM3TVPp1xXt2HCtnqmzH/4xjILCNugpB0+KikIty9UMj47?=
 =?us-ascii?Q?UilosHDuOJ1i883fbXYFI2lb4Kk89HcP6qSEIEBZ49Ve7eNJ0SVDOyMq0ey+?=
 =?us-ascii?Q?Y3ncDaIZ40mQXKK/8L3y41c1v+jmsgN4kCZbDZg//+fVI5WtavnGeHzEQoxF?=
 =?us-ascii?Q?+2j1WwAc1A81jOaJHF5hAObb/MsqEf6UOdHO4oXtSOEOxnON9EB3hzQNsInE?=
 =?us-ascii?Q?t8J57b04qVHVMFVxXgAOfKL5XagClPFMLwJFQ8qA+fW8MsGw0cdIHSDp3Kaf?=
 =?us-ascii?Q?j9wsKRplLYBb8VaH+9zpN503aELFMX8JBZLxeDrpH9mTzJys8GLQ7VL03bq7?=
 =?us-ascii?Q?uhprhTdix8sFI9MZzGDx5EFp0jXdkZm9nxEUD8wSukj3cUvCre6uhnDZqZ34?=
 =?us-ascii?Q?E7+Sm7PQX6sEtx3qJwP5lplFV5GHYmoCrzT8G8D28VeW8a6PNM4SLXgCJUIh?=
 =?us-ascii?Q?10Zfoi2A5906Mo1tqRi6D7HvvUtsPhCjFHchbXrF4YNipzp5E46UWNTARM7R?=
 =?us-ascii?Q?mbcZVezMnnSWQALTGpIrnvo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99cec37-49ec-4b84-9c9a-08d9f52cdfda
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 11:25:33.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeGuhQNUcW4jV3zCFQcdkMbvOFSliX951LnXZwTVqx8YugIBrYuF7o93yztcNIgUUVnLGtcSJDMFPReH4xmb6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8309
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-11 11:13:11, Laurent Pinchart wrote:
> The IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock derives from the
> media_mipi_phy1_ref clock and is gated by the shared media clock gate.
> Its identifier is defined in dt-bindings/clock/imx8mp-clock.h but its
> definition is missing from the driver. Add it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks.

> ---
>  drivers/clk/imx/clk-imx8mp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index c990ad37882b..f23b92906d3b 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -694,6 +694,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_pix", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", ccm_base + 0x45d0, 0, &share_count_media);
> +	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT] = imx_clk_hw_gate2_shared2("media_mipi_phy1_ref_root", "media_mipi_phy1_ref", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", ccm_base + 0x45d0, 0, &share_count_media);
>  
>  	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);
> -- 
> Regards,
> 
> Laurent Pinchart
>
