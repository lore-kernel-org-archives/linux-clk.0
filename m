Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0277DC10F05
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:32:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C18B12173C
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="APnj6Q0L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbfC2Jcd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:32:33 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46923 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfC2Jcd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 05:32:33 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3718625BED6;
        Fri, 29 Mar 2019 20:32:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553851950; bh=ac9niVHEjZ5kfpjyOJouGbSEqefm2yCInIeLHgcCh6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=APnj6Q0LKe8bUpJ9cG1eiNJqjo6IBGt2sHN/KVmKubp6p40VHisj0sH68aJtyUNbN
         YWIynWGaHJF4N7T/doWoRsz197zQ+JCeeyM2tXN21wr9qLeol5p541U59qnZrCuMJb
         VYvjPh9v9mG0pI8UROXRsjjTKvgg+dEw3KM1ud+Y=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4194A940381; Fri, 29 Mar 2019 10:32:28 +0100 (CET)
Date:   Fri, 29 Mar 2019 10:32:28 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 3/5] clk: renesas: rcar-gen3: Correct parent clock of
 SYS-DMAC
Message-ID: <20190329093227.s2v5zmgkowf34wk3@verge.net.au>
References: <20190327124140.8800-1-geert+renesas@glider.be>
 <20190327124140.8800-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327124140.8800-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 01:41:38PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> The clock sources of the AXI BUS clock (266.66 MHz) used for SYS-DMAC
> DMA transfers are:
> 
>     Channel      R-Car H3    R-Car M3-W    R-Car M3-N
>     -------------------------------------------------
>     SYS-DMAC0    S0D3        S0D3          S0D3
>     SYS-DMAC1    S3D1        S3D1          S3D1
>     SYS-DMAC2    S3D1        S3D1          S3D1
> 
> As a result, change the parent clocks of the SYS-DMAC{1,2} module clocks
> on R-Car H3, R-Car M3-W, and R-Car M3-N to S3D1.
> 
> NOTE: This information will be reflected in a future revision of the
>       R-Car Gen3 Hardware Manual.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Update RZ/G2M]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 4 ++--
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  | 4 ++--
>  drivers/clk/renesas/r8a7796-cpg-mssr.c  | 4 ++--
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> index 676e6a1120900b17..13bf7260204f5078 100644
> --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> @@ -123,8 +123,8 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
>  	DEF_MOD("msiof2",		 209,	R8A774A1_CLK_MSO),
>  	DEF_MOD("msiof1",		 210,	R8A774A1_CLK_MSO),
>  	DEF_MOD("msiof0",		 211,	R8A774A1_CLK_MSO),
> -	DEF_MOD("sys-dmac2",		 217,	R8A774A1_CLK_S0D3),
> -	DEF_MOD("sys-dmac1",		 218,	R8A774A1_CLK_S0D3),
> +	DEF_MOD("sys-dmac2",		 217,	R8A774A1_CLK_S3D1),
> +	DEF_MOD("sys-dmac1",		 218,	R8A774A1_CLK_S3D1),
>  	DEF_MOD("sys-dmac0",		 219,	R8A774A1_CLK_S0D3),
>  	DEF_MOD("cmt3",			 300,	R8A774A1_CLK_R),
>  	DEF_MOD("cmt2",			 301,	R8A774A1_CLK_R),
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index 5b658b0861180268..a576a42f104442ff 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -130,8 +130,8 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>  	DEF_MOD("msiof2",		 209,	R8A7795_CLK_MSO),
>  	DEF_MOD("msiof1",		 210,	R8A7795_CLK_MSO),
>  	DEF_MOD("msiof0",		 211,	R8A7795_CLK_MSO),
> -	DEF_MOD("sys-dmac2",		 217,	R8A7795_CLK_S0D3),
> -	DEF_MOD("sys-dmac1",		 218,	R8A7795_CLK_S0D3),
> +	DEF_MOD("sys-dmac2",		 217,	R8A7795_CLK_S3D1),
> +	DEF_MOD("sys-dmac1",		 218,	R8A7795_CLK_S3D1),
>  	DEF_MOD("sys-dmac0",		 219,	R8A7795_CLK_S0D3),
>  	DEF_MOD("sceg-pub",		 229,	R8A7795_CLK_CR),
>  	DEF_MOD("cmt3",			 300,	R8A7795_CLK_R),
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index fa1c1ac14d5caa1c..369092e8d893255f 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -127,8 +127,8 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>  	DEF_MOD("msiof2",		 209,	R8A7796_CLK_MSO),
>  	DEF_MOD("msiof1",		 210,	R8A7796_CLK_MSO),
>  	DEF_MOD("msiof0",		 211,	R8A7796_CLK_MSO),
> -	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S0D3),
> -	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S0D3),
> +	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S3D1),
> +	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S3D1),
>  	DEF_MOD("sys-dmac0",		 219,	R8A7796_CLK_S0D3),
>  	DEF_MOD("cmt3",			 300,	R8A7796_CLK_R),
>  	DEF_MOD("cmt2",			 301,	R8A7796_CLK_R),
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> index 48a9add7d4db8975..623bbda2d24ec112 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -123,8 +123,8 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
>  	DEF_MOD("msiof2",		209,	R8A77965_CLK_MSO),
>  	DEF_MOD("msiof1",		210,	R8A77965_CLK_MSO),
>  	DEF_MOD("msiof0",		211,	R8A77965_CLK_MSO),
> -	DEF_MOD("sys-dmac2",		217,	R8A77965_CLK_S0D3),
> -	DEF_MOD("sys-dmac1",		218,	R8A77965_CLK_S0D3),
> +	DEF_MOD("sys-dmac2",		217,	R8A77965_CLK_S3D1),
> +	DEF_MOD("sys-dmac1",		218,	R8A77965_CLK_S3D1),
>  	DEF_MOD("sys-dmac0",		219,	R8A77965_CLK_S0D3),
>  
>  	DEF_MOD("cmt3",			300,	R8A77965_CLK_R),
> -- 
> 2.17.1
> 
