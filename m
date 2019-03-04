Return-Path: <SRS0=1i5z=RH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACCFC43381
	for <linux-clk@archiver.kernel.org>; Mon,  4 Mar 2019 10:03:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCE342082F
	for <linux-clk@archiver.kernel.org>; Mon,  4 Mar 2019 10:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XxlFqW03"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfCDKDK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:03:10 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38906 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfCDKDK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Mar 2019 05:03:10 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 439C725B74E;
        Mon,  4 Mar 2019 21:03:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551693788; bh=4DBMyYf1rL9mvwX8dA1g2df0CLX/e38QBIT9eC3BkuY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XxlFqW03zhuuHxNywV0rrgCA+idX9kLM3LETzuBPOKVyoO2lD2YbgBnd37JxNTjk1
         E6G6NGu8gRwRF7pHWW6fN/VhDXuJJaiVh/uSe3Bg2TRZFyECn31NtJrP9X5rXQGgex
         wCYGba/L8MByoAqZGa4UrwyXAxGGrgvDGupIzo0c=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3C25894030D; Mon,  4 Mar 2019 11:03:06 +0100 (CET)
Date:   Mon, 4 Mar 2019 11:03:06 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Pass name/offset to
 cpg_sd_clk_register()
Message-ID: <20190304100305.lbzf7pqny7flxp7c@verge.net.au>
References: <20190301123822.808-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301123822.808-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 01, 2019 at 01:38:22PM +0100, Geert Uytterhoeven wrote:
> Explicitly pass the clock's name and register offset to
> cpg_sd_clk_register(), so the latter doesn't have to extract them from
> the cpg_core_clk object.
> 
> This keeps all cpg_core_clk parsing and unmarshalling contained in a
> single function (rcar_gen3_cpg_clk_register()).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> To be queued in clk-renesas-for-v5.2.
> 
>  drivers/clk/renesas/rcar-gen3-cpg.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 9a8071a8114daec9..dcd4ac389326b932 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -369,8 +369,8 @@ static u32 cpg_quirks __initdata;
>  #define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
>  #define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
>  
> -static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
> -	void __iomem *base, const char *parent_name,
> +static struct clk * __init cpg_sd_clk_register(const char *name,
> +	void __iomem *base, unsigned int offset, const char *parent_name,
>  	struct raw_notifier_head *notifiers)
>  {
>  	struct clk_init_data init;
> @@ -383,13 +383,13 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
>  	if (!clock)
>  		return ERR_PTR(-ENOMEM);
>  
> -	init.name = core->name;
> +	init.name = name;
>  	init.ops = &cpg_sd_clock_ops;
>  	init.flags = CLK_SET_RATE_PARENT;
>  	init.parent_names = &parent_name;
>  	init.num_parents = 1;
>  
> -	clock->csn.reg = base + core->offset;
> +	clock->csn.reg = base + offset;
>  	clock->hw.init = &init;
>  	clock->div_table = cpg_sd_div_table;
>  	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
> @@ -606,8 +606,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>  		break;
>  
>  	case CLK_TYPE_GEN3_SD:
> -		return cpg_sd_clk_register(core, base, __clk_get_name(parent),
> -					   notifiers);
> +		return cpg_sd_clk_register(core->name, base, core->offset,
> +					   __clk_get_name(parent), notifiers);
>  
>  	case CLK_TYPE_GEN3_R:
>  		if (cpg_quirks & RCKCR_CKSEL) {
> -- 
> 2.17.1
> 
