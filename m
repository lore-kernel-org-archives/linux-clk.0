Return-Path: <bhumirks@gmail.com>
Return-Path: <bhumirks@gmail.com>
From: Bhumika Goyal <bhumirks@gmail.com>
To: julia.lawall@lip6.fr,
	vireshk@kernel.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH 2/2] CLK: SPEAr: make aux_clk_masks structures const
Date: Tue, 17 Oct 2017 16:38:34 +0200
Message-Id: <1508251114-7042-3-git-send-email-bhumirks@gmail.com>
In-Reply-To: <1508251114-7042-1-git-send-email-bhumirks@gmail.com>
References: <1508251114-7042-1-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Make these const as they are either stored in the masks 'const' field
of a clk_aux structure or passed to the function clk_register_aux 
having the argument as const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/clk/spear/clk-aux-synth.c   | 2 +-
 drivers/clk/spear/spear1310_clock.c | 2 +-
 drivers/clk/spear/spear1340_clock.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spear/clk-aux-synth.c b/drivers/clk/spear/clk-aux-synth.c
index 8bea5df..2f145e3 100644
--- a/drivers/clk/spear/clk-aux-synth.c
+++ b/drivers/clk/spear/clk-aux-synth.c
@@ -29,7 +29,7 @@
 
 #define to_clk_aux(_hw) container_of(_hw, struct clk_aux, hw)
 
-static struct aux_clk_masks default_aux_masks = {
+static const  struct aux_clk_masks default_aux_masks = {
 	.eq_sel_mask = AUX_EQ_SEL_MASK,
 	.eq_sel_shift = AUX_EQ_SEL_SHIFT,
 	.eq1_mask = AUX_EQ1_SEL,
diff --git a/drivers/clk/spear/spear1310_clock.c b/drivers/clk/spear/spear1310_clock.c
index 2f86e3f..591248c 100644
--- a/drivers/clk/spear/spear1310_clock.c
+++ b/drivers/clk/spear/spear1310_clock.c
@@ -284,7 +284,7 @@
 };
 
 /* i2s prescaler1 masks */
-static struct aux_clk_masks i2s_prs1_masks = {
+static const struct aux_clk_masks i2s_prs1_masks = {
 	.eq_sel_mask = AUX_EQ_SEL_MASK,
 	.eq_sel_shift = SPEAR1310_I2S_PRS1_EQ_SEL_SHIFT,
 	.eq1_mask = AUX_EQ1_SEL,
diff --git a/drivers/clk/spear/spear1340_clock.c b/drivers/clk/spear/spear1340_clock.c
index cbb19a9..e5bc8c8 100644
--- a/drivers/clk/spear/spear1340_clock.c
+++ b/drivers/clk/spear/spear1340_clock.c
@@ -323,7 +323,7 @@
 };
 
 /* i2s prescaler1 masks */
-static struct aux_clk_masks i2s_prs1_masks = {
+static const struct aux_clk_masks i2s_prs1_masks = {
 	.eq_sel_mask = AUX_EQ_SEL_MASK,
 	.eq_sel_shift = SPEAR1340_I2S_PRS1_EQ_SEL_SHIFT,
 	.eq1_mask = AUX_EQ1_SEL,
-- 
1.9.1
