Return-Path: <SRS0=1i5z=RH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C39C43381
	for <linux-clk@archiver.kernel.org>; Mon,  4 Mar 2019 09:45:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4321820836
	for <linux-clk@archiver.kernel.org>; Mon,  4 Mar 2019 09:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="mLUbifPa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfCDJpW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:45:22 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38621 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfCDJpV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Mar 2019 04:45:21 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D25A725B74E;
        Mon,  4 Mar 2019 20:45:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551692720; bh=QWfvagg8rrZK7t6Gu7tVrSQhAltjISWhf8gyZyokeks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mLUbifPayAhxGgQeptNoDp9MJj9BbKsVqwZzeML98GFrlhaF1HRWUw4rxyFOyLuP2
         Upvhv35GS4fvJrKLLRnkMyOW98KRBWSYX2BWW3KySTHtdoO5n1oVZ3ohsP4iKyOStg
         ErnUg53N1XTo6WmvyoOMswXYG96CwPWe2dOHNHpU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 18F4E94030D; Mon,  4 Mar 2019 10:45:18 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:45:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/4] clk: renesas: r8a77990: Add ZG clock
Message-ID: <20190304094517.xlr73yi2chkf3qvi@verge.net.au>
References: <20190228135246.31714-1-horms+renesas@verge.net.au>
 <20190228135246.31714-3-horms+renesas@verge.net.au>
 <CAMuHMdU8AWAWjGHQC6tJnxqZRU1W+LmLvnw0nhWqNAKotGApMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU8AWAWjGHQC6tJnxqZRU1W+LmLvnw0nhWqNAKotGApMw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 01, 2019 at 01:52:50PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Feb 28, 2019 at 2:52 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > Adds support for R-Car E3 (r8a77990) ZG clock.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > Tested on Ebisu to the extent that the clock rate is 600MHz on boot
> > ---
> >  drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 ++
> >  drivers/clk/renesas/rcar-gen3-cpg.c     | 1 -
> >  drivers/clk/renesas/rcar-gen3-cpg.h     | 1 +
> >  3 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> > index 0e475dcb68b9..d0d29fc942ff 100644
> > --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> > @@ -83,6 +83,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
> >         DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
> >         DEF_GEN3_Z("z2",       R8A77990_CLK_Z2,    CLK_TYPE_GEN3_Z, CLK_PLL0,
> >                    4, CPG_FRQCRC, 8),
> > +       DEF_GEN3_Z("zg",       R8A77990_CLK_ZG,    CLK_TYPE_GEN3_Z, CLK_PLL0,
> > +                  8, CPG_FRQCRB, 24),
> 
> While this approach may be correct for R-Car H3, M3-W, and M3-N, this is
> not correct for R-Car E3, due to the presence of Spread Spectrum Clock
> Generator support:
>   - When SCCG is enabled (MD12=1), the parent clock is either S0 or S1,
>     with only 2 or 3 (out of 32) supported dividers,
>   - When SCCG is disabled (MD12=0), the parent clock is PLL0, with only
>     2 (out of 32) supported dividers.
> 
> So I'm afraid the ZG clock on SCCG-capable SoCs needs its own very special
> clock type.

Thanks for pointing this out, I'll investigate further.

> 
> This applies also to R-Car D3 and RZ/G2E.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
