Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87E3BD25F
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314689; cv=none; b=sCxSNQ5o71mIUXZ8HmpXL2EOWrhaxFQK2uiEU3Beu3hyxSSXE7q1cXu7S3hMSle2s0T6m5S93Nu5Iqf7KcfCchnENL2u+QxFJWUj0ivZC9QuNNN0eND/7dxLmAR7BrDRiRhazRbzQKmyW9JaQ5Yie5NopUKrE/jNooXHHHDAv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314689; c=relaxed/simple;
	bh=vi3l57rFdQN9o6dYFz4oHBnQnb11V1l9VfNmYa5ReRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2DZ7mYfAG/saVNNV0h9Kla04im1g7CEiBHUcw5ECND8FG4DT7taukalS9r93syQonVHeg6ISqwPmNTyLEZE+DaZhuinHj8Cgm4SfpRN141A/r/JUvXTXo3ZiV+jrveQzCvOqv+a2wGD2zm9W64lwfPgRPtZssBuELcKkJDQedU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=DBqgUKhJ; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="DBqgUKhJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRgEFaLoplAf78NDUsUX00O6rpYN8XYlndl7+r59PiQ=;
	b=DBqgUKhJ52pMAze8FlM7/cDnMrTp+FpePn+nCkzju7pyr+mXRai7VumOaDtWeqk4Ly5uo9
	satgmvbcAvFhlapkQwEIQG8Y3323STpFXTPJItlRdF06crDpE1jYe658OExlH4Q5+3P0r0
	2SbaiXajgBYPzCPiIMS6zZP2DPgMhwpWW6OTaia99eyRBZWl/jqtJoCxz+nzgcCu5Ct6YH
	0cB2eY0yMzVio9iCrn2EY7a93KxzTHOhVrOg7LSVE3XxeMzknHCOEzI47ALsG+xv4Z1c8j
	wcI6511iDviAU2MOP8IEjoO3OCAvHWlgolshOnG/bXkOCPSjY5uNyGH/85OBqw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] clk: qcom: camcc-sc8180x: Add missing HW_CTRL GDSC flag
Date: Thu, 12 Mar 2026 08:12:15 -0300
Message-ID: <20260312112321.370983-11-val@packett.cool>
In-Reply-To: <20260312112321.370983-1-val@packett.cool>
References: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

In all other Qualcomm SoC camcc drivers, the BPS and IPE GDSCs use the
HW_CTRL flag, but it was missing on SC8180X.

Fix by setting it on all applicable GDSC entries.

Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/camcc-sc8180x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index cd4c40a81c28..67b2055bd212 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2555,7 +2555,7 @@ static struct gdsc bps_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &titan_top_gdsc.pd,
-	.flags = POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
 };
 
 static struct gdsc ife_0_gdsc = {
@@ -2620,7 +2620,7 @@ static struct gdsc ipe_0_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &titan_top_gdsc.pd,
-	.flags = POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
 };
 
 static struct gdsc ipe_1_gdsc = {
@@ -2633,7 +2633,7 @@ static struct gdsc ipe_1_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &titan_top_gdsc.pd,
-	.flags = POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
 };
 
 static struct clk_regmap *cam_cc_sc8180x_clocks[] = {
-- 
2.52.0

