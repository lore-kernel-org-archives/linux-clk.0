Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:38099 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751548AbdGSH6B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2017 03:58:01 -0400
MIME-Version: 1.0
In-Reply-To: <20170718164407.22998-1-wsa+renesas@sang-engineering.com>
References: <20170718164407.22998-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jul 2017 09:57:59 +0200
Message-ID: <CAMuHMdU+Sgk_TGDqGRfOVHy6cByw1au0cBzmK_t_zTS00Fu2OA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] clk: renesas: rcar-gen3-cpg: refactor accessing
 the SD div table
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Wolfram,

On Tue, Jul 18, 2017 at 6:44 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Here is a patch series trying to implement the conclusions about accessing the
> SD divider table, coming from this discussion [1]. Patch 1 is a tiny, yet
> seperate cleanup. Patch 2 is the bulk of the work doing the checks only when needed.
> I think the code looks much better now.
>
> I tested this on a Salvator-X (R-Car M3-W) with highspeed and UHS SD cards. I
> could access them and checksum files. I also did not notice any performance
> regressions. There are also no WARNings in the boot log.
>
> Please let me know if this is what you had in mind and if you can think of
> other ways of testing this change.

Thank you, looks great!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
