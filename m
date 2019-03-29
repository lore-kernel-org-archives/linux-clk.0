Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B49C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CA822184D
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CMs/jkZV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbfC2JCv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:02:51 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46500 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbfC2JCv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 05:02:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 41C8925BECC;
        Fri, 29 Mar 2019 20:02:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553850168; bh=g0ISbnxUbc5a6EqS2y9ec/yGv8YE4KPDzKyunMuFDQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CMs/jkZVmpZrk/m++fRFDKC/YP0o0MLU6BUHlbXNhTR+SVKiGwDniKmSR75lKVSGD
         GAgwTEdwiaUO6AB9MzO9s/uhsOS/S/xWFcmWsx0Xsi+r70KZStQRZ0HYNq99bMj+qP
         ps2HF9OJH21FMWOgD2hz0oo37ituiHnWZnGtAaoo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id AE4FE940381; Fri, 29 Mar 2019 10:02:45 +0100 (CET)
Date:   Fri, 29 Mar 2019 10:02:45 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/5] clk: renesas: rcar-gen3: Correct parent clock of
 EHCI/OHCI
Message-ID: <20190329090242.wzprrwttm77sgmtg@verge.net.au>
References: <20190327124140.8800-1-geert+renesas@glider.be>
 <20190327124140.8800-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327124140.8800-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 01:41:36PM +0100, Geert Uytterhoeven wrote:
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Rev. 1.00, and the RZ/G2
> Hardware Manual Rev. 0.61, the parent clock of the EHCI/OHCI module
> clocks on R-Car Gen3 and RZ/G2 SoCs is S3D2.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> [takeshi: Update R-Car H3, M3-N, and E3]
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Update RZ/G2M and RZ/G2E]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

During my review I saw that R-Car E3 (r8a77990) is already using
the correct parent clock. And with this change all R-Car Gen3 and RZ/G2
SoCs do so.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 4 ++--
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  | 8 ++++----
>  drivers/clk/renesas/r8a7796-cpg-mssr.c  | 4 ++--
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 4 ++--
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 +-
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> index 44161fd0a09caaba..bce0e6d6d02c7e7b 100644
> --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> @@ -165,8 +165,8 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
>  	DEF_MOD("vspd0",		 623,	R8A774A1_CLK_S0D2),
>  	DEF_MOD("vspb",			 626,	R8A774A1_CLK_S0D1),
>  	DEF_MOD("vspi0",		 631,	R8A774A1_CLK_S0D1),
> -	DEF_MOD("ehci1",		 702,	R8A774A1_CLK_S3D4),
> -	DEF_MOD("ehci0",		 703,	R8A774A1_CLK_S3D4),
> +	DEF_MOD("ehci1",		 702,	R8A774A1_CLK_S3D2),
> +	DEF_MOD("ehci0",		 703,	R8A774A1_CLK_S3D2),
>  	DEF_MOD("hsusb",		 704,	R8A774A1_CLK_S3D4),
>  	DEF_MOD("csi20",		 714,	R8A774A1_CLK_CSI0),
>  	DEF_MOD("csi40",		 716,	R8A774A1_CLK_CSI0),
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> index 57098b7e3d0eea3c..d095787f7d851fc9 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -178,7 +178,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
>  	DEF_MOD("vspb",			 626,	R8A774C0_CLK_S0D1),
>  	DEF_MOD("vspi0",		 631,	R8A774C0_CLK_S0D1),
>  
> -	DEF_MOD("ehci0",		 703,	R8A774C0_CLK_S3D4),
> +	DEF_MOD("ehci0",		 703,	R8A774C0_CLK_S3D2),
>  	DEF_MOD("hsusb",		 704,	R8A774C0_CLK_S3D4),
>  	DEF_MOD("csi40",		 716,	R8A774C0_CLK_CSI0),
>  	DEF_MOD("du1",			 723,	R8A774C0_CLK_S1D1),
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index 8287816523c3c602..b9e42da38b72bdcb 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -195,10 +195,10 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>  	DEF_MOD("vspi2",		 629,	R8A7795_CLK_S2D1), /* ES1.x */
>  	DEF_MOD("vspi1",		 630,	R8A7795_CLK_S0D1),
>  	DEF_MOD("vspi0",		 631,	R8A7795_CLK_S0D1),
> -	DEF_MOD("ehci3",		 700,	R8A7795_CLK_S3D4),
> -	DEF_MOD("ehci2",		 701,	R8A7795_CLK_S3D4),
> -	DEF_MOD("ehci1",		 702,	R8A7795_CLK_S3D4),
> -	DEF_MOD("ehci0",		 703,	R8A7795_CLK_S3D4),
> +	DEF_MOD("ehci3",		 700,	R8A7795_CLK_S3D2),
> +	DEF_MOD("ehci2",		 701,	R8A7795_CLK_S3D2),
> +	DEF_MOD("ehci1",		 702,	R8A7795_CLK_S3D2),
> +	DEF_MOD("ehci0",		 703,	R8A7795_CLK_S3D2),
>  	DEF_MOD("hsusb",		 704,	R8A7795_CLK_S3D4),
>  	DEF_MOD("hsusb3",		 705,	R8A7795_CLK_S3D4),
>  	DEF_MOD("csi21",		 713,	R8A7795_CLK_CSI0), /* ES1.x */
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index 5cde1bff89235e90..97b58f13111441a8 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -177,8 +177,8 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>  	DEF_MOD("vspd0",		 623,	R8A7796_CLK_S0D2),
>  	DEF_MOD("vspb",			 626,	R8A7796_CLK_S0D1),
>  	DEF_MOD("vspi0",		 631,	R8A7796_CLK_S0D1),
> -	DEF_MOD("ehci1",		 702,	R8A7796_CLK_S3D4),
> -	DEF_MOD("ehci0",		 703,	R8A7796_CLK_S3D4),
> +	DEF_MOD("ehci1",		 702,	R8A7796_CLK_S3D2),
> +	DEF_MOD("ehci0",		 703,	R8A7796_CLK_S3D2),
>  	DEF_MOD("hsusb",		 704,	R8A7796_CLK_S3D4),
>  	DEF_MOD("csi20",		 714,	R8A7796_CLK_CSI0),
>  	DEF_MOD("csi40",		 716,	R8A7796_CLK_CSI0),
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> index fefa26a1a797d9a8..ab25bd5f1371869e 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -175,8 +175,8 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
>  	DEF_MOD("vspb",			626,	R8A77965_CLK_S0D1),
>  	DEF_MOD("vspi0",		631,	R8A77965_CLK_S0D1),
>  
> -	DEF_MOD("ehci1",		702,	R8A77965_CLK_S3D4),
> -	DEF_MOD("ehci0",		703,	R8A77965_CLK_S3D4),
> +	DEF_MOD("ehci1",		702,	R8A77965_CLK_S3D2),
> +	DEF_MOD("ehci0",		703,	R8A77965_CLK_S3D2),
>  	DEF_MOD("hsusb",		704,	R8A77965_CLK_S3D4),
>  	DEF_MOD("csi20",		714,	R8A77965_CLK_CSI0),
>  	DEF_MOD("csi40",		716,	R8A77965_CLK_CSI0),
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> index 99f602cb30a55913..3f22b8565648d590 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -181,7 +181,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
>  	DEF_MOD("vspb",			 626,	R8A77990_CLK_S0D1),
>  	DEF_MOD("vspi0",		 631,	R8A77990_CLK_S0D1),
>  
> -	DEF_MOD("ehci0",		 703,	R8A77990_CLK_S3D4),
> +	DEF_MOD("ehci0",		 703,	R8A77990_CLK_S3D2),
>  	DEF_MOD("hsusb",		 704,	R8A77990_CLK_S3D4),
>  	DEF_MOD("csi40",		 716,	R8A77990_CLK_CSI0),
>  	DEF_MOD("du1",			 723,	R8A77990_CLK_S1D1),
> -- 
> 2.17.1
> 
