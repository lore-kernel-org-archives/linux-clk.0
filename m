Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35281 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752760AbdGSI17 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2017 04:27:59 -0400
MIME-Version: 1.0
In-Reply-To: <20170718164407.22998-3-wsa+renesas@sang-engineering.com>
References: <20170718164407.22998-1-wsa+renesas@sang-engineering.com> <20170718164407.22998-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jul 2017 10:27:57 +0200
Message-ID: <CAMuHMdXxe9L15a289GP4bFP28gkotS0Hu2ngu5DHTgfpQyA4qA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] clk: renesas: rcar-gen3-cpg.c: refactor checks
 for accessing the div table
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 18, 2017 at 6:44 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Do the checks for accessing the SD divider table only when the rate gets
> updated, namely on init and set_rate. In all other cases, reuse the last
> value. This simplifies code, runtime load, and error reporting.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
