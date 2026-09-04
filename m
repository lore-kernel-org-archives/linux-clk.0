Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA048509F01;
	Fri,  4 Sep 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537547; cv=none; b=OXWN5f0aCj5MftnLi4EYR/5o9m8tc5PRLqRtAMbFVb4+Ba6V6pfD0WHQk6ZJtuFdKmGXO3RpLXPeAkF50o2KfRCOY/KEv0pvVw5rxNjTd72fL2xtvvNSF2/5bNiDgmJmMA8nt+VIMHBjNVHkYWPt3JOllQQ5YS07poUxPN/9ogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537547; c=relaxed/simple;
	bh=yyN8kGE+J/DS18+i2Sn6ERdizi7ZNzizwXys/5jFoLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IO/9Wm/JJ8Xsp+sNhqn7E7afRnP4D4qgbGdW9L6DG4hQMSHtKVKx2brPe+oGoz3PqYl7jEbW5ZLrY9NyL+WtQG99bd/jELeFJzKbWQcMMqINYjXCBhcVMSecgQCMJWzncZKwWfVa5WAFMgBVo1y/cu9G9HJ87DOYG9HvO2Ah8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jSCiInB8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jSCiInB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537542;
	bh=yyN8kGE+J/DS18+i2Sn6ERdizi7ZNzizwXys/5jFoLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jSCiInB8jQpEkn8PhcYWz9Gt29XXz9yy/T9GVC5NedXfKYjJcXfC1eIaHMh8ltUsB
	 f/+iyOCqirqsy7dCAoiKdIcei+KA8LTZGWFzIw3mJSvaztuibiuBzThPNPD0uO2jmD
	 dsYWXiYJBs1bk05wTc2oRI0bvZMY60G2rjgvYNuzB9HTgsmT+ehurQZArJPRx8chqm
	 OmHbIKFrk2P629TPHyTXemuFpVTJQ+PHGP6rJ1Sidmoye6svci3ASdKaXmURE/s1it
	 a1iGHJVvx1U181O6rXU65J451qqFsHyVmicxYUXV1E+L3T7gQu8c/EXB6M3I0FWYZz
	 FTwg5IU+9ivCA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD29317E0FDB;
	Fri, 04 Sep 2026 17:59:01 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:24 +0200
Subject: [PATCH v6 13/27] clk: mediatek: pll: Add ops for PLLs using
 set/clr regs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-13-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=4559;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=yyN8kGE+J/DS18+i2Sn6ERdizi7ZNzizwXys/5jFoLA=;
 b=cVnxk3EsDnP4Qyo5Ymqbx0XGSMPcLwZWTvi24mpl4PYGG5rK6PkYIAy2NGjH+SDwSYTD2J7Dr
 dAPOpTtTfBwAbHLuryNPaH1PRnK+g0rENN53RL0Ld3vXqDDOOaToaDA
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

MT8189 SoC uses a new combination of status and set/clr registers to
control its PLL enable state and perform BAR reset, that are different
than the current default clock prepare/unprepare operations are using.

Add new set of PLL clock operations to support this logic that relies
on the following registers for prepare/unprepare operations:
  - en/en_set/en_clr, rather than en register, for PLL enable
    control
  - rst_bar/rst_bar_set/rst_bar_clr, rather than default rst_bar
    register for BAR reset control

Also, handle rst_bar register setting/clearing with a timeout, to
verify the operation was correctly performed.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 67 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-pll.h |  5 ++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 9a197a657dce..f32b9145f256 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -32,6 +33,7 @@
 #define INTEGER_BITS		7
 
 #define PLL_STABILIZATION_DELAY	20 /* in us */
+#define RST_BAR_TIMEOUT		20 /* in us */
 
 int mtk_pll_is_prepared(struct clk_hw *hw)
 {
@@ -301,6 +303,61 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	mtk_pll_power_off(pll);
 }
 
+int mtk_pll_prepare_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+	u32 val = 0;
+	int ret;
+
+	mtk_pll_power_on(pll);
+
+	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
+
+	__mtk_pll_tuner_enable(pll);
+
+	udelay(PLL_STABILIZATION_DELAY);
+
+	if (pll->data->flags & HAVE_RST_BAR) {
+		writel(pll->data->rst_bar_mask, pll->rst_bar_set_addr);
+
+		ret = readl_poll_timeout(pll->rst_bar_addr, val,
+					(val & pll->data->rst_bar_mask), 1,
+					RST_BAR_TIMEOUT);
+		if (ret) {
+			mtk_pll_unprepare_setclr(hw);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_pll_prepare_setclr);
+
+void mtk_pll_unprepare_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+	u32 val = 0;
+
+	if (pll->data->flags & HAVE_RST_BAR) {
+		writel(pll->data->rst_bar_mask, pll->rst_bar_clr_addr);
+
+		/*
+		 * Ignore return code to continue unpreparing the PLL if
+		 * an error occurs on register read poll.
+		 */
+		readl_poll_timeout(pll->rst_bar_addr, val,
+				   !(val & pll->data->rst_bar_mask), 1,
+				   RST_BAR_TIMEOUT);
+	}
+
+	__mtk_pll_tuner_disable(pll);
+
+	writel(BIT(pll->data->pll_en_bit), pll->en_clr_addr);
+
+	mtk_pll_power_off(pll);
+}
+EXPORT_SYMBOL_GPL(mtk_pll_unprepare_setclr);
+
 static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
@@ -329,6 +386,16 @@ const struct clk_ops mtk_pll_ops = {
 	.set_rate	= mtk_pll_set_rate,
 };
 
+const struct clk_ops mtk_pll_setclr_ops = {
+	.is_prepared	= mtk_pll_is_prepared,
+	.prepare	= mtk_pll_prepare_setclr,
+	.unprepare	= mtk_pll_unprepare_setclr,
+	.recalc_rate	= mtk_pll_recalc_rate,
+	.determine_rate = mtk_pll_determine_rate,
+	.set_rate	= mtk_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(mtk_pll_setclr_ops);
+
 const struct clk_ops mtk_pll_fenc_setclr_ops = {
 	.is_prepared	= mtk_pll_is_prepared_fenc_setclr,
 	.prepare	= mtk_pll_prepare_fenc_setclr,
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index 3aaf3a7654b5..296bed073290 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -92,6 +92,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 
 extern const struct clk_ops mtk_pll_ops;
 extern const struct clk_ops mtk_pll_fenc_setclr_ops;
+extern const struct clk_ops mtk_pll_setclr_ops;
 
 static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
 {
@@ -104,6 +105,10 @@ int mtk_pll_prepare(struct clk_hw *hw);
 
 void mtk_pll_unprepare(struct clk_hw *hw);
 
+int mtk_pll_prepare_setclr(struct clk_hw *hw);
+
+void mtk_pll_unprepare_setclr(struct clk_hw *hw);
+
 unsigned long mtk_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate);
 
 void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,

-- 
2.55.0

