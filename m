Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?Alexander_M=C3=BCller?= <serveralex@gmail.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-8-git-send-email-serveralex@gmail.com>
In-Reply-To: <1467741391-60534-8-git-send-email-serveralex@gmail.com>
Message-ID: <146776648028.35356.7816151912503029258@resonance>
Subject: Re: [PATCH 7/7] arm: amlogic: select meson8b clk driver
Date: Tue, 05 Jul 2016 17:54:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Alex,

Quoting Alexander M=C3=BCller (2016-07-05 10:56:31)
> Select the Amlogic clk code for meson SoCs and the more specific meson8b =
clk
> driver for Amlogic meson8b.
> =

> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>

This patch isn't necessary as an alternative is already queued. See:
https://git.kernel.org/cgit/linux/kernel/git/mturquette/linux.git/commit/?h=
=3Dgxbb-dt-clk&id=3Dbae5d70ba6f8726ea6306aa07b7d2eb4357d3c81

However, if you're basing on top of clk-next (or clk-s905) then you
won't see the three patches linked above because they are queued through
Kevin & Carlo via the amlogic tree.

Regards,
Mike

> ---
>  arch/arm/mach-meson/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
> index 31bdd91..b3add39 100644
> --- a/arch/arm/mach-meson/Kconfig
> +++ b/arch/arm/mach-meson/Kconfig
> @@ -7,6 +7,7 @@ menuconfig ARCH_MESON
>         select CACHE_L2X0
>         select PINCTRL
>         select PINCTRL_MESON
> +       select COMMON_CLK_AMLOGIC
>  =

>  if ARCH_MESON
>  =

> @@ -24,5 +25,6 @@ config MACH_MESON8B
>         bool "Amlogic Meson8b SoCs support"
>         default ARCH_MESON
>         select MESON6_TIMER
> +       select COMMON_CLK_MESON8B
>  =

>  endif
> -- =

> 2.5.0
>=20
