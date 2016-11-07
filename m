Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:37441 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751541AbcKGL0I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Nov 2016 06:26:08 -0500
MIME-Version: 1.0
In-Reply-To: <1478267887-30512-1-git-send-email-horms+renesas@verge.net.au>
References: <1478267887-30512-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2016 11:20:50 +0100
Message-ID: <CAMuHMdX_cWjM_DJ5msCA=rCUFsrpAgG=ejXOLbq7ELMHFyP8sw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7795: Fix HDMI parent clock
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Nov 4, 2016 at 2:58 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Correct HDMI parent clock so that the rate of the
> HDMI clock is 1/4 rather than 1/2 of the rate of PLL1
> as per the v0.52 (Jun, 15) manual.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
