Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DBA226D02
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 19:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776852; cv=none; b=dIUdIzz/QDfR5s/hEkaO2W1jJOTFngeEvnMLfbBTPScCq3aJMFEcK52lqQ7sjBkpfCWUvsr6d9EfYgMU5RS/A4BZe2FisTIiPCrisVhpS5jWYIamFCfIou3zY+qJSCnj5OzD1OLhEXLIUhIgMDYAuF/3ho3qBQ3jMJ/m0I0VdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776852; c=relaxed/simple;
	bh=/pfeBRZlSAeIZP2jyTAgG02IfuvKN3sK7yiMk55tNm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SAPyPhLifU/GZLpxDcimOhFiYd3UWia9txMXbIVNGKgTaRV28ZPn7fuxlNuZFZ8CLBJfoBwVpBSJ5IeZBg2w71DIztHjbJX6BenDzu5KrRGm78+EtrnEQfVjnOabRldcdtHXChEv0RSFqdnhrhA0BT18NAfb5sQ7X3Cbtbe2/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSxKhaTu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSxKhaTu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439af7d77f0so4558665f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776849; x=1774381649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qy4MN32IlylccBxs69pXyCRPQ6AWrwsSuWmABVQKBWQ=;
        b=nSxKhaTuBRv332k9NLLC6N8vRMBXs0T/TkRV44UQLdIMHxp0lmd9zNmUA/o0GfgFa8
         xthlPMoCsTXg7zwOtNcoiESj9775TglTA/swuQAsRzeHNZ2mZfzDT3VBHU7yUn+YUdDI
         PLQ6NODpZQoccnTJwzcKp+cfnDm1uUAJ8E6FzX1NmjPQlwHktgYgFF9EhEXfPOrzJP4W
         f2BxvVs/7Onsbse24WeavEiLw74p4fXg9avfzRSpKxo5cbrJzdUpERx4feMn1XN3l0Bj
         N04qOEExNjkjc/Et+NQBuMnqX2s7OVxgD8/GmBUvTgYIcHteaEpwb30koarVl0mSC2DI
         T95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776849; x=1774381649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy4MN32IlylccBxs69pXyCRPQ6AWrwsSuWmABVQKBWQ=;
        b=CSMToVVCJbvTiPStnTbTOMfo6KVqUoMHxUGwj+RzM2WsgTAvSa6+4gs6ehWc6sp+9h
         bNQTrr32DOZHovluR88+WmcT0NvpCMnWTOvR6vv+i36Z3SboNEoduJk21c7oVMZQ1sEv
         scIKh52TJZNpPQRZjXl74f9tmBLaPPrtodI2v2OD2x7w6+CBQCGnoqjUfpBOt1BHKRA9
         /52MO1kn1IZBXa8kyHRl6bhb1iYLFMsuBDJFs3nSHZXaSHcPMmkyzSSS7xTRPmVaa/jf
         81n/lzTOaX/EMO9cJuHBATBBwNNYuL7IcyjCb2ybddx1dTORKTK9rJfT7pPnclxxgg9d
         VONQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWWGRg7dKnqjQk531eONi+TSy3sjkLtJdZ3UsbS903HcvyvVmrHKdKZVqgsxAL2dHsaMqNPaILszA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfz3i951+f/H+g/WsZssk1o+8ljrOMjaQceOnbNqTBqpX006Bj
	GvhEshLZc4G0QqfEFX3j+WhWfsUGjSENXOwqOkSFma6IvSDMZj4gt2NQUp45Sg==
X-Gm-Gg: ATEYQzzhZxHtJnp0TnmmPHOnRIfC0gWQEfFm+vwssbNwBAh9o/fdBROhDtxgONRePx3
	PF+Bw8mizGXEL1mQ/G9XkU/lZaZzhoVeJFHKztqC3POk5qYPcetZxhhpQ7M/HtQjK9DigDVPi9i
	kVSsYvd0z3xVJIN+VYB0Ztr6h5V9HsRqgdV12TQo3C3BkN2Kv5bap4EUf/2Eit6K2pzpwWLOEPH
	xcedM7j8WYjbsZiQYgWtNhpKVcc1BqfKJxWei033Pob8HGmCCxvySjqUxzuW7DiVHC2FSjsW8d0
	ZCWdRUhsHHLiJeDsL9WVeOYfHLq51ptkt66YHgy6Lw/qT9lWqV0sAEhUKCYUYsjYxsKvWH9/5Kd
	gFasV+hP1FO/NPbueSxWaE/1jztCbq+L4jG1AqFeUW3Kv7O+BPZg9nVlDWqZKA6fUBIAcT8HOZt
	p+yfgWpW9OKRacV0oLM83oKPh2yvFRpK8y7+Hsk39KbPU2jx1M
X-Received: by 2002:a05:6000:40cb:b0:43b:4f97:9608 with SMTP id ffacd0b85a97d-43b527a7368mr921067f8f.14.1773776848667;
        Tue, 17 Mar 2026 12:47:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189970fsm1767511f8f.27.2026.03.17.12.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:47:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Tue, 17 Mar 2026 19:47:22 +0000
Message-ID: <20260317194726.468270-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks may be left disabled
as the hardware state is not automatically restored. Unlike regular clocks
which are re-enabled by their respective drivers, critical clocks
(CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG driver
must take responsibility for re-enabling them on resume.

Introduce struct rzg2l_crit_clk_hw to track critical module clock hardware
entries in a singly-linked list anchored at crit_clk_hw_head in
rzg2l_cpg_priv. Populate the list during module clock registration by
checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.

On resume, walk the list and re-enable any critical module clock that is
found to be disabled, before deasserting critical resets, ensuring the
correct clock-before-reset restore ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 8165c163143a..c2d31b93f62b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -130,6 +130,12 @@ struct div_hw_data {
 	u32 width;
 };
 
+/* Critical clk list  */
+struct rzg2l_crit_clk_hw {
+	struct clk_hw *hw;
+	struct rzg2l_crit_clk_hw *next;
+};
+
 #define to_div_hw_data(_hw)	container_of(_hw, struct div_hw_data, hw_data)
 
 struct rzg2l_pll5_param {
@@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
  * @info: Pointer to platform data
  * @genpd: PM domain
  * @mux_dsi_div_params: pll5 mux and dsi div parameters
+ * @crit_clk_hw_head: Head of the linked list critical clk entries
  */
 struct rzg2l_cpg_priv {
 	struct reset_controller_dev rcdev;
@@ -186,8 +193,26 @@ struct rzg2l_cpg_priv {
 	struct generic_pm_domain genpd;
 
 	struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
+
+	struct rzg2l_crit_clk_hw *crit_clk_hw_head;
 };
 
+static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
+					   struct clk_hw *hw)
+{
+	struct rzg2l_crit_clk_hw *node;
+
+	node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	node->hw = hw;
+	node->next = priv->crit_clk_hw_head;
+	priv->crit_clk_hw_head = node;
+
+	return 0;
+}
+
 static inline u8 rzg2l_cpg_div_ab(u8 a, u8 b)
 {
 	return (b + 1) << a;
@@ -1737,6 +1762,13 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
+	if (init.flags & CLK_IS_CRITICAL) {
+		if (rzg2l_cpg_add_crit_clk_hw_entry(priv, &clock->hw)) {
+			clk = ERR_PTR(-ENOMEM);
+			goto fail;
+		}
+	}
+
 	clk = clock->hw.clk;
 	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
 	priv->clks[id] = clk;
@@ -2086,8 +2118,17 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+	struct rzg2l_crit_clk_hw *node;
 	int ret;
 
+	for (node = priv->crit_clk_hw_head; node; node = node->next) {
+		if (!rzg2l_mod_clock_is_enabled(node->hw)) {
+			ret = rzg2l_mod_clock_endisable(node->hw, true);
+			if (ret)
+				return ret;
+		}
+	}
+
 	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
 	if (ret)
 		return ret;
-- 
2.43.0

