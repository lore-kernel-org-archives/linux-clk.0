Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14587C43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 12:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D7BF206B6
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 12:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QDoOFR1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D7BF206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbeK2Xai (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 18:30:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39526 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbeK2Xai (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 18:30:38 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8416555A;
        Thu, 29 Nov 2018 13:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1543494324;
        bh=xT4UfipF1otxLNThsgfgBre9RxfbpXkl82+gSmPgv/8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QDoOFR1E67MSM6RC+5HguxVQF2yun5gV0/WL7htlCdxRJvbjvEuQI8+AnWzvwNxNZ
         gg+Yv0r27lk3mdLHEtirfIR/nFB2EV6Hf4HdeBtidFad1tmpsv+8FpUf1MzMK/skjF
         ik8B48JjPiO5dt4F14V+b3a4kaaTHLgB6D3jg73U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 08/13] clk: renesas: r8a77990: Correct parent clock of DU
Date:   Thu, 29 Nov 2018 14:25:52 +0200
Message-ID: <1579147.G3PS2VnPk8@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <20181129105008.10239-9-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be> <20181129105008.10239-9-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thursday, 29 November 2018 12:50:03 EET Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Rev 1.00, the parent clock
> of the DU module clocks on R-Car E3 is S1D1.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 3570a2af473789c5 ("clk: renesas: cpg-mssr: Add support for R-Car E3")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> b/drivers/clk/renesas/r8a77990-cpg-mssr.c index
> 9eb80180eea0b1a6..9a278c75c918cfa8 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -183,8 +183,8 @@ static const struct mssr_mod_clk r8a77990_mod_clks[]
> __initconst = { DEF_MOD("ehci0",		 703,	R8A77990_CLK_S3D4),
>  	DEF_MOD("hsusb",		 704,	R8A77990_CLK_S3D4),
>  	DEF_MOD("csi40",		 716,	R8A77990_CLK_CSI0),
> -	DEF_MOD("du1",			 723,	R8A77990_CLK_S2D1),
> -	DEF_MOD("du0",			 724,	R8A77990_CLK_S2D1),
> +	DEF_MOD("du1",			 723,	R8A77990_CLK_S1D1),
> +	DEF_MOD("du0",			 724,	R8A77990_CLK_S1D1),
>  	DEF_MOD("lvds",			 727,	R8A77990_CLK_S2D1),
> 
>  	DEF_MOD("vin5",			 806,	R8A77990_CLK_S1D2),

-- 
Regards,

Laurent Pinchart



