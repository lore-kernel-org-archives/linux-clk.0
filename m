Return-Path: <SRS0=/2Yr=RE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD0AC10F03
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 10:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A64D218AE
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 10:24:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="NEtki5mx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfCAKY6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Mar 2019 05:24:58 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:32950 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfCAKY6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Mar 2019 05:24:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8546E25B769;
        Fri,  1 Mar 2019 21:24:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551435895; bh=TcEEu7oZx7XJhjHM5fN1k4dtZpZKXb+3qKPnxkPjt8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NEtki5mxJ/Y2FZ9bBY8tFrlHRzr1EkINoHTXVMoXWF4BJFAsn+JCPmhJkxF/Wfeuq
         FUkbHZOanPKxmBuzNUkqZY5UL7u2vToKns+P68Sy6S9fpkI0q2yPYZ9Tpz+gGGxFT4
         iB5ulQvPHcPHFwFdWXcxtCc2wuKbiX2VlJoNGMX8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BF985940421; Fri,  1 Mar 2019 11:24:53 +0100 (CET)
Date:   Fri, 1 Mar 2019 11:24:53 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/4] [RFT] clk: renesas: r8a774c0: Add ZG clock
Message-ID: <20190301102453.tssc5o5bf3bwiluo@verge.net.au>
References: <20190228135246.31714-1-horms+renesas@verge.net.au>
 <20190228135246.31714-4-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190228135246.31714-4-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 28, 2019 at 02:52:45PM +0100, Simon Horman wrote:
> Adds support for R-Car RZ/G2E (r8a774c0) ZG clock.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Apologies,

the Tested-by tag should not be present above.
It is a cut-and-paste error.

> ---
> Compile tested only
> ---
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> index d9130723d6c8..2c12bfddca95 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -81,6 +81,8 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
>  	DEF_FIXED("za8",       R8A774C0_CLK_ZA8,   CLK_PLL0D8,     1, 1),
>  	DEF_GEN3_Z("z2",       R8A774C0_CLK_Z2,    CLK_TYPE_GEN3_Z,
>  		   CLK_PLL0, 4, CPG_FRQCRC, 8),
> +	DEF_GEN3_Z("zg",       R8A774C0_CLK_ZG,    CLK_TYPE_GEN3_Z,
> +		   CLK_PLL0, 8, CPG_FRQCRB, 24),
>  	DEF_FIXED("ztr",       R8A774C0_CLK_ZTR,   CLK_PLL1,       6, 1),
>  	DEF_FIXED("zt",        R8A774C0_CLK_ZT,    CLK_PLL1,       4, 1),
>  	DEF_FIXED("zx",        R8A774C0_CLK_ZX,    CLK_PLL1,       3, 1),
> -- 
> 2.11.0
> 
