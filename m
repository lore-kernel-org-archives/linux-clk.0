Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48856C04EBA
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 12:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F40EB205C9
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 12:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u+Ia7Evd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F40EB205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbeK2XdV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 18:33:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39682 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbeK2XdV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 18:33:21 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233F955A;
        Thu, 29 Nov 2018 13:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1543494487;
        bh=9Fp9X18OtgDszj2atmi7uHJQMO7smHHSSuGu3yopJ1o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u+Ia7EvdFnFT6cXqexD/Ie6omVdzRQYx8PaRF/sZ/SRvm3m9YShVOO9zUKqiiVVW+
         mqQkMhCOuTVJIwCnOST1o9TRcyVoYQwTltuoCh2Kw5Gdc2fIYxf8Iq6/xwwksEH+LG
         bsiL1x7VEvMyUav7eORBf7wqbbEKgEj78QS4XXSU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/13] clk: renesas: r8a77995: Correct parent clock of DU
Date:   Thu, 29 Nov 2018 14:28:35 +0200
Message-ID: <2350048.0LZWSkXjt6@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <20181129105008.10239-10-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be> <20181129105008.10239-10-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thursday, 29 November 2018 12:50:04 EET Geert Uytterhoeven wrote:
> According to the R-Car Gen3 Hardware Manual Rev 1.00, the parent clock
> of the DU module clocks on R-Car D3 is S1D1.
> 
> Fixes: d71e851d82c6cfe5 ("clk: renesas: cpg-mssr: Add R8A77995 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The patch has no effect on the DU operation as the rcar-du driver hardcodes a 
different clock source for the dot clock. However, after hacking the driver to 
hardcode usage of this clock, operation off the LVDS output is improved. I 
thus believe this change to be correct in addition to not having any effect 
with the current mainline code :-)

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/clk/renesas/r8a77995-cpg-mssr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> b/drivers/clk/renesas/r8a77995-cpg-mssr.c index
> 47e60e3dbe05ff18..ad95dc225e9c039a 100644
> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -146,8 +146,8 @@ static const struct mssr_mod_clk r8a77995_mod_clks[]
> __initconst = { DEF_MOD("vspbs",		 627,	R8A77995_CLK_S0D1),
>  	DEF_MOD("ehci0",		 703,	R8A77995_CLK_S3D2),
>  	DEF_MOD("hsusb",		 704,	R8A77995_CLK_S3D2),
> -	DEF_MOD("du1",			 723,	R8A77995_CLK_S2D1),
> -	DEF_MOD("du0",			 724,	R8A77995_CLK_S2D1),
> +	DEF_MOD("du1",			 723,	R8A77995_CLK_S1D1),
> +	DEF_MOD("du0",			 724,	R8A77995_CLK_S1D1),
>  	DEF_MOD("lvds",			 727,	R8A77995_CLK_S2D1),
>  	DEF_MOD("vin7",			 804,	R8A77995_CLK_S1D2),
>  	DEF_MOD("vin6",			 805,	R8A77995_CLK_S1D2),

-- 
Regards,

Laurent Pinchart



