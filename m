Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:35911 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751406AbdFZRjA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2017 13:39:00 -0400
MIME-Version: 1.0
In-Reply-To: <20170626172652.28018-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170626172652.28018-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jun 2017 19:38:58 +0200
Message-ID: <CAMuHMdWkgeuMGhpMrYJhh9XDSEzPv48tkTeGOW9FQvukU+oaXg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add PWM clock
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 26, 2017 at 7:26 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -152,6 +152,7 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>         DEF_MOD("hscif1",                519,   R8A7796_CLK_S3D1),
>         DEF_MOD("hscif0",                520,   R8A7796_CLK_S3D1),
>         DEF_MOD("thermal",               522,   R8A7796_CLK_CP),
> +       DEF_MOD("pwm",                   523,   R8A7796_CLK_S0D12),

Cfr. commit a0b381fafffaf07c ("clk: renesas: r8a7796: Add PWM clock")
in clk-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
