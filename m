Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] clk: meson: add missing const qualifiers on gate arrays
Date: Thu,  9 Mar 2017 11:41:47 +0100
Message-Id: <20170309104154.28295-3-jbrunet@baylibre.com>
In-Reply-To: <20170309104154.28295-1-jbrunet@baylibre.com>
References: <20170309104154.28295-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Reported-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c    | 2 +-
 drivers/clk/meson/meson8b.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 1c1ec137a3cc..c063287bb0ed 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -816,7 +816,7 @@ static struct meson_clk_mpll *const gxbb_clk_mplls[] = {
 	&gxbb_mpll2,
 };
 
-static struct clk_gate *gxbb_clk_gates[] = {
+static struct clk_gate *const gxbb_clk_gates[] = {
 	&gxbb_clk81,
 	&gxbb_ddr,
 	&gxbb_dos,
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 888494d4fb8a..d1cc4d7cc8ff 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -501,7 +501,7 @@ static struct meson_clk_pll *const meson8b_clk_plls[] = {
 	&meson8b_sys_pll,
 };
 
-static struct clk_gate *meson8b_clk_gates[] = {
+static struct clk_gate *const meson8b_clk_gates[] = {
 	&meson8b_clk81,
 	&meson8b_ddr,
 	&meson8b_dos,
-- 
2.9.3
