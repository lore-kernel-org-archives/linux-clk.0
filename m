Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: dianders@chromium.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux@arm.linux.org.uk
Subject: [PATCH v2 0/2] clk: improve handling of orphan clocks
Date: Sun, 12 Apr 2015 13:36:30 +0200
Message-ID: <75204537.lSvovFhEiG@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Using orphan clocks can introduce strange behaviour as they don't have
rate information at all and also of course don't track

This v2 takes into account suggestions from Stephen Boyd to not try to
walk the clock tree at runtime but instead keep track of orphan states
on clock tree changes and making it mandatory for everybody from the
start as orphan clocks should not be used at all.


This fixes an issue on most rk3288 platforms, where some soc-clocks
are supplied by a 32khz clock from an external i2c-chip which often
is only probed later in the boot process and maybe even after the
drivers using these soc-clocks like the tsadc temperature sensor.
In this case the driver using the clock should of course defer probing
until the clock is actually usable.


changes since v1:
- track orphan status on clock tree changes instead of walking the
  tree on clk_get operations
- make get-deferals mandatory for everybody

Heiko Stuebner (2):
  clk: track the orphan status of clocks and their children
  clk: prevent orphan clocks from being used

 drivers/clk/clk.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

-- 
2.1.4
