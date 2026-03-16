Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1D27FB37
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 01:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622937; cv=none; b=pHCYBbvbMqcX7OQy5OyMMGDA39+jnmcBaTp1xnh+kV4GIRUq5uJ2LPBbtTjshMXxl0oCN0eR5To7KcKYi7kaBYAuE0moC7cWwaxS7Dzaq4dYYmxH44MK+Wom2V5+etQ0AMGWKEjPle92v5MVCeSpD/BrZdpwvbUka1ez/P6dJhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622937; c=relaxed/simple;
	bh=aVDiNWO67RvcaLKortzpEYBNU1wRvtLFUoiyUFNRkzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rp3Wg/aSGaQ/9laqtIriox1VBRq8NKbEe0HFZRCDzasGrbO1t3UQoZPoZsX46/EzdgLET1ABISLR8eCxz6XyIottNJZUjeSSYuEvqJFNjJuvWa4P1ljxoPpPo3V99BIYm77PYI2GPPlh/XeZGAwm5ZnyoDlAtgCYiSYOXTf5LnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mu6eNfD0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mu6eNfD0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48540355459so36451735e9.3
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 18:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622933; x=1774227733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSn7hQ5i66Q0S46ZKJZuvK8H5ifNzHdzpxgp/ADQRCI=;
        b=mu6eNfD0XUeJO5TDPO5Q5DsaOO0noMtnEpdE5n0ICroYzdN8kb9rGmOWBNRG55jJBd
         w0EdmNY/coSq/11OX/pkGYxiq0Hmif9d8nvSulucMGsqiHfoiWIShSUywZ6YeB43HSyp
         ljfZwEpS39TePW0VdVBTXNSYsJd8T4w8zm0j5gmYftJmMpIDoiyD6egoyb+Mift1H8mf
         vCUYXCzSWXtgv5CUqfsR/WxGHhA8xMuenLZZAy6leGHmDyqxB6SXtrnkB2TYzp8WgVLd
         OW+jVSWU3KofLJ+WxeYwxCanHkGNBZX9gRUsS929K22H+XMUH8OZ7JB7a2/h9JaKcZl3
         hfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622933; x=1774227733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSn7hQ5i66Q0S46ZKJZuvK8H5ifNzHdzpxgp/ADQRCI=;
        b=X1PgQhsYVtdewckAsas1zlDOUcuiPDlVVnx8syPODAY6VcktZepKZfDAup4vgjMlJ0
         iGbE+aFw5AUFjiC7QWsJxUQ74s7OlldyDmZpb26yhUH3w9KJMcX3WZxYEAZveqlle/Q3
         OCNDoFmKKOjam8pUZEViYgvfxLbRRJuEgNE1aFtPwtT/IrHpJBu+/qNMF2NWZLc8I55C
         7KYA0HTsAGdpbQMlhFlQP4Y84Bwk84w6sfeNS/loPQ/BfABDt6eHm6SEnk931Xt2z15f
         i879VzjCa1k+DPtmHCq3pkwjZxEGliwDRyH1Lnh3uBdwaM4lBW+LknRr4R2/FNdtKxJ1
         3kpA==
X-Forwarded-Encrypted: i=1; AJvYcCVH1daUPZMCWvxU2BC5LWxJ/SS2lIHx2G8RdjdDeuDFoi4EHtIr7YINkfysz9mNT8kg8jqx/J8f8LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA6QgTfXbqze+hVsG/U3vUSGNB7z/ds//V5br3vpsmWz/8wAA1
	go7QIGsowkdqqdspfxD7+ahdpF9SaO37NPitEKK2qZn6JqwOotM0pXm0dJqrb4Ebyfw=
X-Gm-Gg: ATEYQzwjI24/UzSZuOj5tFWMapEnM+Vn2ZqwfUWBIPJ5LIAnUFxapRMK6G4m5mQG3P9
	ot/VkLFmUDrMnQKi+hROB9YJqCaJXBriaNICgbG2ovlxGCFRduDG2gZ0QOo7RLKQovhTXxduOEx
	k4T+/PlZDHTQgEswGmM/tf1stnxu6vWTJGOLqZCowOdO0g33bM5S4ORcWnciDtqEjmKLDG1yl+q
	cpDLIPjuP1Se2YFspOdsaYRPSqDX9J1vIPf1s5iCImLREpo6xNSMde691s5FbIQsG3nErmtgaS7
	Z8p7b6obWHyVd386PtN67VezbNUHGgn+rQZGshHN4xVNRReoADQM0niFL/BWQWIwpVeyxmGGUbB
	FmZgTDkVzpUJGR92W4Ln3M8rDZN7GcTUKbD96o9PecV5A1hK04xNBrjBygkx/8JdKFl6EZdN6zJ
	CW8N5Pwl5uU7CvNUVUVhe6Sb2K0mvqqBzsbsA=
X-Received: by 2002:a05:600c:548a:b0:485:4100:1eee with SMTP id 5b1f17b1804b1-4855670e7f9mr200978105e9.24.1773622933127;
        Sun, 15 Mar 2026 18:02:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:02:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:07 +0000
Subject: [PATCH v10 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-7-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
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
 bh=aVDiNWO67RvcaLKortzpEYBNU1wRvtLFUoiyUFNRkzQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aNiTUxan9LQk2eGkEMbeN+4hDN1CC/SHfks
 MpN3KerCBeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWjQAKCRAicTuzoY3I
 OkcJD/9ncxjPqP8d7ijCG/48u6PPqFiDjus2c3VUQBQA3QGuObdumglfCpbzKeoO7ljmLEzR2j2
 EhU2jJqfGNWXS2BrCrfxXGvH6Caa7Z5o9dCDYN1MYAKcIhkXRgyGdEQ6vn1uDVYYC4lUY0MPkbz
 3caYMr5AZiAZBkxvM6Nnb9dpoWYpIvZnhU1aPwew0W0HQAkx3iuiXBzcptCR125hl3SHww6MG+H
 DxpGB76xwB0dvzlUwLb5YNJx7QcqWxHmnPrk4xTH76QVg9BC4HzzYip3BZlFgAt/nayE28rl+Vd
 /OfRZS2ITOnkF+LlY2OLebOXqWKG+b2mbetwXKdmqv7woE8d82XoajqZ4ATFC7bWVEZC5oB4sAK
 k9mzHSUMvfvWQcWRvZTb51H4sNx21meG72knIIm7593amZGSmoyVmm39OtDgmVOsPbF0u1DsUKm
 ct50qOTT1uxUJonNfyNuxeJP3E2DcYiM6eoM+6TzeCXVnQCJtDQ7V6ghIuPuHQfWfQz43N833oz
 5+RGqI4uNrRIQeSx+HdrKm/BTs0g2cfmAAG0AEWxWv4uEg4PJ05Om4sj8q2ceR8jVsRY1b71KkR
 Zpg3TR00LdxM3Plq6yjbfWiUm3X9HbWpUd+Gg2wFQH+qgGWaLDsRTPHjuWiv8F79LapMANNM68F
 UUsZHZtpFD2eCTA==
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
index b1737b5d52160..0ebe634f5d96b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3895,15 +3895,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -3912,15 +3903,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -3929,15 +3911,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -3946,15 +3919,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -5362,7 +5326,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,

-- 
2.52.0

