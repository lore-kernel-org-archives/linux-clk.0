Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:44207 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbeGZNb5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jul 2018 09:31:57 -0400
MIME-Version: 1.0
References: <20180725191417.3313-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180725191417.3313-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 14:15:12 +0200
Message-ID: <CAMuHMdXztHNAsOakhKF0AYy4xEPM=d=NUwZQJA=JNvW-gX1RqQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77965: Add SATA clock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jul 25, 2018 at 9:14 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds SATA clock to the R8A77965 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [wsa: rebased to upstream base]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
