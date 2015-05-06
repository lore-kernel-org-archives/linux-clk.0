Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Alex Elder <elder@linaro.org>,
	Barry Song <Baohua.Song@csr.com>,
	Chao Xie <chao.xie@marvell.com>,
	Dinh Nguyen <dinguyen@altera.com>,
	Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Jyri Sarha <jsarha@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Magnus Damm <damm@opensource.se>,
	Pawel Moll <pawel.moll@arm.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Yoshii <takasi-y@ops.dti.ne.jp>,
	Tero Kristo <t-kristo@ti.com>,
	Tim Kryger <tim.kryger@linaro.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH 00/19] Fix sparse errors in drivers/clk/
Date: Wed,  6 May 2015 00:39:37 -0700
Message-Id: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patchset fixes most of the sparse errors in drivers/clk/ that
I could find. The rest of the errors are mostly to do with conditional
locking and a couple drivers that cast an iomem pointer to an int to
compare addresses.

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Alex Elder <elder@linaro.org>
Cc: Barry Song <Baohua.Song@csr.com>
Cc: Chao Xie <chao.xie@marvell.com>
Cc: Dinh Nguyen <dinguyen@altera.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Jonas Jensen <jonas.jensen@gmail.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Magnus Damm <damm@opensource.se>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Takashi Yoshii <takasi-y@ops.dti.ne.jp>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Tim Kryger <tim.kryger@linaro.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>

Stephen Boyd (19):
  clk: gpio-gate: Don't export __init functions
  clk: Silence sparse warnings about __clk_{get,put}()
  clk: max-gen: Silence sparse warnings
  clk: bcm/kona: Silence sparse warnings
  clk: bcm/kona: Remove ccu_list
  clk: berlin: Silence sparse warning
  clk: hix5hd2: Silence sparse warnings
  clk: samsung: Silence sparse warnings
  clk: emev2: Silence sparse warnings
  clk: sirf: Silence sparse warnings
  clk: socfpga: Silence sparse warning
  clk: st: Silence sparse warnings
  clk: ti: Silence sparse warnings
  clk: versatile: Silence sparse warnings
  clk: socfpga: Silence sparse warning
  clk: mmp: Silence sparse warnings
  clk: xgene: Silence sparse warnings
  clk: moxart: Silence sparse warnings
  clk: u300: Silence sparse warnings

 drivers/clk/bcm/clk-kona-setup.c     |  4 ----
 drivers/clk/bcm/clk-kona.c           |  2 +-
 drivers/clk/bcm/clk-kona.h           |  2 --
 drivers/clk/berlin/berlin2-pll.c     |  9 +--------
 drivers/clk/clk-gpio-gate.c          |  3 +--
 drivers/clk/clk-max-gen.c            |  2 ++
 drivers/clk/clk-moxart.c             |  4 ++--
 drivers/clk/clk-u300.c               |  1 +
 drivers/clk/clk-xgene.c              | 22 ++++++++++++----------
 drivers/clk/clk.c                    |  1 +
 drivers/clk/hisilicon/clk-hix5hd2.c  |  5 +++--
 drivers/clk/mmp/clk-apbc.c           |  2 +-
 drivers/clk/mmp/clk-apmu.c           |  2 +-
 drivers/clk/samsung/clk-exynos5260.c | 26 +++++++++++++-------------
 drivers/clk/shmobile/clk-emev2.c     |  2 +-
 drivers/clk/sirf/clk-common.c        |  4 ++--
 drivers/clk/socfpga/clk-gate.c       |  2 +-
 drivers/clk/socfpga/clk-periph.c     |  2 +-
 drivers/clk/st/clk-flexgen.c         |  6 +++---
 drivers/clk/st/clkgen-fsyn.c         |  4 ++--
 drivers/clk/st/clkgen-mux.c          | 14 +++++++-------
 drivers/clk/st/clkgen-pll.c          | 10 +++++-----
 drivers/clk/ti/clk-dra7-atl.c        |  4 ++--
 drivers/clk/ti/clk.c                 |  4 ++--
 drivers/clk/ti/dpll.c                |  2 +-
 drivers/clk/ti/fapll.c               |  6 +++---
 drivers/clk/versatile/clk-sp810.c    |  4 ++--
 27 files changed, 71 insertions(+), 78 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
