Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1526388874.2897.44.camel@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <1526388874.2897.44.camel@baylibre.com>
Message-ID: <152642473300.237094.3319917631211921228@swboyd.mtv.corp.google.com>
Subject: Re: [GIT PULL]  clk: meson: updates for v4.18
Date: Tue, 15 May 2018 15:52:13 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-05-15 05:54:34)
> Dear clock maintainers,
> =

> Below is a request to pull amlogic clock updates for v4.18. Apart from th=
e usual
> clock additions, there was a rework of the AO clock controller found on t=
he gxbb
> SoC family. This has been done to improve code re-usability before introd=
ucing a
> very similar controller for the axg SoC family.
> =

> Cheers
> Jerome
> =

> The following changes since commit 60cc43fc888428bb2f18f08997432d426a2433=
38:
> =

>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
> =

> are available in the Git repository at:
> =

>   git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.18-1
> =

> for you to fetch changes up to 24a2e6796eb23d17d4e32a27f19336248666272c:
> =

>   clk: meson: drop CLK_SET_RATE_PARENT flag (2018-05-15 14:19:43 +0200)
> =

> ----------------------------------------------------------------
> First round of update for meson clocks targeted at v4.18:
> * Add meson8b nand clocks
> * Add gxbb video decoder clocks
> * Rework of gxbb AO clock controller code to allow code reuse
> * Add axg AO clock controller

Thanks. Pulled into clk-next.
