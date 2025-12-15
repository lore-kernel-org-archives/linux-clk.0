Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCBD32F749;
	Mon, 15 Dec 2025 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765794302; cv=pass; b=jLR/E5skAi2oCgfhSFsDP3sxlcgScQpJCxeM6Rkd+rCDiDGlOn5yEXrWTvEzEjv3TEQkpZbyMGHI1C+tMgxBGWrRkJk5hiUqgN4G0bakXXkM4BdNZkH+SgXSGu5uVggbcI5el0EmfnwpVNBOhsTphcjkornASKEXkr84PeXFD+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765794302; c=relaxed/simple;
	bh=M9of1vutdkZdNOkB2WXlI70RIQMLMZ+KFNCJRtrstT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCJrsVsCjhP76ok2vNh2qq67GtwGGQgEcf8R9zIHYE9ggnaX+hFpR73bK079IKfRN9hfG9TWYpK8lRt8g4pdnL7iVXsBpDvsxj9e3z2ixINMJCGum+2BHRILL61a/J4q6YsQIqWlfKHdmw61EkuA+OGVid52bpwZeluQ/ROtqQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=d0l0JuTM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="d0l0JuTM"
ARC-Seal: i=1; a=rsa-sha256; t=1765794280; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GcECXEGFYhLh60t/Aa77LWVODOx3xxLCmrTPNbriqCodsq1XZNwzpzLbZnLcJDZfoVFVGPiWHS3PcqpPfri/+bT9lurZYVhYhD7Pmrl0W5JHYRlWDzdXRrE5N8wkIAfQnfQdXZkMUaXoSxck7mPAQ5DBRXsXhuYuvmBoMi7M7yY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765794280; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a86bVwjEMxjj0fvsOy3/rDq0QFQ2CRDqkBGI8115LG8=; 
	b=kI2B1yKKyA979YDlNJjemxXwt+0xoE9rL0gKRay03jUSKo9uD0a5ZsogeA8PiZfIY30z4+lW0aAWPNXSUd0tGwLAEC8wBgyvork+3P7pTAPFkUv6rviSri224BtYDdo6DbHq2KCieqVfMjVMqWTH08ImpIp/2nSJnJdTZF6CkdU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765794280;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=a86bVwjEMxjj0fvsOy3/rDq0QFQ2CRDqkBGI8115LG8=;
	b=d0l0JuTMtXkiQVywnfeLWCYkYfIl5p7qkA6qDZHe38BRrzMmEXkSxyBcMQyXFqZ/
	Vaqz0KUCI92SEHAyyAcrVK+EV3OlNXTSbSICo5h60I556VYwDv5k1N4lCz39jvmqjpC
	+yqtqhMF7Cd7+D38qLJcyQK31i7c72rtKQ8ijuG8=
Received: by mx.zohomail.com with SMTPS id 1765794279261998.4445952166179;
	Mon, 15 Dec 2025 02:24:39 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 11:24:02 +0100
Subject: [PATCH RESEND v3 5/5] clk: mediatek: Add mfg_eb as parent to
 mt8196 mfgpll clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-mtk-pll-rpm-v3-5-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
In-Reply-To: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

All the MFGPLL require MFG_EB to be on for any operation on them, and
they only tick when MFG_EB is on as well, therefore making this a
parent-child relationship.

This dependency wasn't clear during the initial upstreaming of these
clock controllers, as it only made itself known when I could observe
the effects of the clock by bringing up a different piece of hardware.

Add a new PLL_PARENT_EN flag to mediatek's clk-pll.h, and check for it
when initialising the pll to then translate it into the actual
CLK_OPS_PARENT_ENABLE flag.

Then add the mfg_eb parent to the mfgpll clocks, and set the new
PLL_PARENT_EN flag.

Fixes: 03dc02f8c7dc ("clk: mediatek: Add MT8196 mfg clock support")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/mediatek/clk-mt8196-mfg.c | 13 +++++++------
 drivers/clk/mediatek/clk-pll.c        |  3 +++
 drivers/clk/mediatek/clk-pll.h        |  1 +
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-mfg.c b/drivers/clk/mediatek/clk-mt8196-mfg.c
index 8e09c0f7b754..a317183f1681 100644
--- a/drivers/clk/mediatek/clk-mt8196-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8196-mfg.c
@@ -58,24 +58,25 @@
 		.pcw_shift = _pcw_shift,			\
 		.pcwbits = _pcwbits,				\
 		.pcwibits = MT8196_INTEGER_BITS,		\
+		.parent_name = "mfg_eb",			\
 	}
 
 static const struct mtk_pll_data mfg_ao_plls[] = {
-	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0, 0,
-	    BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
+	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0,
+	    PLL_PARENT_EN, BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
 	    MFGPLL_CON1, 0, 22),
 };
 
 static const struct mtk_pll_data mfgsc0_ao_plls[] = {
 	PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
-	    MFGPLL_SC0_CON0, 0, 0, 0, BIT(0), MFGPLL_SC0_CON1, 24, 0, 0, 0,
-	    MFGPLL_SC0_CON1, 0, 22),
+	    MFGPLL_SC0_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC0_CON1, 24,
+	    0, 0, 0, MFGPLL_SC0_CON1, 0, 22),
 };
 
 static const struct mtk_pll_data mfgsc1_ao_plls[] = {
 	PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
-	    MFGPLL_SC1_CON0, 0, 0, 0, BIT(0), MFGPLL_SC1_CON1, 24, 0, 0, 0,
-	    MFGPLL_SC1_CON1, 0, 22),
+	    MFGPLL_SC1_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC1_CON1, 24,
+	    0, 0, 0, MFGPLL_SC1_CON1, 0, 22),
 };
 
 static const struct of_device_id of_match_clk_mt8196_mfg[] = {
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index c4f9c06e5133..0f3759fcd9d0 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -359,6 +359,9 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 
 	init.name = data->name;
 	init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
+	if (data->flags & PLL_PARENT_EN)
+		init.flags |= CLK_OPS_PARENT_ENABLE;
+
 	init.ops = pll_ops;
 	if (data->parent_name)
 		init.parent_names = &data->parent_name;
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index f6493699c4e3..f49dc2732ffe 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -19,6 +19,7 @@ struct mtk_pll_div_table {
 
 #define HAVE_RST_BAR	BIT(0)
 #define PLL_AO		BIT(1)
+#define PLL_PARENT_EN	BIT(2)
 #define POSTDIV_MASK	GENMASK(2, 0)
 
 struct mtk_pll_data {

-- 
2.52.0

