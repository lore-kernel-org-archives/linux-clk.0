Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700B6C10F05
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:34:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EDD72082F
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="qyFxhkJO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbfC2Jet (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:34:49 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46989 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfC2Jet (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 05:34:49 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C2AEB25BED6;
        Fri, 29 Mar 2019 20:34:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553852086; bh=oq39kiAxI8D8J8LoI9Ob+zkFJ4IoRSd/5LDavoVFYBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qyFxhkJOeUnNJ9/e+eWoai9wzRqoQdZYcUjHV7cqRJPcx9dcyMgA1If3YdQUNCPhg
         TR4cqfZQTGiO2f+MfW87UV3r7/uFojNqZm9G+1POtRWXngNeMUaWarVKbzkzRkIQ2p
         vX/9u3AbBrgJxg3BX1+AMgeTix1n05KqK5+gUWWw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D1AA6940381; Fri, 29 Mar 2019 10:34:43 +0100 (CET)
Date:   Fri, 29 Mar 2019 10:34:43 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 4/5] clk: renesas: rcar-gen3: Correct parent clock of
 Audio-DMAC
Message-ID: <20190329093443.2umvj3re2rzqc56u@verge.net.au>
References: <20190327124140.8800-1-geert+renesas@glider.be>
 <20190327124140.8800-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327124140.8800-5-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 01:41:39PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> The clock sources of the AXI-bus clock (266.66 MHz) used for Audio-DMAC
> DMA transfers are:
> 
>     Channel        R-Car H3    R-Car M3-W    R-Car M3-N    R-Car E3
>     ---------------------------------------------------------------
>     Audio-DMAC0    S1D2        S1D2          S1D2          S1D2
>     Audio-DMAC1    S1D2        S1D2          S1D2          -
> 
> As a result, change the parent clocks of the Audio-DMAC{0,1} module
> clocks on R-Car H3, R-Car M3-W, and R-Car M3-N to S1D2, and change the
> parent clock of the Audio-DMAC0 module on R-Car E3 to S1D2.
> 
> NOTE: This information will be reflected in a future revision of the
>       R-Car Gen3 Hardware Manual.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Update R-Car D3, RZ/G2M, and RZ/G2E]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 4 ++--
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  | 4 ++--
>  drivers/clk/renesas/r8a7796-cpg-mssr.c  | 4 ++--
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 4 ++--
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 +-
>  7 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> index 13bf7260204f5078..76ed7d1bae368adc 100644
> --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> @@ -143,8 +143,8 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
>  	DEF_MOD("rwdt",			 402,	R8A774A1_CLK_R),
>  	DEF_MOD("intc-ex",		 407,	R8A774A1_CLK_CP),
>  	DEF_MOD("intc-ap",		 408,	R8A774A1_CLK_S0D3),
> -	DEF_MOD("audmac1",		 501,	R8A774A1_CLK_S0D3),
> -	DEF_MOD("audmac0",		 502,	R8A774A1_CLK_S0D3),
> +	DEF_MOD("audmac1",		 501,	R8A774A1_CLK_S1D2),
> +	DEF_MOD("audmac0",		 502,	R8A774A1_CLK_S1D2),
>  	DEF_MOD("hscif4",		 516,	R8A774A1_CLK_S3D1),
>  	DEF_MOD("hscif3",		 517,	R8A774A1_CLK_S3D1),
>  	DEF_MOD("hscif2",		 518,	R8A774A1_CLK_S3D1),
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> index c33d3b0370812840..f91e7a4847537926 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -158,7 +158,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
>  	DEF_MOD("intc-ex",		 407,	R8A774C0_CLK_CP),
>  	DEF_MOD("intc-ap",		 408,	R8A774C0_CLK_S0D3),
>  
> -	DEF_MOD("audmac0",		 502,	R8A774C0_CLK_S3D4),
> +	DEF_MOD("audmac0",		 502,	R8A774C0_CLK_S1D2),
>  	DEF_MOD("hscif4",		 516,	R8A774C0_CLK_S3D1C),
>  	DEF_MOD("hscif3",		 517,	R8A774C0_CLK_S3D1C),
>  	DEF_MOD("hscif2",		 518,	R8A774C0_CLK_S3D1C),
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index a576a42f104442ff..e5fa9f6c1ec4b9cb 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -154,8 +154,8 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>  	DEF_MOD("rwdt",			 402,	R8A7795_CLK_R),
>  	DEF_MOD("intc-ex",		 407,	R8A7795_CLK_CP),
>  	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S0D3),
> -	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S0D3),
> -	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S0D3),
> +	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S1D2),
> +	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S1D2),
>  	DEF_MOD("drif7",		 508,	R8A7795_CLK_S3D2),
>  	DEF_MOD("drif6",		 509,	R8A7795_CLK_S3D2),
>  	DEF_MOD("drif5",		 510,	R8A7795_CLK_S3D2),
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index 369092e8d893255f..73c69152c77b02ed 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -147,8 +147,8 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>  	DEF_MOD("rwdt",			 402,	R8A7796_CLK_R),
>  	DEF_MOD("intc-ex",		 407,	R8A7796_CLK_CP),
>  	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S0D3),
> -	DEF_MOD("audmac1",		 501,	R8A7796_CLK_S0D3),
> -	DEF_MOD("audmac0",		 502,	R8A7796_CLK_S0D3),
> +	DEF_MOD("audmac1",		 501,	R8A7796_CLK_S1D2),
> +	DEF_MOD("audmac0",		 502,	R8A7796_CLK_S1D2),
>  	DEF_MOD("drif7",		 508,	R8A7796_CLK_S3D2),
>  	DEF_MOD("drif6",		 509,	R8A7796_CLK_S3D2),
>  	DEF_MOD("drif5",		 510,	R8A7796_CLK_S3D2),
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> index 623bbda2d24ec112..a0ce2ecb656d3d48 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -146,8 +146,8 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
>  	DEF_MOD("intc-ex",		407,	R8A77965_CLK_CP),
>  	DEF_MOD("intc-ap",		408,	R8A77965_CLK_S0D3),
>  
> -	DEF_MOD("audmac1",		501,	R8A77965_CLK_S0D3),
> -	DEF_MOD("audmac0",		502,	R8A77965_CLK_S0D3),
> +	DEF_MOD("audmac1",		501,	R8A77965_CLK_S1D2),
> +	DEF_MOD("audmac0",		502,	R8A77965_CLK_S1D2),
>  	DEF_MOD("drif7",		508,	R8A77965_CLK_S3D2),
>  	DEF_MOD("drif6",		509,	R8A77965_CLK_S3D2),
>  	DEF_MOD("drif5",		510,	R8A77965_CLK_S3D2),
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> index 3a88d2247cf5cb17..53973201a9f576ad 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -153,7 +153,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
>  	DEF_MOD("intc-ex",		 407,	R8A77990_CLK_CP),
>  	DEF_MOD("intc-ap",		 408,	R8A77990_CLK_S0D3),
>  
> -	DEF_MOD("audmac0",		 502,	R8A77990_CLK_S3D4),
> +	DEF_MOD("audmac0",		 502,	R8A77990_CLK_S1D2),
>  	DEF_MOD("drif7",		 508,	R8A77990_CLK_S3D2),
>  	DEF_MOD("drif6",		 509,	R8A77990_CLK_S3D2),
>  	DEF_MOD("drif5",		 510,	R8A77990_CLK_S3D2),
> diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> index eee3874865a95b1a..68707277b17b42c4 100644
> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -133,7 +133,7 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
>  	DEF_MOD("rwdt",			 402,	R8A77995_CLK_R),
>  	DEF_MOD("intc-ex",		 407,	R8A77995_CLK_CP),
>  	DEF_MOD("intc-ap",		 408,	R8A77995_CLK_S1D2),
> -	DEF_MOD("audmac0",		 502,	R8A77995_CLK_S3D1),
> +	DEF_MOD("audmac0",		 502,	R8A77995_CLK_S1D2),
>  	DEF_MOD("hscif3",		 517,	R8A77995_CLK_S3D1C),
>  	DEF_MOD("hscif0",		 520,	R8A77995_CLK_S3D1C),
>  	DEF_MOD("thermal",		 522,	R8A77995_CLK_CP),
> -- 
> 2.17.1
> 
