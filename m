Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160705195537.GA17805@lukather>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>,
 "Chen-Yu Tsai" <wens@csie.org>
References: <20160705195537.GA17805@lukather>
Message-ID: <146776432067.35356.1674013489826255803@resonance>
Subject: Re: [GIT PULL] Allwinner clock fixes for 4.7
Date: Tue, 05 Jul 2016 17:18:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2016-07-05 12:55:37)
> Hi Mike, Stephen,
> =

> Please pull the following fixes for the 4.7 cycle.

Pulled.

Regards,
Mike

> =

> Thanks!
> Maxime
> =

> The following changes since commit 1a695a905c18548062509178b98bc91e675108=
64:
> =

>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> =

> are available in the git repository at:
> =

>   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/=
sunxi-clk-fixes-for-4.7
> =

> for you to fetch changes up to 9ca91a65583c73e4be6e9f53323a7ae04e6803ef:
> =

>   clk: sunxi: remove unused variable (2016-06-16 09:18:29 +0200)
> =

> ----------------------------------------------------------------
> Allwinner clock fixes for 4.7
> =

> A bunch of changes for the display clocks merged in 4.7
> =

> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       clk: sunxi: remove unused variable
> =

> Maxime Ripard (2):
>       clk: sunxi: tcon-ch1: Do not return a negative error in get_parent
>       clk: sunxi: display: Add per-clock flags
> =

>  drivers/clk/sunxi/clk-sun4i-display.c  | 5 ++++-
>  drivers/clk/sunxi/clk-sun4i-tcon-ch1.c | 4 ----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> =

> -- =

> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
