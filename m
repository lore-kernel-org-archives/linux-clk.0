Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F1AC10F05
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FAF12173C
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="iBN1m69n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbfC2JUj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:20:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46784 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbfC2JUj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 05:20:39 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A3D0A25BECC;
        Fri, 29 Mar 2019 20:20:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553851236; bh=YnaDDL2sNtX53uA0cbg4sFyRVsZ8FmjYpa53KH2zkGE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iBN1m69nC1cMm0XqQg9+Ri2Z6F1JkGXQa9pui/tqHxUfR8JFBX59hKUtzucyN30oL
         JHezcXQ88Z0paIqmFCjVBsga4d73nZ+qGwGgmO8MI3Xpr07SGwwrDpEkwSSSbNLOKd
         ivAmXfG7G3ARfCaaA272xRjHLaNKCuXM0CURv4tA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B26FD940381; Fri, 29 Mar 2019 10:20:34 +0100 (CET)
Date:   Fri, 29 Mar 2019 10:20:34 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 2/5] clk: renesas: rcar-gen3: Correct parent clock of
 HS-USB
Message-ID: <20190329092034.hq642r4fs4iwrdjh@verge.net.au>
References: <20190327124140.8800-1-geert+renesas@glider.be>
 <20190327124140.8800-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327124140.8800-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 01:41:37PM +0100, Geert Uytterhoeven wrote:
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Rev. 1.00, and the RZ/G2
> Hardware Manual Rev. 0.61, the parent clock of the HS-USB module
> clocks on R-Car Gen3 and RZ/G2 SoCs is S3D2.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> [takeshi: Update R-Car H3, M3-N, and E3]
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Update RZ/G2M and RZ/G2E]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

During my review I saw that R-Car D3 (r8a77995) is already using the
correct parent clock. And with this change all R-Car Gen3 and RZ/G2 SoCs do
so.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  | 4 ++--
>  drivers/clk/renesas/r8a7796-cpg-mssr.c  | 2 +-
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> index bce0e6d6d02c7e7b..676e6a1120900b17 100644
> --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> @@ -167,7 +167,7 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
>  	DEF_MOD("vspi0",		 631,	R8A774A1_CLK_S0D1),
>  	DEF_MOD("ehci1",		 702,	R8A774A1_CLK_S3D2),
>  	DEF_MOD("ehci0",		 703,	R8A774A1_CLK_S3D2),
> -	DEF_MOD("hsusb",		 704,	R8A774A1_CLK_S3D4),
> +	DEF_MOD("hsusb",		 704,	R8A774A1_CLK_S3D2),
>  	DEF_MOD("csi20",		 714,	R8A774A1_CLK_CSI0),
>  	DEF_MOD("csi40",		 716,	R8A774A1_CLK_CSI0),
>  	DEF_MOD("du2",			 722,	R8A774A1_CLK_S2D1),
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> index d095787f7d851fc9..c33d3b0370812840 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -179,7 +179,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
>  	DEF_MOD("vspi0",		 631,	R8A774C0_CLK_S0D1),
>  
>  	DEF_MOD("ehci0",		 703,	R8A774C0_CLK_S3D2),
> -	DEF_MOD("hsusb",		 704,	R8A774C0_CLK_S3D4),
> +	DEF_MOD("hsusb",		 704,	R8A774C0_CLK_S3D2),
>  	DEF_MOD("csi40",		 716,	R8A774C0_CLK_CSI0),
>  	DEF_MOD("du1",			 723,	R8A774C0_CLK_S1D1),
>  	DEF_MOD("du0",			 724,	R8A774C0_CLK_S1D1),
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index b9e42da38b72bdcb..5b658b0861180268 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -199,8 +199,8 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>  	DEF_MOD("ehci2",		 701,	R8A7795_CLK_S3D2),
>  	DEF_MOD("ehci1",		 702,	R8A7795_CLK_S3D2),
>  	DEF_MOD("ehci0",		 703,	R8A7795_CLK_S3D2),
> -	DEF_MOD("hsusb",		 704,	R8A7795_CLK_S3D4),
> -	DEF_MOD("hsusb3",		 705,	R8A7795_CLK_S3D4),
> +	DEF_MOD("hsusb",		 704,	R8A7795_CLK_S3D2),
> +	DEF_MOD("hsusb3",		 705,	R8A7795_CLK_S3D2),
>  	DEF_MOD("csi21",		 713,	R8A7795_CLK_CSI0), /* ES1.x */
>  	DEF_MOD("csi20",		 714,	R8A7795_CLK_CSI0),
>  	DEF_MOD("csi41",		 715,	R8A7795_CLK_CSI0),
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index 97b58f13111441a8..fa1c1ac14d5caa1c 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -179,7 +179,7 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>  	DEF_MOD("vspi0",		 631,	R8A7796_CLK_S0D1),
>  	DEF_MOD("ehci1",		 702,	R8A7796_CLK_S3D2),
>  	DEF_MOD("ehci0",		 703,	R8A7796_CLK_S3D2),
> -	DEF_MOD("hsusb",		 704,	R8A7796_CLK_S3D4),
> +	DEF_MOD("hsusb",		 704,	R8A7796_CLK_S3D2),
>  	DEF_MOD("csi20",		 714,	R8A7796_CLK_CSI0),
>  	DEF_MOD("csi40",		 716,	R8A7796_CLK_CSI0),
>  	DEF_MOD("du2",			 722,	R8A7796_CLK_S2D1),
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> index ab25bd5f1371869e..48a9add7d4db8975 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -177,7 +177,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
>  
>  	DEF_MOD("ehci1",		702,	R8A77965_CLK_S3D2),
>  	DEF_MOD("ehci0",		703,	R8A77965_CLK_S3D2),
> -	DEF_MOD("hsusb",		704,	R8A77965_CLK_S3D4),
> +	DEF_MOD("hsusb",		704,	R8A77965_CLK_S3D2),
>  	DEF_MOD("csi20",		714,	R8A77965_CLK_CSI0),
>  	DEF_MOD("csi40",		716,	R8A77965_CLK_CSI0),
>  	DEF_MOD("du3",			721,	R8A77965_CLK_S2D1),
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> index 3f22b8565648d590..3a88d2247cf5cb17 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -182,7 +182,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
>  	DEF_MOD("vspi0",		 631,	R8A77990_CLK_S0D1),
>  
>  	DEF_MOD("ehci0",		 703,	R8A77990_CLK_S3D2),
> -	DEF_MOD("hsusb",		 704,	R8A77990_CLK_S3D4),
> +	DEF_MOD("hsusb",		 704,	R8A77990_CLK_S3D2),
>  	DEF_MOD("csi40",		 716,	R8A77990_CLK_CSI0),
>  	DEF_MOD("du1",			 723,	R8A77990_CLK_S1D1),
>  	DEF_MOD("du0",			 724,	R8A77990_CLK_S1D1),
> -- 
> 2.17.1
> 
