Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0E7C48BE8
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 288CB6128A
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhFNI7h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 04:59:37 -0400
Received: from mail-eopbgr10085.outbound.protection.outlook.com ([40.107.1.85]:63620
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232528AbhFNI7g (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 04:59:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hylghdNz0VpgXeUVOKNCQVeqEokBtPev3aaUDEnYwhMWIBux8LWEMlKfV5weRyheDlwXipNExQZNvTGT8TVMMbZUXQ0m+763gqgAzwcFwjkLrHTazt1kah/0BH3q+0B1nEabzdk+a/FKA7eY+S/oZjLv4KPIb+B0KEk+3OaUqnZ06Ft/L8lvMHxWn8H13QSpITJfrzaSWF0vIYLKlwaTLUbTgWhpq9dCoFexMMeXBuTg4lgC6ayP2TqKfJ/3g8M84kwzcExrIrSJYxDzlliUnsQOUgNx1wLeWTW5wm1OkXfI7PCpkbpem49/EPUmIXpGDwDu1XtT1y8cRnQA4Yebzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWr8JFFHrBlZNIqj5cx+gLb6Joy5oAPW1qLmf5ygYjk=;
 b=dw+NiLfmueIlMqtTvJdiIRPeO3/g97o7RksT0TfeqqSE24DcN5EW5CAPQZbKL/L5+6FETlwMLGIRlj6LtSd2BAdetyXdeJJzmhbpmlKOooSbDMEztSgP5qoYXPOhFdpn/oeiXmVLF8TgOA+loa5BgutM1LZWLb4VUnzl6SstQy7G2RIpBjOFTMETGsh2c2TkDtdmXTtNLf7ZqTYNJm0qbDfqX3qojad6lR3xsPHyS3xwTaWrCu0ziaBZrFFBKSnu5jnud4qKAxSdMeQJK/+iWUQBPxylFfeWj9esCzN4Gjy2mFN+CxfS43F8GiH3uOso6jyIoWlLZG0XvEnk5ZCJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWr8JFFHrBlZNIqj5cx+gLb6Joy5oAPW1qLmf5ygYjk=;
 b=hGFovxZDH54R2ND5a/QpIVzzzsMtw2ApoX0H/1xmoe96EFga7rJgroMenVcqxVK0ojq62dOXOBFgTdp9wGTqrda+5kTj/rFJEoq5c4Eo4bBnvBQANBBQXO9zOngCIE2HomN91/xy6iUQG8EOFs1LSvrmSBDB+h64y+a3qtZRw64=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VE1PR04MB7293.eurprd04.prod.outlook.com (2603:10a6:800:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Mon, 14 Jun
 2021 08:57:32 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 08:57:32 +0000
Date:   Mon, 14 Jun 2021 11:57:30 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, dongas86@gmail.com, shawnguo@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 05/10] clk: imx: scu: bypass pi_pll enable status restore
Message-ID: <YMcZ+m5s2pcBgbN7@ryzen.lan>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
 <20210604090943.3519350-6-aisheng.dong@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604090943.3519350-6-aisheng.dong@nxp.com>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR0102CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::46) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR0102CA0033.eurprd01.prod.exchangelabs.com (2603:10a6:802::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 08:57:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1685611a-0e25-4f9d-f1ac-08d92f127246
X-MS-TrafficTypeDiagnostic: VE1PR04MB7293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7293EDCBA1325840A3B4C845F6319@VE1PR04MB7293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovF3cM/IkDMYvRFy8fAIXYqCbBr9dNomxaTYb78FV0dzaU3dOdhgi/xP6jOYy+5b1kd/o7fUaWEgp9ojkjF5flxspR1H5I31N2w7LGHw9at9F8bGdP8QTRiCKj81j488F4jtp7BJ5hWH3uuyjikRsCleUJ0vxBxUwo3Gjb+BlE6I2wByaN111RlGvXNWBH5yckgdHiC2QA1O5P/6ECYy7QM9f7rihD/jagevMT93m1aysMVOMeshnSW0xiYBrJNSBZWwImVlVTKwRmBUbNmcYm2dD1RhEFjncVQ6ML16st3y28mQZMxLcVnDGUkNLZPnrr4KKR/9k0znpvjUy4DDbu7ykSWYEtQvN5zxjxfUCOVXNOIVkX9AUoAYipBDxrugde44ObZnEYdBGnKo0WLvx54LXcojf2/U19USeszl4Piaa24iMP2NOQZaYZxM3kVtww+/RreRYgqwhQvzg0KnhJX265kklOS9pEtZ34eh3VJaHHEV9qZ/+496JB1zssJFbr44P12Rbhjuo499dWJAeOfcHYMElAcb+MUl4GClMWaN/W1rsL4jq9mPqyerZxgBFHsSL8eJ7wejiCfavWutXS1vcdUDyfzu7tltEO/y1T6sNMLJdkV+GFw5qQKjjoFEpBLSX1D5SEFiTBghCoN1rlD6anKNmL+tynKJgIaZrhgGzDSzzd4SvbnMahbM8B5O
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(8936002)(9686003)(36756003)(316002)(6506007)(38350700002)(8676002)(4326008)(53546011)(6862004)(66476007)(66556008)(38100700002)(66946007)(83380400001)(8886007)(6636002)(5660300002)(86362001)(44832011)(956004)(7696005)(52116002)(2906002)(26005)(186003)(16526019)(4744005)(55016002)(478600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/isgZzn3kzh+xgNjkEUQUgO85dhLhnUIwgeZ+AK99ntLtaHygz4AtGU52UQ?=
 =?us-ascii?Q?RgnnEzPKXX8R1OnXAA5Y6p36cA859jWMY5wfu9d7X3M0dHAvvOnUG2rCurtG?=
 =?us-ascii?Q?X3Hav7P+wpI5JDv2YUsElOcReJ9BF+7cIraJXmNGqp9uxHbaHfpzyE82VQaH?=
 =?us-ascii?Q?slW5BMmFhgkJwMtL+/0o+pMauoq1KxTjcPmJEsdpfZmg2x/CuXPxD8rpWSAj?=
 =?us-ascii?Q?4flKMTrOvuqNKqamNPcYuUSW101Rd73sPSVNLa5x+nbaRqBduroGAPhH+ofd?=
 =?us-ascii?Q?yUM0FtAVBxvcMzSXII8u6HV35itT+OwPFXeX77lDIc29OfN7isL1KqXXVtvG?=
 =?us-ascii?Q?FPyOP+TU5AAYsgm/jiB/QwdyhqN73VBzDqqRqvOm+rOdVokp3Iaq8vG0N6bk?=
 =?us-ascii?Q?VpbUNn67qN89eTU+LO+CwA8i+v+teDqGWAejAmxoh8LyDk52qtsgxzTyxWFp?=
 =?us-ascii?Q?c+bRF9eyCe0OyjAy2j97BqFP1hy2XZxzpWbNnQd5f02WUQWsEid7Q/+PZTag?=
 =?us-ascii?Q?jzty6Du7p4715xKyhznWZT/k3XHv/kQFVTN8LUkV1B2F/sJGjz9gf9Vn2+k0?=
 =?us-ascii?Q?uyTm/ynvvHiSaqW69g8Sx5tFF+e4vHcLNuWC/7YjgQNChRkhDu8orosjsGaG?=
 =?us-ascii?Q?vRlhSgx3JLCZ/sPvRHBEPPy5poCkGM/YKJBsHyi2l8pDHNGg2WHq4djs+14g?=
 =?us-ascii?Q?IQUqDZxhvAKN8PgQMSFlCKlnYdRDFyS6Y3Yj4j4L8UXOjNv4HS5aLFsZEj8C?=
 =?us-ascii?Q?TQZHOt8iP+xiPZ7Hzhc70aswdZGvHVGWLIVmBMcCh77pF8M11BkmxAVqmb4H?=
 =?us-ascii?Q?kGwcOqQR7d1vKVH2mRIvHNBpT2vbzwTNRhq9iuba4a6IVhRTQXpft8LhnsjC?=
 =?us-ascii?Q?hDPSN95B92U9bnJpiT5GK3xNGaN6ykVDSAwJz1DqAmbnSLNhp5rxu84qv6E9?=
 =?us-ascii?Q?rB1F/VgE/OloT7Vcv8SUqPQ4WAwkF1h479iHkj2F6gyEsOij/Lko54IGCrLX?=
 =?us-ascii?Q?Ng69fPkjpRuWY+k41aOZKa3g2pJlE7BlUJCTsqILznMyyINAlv4QS2l08niX?=
 =?us-ascii?Q?DD7/jZ2bKWB4kEqZwKEGwc4RcWhTmDhNGXtc7QsHAzJ7HIr7G6FgSM3LDg5X?=
 =?us-ascii?Q?tPZcL3VFfQ9/tyQtNjgEgIs7NzoF1OzV1p7sAKYivM5ElFJtO6+72yy8Hau7?=
 =?us-ascii?Q?v9RFdvm2oCuMiFa0Wavd0PxqIb0StTvKdOrssriEMeSV84OK6fv9sfDN5YvP?=
 =?us-ascii?Q?9fquQlNwI+LybUqKtr1cBneAfBJ0eq00mpFKGg2MGlDdVzJGd5GVFpIGikwL?=
 =?us-ascii?Q?/7xh43ZVQI7pYVCQcfw7H+2K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1685611a-0e25-4f9d-f1ac-08d92f127246
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 08:57:32.4663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5pHFdA96Y7BNchLQUk1kR4p1fZxUfe0YZQw81HDaXPSf6FIQjkPIwAAAuqSPexMV03eDLQO1Y/lN465wfiTyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7293
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-04 17:09:38, Dong Aisheng wrote:
> PI PLL does not support enable/disable. So bypass it's
> enable status restore.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-scu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 95fcac7f73b6..2537e68ded16 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -573,7 +573,7 @@ static int __maybe_unused imx_clk_scu_resume(struct device *dev)
>  			!ret ? "success" : "failed");
>  	}
>  
> -	if (clk->is_enabled) {
> +	if (clk->is_enabled && rsrc_id != IMX_SC_R_PI_0_PLL) {
>  		ret = clk_scu_prepare(&clk->hw);
>  		dev_dbg(dev, "restore enabled state %s\n",
>  			!ret ? "success" : "failed");
> -- 
> 2.25.1
> 
