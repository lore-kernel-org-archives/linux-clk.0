Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <3059c91b-034c-3da3-9ca4-06ad11bcec42@baylibre.com>
Cc: jbrunet@baylibre.com, linux-clk@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "Tobias Regnery" <tobias.regnery@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <3059c91b-034c-3da3-9ca4-06ad11bcec42@baylibre.com>
Message-ID: <149574669436.52617.1861172521136194942@resonance>
Subject: Re: [GIT PULL] Meson Kconfig fixes for 4.12-rc1
Date: Thu, 25 May 2017 14:11:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Neil Armstrong (2017-05-16 02:14:55)
> Hi Mike, Stephen,
> =

> Here is a single fix for the Meson Kconfig, that could go for 4.12-rc2.
> =

> Thanks,
> Neil
> =

> The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43=
f6:
> =

>   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> =

> are available in the git repository at:
> =

>   git://github.com/baylibre/clk-meson.git tags/meson-clk-fixes-for-4.12-r=
c2
> =

> for you to fetch changes up to dbed87a9d3a857a86f602775b5845f5f6d9652b5:
> =

>   clk: meson: gxbb: fix build error without RESET_CONTROLLER (2017-05-16 =
11:05:01 +0200)

Pulled into clk-fixes.

Regards,
Mike

> =

> ----------------------------------------------------------------
> KConfig fix:
> - clk: meson: gxbb: fix build error without RESET_CONTROLLER
> =

> ----------------------------------------------------------------
> Tobias Regnery (1):
>       clk: meson: gxbb: fix build error without RESET_CONTROLLER
> =

>  drivers/clk/meson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
