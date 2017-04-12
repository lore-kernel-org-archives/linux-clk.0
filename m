Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1491810121.3480.36.camel@baylibre.com>
Cc: "Kevin Hilman" <khilman@baylibre.com>,
 "Neil Armstrong" <narmstrong@baylibre.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <1491810121.3480.36.camel@baylibre.com>
Message-ID: <149200155158.88277.17726479755345151565@resonance>
Subject: Re: [GIT PULL] Amlogic clock driver updates for v4.12 - 2nd batch
Date: Wed, 12 Apr 2017 14:52:31 +0200
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-04-10 09:42:01)
> Dear clock maintainers,
> =

> Below is a request to pull a 2nd batch of update to the Amlogic clock dri=
ver. It
> is based on the previous PR sent by Kevin.
> =

> Cheers
> =

> The following changes since commit 3a429818a2e48928ae0114df5fb3b0612dd570=
01:
> =

> =C2=A0 Merge branch 'v4.12/clk-drivers' into v4.12/clk (2017-04-04 15:58:=
11 -0700)
> =

> are available in the git repository at:
> =

> =C2=A0 git://github.com/BayLibre/clk-meson.git tags/meson-clk-for-4.12
> =

> for you to fetch changes up to b609338b26f5653aa211fc7af83477e2df6e3f0b:
> =

> =C2=A0 clk: meson: mpll: use 64bit math in rate_from_params (2017-04-07 1=
7:45:30
> +0200)

Pulled.

Regards,
Mike

> =

> ----------------------------------------------------------------
> 2nd Amlogic clock driver update for 4.12:
> * Protect against holes in onecell_data
> * Fix divison by zero and overflow in the mpll driver
> * Add audio clock divider driver for i2s clocks
> * Add i2s and spdif master clocks
> =

> ----------------------------------------------------------------
> Jerome Brunet (6):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MAINTAINERS: Add maintainers for the =
meson clock driver
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk: meson: gxbb: protect against hol=
es in the onecell_data array
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk: meson: add audio clock divider s=
upport
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk: meson: gxbb: add cts_amclk
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk: meson: gxbb: add cts_mclk_i958
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk: meson: gxbb: add cts_i958 clock
> =

> Martin Blumenstingl (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk: meson: mpll: fix division by zer=
o in rate_from_params
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk: meson: mpll: use 64bit math in r=
ate_from_params
> =

> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A010 +++
> =C2=A0drivers/clk/meson/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +-
> =C2=A0drivers/clk/meson/clk-audio-divider.c | 144 +++++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/clk/meson/clk-mpll.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A026 +++---
> =C2=A0drivers/clk/meson/clkc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A010 +++
> =C2=A0drivers/clk/meson/gxbb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 144 +++++++++++++++++++++++++++=
+++++++
> =C2=A0drivers/clk/meson/gxbb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A09 ++-
> =C2=A07 files changed, 332 insertions(+), 13 deletions(-)
> =C2=A0create mode 100644 drivers/clk/meson/clk-audio-divider.c
