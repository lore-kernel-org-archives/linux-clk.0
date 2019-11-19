Return-Path: <SRS0=V3Jc=ZL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B72CC432C0
	for <linux-clk@archiver.kernel.org>; Tue, 19 Nov 2019 07:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2033222DF
	for <linux-clk@archiver.kernel.org>; Tue, 19 Nov 2019 07:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfKSHJp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Nov 2019 02:09:45 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36035 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfKSHJp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Nov 2019 02:09:45 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iWxdt-00041U-2G; Tue, 19 Nov 2019 08:09:41 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iWxdp-0002Xl-Np; Tue, 19 Nov 2019 08:09:37 +0100
Date:   Tue, 19 Nov 2019 08:09:37 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH] clk: imx8m: Suppress bind attrs
Message-ID: <20191119070937.bcvezx5mwkqqymfo@pengutronix.de>
References: <9f2ac65bab203a943de947465d6534980585e144.1574116045.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f2ac65bab203a943de947465d6534980585e144.1574116045.git.leonard.crestez@nxp.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 19, 2019 at 12:28:16AM +0200, Leonard Crestez wrote:
> The clock drivers on imx8m series are registered as platform devices and
> this opens the possibility of reloading the driver at runtime:
> 
> This doesn't actually work: clocks are never removed and attempting to
> bind again results in registration errors and a crash.
> 
> Fix this by explicitly suppressing bind attrs like several other
> drivers.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> 
> ---
> No cc: stable because because there are likely many other opportunities
> to crash the system by echoing random stuff in sysfs as root.
> 
>  drivers/clk/imx/clk-imx8mm.c | 1 +
>  drivers/clk/imx/clk-imx8mn.c | 1 +
>  drivers/clk/imx/clk-imx8mq.c | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 9246e89bb5fd..3cb75ad4270d 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -619,9 +619,10 @@ MODULE_DEVICE_TABLE(of, imx8mm_clk_of_match);
>  
>  static struct platform_driver imx8mm_clk_driver = {
>  	.probe = imx8mm_clocks_probe,
>  	.driver = {
>  		.name = "imx8mm-ccm",
> +		.suppress_bind_attrs = true,

Maybe add a comment similar to the motivation in the commit log here?
(And of course in the other files, too.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
