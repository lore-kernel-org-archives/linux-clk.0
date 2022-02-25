Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E7DC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 13:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241307AbiBYN2b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 08:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241296AbiBYN22 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 08:28:28 -0500
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30040.outbound.protection.outlook.com [40.107.3.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74ACF1C8846
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 05:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUQKe9mgYSzVTcTs++07RuVI+/RAi+EX1Hck0Iq0KGEWMtihk75qOsb/AlYFwAUEJUn117P1GyVB2PwyJILNdCwoU2qvrqoWnn69XTnVBO1PbSKdFNlhiEevddqreL/jGxglSzQBlBsfWTiXvBzUEZ2hLkWa/RQyAjprecLCAdpFfHUe1u48xDdymWR0f6f1rjVZqufgFS5U9MdzAXzQbXlmcSlF89+Tgpb8TAx7OcfbTqoKp4+nziXeucmQtFLWWH9bMiFFe51eDZ9fJ0nNfqM+R1Mjp8kD4/l5zq9sSJelO9H3qJPdh9A27ND50HrVbVG2FEkbxz9TrcJDwxzdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azZGCT6lFvRF+OAHBcjin7STZrrVgSjqV0anWx7/8U4=;
 b=Gwarlo7Ouy6kr2c5FAUitaVuvldzpa66dF8az6kBdcAwD2X+TWKG+AlYec6n7C4sia+USoTGjYXtZbWdQUOFKMzaaesfWejN9kgvuKnTO7cXewEio43GJMVEPCcNcSaztsvu3838dPxXug3ngTMm8VscvbxiBJIOV/lr8DFcVe/ktOrVCAw3PC0RlNxdEOkfgVEf9frFY5LHw5jIOzF5Scaye4wpcPF5vS2nYLa0rY0Y/6EDrO23JgMfj5j5IF3KfbHu/7ny2eDNhZKd0WzOMESRN0/viQG/CCxT84prlHeCsWHs7pcDM0H26yDgLyQzjRInYE6JTxH8d3LZhtKn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azZGCT6lFvRF+OAHBcjin7STZrrVgSjqV0anWx7/8U4=;
 b=ZgT7O1qLtpChqms6O3DWgQpuJrk1h6UogT5EeCSesvNI7MBets5pQK9b7BmAAYubXVegYBknTILn56BIRUhr09C1rQE63pXR/3qFZKLPgFo3EcrPihMVdAwJMePGL2v0HFewzzVtY3r6x4F4BAMzckGeexslARw/PwNUVLDfrS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AM6PR04MB6661.eurprd04.prod.outlook.com (2603:10a6:20b:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 13:27:53 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 13:27:53 +0000
Date:   Fri, 25 Feb 2022 15:27:52 +0200
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
Subject: Re: [PATCH v2 7/8] clk: imx: pll14xx: Add pr_fmt
Message-ID: <YhjZWOuWh6T2Xkvu@abelvesa>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
 <20220225082937.2746176-8-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225082937.2746176-8-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR04CA0096.eurprd04.prod.outlook.com
 (2603:10a6:803:64::31) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acdfd9ae-6aae-40f0-82da-08d9f862a0bb
X-MS-TrafficTypeDiagnostic: AM6PR04MB6661:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB666180E788DDD2E264F218ABF63E9@AM6PR04MB6661.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LHvY3IKQgNhr/+KVYllL+uewGpKDP/awsMja0ULYZgHJs6NpwqmdotCBZ1ZX6WvHWvhQOWrUn/sFVcs6udjDfeMeVVcGVgUbIRYlnSqTOlQ6OuP651WZNkyaFSuf7Pm39rPRJqUrvc4xn0eIpbFeCwymd/Ak7deubLXT5pmR3QFY9/PHMIgpV/TThwj4kTzZZU96aIps1JHU6AhrN5+ZBynnyo/KEUVHCMLpLg6WhHIIt1mHK6cRmOM4TkarJRVRgCpGJi9T36W1pnvOYP7/LSv20+dj3+RmHNLhIewln6SnjhP73ZLA9++EoYT2xtYhE1553bN9HhtvaqE09h9W2oytpXaHmis/MvMQEbarLW2onh+s2O00aiV15+zErb4ELsy0YeS9cWiZhHl1eGiYjmxOT3bPJsfQnzt7hi2E7/PObzcodxK9g2v99mwejico7Trdq7ctYIgdxNDkhudRUcBaAd83/2X+P1pM+pUfuxhmIBKrW2+uaGWBa+wsjBZrcvYZ7QhV2sbJ+PQcxF2EqMyPlkNbBKCRJR+jhQfr5bn132KDVOqqb53gmXRqnT72UpMwN2GICOiem/6YOI7U1VmFwpid3d9x+vpd6gHedEVVGH64hmcoPbivA9v5mQ4peKwI49s4pxFiqd7mKEL4JUhQepjaKV+P0gikx80a+3Buk1wjZBAl1h3y8Kx/1khy+rlYZ1Zk/LJ7LKIePZ3AHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(6486002)(54906003)(316002)(66946007)(66476007)(66556008)(4326008)(38350700002)(38100700002)(6512007)(8676002)(33716001)(86362001)(508600001)(8936002)(186003)(44832011)(6506007)(53546011)(52116002)(9686003)(83380400001)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t1YUoGDUO3xz20hJXlJNNQEDrVZ7mPYcEndF6jw7tJaFHfqKKyqSFjdcDno2?=
 =?us-ascii?Q?4I4wP8DyQgUsv9cznpGdXuYBd+4KNXTDkabHOh/st6e7oBCU/ioxFJ09uUAj?=
 =?us-ascii?Q?TZiCBjrenB13nff6i6M326odhyICr5Ip0EpISNstMfInafZG+LgLAbWwsIxD?=
 =?us-ascii?Q?YjSfODxCf5X4gih9ffK9T4Ve6JQUjNMvdmQJnySnOvIkFsrUu/gXnYKZ5y8m?=
 =?us-ascii?Q?oE/2drzNKLx6R7MaAC2eezXNeZzOlvmkoND55+u2fkvuJJrTvSj4eErs4ZC7?=
 =?us-ascii?Q?uRd4t6DiLQXC+Ancu5d15qvVRclEr1awyJ+T9wB8ul74+z4wRRLHJS7LNKBk?=
 =?us-ascii?Q?Y1BquOqkucMfMmHX9MEwgLRIhAhcSOHVomQrKTpYOBfX6rrEbvty+PpQuygS?=
 =?us-ascii?Q?m4jJ3TNrQ0OJB4uLdmETLN1wLPFuVlvx/AibYTlLWj8P7Tsv8R+40EveJjKi?=
 =?us-ascii?Q?6iGECK5xWcyO+9PKDOyAZdqX3v0FgmAsoWTffRg71EmaVxWfzaG6XFx7QY1n?=
 =?us-ascii?Q?koilGWVaGKzcrnSIBbGxFiuz6cmzq5yhFUwWapD22vIOSoiF6VyZOBmPbWTJ?=
 =?us-ascii?Q?D1OGdEbk1iY1tZU/yEomoHXaRWR4+ZkkLKUw53YGgT9+XkVuBvwYMFr2co5A?=
 =?us-ascii?Q?AUoi5hlRZ21oZfFmDCTaosIGCZMKFEabBmxknCv61s/8BhOxa+aYIquDM528?=
 =?us-ascii?Q?2avhOlArpXoOMLTzFZxlPkNP2MWmnLrh7k94lXpn9kyxIfjrccHmxFrOBPXm?=
 =?us-ascii?Q?3mKOifDpO66K1I5IKjfUgP4Wp4UA/4bl1M6WJ9LmzdoqaW1ahhufxECaf/kY?=
 =?us-ascii?Q?3/TRgFUHARjFy5gH3RYRtSDQoUwURd3BhhYflaEpx6rzs1dsYjiK6O1s8Uj5?=
 =?us-ascii?Q?PUJxPtsWX/oACc2PH6ils2xByjaSJr3cu08vB5JuzuZiC2z2rY1i8aBeEDgN?=
 =?us-ascii?Q?NNaCTnPbTlNoLNM1/8sG6rlkfDkerWcDNsQY6USMRUfYSDct2PpLXZ3++g97?=
 =?us-ascii?Q?FI/zn+x/6qATeW2hfFTx1TTBAXZcmukWzx9pvmBFR/P39H+/9EiRP09rNt9V?=
 =?us-ascii?Q?znEa5a3Xo5HHCJFGnCo57MOkSxu9BIKOWkNMdrEFuKQD5WVc9MluLrtFeKLL?=
 =?us-ascii?Q?YdaqwDxJjcH3QLxlE84DRf0Eqd+dAVIsZoi3C9ATDaQrkPNLLHpi8Utm72s6?=
 =?us-ascii?Q?kF2F0FAJANNxFAn/opPVKG/aqGqTF4a5zdSenUZmYAH0l6xhOliEAFJ3vE7f?=
 =?us-ascii?Q?fg6h7NFqx+he64yTTPjGS7/fmvArkyJuvdlY6w1YlCG6wDCFAIAqAMZxwJkA?=
 =?us-ascii?Q?ygiALQyFzTdY10+H+kCPyUeClkS/UBTVZPaSS3iAgNZFzDGRlgvia12HnyUp?=
 =?us-ascii?Q?bNz7t5R4QUPAti5bNe93dXkt2WzpCnxP8stqGG1xAUMeIv09ShxaxlsHRl3r?=
 =?us-ascii?Q?mRzJ7ZTcfpkSbQJkLmfhbySZhkahVe3Ap+6MR9Z3ZnXs67OpjGRuVVAD3e9U?=
 =?us-ascii?Q?aAwsSd0gKJLqoph9BsL3H0zGrurOk/7bBJnyqWLoa6ViZCzkQzS0r5gqQZVK?=
 =?us-ascii?Q?hQ7L3PRV+4iMpUjzHil9GvaB/IUlFZjphfaRQELPVksapidN4aiPEz6Pb6qT?=
 =?us-ascii?Q?lXZxuG1W83bCoxmJB+/WrDM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdfd9ae-6aae-40f0-82da-08d9f862a0bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 13:27:53.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p7dBnF624mTHNSTZv+SK/93IufJ01KJssyD/gXmHryHtLKF2NCBOkHZU8zVIqa5/ZN7MKHV/PZqS3F92yAB/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6661
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-25 09:29:36, Sascha Hauer wrote:
> Print all messages from within the pll14xx driver with a common
> prefix using pr_fmt. No need to print function names anymore, so
> drop them from the messages.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
> 
> Notes:
>     Changes since v1:
>     - Drop __func__ argument for which the %s was removed
> 
>  drivers/clk/imx/clk-pll14xx.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index af4c979e70a64..646e0ce7d6242 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -3,6 +3,8 @@
>   * Copyright 2017-2018 NXP.
>   */
>  
> +#define pr_fmt(fmt) "pll14xx: " fmt
> +
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
> @@ -177,8 +179,8 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	rate = imx_get_pll_settings(pll, drate);
>  	if (!rate) {
> -		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
> -		       drate, clk_hw_get_name(hw));
> +		pr_err("Invalid rate %lu for pll clk %s\n", drate,
> +		       clk_hw_get_name(hw));
>  		return -EINVAL;
>  	}
>  
> @@ -404,8 +406,7 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
>  		init.ops = &clk_pll1443x_ops;
>  		break;
>  	default:
> -		pr_err("%s: Unknown pll type for pll clk %s\n",
> -		       __func__, name);
> +		pr_err("Unknown pll type for pll clk %s\n", name);
>  		kfree(pll);
>  		return ERR_PTR(-EINVAL);
>  	}
> @@ -424,8 +425,7 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
>  
>  	ret = clk_hw_register(dev, hw);
>  	if (ret) {
> -		pr_err("%s: failed to register pll %s %d\n",
> -			__func__, name, ret);
> +		pr_err("failed to register pll %s %d\n", name, ret);
>  		kfree(pll);
>  		return ERR_PTR(ret);
>  	}
> -- 
> 2.30.2
>
