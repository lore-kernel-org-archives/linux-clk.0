Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57083 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751308AbdFZS0O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2017 14:26:14 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add PWM clock
Date: Mon, 26 Jun 2017 21:26:14 +0300
Message-ID: <1669418.PM0r6WOmIk@avalon>
In-Reply-To: <CAMuHMdWkgeuMGhpMrYJhh9XDSEzPv48tkTeGOW9FQvukU+oaXg@mail.gmail.com>
References: <20170626172652.28018-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWkgeuMGhpMrYJhh9XDSEzPv48tkTeGOW9FQvukU+oaXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On Monday 26 Jun 2017 19:38:58 Geert Uytterhoeven wrote:
> On Mon, Jun 26, 2017 at 7:26 PM, Laurent Pinchart wrote:
> > --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> > @@ -152,6 +152,7 @@ static const struct mssr_mod_clk r8a7796_mod_clks[]
> > __initconst = {> 
> >         DEF_MOD("hscif1",                519,   R8A7796_CLK_S3D1),
> >         DEF_MOD("hscif0",                520,   R8A7796_CLK_S3D1),
> >         DEF_MOD("thermal",               522,   R8A7796_CLK_CP),
> > 
> > +       DEF_MOD("pwm",                   523,   R8A7796_CLK_S0D12),
> 
> Cfr. commit a0b381fafffaf07c ("clk: renesas: r8a7796: Add PWM clock")
> in clk-next.

Same mistake twice... I wonder why I failed to find that one :-/ Sorry about 
the noise.

-- 
Regards,

Laurent Pinchart

