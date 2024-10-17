Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BF21FA257
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184248; cv=none; b=fU7P7aO7riEUoJfKACKJp442D//VhHPfZqtSozxWvP1UZgZFHJ+zTAYDWFUY9O1AP4zCMV5LeJam0gfCLOB7+qhBntorG33bOpBBT2P+uqWb6r3zDBZn4ynaTXoERHLDEUVzk9r5JVTEmmr7zdRYc1YlBVWyKE1OPeBZWVkPY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184248; c=relaxed/simple;
	bh=LnoCXGHzd5t7+0pN06MF228za9Lu0FM1Oe64mRLrAEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4XuOQcIwS+QoB4p7m0rUZ7/i1McH0chtVROnPUnBnwhUy5a5pmffe1mmH9Uf79CvnZhQ9HE0dnfDXiFSS47Zt3HqzCAlhzjiQZL98ljfPYfZ+bCp9puUPnbnnmOWLxgrqIwvDED1wehaQQjNQFGY4qBKiHmieIFLerf9SVtISk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xa4Oc47c; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xa4Oc47c"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e1543ab8so2130534e87.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 09:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184243; x=1729789043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JBL0fLe68SIR8/IBckLhxHZOhWibFm/IK5cxitVKRM=;
        b=Xa4Oc47cqg3Ny/JMh4YZow1bkvCx9xd2u7FA0jiyZWEtKpK2Ntx6rwbNGqcuUo7GGR
         azj/0EN++NPVUGwXWHqEiNJhT3FvS/dtpGrPIjeBHHxgwOG5a62BIWEKFBiBMdXxgZPM
         9pRgDoOg/szThsrTry0YXFlOx+qcMr9Td//l/Im0YugIzjvqMbpvBA13a0tH3xsXXY74
         /XzYTnhHTErqnh/LbcTf1qQbiaUKDznwIZq8axc42kXl4nMjB+UgLr6//fccrTJcvjdt
         0OK0QpKVmUsuBJp1JZ1UeeKejmx6/Tt5wFG9uUAvTbvfzqq3uHukWqIGTL3rtXrHk6Dp
         7S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184243; x=1729789043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JBL0fLe68SIR8/IBckLhxHZOhWibFm/IK5cxitVKRM=;
        b=Wh2NW041mJEX7UllaMTWqE6t3dFLDqEMKa70JnwhsxpzPsmGcUYvf4nq7bdyrlg5Ul
         adnK9h4wXWHKeTnovh2R3DasDWpRQqNsCpLyx3lLFe/WFOUPOTan5xpfB9Z9VrO+jjkQ
         ZvCACBBWt8NJ2S6pSPbDxgyXy6Sc64NhqRqr1wkpbAJ1uV6uDdCXi/ikle69Clnx8D5Q
         tYTyYB2bcuNAzBNOm8L6/G6FZrHYZc5wvUnXmooDq0siO5Ku/9BlfKv2ZmC+cpmKAszc
         Q07nFQJl8EnYcBwk+pM25GMCNFKU+hMwP2popQq0T/9UtqZtO0TjY+A4wHjk7lXSz7pn
         HrsA==
X-Forwarded-Encrypted: i=1; AJvYcCXMcE52n/V4InsflsB6LUpLupWu1UTe+Uf60/oGeHJxB3pcsKRwhtlBXK2+SQ207gsmkMVc3B9gfJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YygXmqZ9C0luV3/s4MPtoiiq9L2UxueutMKcUoC8WrPe9zBUxvU
	VERn26nchWIBiX5s9Z5YM/NF4a5kiIEu+lbqirhVXlSgIW4hoxIYPOJd4CITBZU=
X-Google-Smtp-Source: AGHT+IHRIYcS1izkG3QDLGonBCdupYCAjQP5J/E1Llmu5cDaoq10FrvTC6qPMUAg1zhS3CDgZA+sdA==
X-Received: by 2002:a05:6512:1598:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-539e551a25emr15351857e87.33.1729184243445;
        Thu, 17 Oct 2024 09:57:23 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:57:00 +0300
Subject: [PATCH 10/14] clk: qcom: rpmh: add support for SAR2130P
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-10-f75e740f0a8d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LnoCXGHzd5t7+0pN06MF228za9Lu0FM1Oe64mRLrAEg=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHcKqmDTEIv6Av8S0SWmIr2MDolT76vqTLRC
 Ih4QTWKMqSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB3AAKCRAU23LtvoBl
 uP8nD/9g7rvTfTMWmadrJfUkNwfw3vCY0gRbKlLLOWvMd6eI22opB3mewevMvHG+GYZrMtONrVw
 QbM5QZSBhIy5pZvTKoEkdvxxG/8CqvkNxKWE17jxZSVDUMo1p8cRV1MYf1zVzFERhUsyZ5zU8cn
 sDk5DPsvG4HCOCUCZ/55uCzplhBtklHuXOez4cKNKvGosN0d6kxAvZK9F5xQWGEAcNAYIZrTRxd
 GWleNFS9qkgd2qEXX9lmTrcwxF3pOfPf9SBFGTKIoDyJdwxKejwwq6PnWU15lAKy/POLmyv6/V5
 ckSejtYZWdcWvoqrmKfrYtarXUu4Es8eeo1IpI+FCW6iTsWPO3DmqiGLOqnjAjAAA5JUR+Cm0HJ
 X1wBvFlHDTRaImfjhhoPAmzPVjWMMT1jblxz85lQ2SBN1+6YZNeC9e+miPf+WKKGuRqILJT0Rsl
 NIw3XJ8lx+IJ2+ZGBFqSGTCLpTclT9TSX16an21PrPWJO9Y10uChcYASk2GS4BW6Dk1YSsFuh/Y
 qoAbSNbzZCQCCSw0zcjDBs5XsT4+oqyQmeJeXVP1lWK29y23v2ADSpMN/yoHulN8kA/haYvYtlW
 Kx7WCgJNfX8bp3/kMGbZVtj1W6SlmXf7vWGfGq7XqicYPAC4gdmrmFC+dfJ9cOJcGisfqTnDLzM
 09CRy6nPyc7NQXA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define clocks as supported by the RPMh on the SAR2130P platform. It
seems that on this platform RPMh models only CXO clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 4acde937114af3d7fdc15f3d125a72d42d0fde21..8cb15430d0171a8ed6b05e51d1901af63a4564c4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -389,6 +389,16 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
+static struct clk_hw *sar2130p_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
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
@@ -880,6 +890,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
+	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},

-- 
2.39.5

