Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60710C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:39:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EBE120693
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="GCBTlH+k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbfC2Jjl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:39:41 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:47076 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfC2Jjl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 05:39:41 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6A80A25BECC;
        Fri, 29 Mar 2019 20:39:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553852378; bh=RLLZ78PeCwNJIFLBTAsOfMdVjzXVoW61wfW0PS/Ku6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCBTlH+kIb9wzycEv95X/aBksL0UyzooLFXxqSmAVJ8hcZ6OJS6uUJtEe2LC0bOn7
         7hS7QZKuUOQZ4nIZ+HHwpnsE/2/GV4cfDBJkClIty8LPRtrbT+pslcQsbMaANMvpLD
         owjMiGq2zz5BOxKbzcr+S18nPEZqLSTugW9gh1tM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7B49D940381; Fri, 29 Mar 2019 10:39:36 +0100 (CET)
Date:   Fri, 29 Mar 2019 10:39:36 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 5/5] clk: renesas: rcar-gen3: Rename DRIF clocks
Message-ID: <20190329093936.znco6mrqslngn7ai@verge.net.au>
References: <20190327124140.8800-1-geert+renesas@glider.be>
 <20190327124140.8800-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327124140.8800-6-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 01:41:40PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev. 1.50 of Feb
> 12, 2019, the DRIF clocks have been renamed as follows:
> 
>     DRIF0 to DRIF00
>     DRIF1 to DRIF01
>     DRIF2 to DRIF10
>     DRIF3 to DRIF11
>     DRIF4 to DRIF20
>     DRIF5 to DRIF21
>     DRIF6 to DRIF30
>     DRIF7 to DRIF31
> 
> Therefore, this patch renames the DRIF clock names from DRIFn to DRIFmm.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  | 18 +++++++++---------
>  drivers/clk/renesas/r8a7796-cpg-mssr.c  | 16 ++++++++--------
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 17 +++++++++--------
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 18 +++++++++---------
>  4 files changed, 35 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index e5fa9f6c1ec4b9cb..9e9a6f2c31e808eb 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -3,7 +3,7 @@
>   * r8a7795 Clock Pulse Generator / Module Standby and Software Reset
>   *
>   * Copyright (C) 2015 Glider bvba
> - * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018-2019 Renesas Electronics Corp.
>   *
>   * Based on clk-rcar-gen3.c
>   *
> @@ -156,14 +156,14 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>  	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S0D3),
>  	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S1D2),
>  	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S1D2),
> -	DEF_MOD("drif7",		 508,	R8A7795_CLK_S3D2),
> -	DEF_MOD("drif6",		 509,	R8A7795_CLK_S3D2),
> -	DEF_MOD("drif5",		 510,	R8A7795_CLK_S3D2),
> -	DEF_MOD("drif4",		 511,	R8A7795_CLK_S3D2),
> -	DEF_MOD("drif3",		 512,	R8A7795_CLK_S3D2),
> -	DEF_MOD("drif2",		 513,	R8A7795_CLK_S3D2),
> -	DEF_MOD("drif1",		 514,	R8A7795_CLK_S3D2),
> -	DEF_MOD("drif0",		 515,	R8A7795_CLK_S3D2),
> +	DEF_MOD("drif31",		 508,	R8A7795_CLK_S3D2),
> +	DEF_MOD("drif30",		 509,	R8A7795_CLK_S3D2),
> +	DEF_MOD("drif21",		 510,	R8A7795_CLK_S3D2),
> +	DEF_MOD("drif20",		 511,	R8A7795_CLK_S3D2),
> +	DEF_MOD("drif11",		 512,	R8A7795_CLK_S3D2),
> +	DEF_MOD("drif10",		 513,	R8A7795_CLK_S3D2),
> +	DEF_MOD("drif01",		 514,	R8A7795_CLK_S3D2),
> +	DEF_MOD("drif00",		 515,	R8A7795_CLK_S3D2),
>  	DEF_MOD("hscif4",		 516,	R8A7795_CLK_S3D1),
>  	DEF_MOD("hscif3",		 517,	R8A7795_CLK_S3D1),
>  	DEF_MOD("hscif2",		 518,	R8A7795_CLK_S3D1),
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index 73c69152c77b02ed..d8e9af5d9ae9cf6e 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -149,14 +149,14 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>  	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S0D3),
>  	DEF_MOD("audmac1",		 501,	R8A7796_CLK_S1D2),
>  	DEF_MOD("audmac0",		 502,	R8A7796_CLK_S1D2),
> -	DEF_MOD("drif7",		 508,	R8A7796_CLK_S3D2),
> -	DEF_MOD("drif6",		 509,	R8A7796_CLK_S3D2),
> -	DEF_MOD("drif5",		 510,	R8A7796_CLK_S3D2),
> -	DEF_MOD("drif4",		 511,	R8A7796_CLK_S3D2),
> -	DEF_MOD("drif3",		 512,	R8A7796_CLK_S3D2),
> -	DEF_MOD("drif2",		 513,	R8A7796_CLK_S3D2),
> -	DEF_MOD("drif1",		 514,	R8A7796_CLK_S3D2),
> -	DEF_MOD("drif0",		 515,	R8A7796_CLK_S3D2),
> +	DEF_MOD("drif31",		 508,	R8A7796_CLK_S3D2),
> +	DEF_MOD("drif30",		 509,	R8A7796_CLK_S3D2),
> +	DEF_MOD("drif21",		 510,	R8A7796_CLK_S3D2),
> +	DEF_MOD("drif20",		 511,	R8A7796_CLK_S3D2),
> +	DEF_MOD("drif11",		 512,	R8A7796_CLK_S3D2),
> +	DEF_MOD("drif10",		 513,	R8A7796_CLK_S3D2),
> +	DEF_MOD("drif01",		 514,	R8A7796_CLK_S3D2),
> +	DEF_MOD("drif00",		 515,	R8A7796_CLK_S3D2),
>  	DEF_MOD("hscif4",		 516,	R8A7796_CLK_S3D1),
>  	DEF_MOD("hscif3",		 517,	R8A7796_CLK_S3D1),
>  	DEF_MOD("hscif2",		 518,	R8A7796_CLK_S3D1),
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> index a0ce2ecb656d3d48..8f87e314d9490498 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -3,6 +3,7 @@
>   * r8a77965 Clock Pulse Generator / Module Standby and Software Reset
>   *
>   * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + * Copyright (C) 2019 Renesas Electronics Corp.
>   *
>   * Based on r8a7795-cpg-mssr.c
>   *
> @@ -148,14 +149,14 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
>  
>  	DEF_MOD("audmac1",		501,	R8A77965_CLK_S1D2),
>  	DEF_MOD("audmac0",		502,	R8A77965_CLK_S1D2),
> -	DEF_MOD("drif7",		508,	R8A77965_CLK_S3D2),
> -	DEF_MOD("drif6",		509,	R8A77965_CLK_S3D2),
> -	DEF_MOD("drif5",		510,	R8A77965_CLK_S3D2),
> -	DEF_MOD("drif4",		511,	R8A77965_CLK_S3D2),
> -	DEF_MOD("drif3",		512,	R8A77965_CLK_S3D2),
> -	DEF_MOD("drif2",		513,	R8A77965_CLK_S3D2),
> -	DEF_MOD("drif1",		514,	R8A77965_CLK_S3D2),
> -	DEF_MOD("drif0",		515,	R8A77965_CLK_S3D2),
> +	DEF_MOD("drif31",		508,	R8A77965_CLK_S3D2),
> +	DEF_MOD("drif30",		509,	R8A77965_CLK_S3D2),
> +	DEF_MOD("drif21",		510,	R8A77965_CLK_S3D2),
> +	DEF_MOD("drif20",		511,	R8A77965_CLK_S3D2),
> +	DEF_MOD("drif11",		512,	R8A77965_CLK_S3D2),
> +	DEF_MOD("drif10",		513,	R8A77965_CLK_S3D2),
> +	DEF_MOD("drif01",		514,	R8A77965_CLK_S3D2),
> +	DEF_MOD("drif00",		515,	R8A77965_CLK_S3D2),
>  	DEF_MOD("hscif4",		516,	R8A77965_CLK_S3D1),
>  	DEF_MOD("hscif3",		517,	R8A77965_CLK_S3D1),
>  	DEF_MOD("hscif2",		518,	R8A77965_CLK_S3D1),
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> index 53973201a9f576ad..9570404baa583a8f 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -2,7 +2,7 @@
>  /*
>   * r8a77990 Clock Pulse Generator / Module Standby and Software Reset
>   *
> - * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018-2019 Renesas Electronics Corp.
>   *
>   * Based on r8a7795-cpg-mssr.c
>   *
> @@ -154,14 +154,14 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
>  	DEF_MOD("intc-ap",		 408,	R8A77990_CLK_S0D3),
>  
>  	DEF_MOD("audmac0",		 502,	R8A77990_CLK_S1D2),
> -	DEF_MOD("drif7",		 508,	R8A77990_CLK_S3D2),
> -	DEF_MOD("drif6",		 509,	R8A77990_CLK_S3D2),
> -	DEF_MOD("drif5",		 510,	R8A77990_CLK_S3D2),
> -	DEF_MOD("drif4",		 511,	R8A77990_CLK_S3D2),
> -	DEF_MOD("drif3",		 512,	R8A77990_CLK_S3D2),
> -	DEF_MOD("drif2",		 513,	R8A77990_CLK_S3D2),
> -	DEF_MOD("drif1",		 514,	R8A77990_CLK_S3D2),
> -	DEF_MOD("drif0",		 515,	R8A77990_CLK_S3D2),
> +	DEF_MOD("drif31",		 508,	R8A77990_CLK_S3D2),
> +	DEF_MOD("drif30",		 509,	R8A77990_CLK_S3D2),
> +	DEF_MOD("drif21",		 510,	R8A77990_CLK_S3D2),
> +	DEF_MOD("drif20",		 511,	R8A77990_CLK_S3D2),
> +	DEF_MOD("drif11",		 512,	R8A77990_CLK_S3D2),
> +	DEF_MOD("drif10",		 513,	R8A77990_CLK_S3D2),
> +	DEF_MOD("drif01",		 514,	R8A77990_CLK_S3D2),
> +	DEF_MOD("drif00",		 515,	R8A77990_CLK_S3D2),
>  	DEF_MOD("hscif4",		 516,	R8A77990_CLK_S3D1C),
>  	DEF_MOD("hscif3",		 517,	R8A77990_CLK_S3D1C),
>  	DEF_MOD("hscif2",		 518,	R8A77990_CLK_S3D1C),
> -- 
> 2.17.1
> 
