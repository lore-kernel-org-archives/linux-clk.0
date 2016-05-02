Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhengxing@rock-chips.com,
	zhangqing@rock-chips.com,
	tomeu.vizoso@collabora.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 0/3] clk: attempt to keep requested rate on parent changes
Date: Mon,  2 May 2016 18:36:19 +0200
Message-Id: <1462206982-10444-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

I remember reading about people discussing that problem in the past, but
haven't been able to find another approach to it yet [or I'm just blind
as happens to often].

Our problem is the following clock structure:

[anotherPLL]
    |
    ------ [div] ----- dclk_vop
    |
[   vpll   ] --------- hdmi_phy


We need to set the vpll dynamically but still want to retain

The other option that comes to mind, would be to have a clock-notifier,
in the drm driver, but calling clk_set_rate from their looks like it
shouldn't work due to the prepare mutex already being held.


The whole thing is labeled RFC because while it works for us and solves
the problem, I'm not sure if I'm overlooking some important aspect or
am interferring with some other planned approach for that issue.


Heiko Stuebner (3):
  clk: fix inconsistent use of req_rate
  clk: adjust clocks to their requested rate after parent changes
  clk: rockchip: make rk3399 vop dclks keep their rate on parent rate changes

 drivers/clk/clk.c                 | 37 +++++++++++++++++++++++++++++--------
 drivers/clk/rockchip/clk-rk3399.c |  4 ++--
 include/linux/clk-provider.h      |  1 +
 3 files changed, 32 insertions(+), 10 deletions(-)

-- 
2.8.0.rc3
