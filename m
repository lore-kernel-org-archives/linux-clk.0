Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7853C43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 11:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 851DB2070D
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 11:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="W6M8ycUy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfC0LxT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 07:53:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56042 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbfC0LxS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 07:53:18 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3D28025B78D;
        Wed, 27 Mar 2019 22:53:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553687596; bh=kyzriu/maV8aDVjgCM5xM51v55JKMzgspv5c7AiQdYM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W6M8ycUycBVMyK4e4GgunO1Ezp8kgAd7s9c554FNFGE6NifJA7VYaM/d8OgbzW0c+
         /xamNSgkz/LeB39ud0UKwxzhbHsx25ee4VWo+pA+5PgZHuBklBVvBF9Ymuvan/k78+
         9H2IBSZ0tA2Ch2Q7HiNMotcT2Go0IGLTQwC8A6D8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 78BCD940376; Wed, 27 Mar 2019 12:53:14 +0100 (CET)
Date:   Wed, 27 Mar 2019 12:53:14 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r7s9210: Always use readl()
Message-ID: <20190327115314.7lkw5pv5y43uixfd@verge.net.au>
References: <20190320102512.19677-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190320102512.19677-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 20, 2019 at 11:25:12AM +0100, Geert Uytterhoeven wrote:
> On arm32, there is no reason to use the (soon deprecated) clk_readl().
> Hence use the generic readl() instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v5.2.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
>  drivers/clk/renesas/r7s9210-cpg-mssr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> index 57c49fe8829567e1..cf65d4e0e1166647 100644
> --- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
> +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/io.h>
>  #include <dt-bindings/clock/r7s9210-cpg-mssr.h>
>  #include "renesas-cpg-mssr.h"
>  
> @@ -119,7 +120,7 @@ static void __init r7s9210_update_clk_table(struct clk *extal_clk,
>  	if (clk_get_rate(extal_clk) > 12000000)
>  		cpg_mode = 1;
>  
> -	frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
> +	frqcr = readl(base + CPG_FRQCR) & 0xFFF;
>  	if (frqcr == 0x012)
>  		index = 0;
>  	else if (frqcr == 0x112)
> -- 
> 2.17.1
> 
