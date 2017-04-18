Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34311 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752902AbdDRNm1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2017 09:42:27 -0400
MIME-Version: 1.0
In-Reply-To: <20170416165709.27449-1-marek.vasut+renesas@gmail.com>
References: <20170416165709.27449-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Apr 2017 15:42:25 +0200
Message-ID: <CAMuHMdWLWTpH27Zbwdf4SfQ-Ws2PC0sqwFPQrL3Ndry9-KeWTg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: r8a7791: add GyroADC clock
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Apr 16, 2017 at 6:57 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Add the GyroADC clock to the R8A7791 device tree.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
