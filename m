Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F68C48BE6
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A8C861370
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbhFNI5d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 04:57:33 -0400
Received: from mail-eopbgr10049.outbound.protection.outlook.com ([40.107.1.49]:12303
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232528AbhFNI5d (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 04:57:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiF8di2GqQUvbz54i4I4KZY2RHSBM+qVZE0luXiQQoj5sFNqAd0il0DDqE/185WaEBxUlkFpYZ1/34g/qrxMx71zYEitXntdEnzAFwOyN/+rJSNpxwZBpiTF1m6/CdfU98Bn66b0+NIVEJu/L4isxKn1zrA69efKArKp/bQyBFZVCoTnvJQkChYIggvaDY6uhaKkiaYTLGp8uTXjeLu8J9FAXSu4NuA83rFhDa/uknB4uFtZrHd+Lt7h3NNbJIsR6hv0DklZh7IUAe6gTYGZdT96WpEhqCXlJNnN7ZaxL4llN40VhST7Eoia8USug0ECg371z2RKM9e+lgNQ53Z9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUvsnuPQBkQDpMrU3EA+erigEeZK1vtlKOXxzuLlT8E=;
 b=ZfjzFgSLk4w6H3KQcyQmgwjd/61/RM/+7DYTLSJr3UwUVq9F6AKIA9fU3CzsgZprjrQWjahkjuzHk5V0/cuTMqF+VFCCdlD7/LLe89SaEvLbuxyyXO96TrEGomZdbhafqbmngpS7HscHuPS11b14NG2Yv2QsufWupVvpFutdr2gWzbvj4Qz7Jo9EbQMxpz3xl6Tz1t9+VzFWN/56jU5ZiwtxjBuiP1uD09/mf5yA+deFEwM/NAs8Eru1139MVXv/7KeqxeBHOm+n2VEzoi6AQywqf8gdkePL+RxH+s/GO0lzsGQxgB1XBdQfWFHkUHParoibg/9YXq+p41dEEQuhEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUvsnuPQBkQDpMrU3EA+erigEeZK1vtlKOXxzuLlT8E=;
 b=WrmglfTxk++Sy3EPjPOv5F20rhglmGolzT3uaw3X/xOOh+Nid+vBF/0vsjKxnaNzuC2uOchDJWv4pWFDD8UN/xuNmsRbkwGivkfTAeLNMb1issZW1EhSy/MoXKrDRNlTd/Ui7agVRMjRSJ1aO4JjhJvsPRm9MYF9SDEWtQOSlWQ=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VE1PR04MB7293.eurprd04.prod.outlook.com (2603:10a6:800:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Mon, 14 Jun
 2021 08:55:29 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 08:55:29 +0000
Date:   Mon, 14 Jun 2021 11:55:27 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, dongas86@gmail.com, shawnguo@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 04/10] clk: imx: scu: detach pd if can't power up
Message-ID: <YMcZf7+BotRQC3iO@ryzen.lan>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
 <20210604090943.3519350-5-aisheng.dong@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604090943.3519350-5-aisheng.dong@nxp.com>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR0602CA0009.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::19) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR0602CA0009.eurprd06.prod.outlook.com (2603:10a6:800:bc::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 08:55:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6952643f-40ac-40a6-de28-08d92f1228bb
X-MS-TrafficTypeDiagnostic: VE1PR04MB7293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7293F41B010802C2DC2B33EDF6319@VE1PR04MB7293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5E1UU4dtFDZhR1J9b0aGLTRLfZkPLaTsMuKyTTF/ptjfJjtKGGxqwRgReVuXze796SnYitXjLPBBe2hTSm1EcPekpyNN4sqcv8Uf7IKTocaiRGHcW6Axo5/2bqfD9R8OBrJRqO9slgMI8B5egn6o7GtZZyM3yVAewnfuBQGPOlVqr8ee9sOzsNYaxxV8tdBRl4sJY8RQpVj+p17LROtxZPkle1WzAvLCW3me8cgc/XORTJhd+sOZ4VuQ8aNBCk4oB6A/RPPjjMHpp8BWn0pGspNpnwdrNnJ5y8GVgdADix6H67oVrV0JhXetAT/01Kn4HPZKTNXLIqnlkDYldqGQPn78pgxcjo/mvePrG7SsB8PycwYZKERL9WQlacN4p7abRK3FQZO2qeJEcExFFylDvjS56JPDTujOVBolgRVkD+wOopOKEmKIJYstUOyrZsVzc5WEUQ0SIQXnW2tTm5pXPC3mr7Zjm9AUX7CX3iG1sCddya0jakNGdhUu8POi4XYqX61fkkrylto7oN/9bdAsRBsvV9wxaqwjDlwSePh6s9nPmivbRn+CKZOLgJjTCesLlCsJ1gEInumt2jNvGwaHptFJbOCY8rlA1iOAdrjLooPek/e4Li4W8z5NKoetv94up0omPW6iRDFUE1eQe2OKsXh9WIiETmuP5L7VJyu2Lh4q2K7vUEkv7RztxxCaQT0h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(8936002)(9686003)(36756003)(316002)(6506007)(38350700002)(8676002)(4326008)(53546011)(6862004)(66476007)(66556008)(38100700002)(66946007)(8886007)(6636002)(5660300002)(86362001)(44832011)(956004)(7696005)(52116002)(2906002)(26005)(186003)(16526019)(4744005)(55016002)(478600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m9HofflL7v30w89KLRIPHguLm9A2IxQ6y4iiEAGd0IsCUDlQyFCid6TQk/rh?=
 =?us-ascii?Q?AhXeL4luezgqP6SvcKhSjYQBTN6IP86x2RAoQ2uRFYJl5EduZeoVFLgxWPbA?=
 =?us-ascii?Q?YGRd7r5Dsx8owujut3AsQLsNgVt3Zfv93I2CrEdLx2k8xHo6+jSB6RFEddA8?=
 =?us-ascii?Q?06HxV9MBNud0ZDTNQr5D1sGHdWZOL9urDPEHDQ8hNvlkoMs7jhScPvMXPBQ7?=
 =?us-ascii?Q?54Rwiign9MjO9o4dZv0r5lFJxMCr9RGoC4DhOMSZivBqxWOG/nH2VWs5veaZ?=
 =?us-ascii?Q?lPlaplhFSnuS5Yd2hogUuemu0SXbTgaiqjPhGEIntoGtEZq1tL56fuRURVeT?=
 =?us-ascii?Q?1/CRPk9SqSx3OrsA0CPNDSRFSBoW4e/JgMBHxrnEkqjFsFRDuxAmgqwpHEYQ?=
 =?us-ascii?Q?WB3E3Zabz/ZxKPIuhvWxjmvxluV/JF6V6tEH680C8OXhSJK7hgAkwrm1A1E9?=
 =?us-ascii?Q?rtShlWtwwRZRbzBy/4/EYDFFq/UBxUC1Su+gJy0hhyzRbREwf8PpzwdYvulK?=
 =?us-ascii?Q?5/wZO1c0B6HwW526egcwiTBNVhySX5K0D/v/l2JWKtmtpzgVhs+fadvxR68m?=
 =?us-ascii?Q?4R+0ep6924zuP4SR86miD6FstHMdbWIbZPtnBADHC5oiFNg2WdegbutNPiS7?=
 =?us-ascii?Q?E46cGmAFQC1k3JL+H4ItrZwHz57ALOYZW20HfzqR4vt7AcGhORPGkYZYaCVE?=
 =?us-ascii?Q?30RhIXLNqFjaemtYCgwZXCyuChYALRs3Q7HRs/vQDQm338+0nsh3AHdR4STO?=
 =?us-ascii?Q?CNfRuViaXlW6K7+ATfg1UfBaE79wUX0qVcYT332X30TN1/Sqwumm3kosF2Dm?=
 =?us-ascii?Q?TQONx2X8aWdNSltR8IsfkeERsWApCwyilEzdOi3HXLQG1XkU+md17U44zx5i?=
 =?us-ascii?Q?Cj26/jOzBLLhG++rnuwxFBoJFXar4E9G1rat7q0rnTYZC6MHsvk8pzPARSQ3?=
 =?us-ascii?Q?6MM+9ouX0qemvKWteZGBTWrRhyCWVUjApO1H94QUdaxNyRfql2E+OkovQGpO?=
 =?us-ascii?Q?akjxPTTcu+s0243aHHRz0r9WjAeIA4mtTihG1F9a7bsQgCqAbzXkRHOgSg+2?=
 =?us-ascii?Q?mSFqYiqBB8U4ViQDW1mPEVJOzx7vOx9Ie8wx3lxRQbSmUA0FVju/f8Wu8c5V?=
 =?us-ascii?Q?45twdkMB3OnuHTdOV90f7X9yqiqEyWmfypSEc1PcSyc4NkhXu5pziIXbIv4E?=
 =?us-ascii?Q?gVznXAv0EfCv2o+K4EC7+RaCUQpq+KrZwpMfM9xKA+b4OP2ABa9FBvD27MHh?=
 =?us-ascii?Q?xnncptQcNuz6J87EWwDV3GSagl1rkEXqnDJpHTqbGmn0Ket+8oQPNfXBALz3?=
 =?us-ascii?Q?kzYaAGBI0QA9PKpxwPv6K187?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6952643f-40ac-40a6-de28-08d92f1228bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 08:55:29.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKp2Ylrgtz9RZyUZAzUQk+A9MLS744PHo2SBkN9pyrUmR3Ohptf4y6UJvWDnr9GrweOP3ii9lOW8czPiHBCJzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7293
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-04 17:09:37, Dong Aisheng wrote:
> detach pd if can't power up as it may be allocated to a differet
> partition.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-scu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index d87a1a1b297e..95fcac7f73b6 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -512,6 +512,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
>  
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret) {
> +		pm_genpd_remove_device(dev);
>  		pm_runtime_disable(dev);
>  		return ret;
>  	}
> -- 
> 2.25.1
> 
