Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34711 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756985AbcCXOBw (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 24 Mar 2016 10:01:52 -0400
MIME-Version: 1.0
In-Reply-To: <1458824442-20279-2-git-send-email-wsa@the-dreams.de>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
	<1458824442-20279-2-git-send-email-wsa@the-dreams.de>
Date: Thu, 24 Mar 2016 15:01:50 +0100
Message-ID: <CAMuHMdV04VGApxjkZCp1b9U5F0mj-1G8acMdR7pWkcaPLGx=_Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: shmobile: cpg-mssr: add generic support for
 read-only DIV6 clocks
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 24, 2016 at 2:00 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Gen3 has two clocks (OSC and R) which look like a DIV6 clock but their
> divider value is read-only and depends on MD pins at bootup. Add support
> for such clocks by reading the value and adding a fixed clock.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


-- 
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
