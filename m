Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36841 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751170AbcDZKXv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 26 Apr 2016 06:23:51 -0400
MIME-Version: 1.0
In-Reply-To: <1461584360-32547-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1461584360-32547-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Date: Tue, 26 Apr 2016 12:23:50 +0200
Message-ID: <CAMuHMdW6RWgMnPnVdsw0x4bonteDCXaX4SqD0HsrSaGEja_dDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: shmobile: r8a7795: Add CSI2 clocks
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Apr 25, 2016 at 1:39 PM, Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index b2198aef..005b323 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -113,6 +113,7 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>         DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
>         DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
>         DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
> +       DEF_DIV6P1("csi0",      R8A7795_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),

The above hunk didn't apply, but I fixed it up.

s/shmobile/renesas/, and applied to clk-renesas-for-v4.7 and renesas-drivers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
