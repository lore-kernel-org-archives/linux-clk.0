Return-Path: <SRS0=0ksy=RL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D00EC43381
	for <linux-clk@archiver.kernel.org>; Fri,  8 Mar 2019 15:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EC842133F
	for <linux-clk@archiver.kernel.org>; Fri,  8 Mar 2019 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552057802;
	bh=RaXNKRVGXAmg+J1BjcdrQ+9zXUa+iYb4CqvCVNcKRMo=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=tTUckgNp2701hc4E6wD6jR1QgdjVMHTrQMkkyp6jNR0xgwgCfd35OqKxqMohbu+Lq
	 t/QWRxdSCU3aSGikDZmGVC3mxTku+BU4j/AWlgojcXaP3KAmrcdOpo4g8kQY4ZrGhV
	 4ZPDEqT10TpzvPJ5xIaRXmiezTCLWrs5mmFz4Gco=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfCHPKC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Mar 2019 10:10:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:51220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726800AbfCHPKB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Mar 2019 10:10:01 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B6312087C;
        Fri,  8 Mar 2019 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552057801;
        bh=RaXNKRVGXAmg+J1BjcdrQ+9zXUa+iYb4CqvCVNcKRMo=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=F6eSIoJjVO5Tb7bsbwB0N5rpACV51y8Uk7k5Z+JF1+Zjd7eRy5t+CCRE/rOHpdQeF
         YzUrTz5Jve/t5ru6YPu5V4iIa46aMPIzb0j8TAG2aO6urbvkhSUV++WJSnwVo6xv3I
         vrNHnQRC6fHF/MXyO4YC85uuF3ttqHxv1Ntkez7Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190307201056.59985-1-tony@atomide.com>
References: <20190307201056.59985-1-tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix clkdm_name regression for TI_CLK_CLKCTRL_COMPAT
Cc:     linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Tero Kristo <t-kristo@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tony Lindgren <tony@atomide.com>
Message-ID: <155205780030.20095.17109428111345820798@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 08 Mar 2019 07:10:00 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tony Lindgren (2019-03-07 12:10:56)
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -530,7 +530,7 @@ static void __init _ti_omap4_clkctrl_setup(struct dev=
ice_node *node)
>                  * Create default clkdm name, replace _cm from end of par=
ent
>                  * node name with _clkdm
>                  */
> -               provider->clkdm_name[strlen(provider->clkdm_name) - 5] =
=3D 0;
> +               provider->clkdm_name[strlen(provider->clkdm_name) - 2] =
=3D 0;

Looks right. I must have become confused about what was going on. I
think I'll just apply this to clk-next and send off the PR for the merge
window.

