Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53ED0C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 11:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F58864E2F
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 11:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbhBKLec (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 06:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbhBKLbM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 06:31:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5347BC061574
        for <linux-clk@vger.kernel.org>; Thu, 11 Feb 2021 03:30:27 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lAAAw-0004Aj-Dd; Thu, 11 Feb 2021 12:30:22 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lAAAv-00040K-2o; Thu, 11 Feb 2021 12:30:21 +0100
Date:   Thu, 11 Feb 2021 12:30:21 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] soc: xilinx: vcu: fix error check on
 clk_hw_get_parent call
Message-ID: <20210211113021.GE30300@pengutronix.de>
References: <20210211095700.158960-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210211095700.158960-1-colin.king@canonical.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:28:10 up 70 days, 23:55, 108 users,  load average: 0.44, 0.23,
 0.26
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 11 Feb 2021 09:57:00 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for failur on the call to clk_hw_get_parent
> is checking for a null return in the divider pointer instead of
> checking the mux pointer. Fix this.
> 
> Thanks to Michael Tretter for suggesting the correct fix.

Thanks!

> 
> Addresses-Coverity: ("Logically Dead Code")
> Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Check on mux pointer rather than removing deadcode that wasn't
>     actually really dead code.
> 
> ---
>  drivers/clk/xilinx/xlnx_vcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
> index d66b1315114e..256b8c4b9ee4 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -512,7 +512,7 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
>  
>  	mux = clk_hw_get_parent(divider);
>  	clk_hw_unregister_mux(mux);

The mux should be unregistered after the check

> -	if (!divider)
> +	if (!mux)
>  		return;
>  
>  	clk_hw_unregister_divider(divider);

and the divider before the check.

Michael
