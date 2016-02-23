Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:35240 "EHLO
	mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932551AbcBWIRs (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2016 03:17:48 -0500
MIME-Version: 1.0
In-Reply-To: <1456189051-519-1-git-send-email-horms+renesas@verge.net.au>
References: <1456189051-519-1-git-send-email-horms+renesas@verge.net.au>
Date: Tue, 23 Feb 2016 09:17:47 +0100
Message-ID: <CAMuHMdX+FbJ=nhw8MSKLXyc0yRt7gUBQ7nvBsHqMjHhMDKkmDQ@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: Remove ARCH_SHMOBILE_MULTI
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Feb 23, 2016 at 1:57 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> As of 9b5ba0df4ea4 ("ARM: shmobile: Introduce ARCH_RENESAS") all platforms
> that use Renesas clock drivers now select ARCH_RENESAS. As it is present in
> drivers/clk/Makefile ARCH_SHMOBILE_MULTI may now be removed.
>
> This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/clk/Makefile | 1 -
>  1 file changed, 1 deletion(-)

> -obj-$(CONFIG_ARCH_SHMOBILE_MULTI)      += shmobile/
>  obj-$(CONFIG_ARCH_RENESAS)             += shmobile/

Should we rename clk/shmobile/ to clk/renesas/?
Or is that too much of a hassle?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
