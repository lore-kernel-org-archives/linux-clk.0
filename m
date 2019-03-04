Return-Path: <SRS0=1i5z=RH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B655DC43381
	for <linux-clk@archiver.kernel.org>; Mon,  4 Mar 2019 09:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 881D320836
	for <linux-clk@archiver.kernel.org>; Mon,  4 Mar 2019 09:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="oJn3GTGL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbfCDJoU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:44:20 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38586 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfCDJoT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Mar 2019 04:44:19 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C0A0B25B74E;
        Mon,  4 Mar 2019 20:44:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551692657; bh=MB07TkT/OuMOjAuKvgajp83eRwk92tFRbt7ThSMpWbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oJn3GTGL+ZQiFJhIJZmA8UHLX6t86P55THmUZ4rCY4rCLTZiY4hNuQ31uO75rpkby
         NmVQINCw9MkVKG+i9Lbl3XMYm0+9yM5UYGiRWT5+NQsN3/9eFq5qHF1EOR7E/W8FgN
         zuhKOhoPhlt+DWmw4LdkI5bwDdcL9jmq3jqIpbfk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0240994030D; Mon,  4 Mar 2019 10:44:14 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:44:14 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 1/4] clk: renesas: rcar-gen3: Parameterise Z and Z2 clock
 register offset
Message-ID: <20190304094414.lbyg3ykz4yectkwo@verge.net.au>
References: <20190228135246.31714-1-horms+renesas@verge.net.au>
 <20190228135246.31714-2-horms+renesas@verge.net.au>
 <CAMuHMdUyE6qADd_QAAKBW8LJSHHB8T1nLUS=6bNtv+bjAO+juA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUyE6qADd_QAAKBW8LJSHHB8T1nLUS=6bNtv+bjAO+juA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 01, 2019 at 01:38:43PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> Thanks for your patch!
> 
> On Thu, Feb 28, 2019 at 2:53 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > Parameterise the offset of the control register for
> > for Z and Z2 clocks.
> 
> double "for"
> 
> > This is in preparation for supporting the ZG clock on the R-Car E3
> > (r8a77990), D3 (r8a7795) and RZ/G2E (r8a774c0) SoCs which uses a different
> 
> D3 (r8a77995) ... use
> 
> > control register to existing support for Z and Z2 clocks.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> > --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> > @@ -71,8 +71,10 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
> >         DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
> >
> >         /* Core Clock Outputs */
> > -       DEF_GEN3_Z("z",         R8A774A1_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
> > -       DEF_GEN3_Z("z2",        R8A774A1_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
> 
> Given "[PATCH v5 0/6] clk: renesas: r8a77990, r8a774c0: Add Z2 clock"
> still used CLK_TYPE_GEN3_Z2, this patch does not apply.
> Have you forgotten to send out v6?

There was supposed to be a consolidation patch at the beginning
of this series. Sorry for omitting it.

> 
> > +       DEF_GEN3_Z("z",         R8A774A1_CLK_Z,     CLK_TYPE_GEN3_Z,
> > +                  CLK_PLL0, 2, CPG_FRQCRC, 8),
> > +       DEF_GEN3_Z("z2",        R8A774A1_CLK_Z2,    CLK_TYPE_GEN3_Z,
> > +                  CLK_PLL2, 2, CPG_FRQCRC, 0),
> >         DEF_FIXED("ztr",        R8A774A1_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
> >         DEF_FIXED("ztrd2",      R8A774A1_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
> >         DEF_FIXED("zt",         R8A774A1_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
> 
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> 
> > @@ -166,7 +165,7 @@ static const struct clk_ops cpg_z_clk_ops = {
> >
> >  static struct clk * __init cpg_z_clk_register(const char *name,
> >                                               const char *parent_name,
> > -                                             void __iomem *reg,
> > +                                             void __iomem *base,
> >                                               unsigned int div,
> >                                               unsigned int offset)
> >  {
> > @@ -184,10 +183,11 @@ static struct clk * __init cpg_z_clk_register(const char *name,
> >         init.parent_names = &parent_name;
> >         init.num_parents = 1;
> >
> > -       zclk->reg = reg + CPG_FRQCRC;
> > -       zclk->kick_reg = reg + CPG_FRQCRB;
> > +       zclk->reg = base + GEN3_Z_REG_OFFSET(offset);
> > +       zclk->kick_reg = base + CPG_FRQCRB;
> >         zclk->hw.init = &init;
> > -       zclk->mask = GENMASK(offset + 4, offset);
> > +       zclk->mask = GENMASK(GEN3_Z_BIT_OFFSET(offset) + 4,
> > +                            GEN3_Z_BIT_OFFSET(offset));
> 
> I think the code would be easier to read if you would move the splitting
> of offset to the caller, and thus pass separate reg_offset and bit_offset
> parameters.

Sure, that sounds reasonable.

> 
> >         zclk->fixed_div = div; /* PLLVCO x 1/div x SYS-CPU divider */
> >
> >         clk = clk_register(NULL, &zclk->hw);
> > diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
> > index a0535341b5da..02bf3785263c 100644
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.h
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.h
> > @@ -48,8 +48,16 @@ enum rcar_gen3_clk_types {
> >         DEF_BASE(_name, _id, CLK_TYPE_GEN3_RCKSEL,      \
> >                  (_parent0) << 16 | (_parent1), .div = (_div0) << 16 | (_div1))
> >
> > -#define DEF_GEN3_Z(_name, _id, _type, _parent, _div, _offset)  \
> > -       DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
> > +#define DEF_GEN3_Z_OFFSET(_reg_offset, _bit_offset) \
> > +       ((_reg_offset) << 16 | (_bit_offset) )
> > +
> > +#define GEN3_Z_REG_OFFSET(_offset) ((_offset) >> 16)
> > +
> > +#define GEN3_Z_BIT_OFFSET(_offset) ((_offset) & 0xffff)
> 
> Do you think these 3 (un)marshalling macros add much value, given they're
> used in a single place only?

Yes, they make things very clear to my mind.
But I'm open to an alternative if you have one in mind.

> 
> > +
> > +#define DEF_GEN3_Z(_name, _id, _type, _parent, _div, _reg_offset, _bit_offset)\
> > +       DEF_BASE(_name, _id, _type, _parent, .div = _div, \
> > +                .offset = DEF_GEN3_Z_OFFSET(_reg_offset, _bit_offset))
> >
> >  struct rcar_gen3_cpg_pll_config {
> >         u8 extal_div;
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
