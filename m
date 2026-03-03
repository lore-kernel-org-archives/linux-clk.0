Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDD81DF75A
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 03:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772509777; cv=none; b=Ty6Wq9c5lsW03gFVQ5qVTg1TaelzF1cuSPr01QJqvsySs/HDKgwWt7LOItRM5aeSRQksp5bN32OV9H9cVobJO+zmBCwmS6WnbiS4wx4tjNOb0XTWQPbJyhhfdY68uouQ7dNaRg+4w1YatJ0tvwnzszfgvSjCctlXefYwEuoKV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772509777; c=relaxed/simple;
	bh=758NQLV26iLjFlPnugp6UymqkgFeKb0vZm5scqECkO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mULGY9BoEudxlCQtXtL0Ls8YfUUSNmOMiNBBRsKWEgfmVDaSly0liDEPtim5xk2rjzUzrnXIMt9dM7xOvqZ7MgH/eLPBlJs48MVuH2AhugBLOm5jar04jD+Q+IiTZcjplpqDs3YNxNCNh4uJPDIwg3WzAkaZnstHnl4BBeDxFso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=OsRFolDC; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="OsRFolDC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772509774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6eVMQMkXuZNpLHxQKItqT1Sc2r+WN+cU+XtpyRC/H8=;
	b=OsRFolDCu9IEcD37vkP3+U6UbAtmNWxC7FaAfAxT5vkxiIhhxognyTc+uTxP79D24QGgHl
	hFv6euDUgS+Yjnbs8nyaVIjjWJZ+YspFKm+VTl+Vx3cTHRd/ow+wMLNqlwHVNQV/6HO+iZ
	kkg4dPXXW0L3VOyQTZBF2rfVtcSLVSepjqguvXWd36h2AM4XkaooiPxXNVX9ISWFUMD4nd
	WY1qTLHXyTNUH06SYQ/iRf7F8XFq92zjTkisftTAwRly0yBz44nrZ3Jl1fu2B2lgHJQDw1
	UDIHdwiCsOdXC2YTu5m7enJBKF/GIeu6BYqICR5jpW5dlme6JliJJe7B9OY1bA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
Date: Tue,  3 Mar 2026 00:41:23 -0300
Message-ID: <20260303034847.13870-5-val@packett.cool>
In-Reply-To: <20260303034847.13870-1-val@packett.cool>
References: <20260303034847.13870-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The MDSS resets were left undescribed. Add them to allow resetting the
display subsystem, which is necessary to avoid issues caused by state
left over from the bootloader on various platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/dispcc-sm6125.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6125.c b/drivers/clk/qcom/dispcc-sm6125.c
index 851d38a487d3..2c67abcfef12 100644
--- a/drivers/clk/qcom/dispcc-sm6125.c
+++ b/drivers/clk/qcom/dispcc-sm6125.c
@@ -17,6 +17,7 @@
 #include "clk-regmap.h"
 #include "common.h"
 #include "gdsc.h"
+#include "reset.h"
 
 enum {
 	P_BI_TCXO,
@@ -607,6 +608,10 @@ static struct clk_branch disp_cc_xo_clk = {
 	},
 };
 
+static const struct qcom_reset_map disp_cc_sm6125_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
+};
+
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
 	.pd = {
@@ -663,6 +668,8 @@ static const struct qcom_cc_desc disp_cc_sm6125_desc = {
 	.config = &disp_cc_sm6125_regmap_config,
 	.clks = disp_cc_sm6125_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6125_clocks),
+	.resets = disp_cc_sm6125_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sm6125_resets),
 	.gdscs = disp_cc_sm6125_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm6125_gdscs),
 };
-- 
2.52.0

