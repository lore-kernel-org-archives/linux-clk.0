Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B541FAC3D
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184251; cv=none; b=ZRnEoSm4wgn0UnFlfLlRnj4O4JtYVqukQAkucoOhO6UYngXmZy5QkAWmQ5xQYQLRPAB3IiF9EYoQ/+tM1sMF2SymMKu8Y5S5Elq2y0WGfhjAmzPrhsDL/ANk20qZQ6DJbQtIH2grk6EZMos6KlWkruFiZk7/EKyVKz/TKA96WZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184251; c=relaxed/simple;
	bh=TNWk6Nhecl+MK70lQyzmpY0MvdOLmTWgfNITHOR69g0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rlHiCMSLFiX+qLEYhJpn2w4Y4aEZ54gp8Wg697A9rKtfsADYAKedUxyU614KC5r7VsdAXjpeqlmOG2CupVSA2geV+pZx42RDQ0geJXk3g+IoLC/gpJoVikKKR5S7q7IvXRGtbw6dMejuFKcko/p95YoZRnN6gcL30wk9s0cW1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+Gwdeso; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+Gwdeso"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so1397034e87.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 09:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184247; x=1729789047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UFz1EBS664yxBFuEMA2FSihrk5iM+Mi4zrbQyP9EL8=;
        b=r+GwdesoO8ek/4+Q7b/gij5pkP1OAL+Kf8oYREyFc+vE5dKKnCY/zJTCqfUSsfl7fH
         FWsAwtjFfhDbOWcEdTj6rjfHv/NzZglDwSx+6VbPj7AfF45k+OHLKaEarRhEBw8swLaz
         xhBz9hVMJtK8xKcBoGGXPWYRrtC0vwbdP9JQ783dnFfAUdqzK1x2p0upDBZrtj9jqVjQ
         bxfyps2MJisFdRJFcq//xBLUVfadkChCF5Sc8YQx9OJFxX9JN2fwbWGg29rzXdzDh534
         D20wzyb2ccIM9uhoYtXS6/jAzWdwKJhcgH9MlLo6QKI+3Pz2UNavG2iOyvHMCeZLakkv
         VEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184247; x=1729789047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UFz1EBS664yxBFuEMA2FSihrk5iM+Mi4zrbQyP9EL8=;
        b=Avx1CO3DBR8KHnferUWz+oy5sh9tkmMf+e+o3/IbedgPb5FKns2BZBPxGXEjmDN1et
         EPCgbW/CjW2s7kmmvBWT5vR6HihUt8O96/+0vsPJwx1GjwpfGLmPnEu3Y7xW9dupd5sS
         qlMZgFmmNc8gGPGAolCxhTzBzJO3SYe+rc4HgKTu6tJy5COaAdKMJ6BH23/oFvLpolUU
         7YZWFpYstIb3ba53ePIaLSqAQyGwnLfQIaQcu3JC3GQ+wx9Q8hzEJIY1UXv7hVLb5Zsx
         doN9LgoGKwy2o1m+68JKVM5egZpRO2tTkAnsAfuJovieJN3j9amWmXmqAXs8Hz/y3LMV
         gR9A==
X-Forwarded-Encrypted: i=1; AJvYcCVEwievjzHJP4Z5dULafyONW2RRLVtPqG432I3uMaXLvLu6UHIwN4cXzr7uwoRjqxIRyI3Cvz3vtXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg9ZtBxEqTWKHhojcPL1D/4c7s6Pvido+0cML9X5ONLwvyOm3P
	V5Y6vJ+BU/x0nn2w2OoXZ+nVshL5C4TaFHfw7s/z3SbUjwoCbWAJtRTljS45NUY=
X-Google-Smtp-Source: AGHT+IHrYo0UHNxAeYw3mALmUSCjMZV1XhvwxN0/XCzV1CdSNcMnHY5qaSZkDK1p/GCifnDks2NOmg==
X-Received: by 2002:a05:6512:304f:b0:539:ebe5:2986 with SMTP id 2adb3069b0e04-539ebe52ec9mr8788213e87.12.1729184246942;
        Thu, 17 Oct 2024 09:57:26 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:57:02 +0300
Subject: [PATCH 12/14] clk: qcom: tcsrcc-sm8550: add SAR2130P support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-12-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TNWk6Nhecl+MK70lQyzmpY0MvdOLmTWgfNITHOR69g0=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHduuavViRPGO9hBvHp15ol0VSkgMtR1sbtk
 kBJ2m2rcz2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB3QAKCRAU23LtvoBl
 uMAPD/42e2/3+kk/kt5jWcY6UjJF0zZtDNqmqeP0+k4lx/TXVR6OcS25I2vfciw91ppiCpQlsku
 ICt3re/0sy1IX0Dqo551NnZ6P5q3fefLp4vl0RnpAS9jx8BIH5uHPwSue3v4tGv7+MkGRBdoh/H
 +Cz2eDA2hA1T4CZppp3+cnN8YtM+dR3OUDpW5dm37ad0ZPun7YvOZcgBV5VZgVjbi4liTCh+Dl9
 GV1fjdINF3W6DWFLpqu45KiYGCNNqv/JmnCkhkaBNAz0wihuMPrXV0t7hjwmshn3AY9HDlu6qYB
 Hp2u761lroVf4qiAj2x6T1weTPJYY+J/CONG8U9Mia5KRiYLKcBuMKo2zcRs+fzAZYxny8huAoq
 qXMlizQWN3o9sHnUiE/WxqEHUMZKMo5Zo3+eDzeZNkp6ipNFi91v/BK164RbtsO5lfLt+kq/UQQ
 I3eBVGIJ5HWsUfigRksDi28TOja+07XuUf8dR7u3aYZb8kataVOZrIGKsAQ2jEaZcHexdI2ev7h
 TlomWUHWqOhY+s8TKyf0O7Gr1DtBi+YvBUSTp7I6r0bKUQmuiRL4RSNowXEMUkxEyeL3hh2Sx8+
 jQvVOKMUYLz3PXqibMRQafI9aqv3KaO8XTyHXN75k6bdLg5w7UQHnknMtpNwWQh9Pk8NYIx4WU+
 Ci8Hrn5YO6PAyoQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SAR2130P platform has the same TCSR Clock Controller as the SM8550,
except for the lack of the UFS clocks. Extend the SM8550 TCSRCC driver
to support SAR2130P.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/tcsrcc-sm8550.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-sm8550.c b/drivers/clk/qcom/tcsrcc-sm8550.c
index e5e8f2e82b949dae592ec3dda585138bf89cab37..41d73f92a000ab924560a0c2c9d8e85a9aaeb1b0 100644
--- a/drivers/clk/qcom/tcsrcc-sm8550.c
+++ b/drivers/clk/qcom/tcsrcc-sm8550.c
@@ -129,6 +129,13 @@ static struct clk_branch tcsr_usb3_clkref_en = {
 	},
 };
 
+static struct clk_regmap *tcsr_cc_sar2130p_clocks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
 static struct clk_regmap *tcsr_cc_sm8550_clocks[] = {
 	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
 	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
@@ -146,6 +153,12 @@ static const struct regmap_config tcsr_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_desc tcsr_cc_sar2130p_desc = {
+	.config = &tcsr_cc_sm8550_regmap_config,
+	.clks = tcsr_cc_sar2130p_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_sar2130p_clocks),
+};
+
 static const struct qcom_cc_desc tcsr_cc_sm8550_desc = {
 	.config = &tcsr_cc_sm8550_regmap_config,
 	.clks = tcsr_cc_sm8550_clocks,
@@ -153,7 +166,8 @@ static const struct qcom_cc_desc tcsr_cc_sm8550_desc = {
 };
 
 static const struct of_device_id tcsr_cc_sm8550_match_table[] = {
-	{ .compatible = "qcom,sm8550-tcsr" },
+	{ .compatible = "qcom,sar2130p-tcsr", .data = &tcsr_cc_sar2130p_desc },
+	{ .compatible = "qcom,sm8550-tcsr", .data = &tcsr_cc_sm8550_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_sm8550_match_table);
@@ -162,7 +176,7 @@ static int tcsr_cc_sm8550_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &tcsr_cc_sm8550_desc);
+	regmap = qcom_cc_map(pdev, of_device_get_match_data(&pdev->dev));
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 

-- 
2.39.5

