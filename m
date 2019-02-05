Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE932C282D7
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 15:14:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD8CA217F9
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 15:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kU/ICkYh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbfBEPOQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 10:14:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51859 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfBEPOQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 10:14:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CAC8F25B7E9;
        Wed,  6 Feb 2019 02:14:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549379653; bh=cA19IS49em/+b1ISn48QYFyMoBGCqYXzoJDb2avlqgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kU/ICkYhdsWxC5ilxznVDEKNR3tk7n42PRxghteMX0LXyd58Cxei79uRVNeRzUzx9
         BsasZoogQ+Mhbjmuq9xhFDzlDUjGNuPIXyRO6Nw5PavZfo0qL4rji/wg8xQ7wg+tgS
         fAqcEMMdVYXDc9CQk7QnbvkdZAurXRhdjrPTRXsc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 043C0940486; Tue,  5 Feb 2019 16:14:10 +0100 (CET)
Date:   Tue, 5 Feb 2019 16:14:10 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v3 2/5] clk: renesas: rcar-gen3: Parameterise Z and Z2
 clock offset
Message-ID: <20190205151410.bqr7dpz6ws2lttzf@verge.net.au>
References: <20190131094021.3092-1-horms+renesas@verge.net.au>
 <20190131094021.3092-3-horms+renesas@verge.net.au>
 <CAMuHMdXsQ_e3=9q8EJVcK3L5BSNGQDux4tGe+sxLJPgFFVEtZQ@mail.gmail.com>
 <20190205143558.jhfy2atkcml7t5fd@verge.net.au>
 <CAMuHMdWjv6rL5dNe3n3MZWynQ3eYT57gTM7ZrDyQ8EDZO=C+UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWjv6rL5dNe3n3MZWynQ3eYT57gTM7ZrDyQ8EDZO=C+UA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 05, 2019 at 03:55:08PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Feb 5, 2019 at 3:36 PM Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Feb 05, 2019 at 11:48:06AM +0100, Geert Uytterhoeven wrote:
> > > On Thu, Jan 31, 2019 at 10:40 AM Simon Horman
> > > <horms+renesas@verge.net.au> wrote:
> > > > Parameterise the offset of control bits within the FRQCRC register
> > > > for Z and Z2 clocks.
> > > >
> > > > This is in preparation for supporting the Z2 clock on the R-Car E3
> > > > (r8a77990) SoC which uses a different offset for control bits to
> > > > other, already, supported SoCs.
> > > >
> > > > This mechanism should be extendable to other clocks, such as ZG,
> > > > f.e. by adding the number of control bits as a parameter to
> > > > cpg_z_clk_register().
> > > >
> > > > As suggested by Geert Uytterhoeven.
> > > >
> > > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > >
> > > > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > > > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> > >
> > > > @@ -568,14 +566,9 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
> > > >                 break;
> > > >
> > > >         case CLK_TYPE_GEN3_Z:
> > > > -               return cpg_z_clk_register(core->name, __clk_get_name(parent),
> > > > -                                         base, CPG_FRQCRC_ZFC_MASK,
> > > > -                                         core->div);
> > > > -
> > > >         case CLK_TYPE_GEN3_Z2:
> > > >                 return cpg_z_clk_register(core->name, __clk_get_name(parent),
> > > > -                                         base, CPG_FRQCRC_Z2FC_MASK,
> > > > -                                         core->div);
> > > > +                                         base, core->div, core->offset);
> > >
> > > CLK_TYPE_GEN3_Z and CLK_TYPE_GEN3_Z2 are now the same type.
> > > Perhaps they can be merged completely, and be absorbed into the
> > > DEF_GEN3_Z() macro?
> > > Or not, depending on how ZG support will be added...
> >
> > Strange, I did have them merged locally and I think that is the right thing
> > to do, but some how this version got posted. I think that if they
> > subsequently need to be re-split then so be it. But lets not jump
> > to conclusions.
> >
> > I'll plan on posting v4 unless you object.
> 
> OK, eagerly awaiting an even more improved version!

Sorry, I was confused (as is often the case).

I think that removing the duplicate code, as I have above,
is the right thing to do at this point as I do entirely
expect the CLK_TYPE_GEN3_Z and CLK_TYPE_GEN3_Z2 cases
to diverge again when we add ZG support.
