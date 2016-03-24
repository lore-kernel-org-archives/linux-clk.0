Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:38298 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751789AbcCXOBZ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 24 Mar 2016 10:01:25 -0400
MIME-Version: 1.0
In-Reply-To: <1458823841-19899-1-git-send-email-wsa@the-dreams.de>
References: <1458823841-19899-1-git-send-email-wsa@the-dreams.de>
Date: Thu, 24 Mar 2016 15:01:23 +0100
Message-ID: <CAMuHMdXcztj9+icsPVR4mxcCLz8J3YsDAKgaMuSEe7r3dY8vTA@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: r8a7795: make SD clk definition specific
 for GEN3
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 24, 2016 at 1:50 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> About SD clocks: The clock type is Gen3 specific, the callbacks are all
> Gen3 specific; I think the clock definition should also be Gen3 specific
> and not in the general header file.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue for clk-renesas-for-v4.7 and next renesas-drivers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
