Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9037B175A7E
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 00:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469252; cv=none; b=XCwDPvZ6cn1dNBZYRGpNe3VKmpq/OcGXCgp1e98vKssupspzoHSKkbWT9FIE1y2/r4N2Wr564k8ER9kxLasr/FDjAyjTbQnmxMNx0FsZoxxrNKFrcwWuhj3X++omY2E79a0Kecv6Us96lfo+EQH0RAIIVwY9QQ/nK1VNCQ8/GT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469252; c=relaxed/simple;
	bh=QELXP0efqklH5qE/tb7wsAFTLcdUr6MfWusslj29lkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3w9hCk2iwhrN1cc0mLXxq5UOaNPq3B4/3bjROdD3nunlg7G9e+/6YVffh34oayRr46VPAELScqEWra03D6fM3k7KzI8VBDtbZjyRw6m8LIddiCgO0D0lApH0qYQxk4kEwyutDzrEpd2AdXHI3Ob8IqLA5507/KEQW7ABHk8gKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYUUZlAW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYUUZlAW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-475417f010dso30851f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 17:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469236; x=1784074036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZBW9NYAVgSClvNZsX0lNZoWG6gpuHIPaag9PPsncp4=;
        b=XYUUZlAW+ShgNGm4VQaYzaKMov6kVD9WO0SuHyZ5BSqu1B9nV1Sb6CTvn99A9tASnZ
         rt2CBzOPBsFj+Cs5uQ9NC1xp4JkPguVrSR81HupKYyzIY/Nq+O7uAox5Tsq8V1gE2gvY
         mtDuutM38wgPNXzGfeB+EGUdLik+ImOTREkJatm4dnOw5BvwG/P/o8Tc9jE5pQqIjqTw
         xt7B1Ja46xaazXnYYZWcxPg4r3CMG07ZIPKhzOLpH0fxXy4SgoLDp3anTzVkGuYmidIf
         NsrfqPjUvlzB8ytSwL7Vhk3iILnMKodXxBNyMnEXGJRRx1kLFn6ApqY1ija9jcoofd1J
         eCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469236; x=1784074036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZBW9NYAVgSClvNZsX0lNZoWG6gpuHIPaag9PPsncp4=;
        b=fg01gPSkAKbQg/pwzu/kJ4yV3vLhqxOnDcpOQ0RmIu2mZiYAaZJk6BbHfwlsm99Jl9
         taAI/Nn4cAigBsa7yTAKFqvUbWJMg+Zudg0N0G+b/ETjy/2Rj519L2UQMffmy7itN7rD
         GvWRatGjpDFdiBJ1o/yaHSZZiY7JqSfMU0Qv+hMP+hDDuIpcVUTLvi7PWlvHaBS01mPd
         2inSQCWe73g2pQ7cPjb/e8fxit0Oqrh2F6s0CnKiXFxBz6xK4pb+I2GsyNUE/Zd2E8PK
         Me/XYpwg/C8eX2OWsEJ+cuVNfryFr1LFh3V1PwZz8NE4e3EC+Qb5Pq/Jyy/Lruy3Yvjo
         rrKw==
X-Forwarded-Encrypted: i=1; AHgh+RoutPIXNhI6owcou8uhLXNWSt++d4aI/aKv3y7cTh+gGPhsccBiSU73fGV6qrbfsWbxcMVlaI7CYxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4TgzQUKaDQ/YZ6sMWOxVRScobQ1KWrnFD8UjMEiQCpxqHkUzG
	JMNuaJTEskcrZqnEyxyW+pbS1gSnBPrE+JUF/WteRh9iWYg34JCQWnxHQOBwDtKiBcE=
X-Gm-Gg: AfdE7cmcAgkYbnctdr4tiKyofP0pT2B0Y0UZHfvAAy+uFHkA+OUHoQ7IdfPyDebd8lY
	MaNVcSKy2uo+UGRROGvDYBzrG6L5BDo3qp+lFjSmOF4pTi0B5JMorsY6hwpjvcI/BZ4MkdrBVRQ
	z5sGwtndqjFN7PkCNfgKDVGvOZo+0BKpyGDNsBNzreWozRibq82/mB+yRtvl6UNn7NVqRT3hMWJ
	ZDTb/YeX1gAn7H2J9MxjHQN+I82ao6UloWIcUbBob/xh1Plk6zLjFXsG+qzvear//7HPMtIoatX
	kuHYohExxN61YlNpvKzzMePnfeI0HSJ4P8HRxmspmUeQVRihijbO3Dlehm9n0Z+jula7xCIK0gD
	28K9pBlERTqZNsbSS04Tf7ECEsxMElLmFgSbtnZZE4K7FWf//br66LZ0/Xp6xCOCw+bSt5454GN
	JIgt0nC0Pha/eSfs54FSz+H+g=
X-Received: by 2002:adf:e34d:0:b0:472:c426:2ce9 with SMTP id ffacd0b85a97d-47de666b0d0mr6964115f8f.12.1783469235651;
        Tue, 07 Jul 2026 17:07:15 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:07:00 +0100
Subject: [PATCH v12 6/6] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-6-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=QELXP0efqklH5qE/tb7wsAFTLcdUr6MfWusslj29lkI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSoDVvrSeIR1GEcpvrGvnRh7TNJeP7pIsOLg
 98ZcrZUbCyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UqAAKCRAicTuzoY3I
 Opw7EACl8D4iTNEOm3rvEsFvIS8xj6DIdntmnPUbPQjtqGfBP6eDN60AH668T4DmLW82RkhSrg6
 YCdbHf7h4xf1t+4DusZ7fk9x8bP3vXnitqmEKmT77+HYNZFMinclo3b62Zm/lIEucCKmbX12782
 XGjMGss3fPpJeMNRxawoXmEZBmVSQ4GnzjSjTuNze0DDKn1SyUE2TaoHJ2UENluK1Lqw6POiTJa
 +5jSUT8+dFSWOjaBCiSn6yi0kDOzJXNChp6nipQy67T+N6lxnZwUcaD2NaPusM+xZFuk8cZYuJo
 2A47lQEp7xVhcQj3NOxTgPjnqZi/9hNejuY1jlx07g0IjZVM9GYClUoN0F0UI9BEkoadqdeSOkR
 hl7Spf9gYWpiAOVof8dCE1HEaL277FV7LRaGC9Oqlz7cEAhBhUUVyFvNOWdx5bPiM9407qQ24bd
 5ujbW+13N8krxjuOxrOwveQPw33E1KIgtTb6CT/vmQFCWM+3OgkUcXrtFQtheK8d7jgUpBRMZji
 VyIk7/1JvDshePSg9oY21VyDEylKwolhmnmv9mPYWWdfH465qg+irrMUwdQ0AZgv6gJDRpmfq59
 7GwEpAL+Js4ZLp7MHlklypkjhYs6m8GuBC+4xK7mLADRfTINiZQq8+9xBXLBNnDFqXWA/IMImsN
 OzFdxJ/KvcGF+CA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 146fea438486f..f360b2c99bf89 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4191,15 +4191,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -4208,15 +4199,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -4225,15 +4207,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -4242,15 +4215,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -5803,7 +5767,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_x1e80100,

-- 
2.54.0

