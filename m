Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2C5344035;
	Thu, 20 Nov 2025 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644500; cv=none; b=pqxyYbzNUwlshogBYPN3AG/uYpLiWMcNqi0QYaCOG1SVrozcK4+NDaV40djJIc04xn6kRaRXV7XlW6bY7sIfVpi3t+R/nQIKxEeF0mnLCvoxRJnMdJuYR9IVljbNvs2QE5oH8XIqKVWqJc2izz33t0AnzduylxKzqFs7/mQhHN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644500; c=relaxed/simple;
	bh=yRuavE+79rhObkVfJzraR/ld6UeWsLJML/RIv44JkEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psS4pH1AS84bW5xa9ERgpsGmMial/K/w7P/Ni0fYF1mIv36QxK7veCjwJYEEDGCtK5chcAjSdp9YiKLobgXBdReSrQfsxjiB/43n8awYNIfgVN9INf1XFjDCkde+7lSQbVsvCFroVTcm4IJlBhBEqxrOu8p4gXuS1QLzzZIdqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IPxJMr3/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IPxJMr3/"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E67092617B;
	Thu, 20 Nov 2025 14:14:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBcYb6eqv8Dq; Thu, 20 Nov 2025 14:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644495; bh=yRuavE+79rhObkVfJzraR/ld6UeWsLJML/RIv44JkEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IPxJMr3/Lgn6+XBEK3e05FI6gFR6vMzeCDmz8CVAmZhkaaE7Mn9VYuZ/ZPoTN+dAy
	 tkApJIsC2Vp72FqW7ncA3ZeVUD3PmkkIWnmKyns8Yt7aYSkm5rxiSycU81iiHhPCY8
	 0RDtGhiau1UM3rxlrulObpjxNvFmXVT8igkh7g2lvUMEYFB7UQWPt17unz7soIDsWF
	 HPueZXnMBRYmkyelBTAkluery1/COhG3+2vk3yDC3Owey1ajHr7wUR4+g6KKRbt5GL
	 XQ5jP+/0vTB4hkCw27ZFj3raViwC7tE4MGZAz2lkigLvu1ONGKXK0/85qIzhZjduBj
	 oQf9k/ZRrXl0w==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait for stability
Date: Thu, 20 Nov 2025 13:14:11 +0000
Message-ID: <20251120131416.26236-3-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
lock status is indicated by register PLL_STS (offset 0x80 inside AP
clock controller). We should poll the register to ensure the PLL
actually locks after enabling it.

Furthermore, a 30us delay is added after enabling the PLL, after which
the PLL could be considered stable as stated by vendor clock code.

Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 71ad03a998e8..d870f0c665f8 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -8,11 +8,14 @@
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
 #include <linux/bitfield.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#define TH1520_PLL_STS		0x80
+
 #define TH1520_PLL_POSTDIV2	GENMASK(26, 24)
 #define TH1520_PLL_POSTDIV1	GENMASK(22, 20)
 #define TH1520_PLL_FBDIV	GENMASK(19, 8)
@@ -23,6 +26,13 @@
 #define TH1520_PLL_FRAC		GENMASK(23, 0)
 #define TH1520_PLL_FRAC_BITS    24
 
+/*
+ * All PLLs in TH1520 take 21250ns at maximum to lock, let's take its double
+ * for safety.
+ */
+#define TH1520_PLL_LOCK_TIMEOUT_US	44
+#define TH1520_PLL_STABLE_DELAY_US	30
+
 struct ccu_internal {
 	u8	shift;
 	u8	width;
@@ -64,6 +74,7 @@ struct ccu_div {
 
 struct ccu_pll {
 	struct ccu_common	common;
+	u32			lock_sts_mask;
 };
 
 #define TH_CCU_ARG(_shift, _width)					\
@@ -299,9 +310,21 @@ static void ccu_pll_disable(struct clk_hw *hw)
 static int ccu_pll_enable(struct clk_hw *hw)
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	u32 reg;
+	int ret;
 
-	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
-				 TH1520_PLL_VCO_RST);
+	regmap_clear_bits(pll->common.map, pll->common.cfg1,
+			  TH1520_PLL_VCO_RST);
+
+	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
+					      reg, reg & pll->lock_sts_mask,
+					      5, TH1520_PLL_LOCK_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	udelay(TH1520_PLL_STABLE_DELAY_US);
+
+	return 0;
 }
 
 static int ccu_pll_is_enabled(struct clk_hw *hw)
@@ -389,6 +412,7 @@ static struct ccu_pll cpu_pll0_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(1),
 };
 
 static struct ccu_pll cpu_pll1_clk = {
@@ -401,6 +425,7 @@ static struct ccu_pll cpu_pll1_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(4),
 };
 
 static struct ccu_pll gmac_pll_clk = {
@@ -413,6 +438,7 @@ static struct ccu_pll gmac_pll_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(3),
 };
 
 static const struct clk_hw *gmac_pll_clk_parent[] = {
@@ -433,6 +459,7 @@ static struct ccu_pll video_pll_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(7),
 };
 
 static const struct clk_hw *video_pll_clk_parent[] = {
@@ -453,6 +480,7 @@ static struct ccu_pll dpu0_pll_clk = {
 					      &clk_pll_ops,
 					      0),
 	},
+	.lock_sts_mask		= BIT(8),
 };
 
 static const struct clk_hw *dpu0_pll_clk_parent[] = {
@@ -469,6 +497,7 @@ static struct ccu_pll dpu1_pll_clk = {
 					      &clk_pll_ops,
 					      0),
 	},
+	.lock_sts_mask		= BIT(9),
 };
 
 static const struct clk_hw *dpu1_pll_clk_parent[] = {
@@ -485,6 +514,7 @@ static struct ccu_pll tee_pll_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(10),
 };
 
 static const struct clk_parent_data c910_i0_parents[] = {
-- 
2.51.2

