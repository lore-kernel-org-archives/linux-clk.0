Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:33551 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760365AbcDFHxP (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 6 Apr 2016 03:53:15 -0400
MIME-Version: 1.0
In-Reply-To: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
References: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
Date: Wed, 6 Apr 2016 09:53:08 +0200
Message-ID: <CAMuHMdV4ajNn4bxXqs8ETRSaNxyV1Bx4hORWw1Eb7=jEmoP41w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] clk: renesas: r8a7795: add clocks for the watchdogs
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Wolfram,

On Wed, Mar 30, 2016 at 4:58 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> Okay, here is the again updated series. And rebased to latest renesas-drivers
> (renesas-drivers-2016-03-29-v4.6-rc1). Tested with both parent clocks for R.
> Still works fine.

Thanks!

> Wolfram Sang (5):
>   clk: renesas: cpg-mssr: add generic support for read-only DIV6 clocks
>   clk: renesas: r8a7795: add OSC and RINT clocks
>   clk: renesas: r8a7795: add R clk
>   clk: renesas: r8a7795: add stop for R clk

I've queued up the 4 patches above in clk-renesas-for-v4.7, after changing
the one-line summary for the last patch to "clk: renesas: r8a7795: add RWDT
clock".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
