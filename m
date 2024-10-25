Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9720F3DE
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868652; cv=none; b=Q39ZvJrUZ+0u8VvJ8lNo/6fChJWzaT3T11P1cLQwWes1KGitEs1fytMoVKWpqnfHirGkA6kjoz+1bGpUwx/giauzI3hL62+EbYfdJlNmy4RwlYSS+ZrGU1fazVkv7mEZv1XdqkifUO3cKd+OBOwJyFMHPzVZkBEh59sdj5gEk/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868652; c=relaxed/simple;
	bh=L1rjSA7hLRyjlIeLPYAhbgLNuAgpRygH7wmtCWHxdlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rA2Bk1/BIEISm1NmPePe8ZWB0/Ge5oqRZ7cEf0S0Gy5vgo9cj/7Fr+pyniOaWJXuUnF/V+Y45NOjRAbrATVAFVIhmj+Imq3e4qDpSyeDeL7tTMVBmJvvHzN56/08LZzlTJV1+jhDO686Uc9vvc/Yoy0mNBhcmq53iV2H0sGrwa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VdffLGuX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VdffLGuX"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f58c68c5so3989955e87.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868648; x=1730473448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cx/7E6yuzJaG4XgFatO59KTwh6rhD+wMbHNfceiybZI=;
        b=VdffLGuXYiM8BRtTTB1f8WgM7rLZdFs/SzyFIt4YTOQ6pojd6xhXBqZHwoWNFQzkzL
         XNG4vzqOjcEERnPaSA5MmPtnqJQEKf0dD0o7EUIbQbBsydjhcjsWuY/KXTKxolMYh7tb
         zrZe6MS0kuvDuIn/dEjuxB0ufC/1FUWlXy+SZ9XXPiu8F2PRi63A31rB8kxojnIIYx+x
         K5OSIiKyhst8EUmNaF/Bx8gJP1+v9awRD0zlPMUxsfkI5n3rSsfHSxbm/CpVRt6nN6KZ
         ejm7ptKW/FQGYFI7aTiRa/SkBTErNghVc8cEEFhjrJfSwFn9hmHL2nySCzdGDWuzI8YV
         0g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868648; x=1730473448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx/7E6yuzJaG4XgFatO59KTwh6rhD+wMbHNfceiybZI=;
        b=IVRznIr+oqh0icikVNwso6ktFC49vI9W9Qm54qv/leczqJBc1bMfgyB4xz49/3yqxP
         l2vFwNUAK4aaq9mDtsTk75CrQjPLXPi90EGSy53Z8/pKUSisXDBfYzIRZgBWJ4Wh1DoW
         M5P4nxXxnk8lrzxzcvbzMNe+yvT16vDsIkNB5atVDibbhejkX6n9L+Na3NU9Mqb1g/Lt
         6RVov+PJV4D9b1LbYevuMy3klWyTky5o1ZMkJlPKfVRmWLradTNMwnnAiZqScCV/DjRZ
         QB9+iFhqmw5bI0YpoRTQyrV3bxPmlxSti0ooSK//IvCHuXn3H+Tn9jetIsrqF8bdiTTV
         kBZA==
X-Forwarded-Encrypted: i=1; AJvYcCVu0lZfektyQtqOz7ew+Z5Q1l1pWaEzq6e7jYhyzujJg9ju3lVmHc5uw5fUlePUMSLNEDHxibQf/10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKfCkyempAAkUiR6JEHaKNbLjeo2QNltOXbpFQ7Ug5HLLQhNk6
	fNTSgcZPTdc/n0fJ+vjmbbElzB5Qlfp3TVL4n8Q//eH9k1CUdwqNcx4nkvTlSk4=
X-Google-Smtp-Source: AGHT+IHKeGi7yAw1nrKsdQEKATmo/BeDQcLQH8PETHLOFHplqHMWV1kNi0431GoHQHIGePJg942nfQ==
X-Received: by 2002:a05:6512:258c:b0:53b:1e9b:b073 with SMTP id 2adb3069b0e04-53b1e9bb2d6mr9019329e87.3.1729868647882;
        Fri, 25 Oct 2024 08:04:07 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm209542e87.12.2024.10.25.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:04:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:03:41 +0300
Subject: [PATCH v3 07/11] clk: qcom: rpmh: add support for SAR2130P
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-clocks-v3-7-48f1842fd156@linaro.org>
References: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
In-Reply-To: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=L1rjSA7hLRyjlIeLPYAhbgLNuAgpRygH7wmtCWHxdlw=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7NUk3yWZdzVjPwVQa1LUVgaj+sDlUPqXdKm0
 6q66y76nnWJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxuzVAAKCRAU23LtvoBl
 uHmJEAC4U2gI4CvDeOJh7p/G2E3CyEJ6aT08SK/0Zud8/VQL6zEyXSEWFNbsNfEg2SaIeuChzce
 k3sRpy6BMKi/VULdMt5eT2C3e38FH5tcZeVyGpLii41BP3uoQnJSABuXKTEiyRb3b8yaB0fK7m7
 99LEjfJEFfZB+f9A/pdSEXq+i5bsEFFkk8QcxZT3R3NzhWbDY4aNEBmvgXSPwgs116baWtZQWGg
 ON2ppeY8pgF+aPFy01U2Q8cfg4mhOLMhRlptbSHE1j80okXJ9A5t3MI79j4BHfG49KOWWub1IhE
 DWfOVt7ToMLNf3zyA0y2R5RtWjAezFMLLuCdDQX1Dd5SVs0c6jVGY8ybLw0s0eoj+P8tzFMmMEn
 2oLCXsgDOAhPshVdU7gsgeJC4kAFakL4F7P2SADf60IsztOSoDzyj3cQNodshFWFK7oljZQfKWX
 bJFgCH97c48lNpvj2rRpvDYL1cQwdx5AZeW8enfjIAxXt4Ghi9fPtq1D0qjv54r/uk2S2uWpgpk
 cZgNk8FNGWXMH532pxg8nS0Gw5abGolKv5A37M9nE5otR/cW+XUcwXOSsHGSFrARz6WJLmkCdyj
 XgyDezZKMJRI5Avqe5OW2OJWyjfeGHXxgZNEji0V6DB0sDHFEmBdixrMGzPm4dzejw1hSLG6YWP
 AVTyDazzWU2KwVA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define clocks as supported by the RPMh on the SAR2130P platform. It
seems that on this platform RPMh models only CXO clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 4acde937114af3d7fdc15f3d125a72d42d0fde21..eefc322ce367989f625f1285dcccddbdd8341a12 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -389,6 +389,18 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
+static struct clk_hw *sar2130p_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sar2130p = {
+	.clks = sar2130p_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sar2130p_rpmh_clocks),
+};
+
 static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -880,6 +892,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
+	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},

-- 
2.39.5

