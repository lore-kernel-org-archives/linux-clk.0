Return-Path: <carlo.caione@gmail.com>
MIME-Version: 1.0
Sender: carlo.caione@gmail.com
In-Reply-To: <1454879583-27036-1-git-send-email-afaerber@suse.de>
References: <1454879583-27036-1-git-send-email-afaerber@suse.de>
Date: Mon, 8 Feb 2016 09:34:19 +0100
Message-ID: <CAOQ7t2YwHa7cJdqv4m8rPx50ZnFZJJzcU2AjtE=Q2AYEAf84hg@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: Fix meson_clk_register_clks() signature type mismatch
From: Carlo Caione <carlo@caione.org>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Carlo Caione <carlo@caione.org>,
	Matthias Brugger <mbrugger@suse.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sun, Feb 7, 2016 at 10:13 PM, Andreas F=C3=A4rber <afaerber@suse.de> wro=
te:
> As preparation for arm64 based mesongxbb, which pulls in this code once
> enabling ARCH_MESON, fix a size_t vs. unsigned int type mismatch.
> The loop uses a local unsigned int variable, so adopt that type,
> matching the header.
>
> Fixes: 7a29a869434e ("clk: meson: Add support for Meson clock controller"=
)
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  drivers/clk/meson/clkc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clkc.c b/drivers/clk/meson/clkc.c
> index c83ae1367abc..d920d410b51d 100644
> --- a/drivers/clk/meson/clkc.c
> +++ b/drivers/clk/meson/clkc.c
> @@ -198,7 +198,7 @@ meson_clk_register_fixed_rate(const struct clk_conf *=
clk_conf,
>  }
>
>  void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
> -                                   size_t nr_confs,
> +                                   unsigned int nr_confs,
>                                     void __iomem *clk_base)
>  {
>         unsigned int i;

Nit: I'd prefer to fix declaration in drivers/clk/meson/clkc.h with
size_t since we are going to use it for array indexing.

Also please, CC linux-meson@googlegroups.com on meson related patches.

Thanks!

--=20
Carlo Caione
