Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E671C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 12:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbiB1MHH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 07:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiB1MHG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 07:07:06 -0500
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40083.outbound.protection.outlook.com [40.107.4.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC60427D8;
        Mon, 28 Feb 2022 04:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCwpnctVU0HvrhWakx9PCzug7NpzzLxgORHwEmP8V23q4qDwK/duY1YUiNMDxdsN5NsUgAwSXVkO5hXncmMG8cxwWdpSa/03mYXV0Vpf1sCK8yEy5QMFG4PXzWvwU4LNT48OyxNRzFp3zMuFztUEqR8jQ14s9xEMFOsoMeJVI9Aa5iP0B6U7nz2iXGiIc3TENTwVpYVKUzJqMyrpzMMaGoogqfeX6q8r5a/MuIxtAjm/2Oz7FrmTK0bBUtWjP7z0B+4hzTl/HLbOiScQ27A4Nw2CcVRftyV7uZ4BfTI0EqCabczOHdcHM1KCx0yTqUq+K+vaAZej+1qcrrliQB/aPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe4ZaBoNevK22o7Us2V3TaLUT9CJArzhZtJ51FybxsQ=;
 b=MhIjUaP/Sk+xOg8XUHrtOsOpdLzGoqcPdIJ+Z1CPU3dCab/ns/8/mhsMmiQvoiIZGyTJBB0klgaq5kVDEJ/ZRufClN8CJ6yZUHJ8I+Ee4Xhze6oDOk6sp9cbh6+YDGZ/3A+fpXLWcs9WtLl2s7lOeQfgSkZaYUMFlKl6wfcOmN21hVjp2ILzimxYlWk0MxfsJCzufBcqY4K12FZ4Hy3kh2ifGj1CwS6fLc6gQ7YFSHGxkJV5+SayeLa/ycptieyKM3wuUQ2YeZfn9pposqWvAMTRW+l0PG/RRIZGpbDi5UZa2V/zqxjNZ9yAqwKZsREv0U9W+OyjBM3MFcnwC9DnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe4ZaBoNevK22o7Us2V3TaLUT9CJArzhZtJ51FybxsQ=;
 b=oTyxvBWPvCXJ2KtMRngLDgUbjrqbLCk8v3+lriApOwzDu7jaAveeCKrtchZGdKHvVTAmRTjE0uKubbjI8x9ujOFkSDzHET3ypbb8b3Fa5fHL9DXVclABDLp98q6lDPzTJuR/dZJH/BJP42FWeriLI7h3UCvR2U+DPldz48Hy2Vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AM9PR04MB8619.eurprd04.prod.outlook.com (2603:10a6:20b:43a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 12:06:25 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e%5]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 12:06:25 +0000
Date:   Mon, 28 Feb 2022 14:06:23 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: imx: off by one in imx_lpcg_parse_clks_from_dt()
Message-ID: <Yhy6v4UlzkpnMnTn@abelvesa>
References: <20220228075014.GD13685@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228075014.GD13685@kili>
X-ClientProxiedBy: VI1PR07CA0148.eurprd07.prod.outlook.com
 (2603:10a6:802:16::35) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5289ba65-576e-45df-5aea-08d9fab2be59
X-MS-TrafficTypeDiagnostic: AM9PR04MB8619:EE_
X-Microsoft-Antispam-PRVS: <AM9PR04MB86198B033651A1FC48DC8866F6019@AM9PR04MB8619.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8gg40HwkGtDF5/WgDq1ycHSxjCZ/S+hQat98MtiX8d4LUb4aWVt4DEkm+cWbC2DkB9rBgjK7JbPM3RvIuCOMaTWNV9wSuD07ev0P32xfig7ou0+PZCaE/zZ9DoXqN6fwl/jNOvhj6GtqPDWua8qqFMaMae8yE99OiHrCOw0ma/JA/Hl1mih08cZqO0EbjOhe5fJFoVGnbRIyMaXSvWjknzovwBuZZgrNXBdFyu9P8RBev/M6fppfmzHp/2Hx40ZUqytm21TX5hHYc5Hv3mHmQ24ko2YEXBD4mwKRH2Uzp9iDRta2m5tLcTFg4IIU+Ybp1WRcX6gPKgRLl0V1d2jQU84KVxh4jGUiuof1Ic8RgB7NAboBAI80Z8h1mWrdkLCGbcqnYe8gDS+a/X9mTs9Cf+r9JsLKLfpH7z+T9rxffyBx8/KbrJbD0iqFUaw+tBkvvLQrMR/Ltz12vH9SGCXPPGy2mzZGp1YSXfSyVq4k9P82Dm4Rh3l3qtLulmN6JSPo1iSOj+XYR1Gk+MAXYaQb1yVZjuUNio4Pc0f7TQD65mD2Jnp5micGo22/p2axKT9gWb84lGGu8ExASS5L68SnW1Ba1G/XxxRXySHfOwsp+FAd4pDrTMy3Q0ZO7kh7e0xUOrsEeF+SPgrKNT5TEIZKj8HsTQ4VBxaIg+2zJ/+Z/l36ra9SCvSE+/PEn55rqF9hUMuyxMye/HmN8YA9U5W2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(316002)(8936002)(2906002)(52116002)(83380400001)(53546011)(38350700002)(9686003)(4744005)(6512007)(508600001)(6916009)(44832011)(186003)(26005)(54906003)(86362001)(5660300002)(33716001)(4326008)(6486002)(8676002)(66946007)(66556008)(66476007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hshPBj5dTjDCPYSFcxCrtx/5Ux9zllatrqzWVe/tdiLDeRuSu1LgVyGBaU9F?=
 =?us-ascii?Q?9rJ8yXwaWSrIPisUgIuOgUnLQZ3Uafx/nA0x6gyawrc4w3j7r/TogLzrduQz?=
 =?us-ascii?Q?9pSdIu7zIRlnoEeK679KzCOU/p3J5ruAEJDqTEt2pNgYksKppyvajDeM7CG4?=
 =?us-ascii?Q?m8DZnxmvty1gqM1orTGBHA6hEba1sIWED3R8skOuDw26mKsWjTNY2L6s8oLu?=
 =?us-ascii?Q?beli8mYN2yHrXOEmDNfpPYm7/fYqkArqqSKJ4aOw6KY88qx0ffZTwj/D9Ghc?=
 =?us-ascii?Q?InSJbF/H7HZPtLL+TnRm/QbFA+hAe87+lJqrrEuG6u4JoTgEJI1rZfwAqFNm?=
 =?us-ascii?Q?C7BeiyZGPptRyYACt4yGolWdA3l6S02LcFh64ErV+d9VNwxeClaamKlpZ1Is?=
 =?us-ascii?Q?Nr73dKKQBkZ+YYzQ188QrWSKBJ3/nqjp/xnz6WIH7smWSuLKtUZuXQWMigE2?=
 =?us-ascii?Q?1j5DMV4+bz2dcnULKHj4RddU4Pcv70bexDTKCqZVtCQlm3lfHAoFEMdQ/Lcp?=
 =?us-ascii?Q?neBtiJCqsAGmN6zPk+5t4U+J2LOCY0C0wSo+vFvwg4iWTJe9BLV/4RVd6qIT?=
 =?us-ascii?Q?p19J5xX6ndQyJUlLidj0MAfgSh9z9GRq/B/O+NSOU7Sly71EyJ1JSp9U6F22?=
 =?us-ascii?Q?0YflQmRIbUe2K/mQ7TnO47cZYG5pQrGVQQtsw1PyT0keXvX4JN4nfTnuuoP+?=
 =?us-ascii?Q?t0BO2FsUm1BRfsJ2Pfqjnp5Y3h8zWClN0YaVK9xy2n8JOynAymR8y5tR1PAV?=
 =?us-ascii?Q?ZWrrBg+4gzN7NBIv9ksKWu+2DtMt45kVSW0yRovIVUJL3nMLNC6iYqBgNrPK?=
 =?us-ascii?Q?+z80TavqttbZDeiI0Mr4eNf4hxVH+k8L4bWMzDPMVS/14wU8IGEv4O6QJM1+?=
 =?us-ascii?Q?3Hk6uqSMlc/gXWKM/+09ll46+cdLX7ShGT+PnaFgkm1Gxz+mlUWzF5za5F1I?=
 =?us-ascii?Q?vs2JnUqNr3RGYLU+5TGH28zxGvo7UD89UQUUhM8kvj1/fgzrcFZFlhZ3YeMD?=
 =?us-ascii?Q?pC0oU8x98I7t4lwpLNpZL39l1rlS2a0QsWUBb8CEK/X3VKtT4/2Q58VL/GLf?=
 =?us-ascii?Q?16APoSNHr8Caz10aebXJ+2eBJb37fiY31NQgnJI/W74DpZ8V8GplNyQiEUAv?=
 =?us-ascii?Q?jV+8FojzQQYruChv3CK/fE7c/heDVmVEN2NpVEfHYmGcYPwhSnLVrvyjuE2Z?=
 =?us-ascii?Q?NDFhJKcOFMSSNFgkXqjw4KIT23d+/5NXCy8CLGREPj44GT/uyqPowuKLvc7D?=
 =?us-ascii?Q?Cf9vId0ej0Wr94A1HDoWWzu8VyXNesBT+O956DX6yiqZzt7ovDyHIlJuxxbI?=
 =?us-ascii?Q?2mMjCSaB+MkUumSY5U6ibwNgK2xtEOWD/flaaRZ2h4tqI9Nzgjdi0e+FUC63?=
 =?us-ascii?Q?Cr3hpgu9QUzU2vi0Wo95R77tyuv8szs2E/0VxLWNPXq12ZEEPCGamitPQWVU?=
 =?us-ascii?Q?JNeD3mKkySNCVqLWsqPV0GyLNG6E78tuPkH0PLEoHQONqesAX8aKpUKeq4HG?=
 =?us-ascii?Q?Obs6BbbMC4ZteMS43PW5RzkMF9l2QgGzHTScpH4B1kghWS/kkBb1mMqpcxPS?=
 =?us-ascii?Q?T7NQKwYs/1+itSm9trjI3fIWOedXdehicXvZ5gQvY7TV55WLhgc3N7PE11YX?=
 =?us-ascii?Q?zgd9Qzogb6qmy6HW8tsB5V0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5289ba65-576e-45df-5aea-08d9fab2be59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 12:06:25.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+BQeIajjZli5KEXjjwOXJV4kMh2FEhAutiw36HYw1n1mx3u7SlaCsk8BPsQKZ25z/Ry4W/BAGxWqWvFUHk67A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8619
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-28 10:50:14, Dan Carpenter wrote:
> The > needs to be >= to prevent an off by one access.
> 
> Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!

> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index b23758083ce5..5e31a6a24b3a 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -248,7 +248,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  
>  	for (i = 0; i < count; i++) {
>  		idx = bit_offset[i] / 4;
> -		if (idx > IMX_LPCG_MAX_CLKS) {
> +		if (idx >= IMX_LPCG_MAX_CLKS) {
>  			dev_warn(&pdev->dev, "invalid bit offset of clock %d\n",
>  				 i);
>  			ret = -EINVAL;
> -- 
> 2.20.1
>
