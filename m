Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D998A1F16B;
	Sun,  8 Mar 2026 00:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772930415; cv=none; b=uLsM7zegLFniAoFtzhTYD6QefksA8b/afL9WmPP5AeN7dzvvZxTgVCe7QLb5aiHMgPBhAt3GU0BqPVdrB8i93Lcx1s2KRK7kLgjPQZIWOmOq8MInjFZs2TFChgwkw+OvbOvJPbV0GSFBWZ7YL757XWeW1QtPBNvrYr4v0doS/u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772930415; c=relaxed/simple;
	bh=Vq9Sfd+DjyiOKaA8ORs1pri0sgmURevtwQxcjbrH5Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRxsz3GnT3D0vSibLBfpFklJxVBDV9FsuT44m8BX0KMqjxMVB0STQXJaxVJynquDAA+p9zya41pJN+6Ss8OTXglpU78hTclMKAMjN9HPIU5GeuwA/q7lBSJ0F9D7hy1AWnI7eVgfx2Whzi9fDF+EiJoOSAJlxMvpFQF6G9q63Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MTNMvl/P; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ec5srwDA; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MTNMvl/P";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ec5srwDA"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772930385; bh=VSoauOerBbQAg+uIgBDDL8V
	UXe7EwPsnkrpOJZyLd9U=; b=MTNMvl/PwC050fe7fWZUskQCEShN0d6FdhsnroA6TNeK5rMQVd
	9vT/PGe1HVn5KCpdE1dZ0JgDc0w0xbvW9E7YNFyX99PsrtFGIi4qUSC6W/AlCkaItoBoMPMHjiF
	ZP5GIab0+1Yae+SUCnvU098Ot2S4JO7TkfUwMP+wm18Obd8RJW6f2BmgIi4Lhrd4QBsl9JgX3rv
	3HMv0kSZgTEgf2I3N0f7e3cen+Y9e9o1ycRiIkVEC6SdzTLPDmORV48mX+r38JNCKLUHq10MWjP
	P5J8bH+IrtSA1giUJnC5oClqrYiU1h7GY89+An5VRDNYy2T+VYaHiKXy6NELor1bi5A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772930385; bh=VSoauOerBbQAg+uIgBDDL8V
	UXe7EwPsnkrpOJZyLd9U=; b=Ec5srwDAnclMAYQ+Ika8VmOGYefFZ/W0vUKBlVL4Xi3gZ+QKZZ
	6oz1q4AVaqOvQLDLcJzDhk6AMi2qCxerAKBA==;
From: Aelin Reidel <aelin@mainlining.org>
Date: Sun, 08 Mar 2026 01:39:30 +0100
Subject: [PATCH 4/4] clk: qcom: rpmh: Add support for Fillmore rpmh clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-fillmore-clks-v1-4-976d9a6bebe7@mainlining.org>
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
In-Reply-To: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2

Add RPMH clock support for the Fillmore SoC to allow enabling/disabling of
clocks.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee01cf28c11ee8c4bd2f36d7536e6d..aeb83720d8fb07a2d5f413b746a24670a570ee63 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -940,6 +940,27 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *fillmore_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a4_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_fillmore = {
+	.clks = fillmore_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(fillmore_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1050,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,fillmore-rpmh-clk", .data = &clk_rpmh_fillmore},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.53.0

