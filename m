Return-Path: <huanglin821201@gmail.com>
Return-Path: <huanglin821201@gmail.com>
From: Lin Huang <hl@rock-chips.com>
To: heiko@sntech.de,
	mark.yao@rock-chips.com,
	myungjoo.ham@samsung.com
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kyungmin.park@samsung.com,
	dianders@chromium.org,
	dbasehore@chromium.org,
	huangtao@rock-chips.com,
	typ@rock-chips.com,
	Lin Huang <hl@rock-chips.com>
Subject: [RFC PATCH v1 0/6] rk3399 support ddr frequency scaling
Date: Fri,  3 Jun 2016 17:55:13 +0800
Message-Id: <1464947719-6245-1-git-send-email-hl@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

rk3399 platform have dfi controller can monitor ddr load,
and dcf controller to handle ddr register so we can get the
right ddr frequency and make ddr controller happy work(which
will implement in bl31). So we do ddr frequency scaling with
following flow:

	     kernel                                bl31

	monitor ddr load
		|
		|
	get_target_rate
		|
		|           pass rate to bl31
	clk_set_rate(ddr) --------------------->run dcf flow
		|                                   |
		|                                   |
	wait dcf interrupt<-------------------trigger dcf interrupt  
		|
		|
	      return

Lin Huang (6):
  rockchip: rockchip: add new clock-type for the ddrclk
  clk: rockchip: rk3399: add SCLK_DDRCLK ID for ddrc
  clk: rockchip: rk3399: add ddrc clock support
  PM / devfreq: event: support rockchip dfi controller
  PM / devfreq: rockchip: add devfreq driver for rk3399 dmc
  drm/rockchip: Add dmc notifier in vop driver

 drivers/clk/rockchip/Makefile               |   1 +
 drivers/clk/rockchip/clk-ddr.c              | 147 ++++++++++++
 drivers/clk/rockchip/clk-rk3399.c           |  20 ++
 drivers/clk/rockchip/clk.c                  |   9 +
 drivers/clk/rockchip/clk.h                  |  27 +++
 drivers/devfreq/Kconfig                     |   1 +
 drivers/devfreq/Makefile                    |   1 +
 drivers/devfreq/event/Kconfig               |   7 +
 drivers/devfreq/event/Makefile              |   1 +
 drivers/devfreq/event/rockchip-dfi.c        | 265 ++++++++++++++++++++++
 drivers/devfreq/rockchip/Kconfig            |  15 ++
 drivers/devfreq/rockchip/Makefile           |   2 +
 drivers/devfreq/rockchip/rk3399_dmc.c       | 337 ++++++++++++++++++++++++++++
 drivers/devfreq/rockchip/rockchip_dmc.c     | 143 ++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  43 +++-
 include/dt-bindings/clock/rk3399-cru.h      |   1 +
 include/soc/rockchip/rockchip_dmc.h         |  45 ++++
 17 files changed, 1063 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/rockchip/clk-ddr.c
 create mode 100644 drivers/devfreq/event/rockchip-dfi.c
 create mode 100644 drivers/devfreq/rockchip/Kconfig
 create mode 100644 drivers/devfreq/rockchip/Makefile
 create mode 100644 drivers/devfreq/rockchip/rk3399_dmc.c
 create mode 100644 drivers/devfreq/rockchip/rockchip_dmc.c
 create mode 100644 include/soc/rockchip/rockchip_dmc.h

-- 
1.9.1
