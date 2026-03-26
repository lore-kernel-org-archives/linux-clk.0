Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AECA3793BC
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 01:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488498; cv=none; b=J8JyBcWhafvngBaAHmo10Hl5+OFzjSNDNSTx3FYPViga81+qtCQPQ0JwOKkjkdz0tT2jxkItobm7HZZh6q+bYwqYL4XtatQgc8HJbgmMkFhRHzVbWIFP/vx9btBsDcVNFQ9kXuXGyA163L5DduZ2ZQwW5l/7621eS5i+cDFWvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488498; c=relaxed/simple;
	bh=N6f8XbQrqLkocc2xm2zf/znOnvl2dvw/ToKTgJkKLbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ian4xmchtC6sCioGLH0lyjIoYA5hP3ICURAzx5GlqzJyNdrBFSQdbacPCi1xzeu0Ub6M5lfod6AzU5cKKsibjyUeHREQ3Gpulz/msB4SI0/LoY7/GKTE7Swf52Fe5LKlrb93FfAvUBvatOsSu2EGLibq/pnbbcqb+gEvJQ4iJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltG5IQ1l; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltG5IQ1l"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b94a19fdso374154f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488494; x=1775093294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgXkjUFi8RNX9zADMCF4Q/I66OJ8AZWY+meNn13gnkc=;
        b=ltG5IQ1lStIVtAwjl5niPwGo+gosbh4SgN5XX9ZAYRGm+6SNX3rEEFveufg1cf2SQe
         +wCEIOzM5tV7rZ3bpcM+wSo4jhtQAPpjlJxt+X3yCMSYLLkDVRZGqV3Q/JMva8SCGcdI
         VH5zpZfX6ctCJE3FF54PU4D1X7GZg4IUS8W2nUi1Xcdm8axA4ioVtEr1Vngmt6+zGk+N
         7z8NempHIZ2IOjIOCcpcT0THhi5ROYFgud9hO6PuRv08mVwBl5eFZEApVBLQZqAdbdTI
         /v6F3V4lwKJ+y+QVRhgaR5QBSUdpWLmzFOh13FOcUMD6thgbgjIn47sJN4oqCudUh0Eu
         2ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488494; x=1775093294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgXkjUFi8RNX9zADMCF4Q/I66OJ8AZWY+meNn13gnkc=;
        b=k3/z/2BuN60WbwkLia73QoHkZDSKq69bntd4Dm0aG1tvPejimJAuIzJMY9g2l/v6Q8
         JOZX/h1weOHfdiP7fT4x75Gp5zGnVRv0YsFcoLvW5vl52gruFtZuNBVoa0jSkheAe37P
         M/kRMpmLBKR7OnyWaBkurq5aM8GQKLHiEZEp+DCbkdXcXcsjYDKfPuXlTmaLjNCFiJIA
         HS8ZSjgIm1ZylRBihWIwieMnls8kGYq9/F6bk7NBnBYN5lb0u8eBj3gBlELKxxpqr1Cy
         9e8PTeMT0mW3whdaGwz6XTUC6Qg11PNu9yIsaW6sl86/l/XwNvdx9i3n7x307NFEdPmh
         sc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzcQHRPlwxvSK6VyRu+XowpY50jWg6Z+KRtwhnOOeAOrP7E9T3injqEIsly7BmUDAgbXfhDCmR4XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvuZo+hbJ2u04IMSdL8W4C/wC/zzdxizqcDuUYUMuxbWE/YQnO
	n/c1bPABIyrV89yQxnZ9pbC78Q2xEMRJsdgiIWNi7u1nXE4IoJjt9SqIQu37pshuPJJd8o+cgK3
	EaV9w
X-Gm-Gg: ATEYQzx/4Ti8zOMiMAPi3C3/vnBxifT48p7D7c4S/06CVCxNSq5H5HErpG0qkxsh1TG
	tTGDbJ3PEamvcHirwpPkcq5IRvSbK61dy/2AVXwXadnKSKLWLKOoe9bzzWu84NdP/3OxTDBR/HO
	nOwyaTlZxth31/r0rqS0nCrDiSXFYTDcvFWoNRDRp5WRkINi8PT2aviAZSr/R/dxfQfx+K5iKuU
	3EpQmR3cx/ahSnxe5nD2q50ar+HAY1KHe1VIItAF8rJJNcdcDo8dHeFUp+2s5oYCg5+zad0aErk
	IINhqOkYOsoajhUvtUpWXoCPzJW26hJRKo/47j6vhXG7pgU5vJhGym/CNCctIS5sHtLsrpE5I2O
	Ui9XyjxDkXBGRkvPKMLRFkIhqLO9GFbeJ0hoX76wL1sqrO3lDSh7ZE4jOIzwdd36gS0/h5oNEJ1
	VOH0pT8heh7RQgmxYRdBJfKIMP59QHrFnk5/Y=
X-Received: by 2002:a5d:64e7:0:b0:43b:3c05:d7fb with SMTP id ffacd0b85a97d-43b88a39b7amr8254132f8f.54.1774488493490;
        Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:35 +0000
Subject: [PATCH v11 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-7-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=N6f8XbQrqLkocc2xm2zf/znOnvl2dvw/ToKTgJkKLbQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIvAW/02o1imMUf4CeWHGfYnnSEV/h55Bnm95
 89E+DnlACmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLwAAKCRAicTuzoY3I
 OmeHEACz2r5rOYRYzaR2gfd8IFZe4AGMT/qP/a1S1ZqysbMJWb+lApAt50A/4VelvLBR76cDeo1
 9rYvr6oRXNFZWJZpk+JHQ3jx2Sm9IZove9pAV4pWYxVJsym9r+koD5zQwywQOeFvyvizvsGRsEq
 fnRYzHymI2Lo9QnJR+mUlK5Gr/FXJ7ElGVI11WlWQZLSbO125JtS0e3Ve1AcSU05RTiZ++J/LrV
 m91WApzYPYJUFGwdDxd4dWUZC51LL8LTSLDFAWYU6DuIP1AwS5k4+DdXgxeLu+canP8K53jC8QV
 Er90YGREEx43r3S2eXwS743Z5zYXiU2QNc1W0WPvsQ4+D+kOskrMDDakHugusK0IJCoYdx/t6Ti
 jTBssLHgS9fiyypxCwV4LKuJOO81S6g5YqxSm13BbcWN3OUn/U5l/yNprtsnS5pAHAyb55kC/RF
 9iinNXo8ZCN7rUuddhGsZtZgPWiqrI0WTlYJHFCH1uenDrdYnm893IsSTBcSeRiFYU3cUuQ4jfA
 bBxQupEW/n2Ut19upmltARvES2wfzAv0P5q8cdI2S8vtvZcf0MYPrXWIdGpwaF2i71JNMdYQVkI
 So6btYsJc6d5lhvoDAUJVkqDYu6K2T7WQumaHSquDzrmYNv6DMxk4ZNuyJ47Y/KYazIA0nu8vPX
 QfPKTV/SBF53dDA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 224b5472d7771..3b092560b5df5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3896,15 +3896,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" },
 		.csiphy = {
 			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3913,15 +3904,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" },
 		.csiphy = {
 			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3930,15 +3912,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy2", "csiphy2_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" },
 		.csiphy = {
 			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3947,15 +3920,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy4", "csiphy4_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy4" },
-		.interrupt = { "csiphy4" },
 		.csiphy = {
 			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -5365,7 +5329,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,

-- 
2.52.0

