Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FD9C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 11:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiBWLbn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 06:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239883AbiBWLbl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 06:31:41 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60087.outbound.protection.outlook.com [40.107.6.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D466790276
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 03:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gb9XaU5lIZl4DSNxs7AObHw06eNy5h28Bq2Z4RxJPWWHid5rCAHMjl8R85HEn+mubdvzfDG+nXtvAie7jPFxIt3sKauBmBbkxYW3MsdNWk/AQVhde6gAG27nR2b8eGsN91aXjWb26TtO5fO0ehGRGYE/WdPrWdCcoPyywpnrYG8aAr2ZUF5QQF81pABlHwgBanlFOETQpyuz0/pMZmrC3bZrI+xT6wdjSddgGRPFn2K/3wimeEJrMRYQVEIXE043xOWD9Hz8KtxieVOqVhU77JHksRlC43YRrLfPPIf0d5l9LnIBXs6gG+TlHYaAv2wiGJVM40GUZleWFsSpzxATPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGmUApu+8cXqXye70wn7dLeC20vsrbqdqIrU6jY4urE=;
 b=h09SKUa/QMSYKoQuULPc2NCFeADaPyKZMIU2nF8DiklmRYB8SoIRqrhZoj4Ab9nMNOQli2UjeTm9sCBd8zkjAkU6Slc1TSgTyF8ADoOZaPH9epQfByitPsU5WOx+gaQDXZEEEw1lQOlr3tsBknLZZt2NGKnnE8CWLz3Wp3EAuGRsp+QWY5xvDjUEcEbkiO6G31vBi0Cn9MGBuP8ppwOm6uHV924BacsR8itx+fQNZnsyx3Ayd8X+4N2ZFdrGRIZJPMlk+N9HPLQ6730w2tqLAkHOwdkDFBi59Hci0qBpFXsXYWzln7jKJVxmvnGOq453F/UVTiyNz/ceBGu3cVIf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGmUApu+8cXqXye70wn7dLeC20vsrbqdqIrU6jY4urE=;
 b=QC5Q9R+IkC/Bi2XCK/ZDK3/vEoIxIRMyDBAmJ3o+4yQCn+9zLDD5fk0RbfErMzrbxFqKQ4Lqu4rv1CcRrH2gZ0+5/mmEpNmhTV0vAEKtHyqmhl8qPdFfwHi745M+ES97d/UAQSZIXUGZyskrNHJp6FxDF5ZOq+lUU2IYVAZIMwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 11:31:11 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f%6]) with mapi id 15.20.4995.026; Wed, 23 Feb 2022
 11:31:11 +0000
Date:   Wed, 23 Feb 2022 13:31:09 +0200
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
Subject: Re: [PATCH 2/8] clk: imx: pll14xx: Fix masking
Message-ID: <YhYa/TWsd9C4ebtX@abelvesa>
References: <20220223075601.3652543-1-s.hauer@pengutronix.de>
 <20220223075601.3652543-3-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223075601.3652543-3-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::36) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb4b151a-db24-4423-4f00-08d9f6bffe20
X-MS-TrafficTypeDiagnostic: VI1PR04MB6894:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB68948C75A1BD3FDE48388DB0F63C9@VI1PR04MB6894.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFWDcJJh0ES59WyEOzD6OYkU1M4i3z3GN49d97ZyzUz45tG5UdZsR/3xFxnG4l3r9rvBkqykb5Xjcwflsk9SOlr6N/UoFfsoXWTU+IlmlEh4IsF68Hsbbi2mWYWfvkaq16tnUjRlm6/eE5kgnxCXejiz0F++T8Dsozqf4vYH+6d1WravoqyeXOmwtpqMpMEldZTGgpiY1Vyh6V/mEZTginhcrOWoPzdWtqvtdUjADAU7eDJPF/SGI7baM18T2X0P/PinuNaUQYwU1HUL22mBbBC7Ri/lWzblqN9HjqJaQcS5lH8LlksAVv45xsSJrIYZIEt3c7sf5t8o+cdp0e+AyR4ODN5QFTWqV/Nj3cajqbXwhQVvDoQmzEuvKDa5GqzjvgWxcFt/lmIATtxTdqnHNj+/fuvT6M936FgnK58Xxi5BdYCyKrXGhcrJPr4SwPI2Ji9aUuyIWD/LKZMC2Ct0Ir3SlCQGV9EAO4l/7Dm/6aNdXurNtwdIpR7H6QO072ArROAH6pYtLHI+kQ9n6hdqsl7mzz1EIJ6bvTcW2DPY/ZwvW8+BFxosbbB5ob0C0QkzakMdezJpvfZsEzx8HDKcbX1TvW3yFyRua4mt0pDEz58oikVK/J58UKFdt2mjeM6FvvPMB76UBFcEhZT+/0Sj/vefKSncDUlx0ZgxS6G55KFUyhXA7HtC5B6n3yIjXYJ0qTljpspn/Wnj7cmXZxQAdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(2906002)(26005)(186003)(44832011)(6512007)(33716001)(9686003)(6506007)(53546011)(52116002)(8936002)(86362001)(8676002)(6916009)(54906003)(4326008)(38100700002)(316002)(5660300002)(38350700002)(6486002)(66476007)(66556008)(66946007)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ui82Un5li5vF/aveOtRtTMQBFGMY3uJoFUmNbtOGjQ54ehL7gwc94fWs23uL?=
 =?us-ascii?Q?4EyjaBLgspH2dmjTLnxDPQWghqgUDa+on6baZJHwmphjMJbjJEqWU3yD9d5P?=
 =?us-ascii?Q?6Ou42AM/oAQgjFuPyccpND5sjWVFG8GVIslbX3YmuglxqPuVMi2NYY3og1kQ?=
 =?us-ascii?Q?QeimPV8l5m5ciQ0ULerno8wUgREtHBlQZzqnptUZZbP6V1iVxjjKhQ0dcC3Z?=
 =?us-ascii?Q?6nBctLmocuHNsnPwxGlRNUJLjqtrcy1PIYjRc8YhtJXJDxopsRpjKFk74cV2?=
 =?us-ascii?Q?Y397n10G06drVWWZFtSR0BVkKwyA2je1c1taQpsejl3Ho8Jugv19U6i1eBGj?=
 =?us-ascii?Q?Ht2jUx016RYlvXe7Wb1OmgNjW+SeGmox68L25HHFJQSMLzlnV9V1+roDLwvG?=
 =?us-ascii?Q?Cva2T/Z7jDnK2Ev9w2fcZkj0N5FoYbvQDezKRg1P2IH2ouFFdCnV3TSEwCoi?=
 =?us-ascii?Q?rwaIlqI49vqxcTtPZQNgfmfZGNdVK7HuT/rubsgyLjEGnUj3UJTkzN6VCXIi?=
 =?us-ascii?Q?WmYufhpp5LlCSkqylJPqyKYAtfuE+BeGmfMcTIlNl+dwRKwlLEapGIVbKj+G?=
 =?us-ascii?Q?MQ8FrurAt9NKJWg/sdtgaHrXZ4MpaLWvFDhSmcApo5Vi9XoDoC2UL/C2ONLT?=
 =?us-ascii?Q?qEeOFJiCLKPnCvYgj2qd16H9QMR+Nwafy9ZY7ynjQ6stmLjpUCn3Z/aoUkkR?=
 =?us-ascii?Q?dYY8W/v1m9NbzbtTe8Swh+M6ZS0TWpejXOk13g3cj2bYWOJKTzg/nclaAer8?=
 =?us-ascii?Q?j6v5oTLuiiGWo5v2GIUU0Z2GW4/3FU0NS2B2c22XtK6oQJHrR1nu+G85bOKq?=
 =?us-ascii?Q?EPgRjSw0lFYSc7Jni6m6HB7+zuwoqqfZFzaE466l+NakeBXgdLLU1di2pyN6?=
 =?us-ascii?Q?xsz225gTc7EUB9iKOYNLks/eE79Xj1t6dyPzwqVvsTeIvZn14nvuVUKtbk6V?=
 =?us-ascii?Q?Hj5DLGlpO0O97kMMnutAeLD8S4NQfTCXq2J8cTTL9HtLtPg7k6C4Cd+VzyzB?=
 =?us-ascii?Q?M0wD5gjfVdbvSEFsZ3chO3xYpwy/o/G4fpUCrx/YDB6JJcVcBySe0EISWLDf?=
 =?us-ascii?Q?n8H9oxKTi8Ef30p8cH4qpZPaz72m+DDyzSJU+IZ1B4kNQKVzqZSMV0VGsRCF?=
 =?us-ascii?Q?yyWqp22aV78PpKjVgv1Vs1ROJ/8xYAsOFc4Gz8LmDYaXKiGa+FP4am0u7eIS?=
 =?us-ascii?Q?ofXChohCP61K+m3AZpZJPCkd+zxn8lnaLFcBugLKhHswhyYY3wxaKCmcouiQ?=
 =?us-ascii?Q?152F3fIck5wmE4cxOrf0N8T/PjmJpoy/fCwmOCRjuWz/G0pJvAByU8+5wNji?=
 =?us-ascii?Q?Rkhokvm0pQLZRiiXftQs3oxvM7xLSylkXHZ/u18FTCGBb3DXHm8eCoTh0KEB?=
 =?us-ascii?Q?yw6rqTkmO9Q0GC+oqMm45vVoyc/26vbmVvvnENqYRSQIKUWjmB9lFivBcA3w?=
 =?us-ascii?Q?BGEwzxZmB+3swfzcJkHJxC/qK8Z4Wv3WsJ23/MA68fb1FYpZcgF1zUvWAnLI?=
 =?us-ascii?Q?23zE8SzLn6eH9ia4F8ESnSBLRS4b9w8CFS8lOij5AwP8+ic/SnhulAhht1yh?=
 =?us-ascii?Q?ZcthxdA9E5LdtKqMtBeGI7QxAgXs7+NmwWTR6MkZrAeFYjPOv/dDiWWmVz8k?=
 =?us-ascii?Q?BuCmw4z3pSJVpFNQu689svo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4b151a-db24-4423-4f00-08d9f6bffe20
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 11:31:11.3446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIsl1EfD0GIDwDhk3V71Py6E8w9y1Py/lXqJg54/Yg75OFuOGxy/tBMI+Ou5dYKmldhBCNj54aPveC58CdI1RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-23 08:55:55, Sascha Hauer wrote:
> The code tries to mask the bits in SDIV_MASK from 'tmp'. SDIV_MASK
> already contains the shifted value, so shifting it again is wrong.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Do we need some fixes tag, maybe?

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-pll14xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index cae64d750672e..b295d8a049009 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -195,7 +195,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
>  	tmp = readl_relaxed(pll->base + DIV_CTL0);
>  
>  	if (!clk_pll14xx_mp_change(rate, tmp)) {
> -		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
> +		tmp &= ~SDIV_MASK;
>  		tmp |= rate->sdiv << SDIV_SHIFT;
>  		writel_relaxed(tmp, pll->base + DIV_CTL0);
>  
> @@ -261,7 +261,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  	tmp = readl_relaxed(pll->base + DIV_CTL0);
>  
>  	if (!clk_pll14xx_mp_change(rate, tmp)) {
> -		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
> +		tmp &= ~SDIV_MASK;
>  		tmp |= rate->sdiv << SDIV_SHIFT;
>  		writel_relaxed(tmp, pll->base + DIV_CTL0);
>  
> -- 
> 2.30.2
>
