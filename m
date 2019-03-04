Return-Path: <SRS0=1i5z=RH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A2FC10F03
	for <linux-clk@archiver.kernel.org>; Mon,  4 Mar 2019 10:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8715208E4
	for <linux-clk@archiver.kernel.org>; Mon,  4 Mar 2019 10:05:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfCDKFA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:05:00 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:44558 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfCDKFA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Mar 2019 05:05:00 -0500
Received: by mail-vk1-f195.google.com with SMTP id w85so989008vkw.11;
        Mon, 04 Mar 2019 02:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrOjmrpU/zSVGEfsYuKQOlM7nLLpK8rzakLMAP1C8PM=;
        b=b8I1g9ZwN1aBXBWtCr2eCDGfg/08ic14Q8+StMAF5/sJCAJB4im17u3eeCuh6bsce2
         938hHvInPUHxfsi/QSL4Xb+gacbTRHLebxC6iyaPr8rhJJRMI6uBkxKza56ROJqq/iQB
         UxbduOKRvhE978l5ZjV47pGQPsEQHnVlRMD69n8jKvodtKpa5NpoZgVkIcuVdgJncGME
         Ga8V10trodL0I+9U8hXcu4GPV6agvnK6OnAMuAVw4WAxIZv6TY5GS7yF1yRvYi4t8Qb1
         9wFsZX+mwWfm4Uf6r22jaamKQu6lMyg9/YGInK0vp/xZWXwPtOAXM4/NHja0vPfNMntE
         fr3A==
X-Gm-Message-State: APjAAAW5fojXVmJQgzv4Do3vlbzDyAFzY7mYIvED+RcUEY0dq/ZzzOxD
        EqZZRZCpx4L58oiTahlifClYg29lmsHH8O3/Od3FrA==
X-Google-Smtp-Source: APXvYqwoq+DOw8QCUZCfGMVub9TsfD66byRdJdDRBJr+tEhtrqcQY/3QWumB0dEwEQSsnqCVHmtiEe6BiIi7C3W0uCM=
X-Received: by 2002:a1f:711:: with SMTP id 17mr9812191vkh.65.1551693898615;
 Mon, 04 Mar 2019 02:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20190228135246.31714-1-horms+renesas@verge.net.au>
 <20190228135246.31714-3-horms+renesas@verge.net.au> <CAMuHMdU8AWAWjGHQC6tJnxqZRU1W+LmLvnw0nhWqNAKotGApMw@mail.gmail.com>
 <20190304094517.xlr73yi2chkf3qvi@verge.net.au>
In-Reply-To: <20190304094517.xlr73yi2chkf3qvi@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Mar 2019 11:04:46 +0100
Message-ID: <CAMuHMdU6TXTQWvWq6jVLwwUAom6qpt0UQAjvjvut5s+zN5-30Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a77990: Add ZG clock
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Mon, Mar 4, 2019 at 10:45 AM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Mar 01, 2019 at 01:52:50PM +0100, Geert Uytterhoeven wrote:
> > On Thu, Feb 28, 2019 at 2:52 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > Adds support for R-Car E3 (r8a77990) ZG clock.
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > ---
> > > Tested on Ebisu to the extent that the clock rate is 600MHz on boot
> > > ---
> > >  drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 ++
> > >  drivers/clk/renesas/rcar-gen3-cpg.c     | 1 -
> > >  drivers/clk/renesas/rcar-gen3-cpg.h     | 1 +
> > >  3 files changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> > > index 0e475dcb68b9..d0d29fc942ff 100644
> > > --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> > > +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> > > @@ -83,6 +83,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
> > >         DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
> > >         DEF_GEN3_Z("z2",       R8A77990_CLK_Z2,    CLK_TYPE_GEN3_Z, CLK_PLL0,
> > >                    4, CPG_FRQCRC, 8),
> > > +       DEF_GEN3_Z("zg",       R8A77990_CLK_ZG,    CLK_TYPE_GEN3_Z, CLK_PLL0,
> > > +                  8, CPG_FRQCRB, 24),
> >
> > While this approach may be correct for R-Car H3, M3-W, and M3-N, this is
> > not correct for R-Car E3, due to the presence of Spread Spectrum Clock
> > Generator support:
> >   - When SCCG is enabled (MD12=1), the parent clock is either S0 or S1,
> >     with only 2 or 3 (out of 32) supported dividers,
> >   - When SCCG is disabled (MD12=0), the parent clock is PLL0, with only
> >     2 (out of 32) supported dividers.
> >
> > So I'm afraid the ZG clock on SCCG-capable SoCs needs its own very special
> > clock type.
>
> Thanks for pointing this out, I'll investigate further.

Given MD12 is sampled a reset time, there's no need to handle both cases
at runtime. I.e. if MD12=0, you can register a simple clock with one parent
and two dividers. If MD12=1, you can register a more complex custom clock
with two parents and 2 or 3 dividers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
