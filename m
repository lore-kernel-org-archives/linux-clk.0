Return-Path: <david@lechnology.com>
From: David Lechner <david@lechnology.com>
To: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: David Lechner <david@lechnology.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] clk: davinci: pll-dm355: fix SYSCLKn parent names
Date: Wed,  9 May 2018 10:36:40 -0500
Message-Id: <20180509153642.22399-1-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

v3 changes:
* swap order of patches

v2 changes:
* add new patch to remove non-existent PLL2 SYSCLK2

David Lechner (2):
  clk: davinci: pll-dm355: drop pll2_sysclk2
  clk: davinci: pll-dm355: fix SYSCLKn parent names

 drivers/clk/davinci/pll-dm355.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.17.0
