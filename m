Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9445916F841
	for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2025 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393411; cv=none; b=q9JMgU9pmzrhWmG3eeCTInDIpmm3QvY5y5UWlAtleLuAEH9gBIsIeG2DLJ1o44TdMetaYVGdib8JNi6W9O1BXWFG5+NrAFFfudJCEVGI1gDAdweLop3nInCiTP+O/2xIOqp142JjwHr3D77XLXaDdkY1iw+HzSqUcqdL/f+8qEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393411; c=relaxed/simple;
	bh=DeCsmBBpdW664QNCp4XGq6tz+M8IRL34Kw3VTvPG5eU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqAmHBn5/7VfDUI+xmwoLFS3LQ+YftSJy4oYgqth+qGeQg4nn3jnTpRJVq4Py22vAqkgPaD4miwkqUo8CNvuri+2bLLaiihO9pivqEU3hIuhcLeyeq7l+HE4CMs/6duhIicC+zIW9FGxdONZcKmhelrsaxSR0F+sjNhQ56DanVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FnQoBc2e; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FnQoBc2e"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso35823875e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2025 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737393407; x=1737998207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tfvb/9D1Ez6OPrxjfKbAnbGQNGi/lvE7qXPfftYcTf0=;
        b=FnQoBc2eWJDHBvt7oHMLI7Q9DlwLdKzqHGsLcKiUzPFbWHnsNLdaeQ8rWUkoo0kNyZ
         Y4CMofoOzyhS1+IofkK7eNPErnyGbYqAOBStxj/d0Wti1yLnDCFu66kWylNmUshflIF5
         dnRJPyWa5mmYOWnSwqu83ozimYEEbTM1/oNZy93QWczf6pc5gv86QaUWKhd79BEXH6vV
         5zCOgOGdH2At8opfzMLO5apNgEJH0Mkt9StpxCfgSveNSPD4WqnuP1VRpjt6UhQ5Wcuj
         iS9ymNOq0rGW8gFC2B4bANwVvhfpKLOv/kS/RJRJBUMd33sXbvmpkkQahKzgGpeq2hlk
         Wmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737393407; x=1737998207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfvb/9D1Ez6OPrxjfKbAnbGQNGi/lvE7qXPfftYcTf0=;
        b=CyohtSZPl5IeOUbaNlzOuU58IsFZvlulrRugjCsGHu92gvP1YUppYVAYM+l+k4RCQY
         qKOzMHp4tNWKBhbyfLmKV3fatF56msRdcbgELonaJPPjkDlLD3WSz/f8W4rPizxDzorK
         fVlDY5GxWdFSC1NSNShbuWTlPJtfF/PujJsIQHrxCJZI3ORD/jy+vSxMK1PNNrXB1gZW
         Ce1icC0itD8u/Y2il25hzfOcQYo2i53WzIak8O+esLPCjzJRTHZUYj71/oXcLxsakkBA
         nwNJgxFMvxmnuUs2KJNsNHQAR+3v16jV7L3A6Z9EkEnxV+QyFlJkMtcylVqNNspAD/zH
         wqNQ==
X-Gm-Message-State: AOJu0Yys5iO75JFFI3epSbo3r4NWKlUs+tflDcWA5NP1NqBDltMMnAbU
	C80HALeTH1++tfk3GJMZ7DzkqB/ovZLr8xcWKJQ+F8yM24L6kqkpg0u/3kjgPfM=
X-Gm-Gg: ASbGncszVt0M4iMKFM+nzZ4QKkwHEXHIFeaQw7cbYsOvIi+rSj3C72Nh3qIRnKUfppc
	z+p/Y687G6R3yM3ebSE7iu3bRmxCTAN80jl5SzWuJQZpfF0xX3POVpUVYISw1JcPcdWY+0sOp7l
	zsa5xm3kj7FvLMS6DGepQuZA7biiDNs3yDFdEiluC5qPY2ujQLdMLvyqJi0iF9wFiq/PRrY41Cj
	wiI4QxLaesEQktX7q7frY6qwHeP/5Dh/S0xTlKfMT4mOsHyHDbkXgAT2+PWvWR1BtgKBQ/IRcF1
	rd06LhWG
X-Google-Smtp-Source: AGHT+IEfhYB2mOpJAOFHaURWWL0moDkjx4UB4rJYkwC3iuyyd1pL9Agrv/k9fMVlUj7WMSWQv0FSyg==
X-Received: by 2002:a05:6000:2a1:b0:386:42b1:d7e4 with SMTP id ffacd0b85a97d-38bec54287fmr15643541f8f.19.1737393406093;
        Mon, 20 Jan 2025 09:16:46 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:66cc:1b13:f78a:5738])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm208629865e9.30.2025.01.20.09.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:16:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jan 2025 18:15:31 +0100
Subject: [PATCH v3 2/4] clk: amlogic: get regmap with clk_regmap_init
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-2-126244146947@baylibre.com>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12538; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=DeCsmBBpdW664QNCp4XGq6tz+M8IRL34Kw3VTvPG5eU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnjoT4AlRm1ps99QDaN11SpAXqiBDGHAGYYzK0j
 TDtG4c6A42JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ46E+AAKCRDm/A8cN/La
 hQD0D/47xVTSFrx+M6jW/+mjrrNr+49pkq/yr7KHWf1RbFhXXvICAgFpDw1HwVa5zJB8i5HXHhu
 iweYowIhYr/qbdFv1JCpNKZ30Gcw575gV7m9SP19W4XlwcGrA8d99a9p+FHPsZ7555lYyCdaql+
 hCXcURqPZFkXj6N51P6ge9EvRdTFqycWbSh6CEuTP8fJm5EDwFiJfs4NuiYiwoU1rLimrq6QHQ0
 CafKnHY9YxVF7X6nOD2DXsb17vSwvDuco+h9YZ2vkQzDcBqmI947ccUYu2WCiVEm+ce2zp31Hr6
 ut6axUsMyFAl2uGBacLJPaWWwrJc5jMFE+bpAdxscmIGkXMk9W8Z+XpcwJ75+b5JliyADdOdHC+
 r5eK0Q3R5nFdn7xfgvXKghuZNx16gLe7zEfh80mDzjqiJgha0hcP4H5df1AbirHWrqJhlEn/oKV
 q56mAIrhAzHZYbwf+ZSfGbEnNqJ9kypdkJ/SjPteo67QO772Q2/68akpPfaPBu6TxLmnQVWpdi6
 UFfmkhz4+i23h82pfWeoqUjbrQHwBU+Wm9eqlxuOLPwdpWHybwTIH+5oofNVncWJg8+qJbWe8Lt
 ygk5gfN0oSIrtO0ntLujuvDtYmD3ZUkRIsXupUcSurogRVZS1mzYc9KNWq6+P8zwLH+ReCamr4h
 KhKUxGR4y+igIaw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add clk_regmap_init() and use it with all clock types which derive from
clk_regmap. This helps initialise clk_regmap clocks without requiring
tables to keep track of the clock using this type.

The way it is done couples clk_regmap with the controllers, which is not
ideal. This is a temporary solution to get rid of the tables. The situation
will eventually be improved.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig          |  1 +
 drivers/clk/meson/clk-cpu-dyndiv.c |  1 +
 drivers/clk/meson/clk-dualdiv.c    |  2 ++
 drivers/clk/meson/clk-mpll.c       |  6 +++++
 drivers/clk/meson/clk-phase.c      | 11 +++++++++
 drivers/clk/meson/clk-pll.c        |  7 ++++++
 drivers/clk/meson/clk-regmap.c     | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clk-regmap.h     |  4 ++++
 drivers/clk/meson/sclk-div.c       |  5 ++++
 drivers/clk/meson/vclk.c           |  2 ++
 drivers/clk/meson/vid-pll-div.c    |  1 +
 11 files changed, 89 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index be2e3a5f83363b07cdcec2601acf15780ff24892..d6e2ddb4eac85ddad44b99a8efa9d33426edbab3 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -5,6 +5,7 @@ menu "Clock support for Amlogic platforms"
 config COMMON_CLK_MESON_REGMAP
 	tristate
 	select REGMAP
+	select MFD_SYSCON
 
 config COMMON_CLK_MESON_DUALDIV
 	tristate
diff --git a/drivers/clk/meson/clk-cpu-dyndiv.c b/drivers/clk/meson/clk-cpu-dyndiv.c
index 6c1f58826e24a2bf7706f0fc98cdcdb44fd60b64..0498fd3af7de7b9a4e72930ac4de11368d686393 100644
--- a/drivers/clk/meson/clk-cpu-dyndiv.c
+++ b/drivers/clk/meson/clk-cpu-dyndiv.c
@@ -61,6 +61,7 @@ static int meson_clk_cpu_dyndiv_set_rate(struct clk_hw *hw, unsigned long rate,
 };
 
 const struct clk_ops meson_clk_cpu_dyndiv_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = meson_clk_cpu_dyndiv_recalc_rate,
 	.determine_rate = meson_clk_cpu_dyndiv_determine_rate,
 	.set_rate = meson_clk_cpu_dyndiv_set_rate,
diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
index 913bf25d3771bdffa8db28e9b08dc566d1aac1ff..7c668df1a29f6eb20bde3f23d8701443602d774c 100644
--- a/drivers/clk/meson/clk-dualdiv.c
+++ b/drivers/clk/meson/clk-dualdiv.c
@@ -126,6 +126,7 @@ static int meson_clk_dualdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 const struct clk_ops meson_clk_dualdiv_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 	.determine_rate	= meson_clk_dualdiv_determine_rate,
 	.set_rate	= meson_clk_dualdiv_set_rate,
@@ -133,6 +134,7 @@ const struct clk_ops meson_clk_dualdiv_ops = {
 EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ops, CLK_MESON);
 
 const struct clk_ops meson_clk_dualdiv_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 };
 EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ro_ops, CLK_MESON);
diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index aa9abd06ae653585f68043bb1ddc2b0b96feeb6d..166fbcb053cc573ec92489c2bb03f81caffdf64b 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -128,6 +128,11 @@ static int mpll_init(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	if (mpll->init_count)
 		regmap_multi_reg_write(clk->map, mpll->init_regs,
@@ -151,6 +156,7 @@ static int mpll_init(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_clk_mpll_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= mpll_recalc_rate,
 	.determine_rate	= mpll_determine_rate,
 };
diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
index c1526fbfb6c4ccdd4034df465f70a56e0f9214ac..d05065e56483a218e0eaf402807c8734271d0cf5 100644
--- a/drivers/clk/meson/clk-phase.c
+++ b/drivers/clk/meson/clk-phase.c
@@ -58,6 +58,7 @@ static int meson_clk_phase_set_phase(struct clk_hw *hw, int degrees)
 }
 
 const struct clk_ops meson_clk_phase_ops = {
+	.init		= clk_regmap_init,
 	.get_phase	= meson_clk_phase_get_phase,
 	.set_phase	= meson_clk_phase_set_phase,
 };
@@ -83,6 +84,11 @@ static int meson_clk_triphase_sync(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_triphase_data *tph = meson_clk_triphase_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/* Get phase 0 and sync it to phase 1 and 2 */
 	val = meson_parm_read(clk->map, &tph->ph0);
@@ -142,6 +148,11 @@ static int meson_sclk_ws_inv_sync(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/* Get phase and sync the inverted value to ws */
 	val = meson_parm_read(clk->map, &tph->ph);
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 89f0f04a16abad99748e1ff3784e7ed91abd0f88..eaaf021d2f6911a99a722c8b9d8b4e1f1f77d0e6 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -311,6 +311,11 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/*
 	 * Keep the clock running, which was already initialized and enabled
@@ -468,6 +473,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
  * the other ops except set_rate since the rate is fixed.
  */
 const struct clk_ops meson_clk_pcie_pll_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.determine_rate	= meson_clk_pll_determine_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
@@ -488,6 +494,7 @@ const struct clk_ops meson_clk_pll_ops = {
 EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ops, CLK_MESON);
 
 const struct clk_ops meson_clk_pll_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
 };
diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index 07f7e441b9161c47fdb38ec61ed162a2f9d4fe41..d6bce32b087b174482ca896e4a0f3c57b58f155c 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -4,9 +4,52 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
+#include <linux/device.h>
 #include <linux/module.h>
+#include <linux/mfd/syscon.h>
 #include "clk-regmap.h"
 
+int clk_regmap_init(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct device_node *np, *parent_np;
+	struct device *dev;
+
+	/* Allow regmap to be preset as it was historically done */
+	if (clk->map)
+		return 0;
+
+	/*
+	 * FIXME: what follows couples the controller implementation
+	 * and clk_regmap clock type. This situation is not desirable
+	 * but temporary, until the controller is able to register
+	 * a hook to initialize a clock type
+	 */
+
+	/* Check the usual dev enabled controller with an basic IO regmap */
+	dev = clk_hw_get_dev(hw);
+	if (dev) {
+		clk->map = dev_get_regmap(dev, NULL);
+		if (clk->map)
+			return 0;
+	}
+
+	/* Move on to early and syscon based controllers */
+	np = clk_hw_get_of_node(hw);
+	if (np) {
+		parent_np = of_get_parent(np);
+		clk->map = syscon_node_to_regmap(parent_np);
+		of_node_put(parent_np);
+
+		if (!IS_ERR_OR_NULL(clk->map))
+			return 0;
+	}
+
+	/* Bail out if regmap can't be found */
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS_GPL(clk_regmap_init, CLK_MESON);
+
 static int clk_regmap_gate_endisable(struct clk_hw *hw, int enable)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
@@ -45,6 +88,7 @@ static int clk_regmap_gate_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops clk_regmap_gate_ops = {
+	.init		= clk_regmap_init,
 	.enable = clk_regmap_gate_enable,
 	.disable = clk_regmap_gate_disable,
 	.is_enabled = clk_regmap_gate_is_enabled,
@@ -52,6 +96,7 @@ const struct clk_ops clk_regmap_gate_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ops, CLK_MESON);
 
 const struct clk_ops clk_regmap_gate_ro_ops = {
+	.init		= clk_regmap_init,
 	.is_enabled = clk_regmap_gate_is_enabled,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ro_ops, CLK_MESON);
@@ -121,6 +166,7 @@ static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
 /* Would prefer clk_regmap_div_ro_ops but clashes with qcom */
 
 const struct clk_ops clk_regmap_divider_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
 	.determine_rate = clk_regmap_div_determine_rate,
 	.set_rate = clk_regmap_div_set_rate,
@@ -128,6 +174,7 @@ const struct clk_ops clk_regmap_divider_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
 
 const struct clk_ops clk_regmap_divider_ro_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
 	.determine_rate = clk_regmap_div_determine_rate,
 };
@@ -170,6 +217,7 @@ static int clk_regmap_mux_determine_rate(struct clk_hw *hw,
 }
 
 const struct clk_ops clk_regmap_mux_ops = {
+	.init		= clk_regmap_init,
 	.get_parent = clk_regmap_mux_get_parent,
 	.set_parent = clk_regmap_mux_set_parent,
 	.determine_rate = clk_regmap_mux_determine_rate,
@@ -177,6 +225,7 @@ const struct clk_ops clk_regmap_mux_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ops, CLK_MESON);
 
 const struct clk_ops clk_regmap_mux_ro_ops = {
+	.init		= clk_regmap_init,
 	.get_parent = clk_regmap_mux_get_parent,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ro_ops, CLK_MESON);
diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index e365312da54ece08098293b1a831c803415db814..f8cac2df5755b0f894570305604485f54c17ea49 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -7,6 +7,7 @@
 #ifndef __CLK_REGMAP_H
 #define __CLK_REGMAP_H
 
+#include <linux/device.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 
@@ -31,6 +32,9 @@ static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
 	return container_of(hw, struct clk_regmap, hw);
 }
 
+/* clk_regmap init op to get and cache regmap from the controllers */
+int clk_regmap_init(struct clk_hw *hw);
+
 /**
  * struct clk_regmap_gate_data - regmap backed gate specific data
  *
diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
index ae03b048182f3bbaf4a7e86b605fb4fb37b9cfd5..13536df1760d135cc2d62062e2699ed6842e1e5f 100644
--- a/drivers/clk/meson/sclk-div.c
+++ b/drivers/clk/meson/sclk-div.c
@@ -222,6 +222,11 @@ static int sclk_div_init(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	val = meson_parm_read(clk->map, &sclk->div);
 
diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
index 36f637d2d01b5d86bf5d85196643ad9d66c6f19b..bcdec8a444f60838c84eb27c4cdf2b8f8574ce71 100644
--- a/drivers/clk/meson/vclk.c
+++ b/drivers/clk/meson/vclk.c
@@ -45,6 +45,7 @@ static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_vclk_gate_ops = {
+	.init = clk_regmap_init,
 	.enable = meson_vclk_gate_enable,
 	.disable = meson_vclk_gate_disable,
 	.is_enabled = meson_vclk_gate_is_enabled,
@@ -127,6 +128,7 @@ static int meson_vclk_div_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_vclk_div_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = meson_vclk_div_recalc_rate,
 	.determine_rate = meson_vclk_div_determine_rate,
 	.set_rate = meson_vclk_div_set_rate,
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index 486cf68fc97a0205ee5139056b1eabc6e743ff35..c28d8b150400308df050e500c2aedc14157c1bcf 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -90,6 +90,7 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 }
 
 const struct clk_ops meson_vid_pll_div_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_vid_pll_div_recalc_rate,
 };
 EXPORT_SYMBOL_NS_GPL(meson_vid_pll_div_ro_ops, CLK_MESON);

-- 
2.45.2

