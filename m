Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98419AD8C
	for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129539; cv=none; b=PJeCybMJWJ7j+9r8oAsgsFTMpYl0aC4/IFv7rtYUfKp6aSImht/jZmnjpR6MCE9ScfkfV8L0ayPgd+Vgx3mCq1LkgVoczMjD6YyB8ZvGyFIHOTVReSQIfQGwzC1WCPqg0DjvJ9KxcdtRp1hTiZrrsQVAhI6fNiAlaVK8ZDCTL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129539; c=relaxed/simple;
	bh=6hAHQkcFzezTJzPIHf4zYo9pPOVwfwF4hDU0yHpP4Hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKD+MN+y2mOaYn9pkdJF+WHBTzGezHPx4ZDbIF0DqNcsiNHS6oChoBiophMXA58bbE1UilfmlWE212bb+aqEUJjdHY9JORor+XBOuAW8bRo9Fs2isMryHjTb4hb2bHz3HTxDzEt4uxojrHTCrykxJmmTUEOXSyb4YYFVBPtiMK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wsLEIPys; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wsLEIPys"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso15446415e9.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jan 2025 07:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737129536; x=1737734336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMibB/Ymp8cqFGnvHem3CR1ADmPYUK0TjL+j8Mb6yzo=;
        b=wsLEIPysNnrUWblNjSArtW5PPHKDtzrPjSjb4a+hgahQMDi+pAQ+IVZmSmUX9mOtL/
         4XJSQL9tTYEwND8fv6LyK7RbehTmm0JeOa2WlG09Ov9Gm51/0zmXgDrEQW4OlzwAhH2Z
         IgKnGnAM0DBrAkr8KVN7VDzf25yN2bWoXkc18P6+HblkcBL1Uw6QQ6GU787NWO961kea
         6/KuIDHKEMHrlZRRcTppRKqIA0smPIPLFP1GqPUJz17sDrkKj+UALCO/ClQVGU2auPSb
         tZ9gAmV+S5eHAjd3UgWAyMS97iVNeYJKuRPItmkHMxVt6itmof/xlWUA/859cYO1dzLL
         YNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129536; x=1737734336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMibB/Ymp8cqFGnvHem3CR1ADmPYUK0TjL+j8Mb6yzo=;
        b=pCNyJY+ztVk5ofA1yf2POAN8HISTwbhnYV78MBggJgbduNtgnmQbIY/TTkzMZkpT1j
         TEuiNVFPy7dfu2XWADlsW/+sXfoI1nmCy9OjG6FByPY2wClCgtaJkJEntxo5Zk7DGA1c
         gWQ7iSKk/iWj1SmDVtZuLAMUdnL1InwVWH59EptlP3O1hgb9Mm8UNr7SCG2V6ucMfxf/
         XFq7UTJyK4jWyvbzwEVpt2MaQJtEmnwWTh1oiiR4XS19k77uvHMxKuI60PPnVvJFFjoC
         T547U8Xr2+U5pvEbRssZfselt8e1BLscTgf1Asxipg6L0OopF525PuuC3sFuC2TGE+rZ
         N7Sw==
X-Gm-Message-State: AOJu0YzC4ws17+JMiROmhNrQ7uN/744+Zb7B5hyM5yP79KORUUVEXewS
	MBeXKzEyfWlL4wCXrzbjvB2eff2xjNOPCRw8YwCsWXTJz9Xpm+DwT9rf+CdjgGI=
X-Gm-Gg: ASbGncvcMgQIJGKd4YlFWRZi6U8iSBAvHPpeobP01j3htdWoCpOGDyJD+HGP/RTCr72
	egunkhYjM7wmLykskwgMq/JbcFZkiPFrBWmZlzQj+X+EMO3IkxvvCSJuZdLziIErdOYadhbEm/+
	avn3LF2jYoH6U+DELx9QGt3IuM3cvNc3UNjqOx/lcK5jBY/DNhdbKagROxI1yF0/AUsii6bXnkU
	jF2qSYEI+xp/elSMlFyTM2L1x5cQTT3cDhQUwVe08a42n8aMOmhk/Tv45juQTjUXl4i8Bw=
X-Google-Smtp-Source: AGHT+IHE2+bcZ5qxYRBesznrVc4PDvGvy7t0VxOjWA8Bo+i3UA189EA8RHUoAW0gIOTJwdqGNN90pg==
X-Received: by 2002:a05:600c:348c:b0:434:f1d5:1453 with SMTP id 5b1f17b1804b1-438912dbfedmr36862415e9.0.1737129535647;
        Fri, 17 Jan 2025 07:58:55 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b019:599d:2d51:f3c7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm99382195e9.25.2025.01.17.07.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:58:55 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jan 2025 16:58:31 +0100
Subject: [PATCH v2 2/4] clk: amlogic: get regmap with clk_regmap_init
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-2-d1f77cb0773e@baylibre.com>
References: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
In-Reply-To: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12561; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6hAHQkcFzezTJzPIHf4zYo9pPOVwfwF4hDU0yHpP4Hc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnin46w07ogwsitxMHyqT7KptL8fu5EqP/VejtF
 iINZVJ8iWKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ4p+OgAKCRDm/A8cN/La
 hfSPD/4uve/WRtWMBEOM3wzLy4NMqRKvTJsqDq3jCl0ttI6CVtZwuZxJg2/kj+aof0aJ/Cpa67C
 p2wp5nxhPVBsdmZShhn72m5GfK0OGI0uIJmy0xWXw3lSRq8QCqGo+c8IUbNcdcK91qDQgtWxhfm
 FkFYyWHIaBGYQ4bGsBsvYNUo3SATF6p+NwrXqepBjfp9ChTyB1pCM8IuJuMGkBYu7xVHah+nITU
 Pd9ZKKooPnugFW5u0CaTv9yDdRm22WYPRo+aXSDPk27fyShuQCQwd1EI0yQyVPnCnghZ662XPMz
 mKxV3fDF9aCFOceSXxQlbF+rTv6TZTlWpO/dR38aYctVzV1XP3cIksR50xLZr1qnJc13zSi/sAx
 ki/3G6qjlInKBsKCG7OTN9M51V6fIKv9thSDgOwMAms3rcnxFs3e+kZVBZwyS8cwgP4fu1FG0Lx
 skws8YGZtM0tXKBjh3l9scUhEDqVp96vXjUnRLvyk69HhPFdVdQNfXOc1hdDHq4qzThntxW7imb
 lE5mkihuuT7oabhdXxqJeEpPF6N0CM9KG0DroH5XtGzhCNsAqhnscnerJCLrPf1c432KTXOREfV
 SEmAzWt4OkUxSh1FeJ5PSYDh819Z0mf7tCT4xYtJk+p+hqWYhAAKjryPkj9dtE9qU2khokQkppo
 w70Yh2583ij2khg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add clk_regmap_init() and use it with all clock type which derives from
clk_regmap. This helps to get the necessary regmap without needing
big tables in clock controller drivers to keep track of which clock
are based on clk_regmap and need to be initialised.

The way it is done couples clk_regmap with the controllers, which is not
ideal. This is a temporary solution to get rid of the tables.

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

