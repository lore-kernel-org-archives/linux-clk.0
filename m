Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CC123BCEE
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 01:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018471; cv=none; b=RjS7SjnmAMuoa8iatsN7Nbgj/YUixUm6l0DyKiBlNIaYPMe5/5fm4x8u4ZmMDQP0PREpv9TxV/QZeSS4wlUm4o5rRe8W2MsnOcI5s5t3sK+LmrfFv8qEdxIOBZV8FuvOiKvzv9ps1DfbQxgBl+Qn4qP6GRU00z86fC3r1ipRoN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018471; c=relaxed/simple;
	bh=U57ypHnljXKDxdsq3ODYlw85+vLwbFuz97Pd9FjGt+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fO8m1ntlRRpW3DASTHdktfpBRQYAOAnTVN6GIZZ3j9O3bbgGAnCU/3JrhoFRX7oTL/FkZJxedC1MAqay+vKig0KUtLR4XD9gVgsW7gNgzVGzIuB/3ydDGtJK1f9KQUJVBxqfP1tJLc4YB8m+9TlYfic4wwmGeB3xRvhSri6nRX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=vpoLoQtb; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="vpoLoQtb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kYbndzewGc+xjVSANoUQRMJVXNo+rCGM1vazeKfU1s=;
	b=vpoLoQtbqNORZ41RDBb6IYgUabzjzMd35UAUcTCyT0fX/7QjBVzYQrC0gq4O0KE1ES0r7M
	fdlvfW+YrztwYgvmVd6PDUNX7c7nNJy71pTDAlObeyiWkQE2KrEDuiScGZufQ3re8AWL1y
	p+Z0Jp5gGtwhx4BSEQ6XrvbBLhhCWmQf1I4BJI7J02lBbX/v6CQ2nkSKZR4nYfNaZI46Jo
	Niw1K7KYPL9DICKftfUgov06kn4IXsokdoRAYp3Qdqx/nge69OCdh7/EpZiFv1C5WMMfxg
	xoqmriC8yPjB2+5rzCJVl3RqOmb3vwhGKnpLQkmeSnxXfhgJkIAiJ+xKDFmw3g==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] clk: qcom: gcc-sc8180x: Add runtime PM
Date: Sun,  8 Mar 2026 22:06:03 -0300
Message-ID: <20260309010653.4266-1-val@packett.cool>
In-Reply-To: <20260309010214.224621-1-val@packett.cool>
References: <20260309010214.224621-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The GCC block on SC8180X is powered by the CX rail. We need to ensure
that it's enabled to prevent unwanted power collapse.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/gcc-sc8180x.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 365943cd5278..073fb1e2b302 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -4676,9 +4677,19 @@ static int gcc_sc8180x_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
 	regmap = qcom_cc_map(pdev, &gcc_sc8180x_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
@@ -4699,9 +4710,20 @@ static int gcc_sc8180x_probe(struct platform_device *pdev)
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 					ARRAY_SIZE(gcc_dfs_clocks));
 	if (ret)
-		return ret;
+		goto err_put_rpm;
 
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sc8180x_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &gcc_sc8180x_desc, regmap);
+	if (ret)
+		goto err_put_rpm;
+
+	pm_runtime_put(&pdev->dev);
+
+	return 0;
+
+err_put_rpm:
+	pm_runtime_put_sync(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gcc_sc8180x_driver = {
-- 
2.52.0

