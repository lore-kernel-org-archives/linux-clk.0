Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531140923.2708.19.camel@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <1531140923.2708.19.camel@baylibre.com>
Message-ID: <153115528186.143105.10978033720652183122@swboyd.mtv.corp.google.com>
Subject: Re: [GIT PULL]  clk: meson: updates for v4.19
Date: Mon, 09 Jul 2018 09:54:41 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-07-09 05:55:23)
> Dear clock maintainers,
> =

> Below is a request to pull a first round of Amlogic  clock updates for
> v4.19. It is based on our previous fixes PR (meson-clk-fixes-4.18-1) to
> avoid conflicts while removing the audio divider driver.
> =

> Also, we had to pull your 'clk-core-duty-cycle' branch because the audio
> sclk divider driver implements duty cycle operation. This explains the
> changes reported in CCF core files in the summary below. =

> =


Thanks. Pulled into clk-next.
