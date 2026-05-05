Received: from mail.chunchunmaru.org (mail.chunchunmaru.org [45.79.219.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2003D3C2763;
	Tue,  5 May 2026 20:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.219.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013537; cv=none; b=paNGkz1qvCW73GRMQJV6ggmiVo/c+Wz9d0imjCDJp9UwewWxHu6f+f8Msw9gpOmHa1GxkB8IWm1PxsSZxovQxjffVFEKKRNCLEZFF0+dhu/I1Qy17qjASOpK6fHX3jeAlQfPCxWNWz3+ZrUewxA5pl1WqwIihR2KLmN74driafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013537; c=relaxed/simple;
	bh=dHd2KDKnBvYMY1x5Ql4RD/wy9CzzB4WBj1LykRhnhTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYKw8w3CZWjBpnVAuW/9/4G5RirJmy32MoB8jcA13MJyQFjsS2nTJVLvwqjVzbM7a9viPva1PsuLIMq9LprEI/84RMbOzZfNoqZr4jNpwo1PjsWQnNNbvjbq80yX8a/7cZ6ZkIXLUIWUFcByrxqLkcmJFHUe9VFEYF57pLAZjWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org; spf=none smtp.mailfrom=floorchan.org; arc=none smtp.client-ip=45.79.219.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=floorchan.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9517A32254A;
	Tue,  5 May 2026 20:38:53 +0000 (EDT)
From: "Catherine A. Frederick" <serenity@floorchan.org>
To: andersson@kernel.org,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Catherine A. Frederick" <serenity@floorchan.org>
Subject: [PATCH 1/3] clk: qcom: smd-rpm: Add clocks for MSM8920
Date: Tue,  5 May 2026 16:38:39 -0400
Message-ID: <20260505203845.192140-1-serenity@floorchan.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

MSM8920 is very similar to MSM8917, but adds IPA clocks.

Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b..cdabe373aabc 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -666,6 +666,36 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8917 = {
 	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
 };
 
+static struct clk_smd_rpm *msm8920_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_BIMC_GPU_CLK]		= &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK]	= &clk_smd_rpm_bimc_gpu_a_clk,
+	[RPM_SMD_IPA_CLK]		= &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK]		= &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_DIV_CLK2]		= &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8920 = {
+	.clks = msm8920_clks,
+	.num_clks = ARRAY_SIZE(msm8920_clks),
+	.icc_clks = bimc_pcnoc_snoc_smmnoc_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
+};
+
 static struct clk_smd_rpm *msm8936_clks[] = {
 	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
@@ -1295,6 +1325,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8909", .data = &rpm_clk_msm8909 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8917", .data = &rpm_clk_msm8917 },
+	{ .compatible = "qcom,rpmcc-msm8920", .data = &rpm_clk_msm8920 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8937", .data = &rpm_clk_msm8937 },
 	{ .compatible = "qcom,rpmcc-msm8940", .data = &rpm_clk_msm8940 },
-- 
2.53.0

