Return-Path: <p.zabel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Barry Song <baohua@kernel.org>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/7] clk: Make reset_control_ops const
Date: Thu, 25 Feb 2016 10:45:05 +0100
Message-Id: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

Since commit 203d4f347d86 ("reset: Make reset_control_ops const") marked
the ops pointer in struct reset_controller_dev as const, these structs
can be made const, too. The commit is currently sitting in the
arm-soc/for-next branch.

regards
Philipp

Philipp Zabel (7):
  clk: mediatek: Make reset_control_ops const
  clk: mmp: Make reset_control_ops const
  clk: rockchip: Make reset_control_ops const
  clk: atlas7: Make reset_control_ops const
  clk: sunxi: Make reset_control_ops const
  clk: tegra: Make reset_control_ops const
  clk: qcom: Make reset_control_ops const

 drivers/clk/mediatek/reset.c      | 2 +-
 drivers/clk/mmp/reset.c           | 2 +-
 drivers/clk/qcom/reset.c          | 2 +-
 drivers/clk/qcom/reset.h          | 2 +-
 drivers/clk/rockchip/softrst.c    | 2 +-
 drivers/clk/sirf/clk-atlas7.c     | 2 +-
 drivers/clk/sunxi/clk-a10-ve.c    | 2 +-
 drivers/clk/sunxi/clk-sun9i-mmc.c | 2 +-
 drivers/clk/sunxi/clk-usb.c       | 2 +-
 drivers/clk/tegra/clk.c           | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.7.0
