Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:33026 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753139AbdGSHxM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2017 03:53:12 -0400
MIME-Version: 1.0
In-Reply-To: <20170718164407.22998-2-wsa+renesas@sang-engineering.com>
References: <20170718164407.22998-1-wsa+renesas@sang-engineering.com> <20170718164407.22998-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jul 2017 09:53:11 +0200
Message-ID: <CAMuHMdW8Qcay5NpExsVrXfMOZq0-2Hxrg3v42egBASMY0V_tcQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] clk: renesas: rcar-gen3-cpg: drop superfluous variable
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 18, 2017 at 6:44 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> 'rate' is not used, so we can use 'parent_rate' directly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-4.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
