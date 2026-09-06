Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D123F39E9CB;
	Sun,  6 Sep 2026 07:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788678457; cv=pass; b=aG8AqpscTc1nmncakf/Hrql+tJjhf23336P51IF2faZIfbajUhxL3Uh28TNEycHV/EePK8Yp88FpwDI5O2djwrxHPMNPzKTlkiop9R18BkzjsdxYrKKDRoPoDKEMaT/twiM3ovI3uv2hjdnRCcuiSQMsslp7XY6vV6kudgr922g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788678457; c=relaxed/simple;
	bh=sx6BJ1JsCbiIy8jm4gR7Z3AI1Jw4H0UuT/5mJyKCVds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwCJNHsirdSyy755XN/tgF0YgpQtY7bex2x3mz37MaPmTvDYERV1Sa8sJM++58Z4g9jxxUUDd+TAQdoL9Oydsg+914Tr4GzOvQJg5Zkn2V8SMnf3w6M+3dULhhC5QKb/4EYR4x0y1O6S1ZLf1dhYWES6fpG7ndUmDA1j8aFWL9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=ErSJ/RhF; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="ErSJ/RhF"
ARC-Seal: i=1; a=rsa-sha256; t=1788678441; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dniKCp0OKnLpZamZrVrHUROl0KW+1eQHZuv7oT3JVmt/p27lpT03/6kTertNcG08PdyHz6VhMcgxfPpy0dxJWMM5fLJtvs6Mf8+UwOuQByjqiuNe4XvQuMr7FhCXlSdlU3dxuv8AdmACCIX8+v+Gwn+f6n0XzvzYIITshGTgxSM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788678441; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vuBYatI2A+T0vk/pTOo+2ExTt5PEnYd3ra3QdMzmI10=; 
	b=gt55zeeI20UFoJk+ZKKfmFV5MUkS2F9KfBeM5agDm3kThBC333WYni+KvO1NcrMqrnoQtMwUE3+Ywrof8cRrYaVayTO8tdWcvCZ/IUTx6dElKTimYbBXLlC0PspMLzg4+S0Aw5WGyMWgbPF8dLvCzWLpBfo8yw/pMk2SUkJUvyw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788678441;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vuBYatI2A+T0vk/pTOo+2ExTt5PEnYd3ra3QdMzmI10=;
	b=ErSJ/RhFd6V5oLq18stBgO1xfg11N3i3KgR8rm6cDgEt8p7/rv9DmrRyTW6XLSqm
	450s0pM7kCr/nXiQE4t2Wt5Lc4jGwTV9ihk5NvJDpAytkcOT7vRK4iqWY38BcXa6QUS
	xLGlN0qseY9voEXzaul+wBfY5s1wUPnHvLH0Gq5Q=
Received: by mx.zohomail.com with SMTPS id 1788678439638627.6650541040009;
	Sun, 6 Sep 2026 00:07:19 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 06 Sep 2026 15:06:39 +0800
Subject: [PATCH 2/4] clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for
 MBUS, IOMMU and DRAM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-sunxi-clk-no-p-v1-2-cbde21c9fe69@pigmoral.tech>
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
In-Reply-To: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=sx6BJ1JsCbiIy8jm4gR7Z3AI1Jw4H0UuT/5mJyKCVds=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLmCnL/FcvceERrrnjPiqn+Kx85S18/1bgokbf53hLfP
 Z55dUtlOkpZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZjIKmdGhj0BzNz3NH9q1oQ1
 F1hbrXuT7Ls8p3pGQIJb0ZZnf1bOdmP4K3hRQyFZVELXZ9lHjiuBrDfcv/nxPNi5oKCvTzHg+uE
 QPgA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The MBUS, IOMMU, and DRAM clocks only have an M divider, but are
currently modeled as MP clocks with a zero-width P divider.

ccu_mp_set_rate() generates an invalid mask for the zero-width P
divider, clearing unrelated register fields. It also ignores
CCU_FEATURE_UPDATE_BIT, so the new divider value does not take effect.

Model these clocks as M-only clocks instead. This avoids accessing a
nonexistent P divider and uses ccu_div_set_rate(), which handles the
update bit.

Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 45 ++++++++++++++++------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 20dad06b37ca..9bc3ff0ab12d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -380,14 +380,13 @@ static const struct clk_parent_data mbus_parents[] = {
 	{ .hw = &pll_periph1_150M_clk.hw },
 	{ .fw_name = "hosc" },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
-					    0x540,
-					    0, 5,		/* M */
-					    0, 0,		/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
+					   0x540,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
 
@@ -584,14 +583,13 @@ static const struct clk_parent_data iommu_parents[] = {
 	{ .fw_name = "hosc" },
 };
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
-					    0x7b0,
-					    0, 5,	/* M */
-					    0, 0,	/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_SET_RATE_PARENT,
-					    CCU_FEATURE_UPDATE_BIT);
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
+					   0x7b0,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_SET_RATE_PARENT,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static SUNXI_CCU_GATE_HWS(bus_iommu_clk, "bus-iommu", apb0_hws, 0x7bc,
 			  BIT(0), 0);
@@ -603,14 +601,13 @@ static const struct clk_parent_data dram_parents[] = {
 	{ .hw = &pll_periph0_400M_clk.hw },
 	{ .hw = &pll_periph0_150M_clk.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
-					    0x800,
-					    0, 5,	/* M */
-					    0, 0,	/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
+					   0x800,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static SUNXI_CCU_GATE_HWS(mbus_dma_clk, "mbus-dma", mbus_hws,
 			  0x804, BIT(0), 0);

-- 
2.55.0

