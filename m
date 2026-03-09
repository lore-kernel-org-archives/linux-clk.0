Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9722D4DC
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 01:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018470; cv=none; b=OunrYkXep6yYiWFpTdfcu4Ki0xslMqSS5WU1AEbHa+W7dLJ38DbfeqmOw/M6TtdtrKMA9UQknWMmtYQXIsLNGhhXXnYU7jr3f2JopQ4Elw3aGheGDCmHt2FmYuNHzWLNmYaM4RaSV/g2mjrJs5DiAK9GvgqxCg4W0It1I6kPX+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018470; c=relaxed/simple;
	bh=/H2AD7oqAEUG+AgYB0p3dy99I3EKp/981cS22YlZjHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqoirsoIASHatwM4HxWZRgY8CRpHkJatTZuf6ShIt5hGtT0UgT5YL0Oj7P3hJuojzCAmRL6rEWTqgTtnUeYU+mWYofVM79oiSstMyD9v9wGlc34534xIdYcjsCbfgoXPZWUBGgV8Yhwuka7PKoyoo1oKALAPwwk3Wqlmg8QQzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=SPMEY3Yy; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="SPMEY3Yy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H12MaRopqLgkqyQ4i7oMR2dyRauH9db39BTpJwkq+Z4=;
	b=SPMEY3YyNQIQ92AltTwUtMNzMbnciNwyPEzG3ILukOJN7eojqfhbQ0t4Bct5lgi2GpE4md
	bIbnfNetdvmANLtGNoVjEbD7iXh1RNxJrLheZYjI09sW1e9owdOxPVnAm7EGaxRvylvLQT
	VsWd/TfYPHGaqYxeIqLPPBn2oy6tXU9hFaY+u5hGcdruuX9JPGQ9BBmKF0b3vh5RB1OwFA
	IEmGSb7hG65z/NEVCrthncsUX/A9SenNnP3f5VNI4KYz5MsAiio0VKtwqeh8k9ZNN9VtDo
	XRu67Nlgw6IeWgyQRFiUNkcXSxoJuN/6Xdfm8FDTmhRHs/ZEB92rIBeW9JJYJg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] clk: qcom: camcc-sc8180x: Disable always-on clocks on probe failure
Date: Sun,  8 Mar 2026 22:06:04 -0300
Message-ID: <20260309010653.4266-2-val@packett.cool>
In-Reply-To: <20260309010653.4266-1-val@packett.cool>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010653.4266-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Align runtime PM code with sc8280xp, fixing clocks being left always-on
in case qcom_cc_really_probe fails.

Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/camcc-sc8180x.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index 388fedf1dc81..7cf24d5c3abf 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2852,8 +2852,8 @@ static int cam_cc_sc8180x_probe(struct platform_device *pdev)
 
 	regmap = qcom_cc_map(pdev, &cam_cc_sc8180x_desc);
 	if (IS_ERR(regmap)) {
-		pm_runtime_put(&pdev->dev);
-		return PTR_ERR(regmap);
+		ret = PTR_ERR(regmap);
+		goto err_put_rpm;
 	}
 
 	clk_trion_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
@@ -2869,9 +2869,19 @@ static int cam_cc_sc8180x_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0xc200); /* CAM_CC_SLEEP_CLK */
 
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sc8180x_desc, regmap);
+	if (ret)
+		goto err_disable;
 
 	pm_runtime_put(&pdev->dev);
 
+	return 0;
+
+err_disable:
+	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);
+	regmap_update_bits(regmap, 0xc200, BIT(0), 0);
+err_put_rpm:
+	pm_runtime_put_sync(&pdev->dev);
+
 	return ret;
 }
 
-- 
2.52.0

