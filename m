Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525084718EE;
	Thu, 17 Sep 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636047; cv=none; b=HizgGiTb1pb088QS+aZtMlEr3TiKVKh2Af9ESo/Ea+Co/AtJNmENydC+E7Bfjycr4dQ26KS0dYd+St9srFh7jpn5pch6q7KWPxSzy2MCeY1HPv6gWcS0PU/WgMBdeJ/YikWQj3HqIw0y4SXvM+twvpnEP4vbQ49YzwcO9pzQa0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636047; c=relaxed/simple;
	bh=GHLtme7NDMufS6DWbRTLTYLKLClTqWKEGfOqK73WaTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUiGfGpVagw9tn8TTM8AlQQz3dBvnGRiWa6RlNDzi23Kt9Dx7NJ5ObOmJTS07emlKqgk0Sl6pA/xHdvZ3+o7heWUIsg18Us5go3OJosHiSjNeQRB8vTlRErfZBrnHASveFF7gHeLlNIYlooBKJ7sFaJK+NIYQwx5PgG+noh8Hag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRt0zySM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRt0zySM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4791F00893;
	Thu, 17 Sep 2026 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636046;
	bh=JLK9Gif7xz707Dqma1dcllSycd1rrGEmnGWxi/D/qSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lRt0zySMa+BGnlh9QjzQeRNwLRg7IjOvn/6XlrVHKLKAn+YD6eE16F8s1DzLvE49F
	 9pcpWeKJ7IKHjivftdsSX913uy2yk607jn7ZMCmx//6zkhPnkwsBoDZnnt5UamG10L
	 E8CMtD36UJff0fjghi8KmJDmRgfTgetQ44Hqt0SXAoYNcnqXPFO+lkrZE8erKj1eKr
	 SXRDsMYzRBEM2uLD2U/khcwbv4GCIaA4zwhMrOWSx+3pMJ5nObI/sjrPJP58OhAC8H
	 VWnzrYN5/jTIh6YX5jgymycDoiXz9co+MEWtoK52wLYHv7OEhQ6tTyTgZRr3zIsIS/
	 Q/hrnK8Q8D5OQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 17 Sep 2026 11:06:53 +0200
Subject: [PATCH 1/3] clk: qcom: rcg2: Initialize shared floor clock state
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-qc_clk_fixes-v1-1-5531cb00514b@oss.qualcomm.com>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Amit Nischal <quic_anischal@quicinc.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636037; l=2220;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tfh3/y1GaAsjd2wJBp33BDTZSBpDeCti9KhPKvCTPPU=;
 b=N13hvY2ui53EQFPsSSXBa0vDWSmJQ5kp7JDmARvQRIuW05X3mpzaw3VDx0giiN5t1zLAphRcG
 JFNQLVi3k2eAWgUU9xrParRq3RakCV6rixg395d6tOrm2wD4d3Gd+IG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Shared floor RCGs use the cached parked_cfg whenever CCF considers the
clock disabled. Unlike the other shared RCG variants, their ops do not
initialize that cache, leaving it zeroed until the first disable or rate
change. This can make registration report an undivided XO configuration
instead of the boot-programmed parent and divider.

Initialize parked_cfg from CFG_REG without parking or otherwise changing
the hardware. Propagate read failures so a clock with unknown initial
state is not registered.

Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg2.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index d7914e59129f..adb03c3aa0dc 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1555,7 +1555,20 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+static int clk_rcg2_shared_no_init_park(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	/*
+	 * Read the config register so that the parent is properly mapped at
+	 * registration time.
+	 */
+	return regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
+			   &rcg->parked_cfg);
+}
+
 const struct clk_ops clk_rcg2_shared_floor_ops = {
+	.init = clk_rcg2_shared_no_init_park,
 	.enable = clk_rcg2_shared_enable,
 	.disable = clk_rcg2_shared_disable,
 	.get_parent = clk_rcg2_shared_get_parent,
@@ -1567,19 +1580,6 @@ const struct clk_ops clk_rcg2_shared_floor_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_floor_ops);
 
-static int clk_rcg2_shared_no_init_park(struct clk_hw *hw)
-{
-	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-
-	/*
-	 * Read the config register so that the parent is properly mapped at
-	 * registration time.
-	 */
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &rcg->parked_cfg);
-
-	return 0;
-}
-
 /*
  * Like clk_rcg2_shared_ops but skip the init so that the clk frequency is left
  * unchanged at registration time.

-- 
2.55.0

