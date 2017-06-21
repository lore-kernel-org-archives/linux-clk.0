Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34699 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751742AbdFUJQ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2017 05:16:28 -0400
MIME-Version: 1.0
In-Reply-To: <20170621090150.3868-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621090150.3868-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jun 2017 11:16:26 +0200
Message-ID: <CAMuHMdWScq8wOunFjPgDL7-qPUuteEdPkcR_JeOXes9xyWHCiQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add HDMI clocks
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Laurent,

On Wed, Jun 21, 2017 at 11:01 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add the HDMI and HDMI0 clocks to the R8A7796 CPG/MSSR driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> Hi Geert,
>
> I'd like to upstream HDMI output support on M3-W in v4.14. To ease dependency
> handling, it would be great if this patch could already make it to v4.13.

I believe a similar patch is already in clk-next, destined for v4.13?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
