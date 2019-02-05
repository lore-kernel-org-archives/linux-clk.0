Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E61C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 14:55:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 585592081B
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 14:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfBEOzX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 09:55:23 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46127 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfBEOzW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 09:55:22 -0500
Received: by mail-ua1-f67.google.com with SMTP id v24so1173385uap.13;
        Tue, 05 Feb 2019 06:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1hdARXRKG25vztFd1aWw+hSOxjnBhm1vOlvyyLpFzZY=;
        b=DmUtgpC1kb6omMeRu3bXtsE+L4fqMWIDgTSW4lQrquGq1SJ+bB0kjF0VvcrDdsr7Ia
         VYIyFeGanCRt+EX/WLlwemlwXh2c9SnspS5wy3tONUPYliIE1lbNmzW+pu3iBsjLAS43
         ArAusXd/q5T271TIrkWpaI30/bltl0Az3Azs/6phjsdw0llMAIJjWWbDeOo44MiSf6TA
         VKo81maGPhB5g/nZ0H84BGmgF+n3KmSHhCAU91w7Oe71NxenD6nJBVVaC+vnReTHy7Y1
         /EERK4+lbq9LqJ+DEdtOAdgmNR7smeaU2guBrZv4CSULZApWbshUGQgsiiLlSx91ywjj
         EeYg==
X-Gm-Message-State: AHQUAubJlgudiMw5eMEqfNZSgurCaSDWv38RGcbXXK3rm+8vWpkoNYag
        o8v7FZ1IQ3T2vGzeKtL9bvOT95xw96OaZ4VcXxs=
X-Google-Smtp-Source: AHgI3Ib1GdCQvU6mwCfUeTeqSTN2aQI2GpfuntHQXNexZ9jocv3aIvpG5qb+jJ1jpzzgDufxw4boX7OnJRrkdUQxzWc=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr2083925uap.0.1549378521305;
 Tue, 05 Feb 2019 06:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20190131094021.3092-1-horms+renesas@verge.net.au>
 <20190131094021.3092-3-horms+renesas@verge.net.au> <CAMuHMdXsQ_e3=9q8EJVcK3L5BSNGQDux4tGe+sxLJPgFFVEtZQ@mail.gmail.com>
 <20190205143558.jhfy2atkcml7t5fd@verge.net.au>
In-Reply-To: <20190205143558.jhfy2atkcml7t5fd@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 15:55:08 +0100
Message-ID: <CAMuHMdWjv6rL5dNe3n3MZWynQ3eYT57gTM7ZrDyQ8EDZO=C+UA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] clk: renesas: rcar-gen3: Parameterise Z and Z2
 clock offset
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Tue, Feb 5, 2019 at 3:36 PM Simon Horman <horms@verge.net.au> wrote:
> On Tue, Feb 05, 2019 at 11:48:06AM +0100, Geert Uytterhoeven wrote:
> > On Thu, Jan 31, 2019 at 10:40 AM Simon Horman
> > <horms+renesas@verge.net.au> wrote:
> > > Parameterise the offset of control bits within the FRQCRC register
> > > for Z and Z2 clocks.
> > >
> > > This is in preparation for supporting the Z2 clock on the R-Car E3
> > > (r8a77990) SoC which uses a different offset for control bits to
> > > other, already, supported SoCs.
> > >
> > > This mechanism should be extendable to other clocks, such as ZG,
> > > f.e. by adding the number of control bits as a parameter to
> > > cpg_z_clk_register().
> > >
> > > As suggested by Geert Uytterhoeven.
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> >
> > > @@ -568,14 +566,9 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
> > >                 break;
> > >
> > >         case CLK_TYPE_GEN3_Z:
> > > -               return cpg_z_clk_register(core->name, __clk_get_name(parent),
> > > -                                         base, CPG_FRQCRC_ZFC_MASK,
> > > -                                         core->div);
> > > -
> > >         case CLK_TYPE_GEN3_Z2:
> > >                 return cpg_z_clk_register(core->name, __clk_get_name(parent),
> > > -                                         base, CPG_FRQCRC_Z2FC_MASK,
> > > -                                         core->div);
> > > +                                         base, core->div, core->offset);
> >
> > CLK_TYPE_GEN3_Z and CLK_TYPE_GEN3_Z2 are now the same type.
> > Perhaps they can be merged completely, and be absorbed into the
> > DEF_GEN3_Z() macro?
> > Or not, depending on how ZG support will be added...
>
> Strange, I did have them merged locally and I think that is the right thing
> to do, but some how this version got posted. I think that if they
> subsequently need to be re-split then so be it. But lets not jump
> to conclusions.
>
> I'll plan on posting v4 unless you object.

OK, eagerly awaiting an even more improved version!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
