Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:36162 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731719AbeGTOd7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jul 2018 10:33:59 -0400
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co,
        thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 3/8] clk: tegra: fix fractional clocks for VDI, VI, EPP, MPE, 2D and 3D
Date: Fri, 20 Jul 2018 14:45:27 +0100
Message-Id: <20180720134532.13148-4-ben.dooks@codethink.co.uk>
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The clocks vde, vi, epp, mpe, 2d and 3d are all fractional
divisors, and not integer divisors as setup in the current
kernel. This seems to be the same for tegra2 and tegra3.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/tegra/clk-tegra-periph.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 8fa1cecf18a0..ed70419f4ff9 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -641,13 +641,13 @@ static struct tegra_periph_init_data periph_clks[] = {
 	I2C("i2c4", mux_pllp_clkm, CLK_SOURCE_I2C4, 103, tegra_clk_i2c4),
 	I2C("i2c5", mux_pllp_clkm, CLK_SOURCE_I2C5, 47, tegra_clk_i2c5),
 	I2C("i2c6", mux_pllp_clkm, CLK_SOURCE_I2C6, 166, tegra_clk_i2c6),
-	INT("vde", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde),
-	INT("vi", mux_pllm_pllc_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi),
-	INT("epp", mux_pllm_pllc_pllp_plla, CLK_SOURCE_EPP, 19, 0, tegra_clk_epp),
+	MUX("vde", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde),
+	MUX("vi", mux_pllm_pllc_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi),
+	MUX("epp", mux_pllm_pllc_pllp_plla, CLK_SOURCE_EPP, 19, 0, tegra_clk_epp),
 	MUX("host1x", mux_pllm_pllc_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x),
-	INT("mpe", mux_pllm_pllc_pllp_plla, CLK_SOURCE_MPE, 60, 0, tegra_clk_mpe),
-	INT("2d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d),
-	INT("3d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d),
+	MUX("mpe", mux_pllm_pllc_pllp_plla, CLK_SOURCE_MPE, 60, 0, tegra_clk_mpe),
+	MUX("2d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d),
+	MUX("3d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d),
 	INT8("vde", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde_8),
 	INT8("vi", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_8),
 	INT8("vi", mux_pllm_pllc2_c_c3_pllp_plla_pllc4, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_9),
-- 
2.18.0

