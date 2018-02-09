Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:33572 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751151AbeBIPvx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Feb 2018 10:51:53 -0500
MIME-Version: 1.0
In-Reply-To: <20180129180154.29626-2-horms+renesas@verge.net.au>
References: <20180129180154.29626-1-horms+renesas@verge.net.au> <20180129180154.29626-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Feb 2018 16:51:51 +0100
Message-ID: <CAMuHMdU11h-iTQtfRJk7_F1UzkzLPJTNFZErs+Vtf9mnmsVT_A@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] clk: renesas: rcar-gen3: Add Z clock divider support
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 29, 2018 at 7:01 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds Z clock divider support for R-Car Gen3 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I.e. will queue in clk-renesas-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
