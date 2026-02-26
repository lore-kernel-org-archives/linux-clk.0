Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9313D7D63
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116139; cv=none; b=DGbrVKqEu4NzU1ptPWn1uIk5CZPHDfUiKjYYj7z/+0Somr8IOOHOU/rmYq8dxZtMCMJ2Qh9aYxS/GgA7vBtDwod8nNtIBBK5qthkCSMQKEWpD5Dv/8FZbTdas104sgXIJjN920F6WaJ9ZA+CmRTymD+xxdV+xULI5AiWDwyaGGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116139; c=relaxed/simple;
	bh=JCJLTtRtvJ90CcOYDuxKvQaTTx+Gne77FFK0gL0HyCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zep3EMfK3yA0Jsx8wAv01DI/S3plWNVYrge7DuNGNWSq1F/joMQ5ccShqnVUutCtGus2ZOjzgmCQVEKsrw2+56rt+wK0If9TqxccXpS/jXE5AOnlyCBlMz6LBiaWGZM59kRWOQ/SrYBMCYE7SnRriUDp0PLM88c9MYUXaMLuBSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=poCAV5UR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="poCAV5UR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4398f9e3b40so894408f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 06:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116133; x=1772720933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhJBFhoC1RwaDVTW5cflhmAq0jF+Ul6SFFdi4f77LHM=;
        b=poCAV5UR6tn51Isdfw79sNZs/F78IkV1Kw+5XZ0VAXmKfVQd8WuPvNvsVWAJTHFk4R
         V0655Nu2Ym4ct5RSExaQPRuuLrqlKvDH8NUhp8PKgzgzBJtnA2gfi/FDyRD8YYCPL/UY
         Vvi/OtXNFs4p0hhVGXDy5zM2nhD+gFjzU5DIoL0mDQQdfM33BucK4kFwDW1dQdB+9ESi
         RDIiPbrZcqCGITW5FiD/SobJhWDAITjp6HUxHE2N5Ink+CLCCw/Y6JIDDpGJeSs3b8Iy
         dn4xAjv5IIHDc8JHHKaJu/yv9cT+i3rh4W2sofJ0xPPaXODsmC72Gi4Ps73AJh8e/ZyC
         zk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116133; x=1772720933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhJBFhoC1RwaDVTW5cflhmAq0jF+Ul6SFFdi4f77LHM=;
        b=BWPbphdyuVeWXp6de/aoW9EgtSwglh3s4hGZBffdpIakFWAGJat7uZHWgi7n9l/bXk
         oku67bNYNSdKPVCh15Nm2BoQnDR1Lov89eR0T9rMIwg06aGljUm43pgX6Z6/lYpSDMMu
         L2pl1jIYvpyifEdv8AqMwMCuroRQ2HPSLfWFTdBJ1gdlgd17AOiVLJMoZCrM7pWWvRsL
         g99TaSgzxtkg9Uc5ljaKZcqxxGwFwyxOL1OOM38ANqrk2oG+yqo+saVo3BzNAhBuiQ70
         TE7mJ2CGyEHxIUieqXD57tPJpxLC2TJgbq5/Cq5SC5SbNTBtVLTOv0yv0k+GcME5PSFe
         UGGw==
X-Forwarded-Encrypted: i=1; AJvYcCVwfjicC+3Ldd3b0zhvReJNIgCI7lHkCNVNivDZZsnlDnav7pXi3WiABMBO8q65fHJNU73MsUWkn8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRyhaIiTDODB4KtOJOYx0xhKUMLMkfIA2kq6uhZPxoKNt1Fb5
	ETDWFwJmD8e14kpMlfOC0i1088WHyFWh6uVpuj0E2ox0pz1umZ3U51hEYuhilFpE82Y=
X-Gm-Gg: ATEYQzwofF221ss74qpFDZj6nRQ0lFjvPEWoWPtuj/AuGZ0iCxzNKGWxyD/1kPqrP9o
	IPDbKMRIayF0a8mAXWTTZjZUJO+9tmxs07QDYuGdJvJUOS/zcBD7EoOLLu2MV9RAGRncrbXYso1
	PAR6NdDBSUST+bF2/H6kP64S5UkjWr2vjVc4j1O5jm1vusldYCpegFw49ud7Eu+byZc2JjFZsyK
	EtLoqxROt7gd4/pEtG+dynmZ0xQEs3HqcBop0K4Q83ZWk8OdWDew6OT/+/3/ysNWqGrsdcta7Fm
	Ub/mklsZuMR8SwO6vmZv29a3zD+/8brsgC6zF1lwG0dN+svePi9HHFVztZ04O9wrdRnY/CAEpjG
	G3WcXgmagyS4M5asv0pLkj5l4BHRA+mFk5qmRU4PRbwlw+oLtBQJR1zLAjztd40Yzsofgny4ZgY
	A9wOupoeLws54LiScqaOnkPrk5oAEZsV8IIZislajLffpLrB7YjvF7UoNcJV3YRhVW
X-Received: by 2002:a05:6000:2c12:b0:437:6bcd:77f8 with SMTP id ffacd0b85a97d-43997f37a94mr4434903f8f.38.1772116133025;
        Thu, 26 Feb 2026 06:28:53 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:48 +0000
Subject: [PATCH v9 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-7-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=JCJLTtRtvJ90CcOYDuxKvQaTTx+Gne77FFK0gL0HyCQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFicNa7xECexMGU1qMw7iHROJ0V8EXx62VgEs
 4A+s+36pP+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYnAAKCRAicTuzoY3I
 On3MD/0dlLq4Rd0TSgAR4RKDSDZlnJGCoZUBKbur4pY1ZqfwR9qr7TJUL59sGF/gzL4BwUBDk2E
 Wv6svw+sHsDWEvtmYTvhpk0GzWUzy2woe4hwSsKM1iPdaPfOg5nDtze8nDiIZQxXDicxMjKxi0o
 8iZxie+7cT0G7B5QXtB9wutNmveH5BrlI437zKzrBzW3k6kk+4e6BasMf5jsBsJPCM+Yspe7NTc
 9HnXWmhjqbg5cvq6D29It3AIyRe0IxfjRsImf2w1JctTonN5oiwI29F6PiVdai3mVOsvvGn0/Yq
 wUTtYgn0n47mDUD+dCScMVSxPcZreegMDABOt4foMUiAEnczPTFia8NMWTSGpw8TlQdlZr42Za5
 WgmwwF97G15DlyYUC4wnsdrqw8em/DKZNcALJrnO0ldmK8csRHHOtu6JSYYjBptsvgsSEu2Oh+X
 P4PAWMKDVRSafytNnbnq/1WklJpYZaTXsE5/h6jEqGJWZ7UY8EBGw6IkOadTRXMojFogCfTcEKc
 Xj8Jr+eKfUxD5PAF4SaFWT4XrhFvDYjjrMxXK62HakDIWX6ZuyS9s6Rx8qYemIr2fO4VLO3pOav
 Sj3c0WWTkQ4VsviH0knFMxAp6p8CZNddmbAwhCDyBmqlYkYD8jfhLD04AIt6pVjzAngKvz8Q5T6
 AHkyqQcVO0NCnEA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

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

