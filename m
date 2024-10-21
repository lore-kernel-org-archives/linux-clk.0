Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2121E9066
	for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506661; cv=none; b=B2k692sRdlEuHYEkZzFQr3W8B9JZT4byn6J5JR/mPVlVYVsYwRFKLpJvbtPX6vVaS0t/JIp7T8795Hp/L2tvjCpJL3PJp7SKBPxCcAcY9CNYSHHqwLSp3yNaG/1UFwYu5b+HP0Rz3SnHuTkFxoDsER65UNQV/q92hVCeD2DIVIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506661; c=relaxed/simple;
	bh=LnoCXGHzd5t7+0pN06MF228za9Lu0FM1Oe64mRLrAEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0pAv5VEPqoo8s6quEKrlBKR4EOwexSn2gE9r9zjkLT/Tzp4TY2ipNOrLwjvxStbfXy9QypBL76VEiCdEZiZBr8ZpUkOCzjbbg3oybQ2xDw0/sAzEzmHOyJBE1JIm/FVYyVLx5KsvpO8LP+b88CTPoUQDN4k7Ysx2d+7tfoQ3No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqfJRzod; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqfJRzod"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so41398931fa.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 03:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506657; x=1730111457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JBL0fLe68SIR8/IBckLhxHZOhWibFm/IK5cxitVKRM=;
        b=OqfJRzod0jf0du+Ys9063ctMGXoKFp9VQkPcwu3ZSZ0C1T5pXc++aOYVQpaGNBGOWh
         Cx5ppqEHaKgWkB7O5dRZpMgB1nwVTCMyDdHi394B2Dn5kpvGkaPmUiE68sWOpfrkJH0a
         yIfUC90DXC2eMwPLoAoVk3LfT5pm5oFX7TOhQ8Xikm5dcRMX9cML79SkcnnLODt7XpbW
         EmRs0Rnore9+wo/51RMU/Gi/H+nwy0+vL8jDpt++d2SEOeGhuvsHF+9sqBOhKq7bcSkA
         a6KHdmEfPwRcC8acrLEKH6TA0bgYBbXg2/j/qSIzwJ+v4dy0qkMQGqm/b/f+adsLRyhq
         9+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506657; x=1730111457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JBL0fLe68SIR8/IBckLhxHZOhWibFm/IK5cxitVKRM=;
        b=ozK/idMFASD1aZWMVYGmNNux1rn/QWR9bjtUMVJYLjtTeMRgNfG9y6ZOgV67FPTdRB
         OKrQZx7JXwxG/14LhaKSFyb+Yr7idbtQOs6R3SeJ6vRSA5SxbtDhC0vgoZ6lYZojUaMb
         ZarNVnZt+SrCznZemAsfA+SDRKtpjfEYzBsoCHfVhRs7SowxyQUf5HSCvoc943YsHLGq
         lJtAQqKowO4YGoLYDcZvmK2+m1FwDCAZE0d7+NFT09LmjVe31o7X2S9ezjJmnAZIUZTE
         jcGUZPUFoYaFP09dr0NXA9EFg38dIgJ4J4hL0xsZY3J7VitZ0j1s80ZXcZUQzumveMlm
         9lYA==
X-Forwarded-Encrypted: i=1; AJvYcCUEsilcS6ffWbIqgR4JW3dW4ySFzsxBcbmjp95E4bDM+iQAfiDsPwdGlbQMPJRb+jqIzJfnQk+ohu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlI0a5gjkdEa4IcyaBA+M5MLyGQoDP4YzkduZ1LFnWc5Vm/t3g
	zvgP0HQbt8oNCbW+RHVz8MGkJ7ivDkazJ58LDv69No0VsNj6UsxKk5nZEp36Ovg=
X-Google-Smtp-Source: AGHT+IFADdxwB1lKuUHVbxyA2IJl8o/CFXKYmHwZVNmW2KmmdGR5UlnMkpnPMQvtZuxzFzao6rXxaA==
X-Received: by 2002:a2e:701:0:b0:2fb:3445:a4af with SMTP id 38308e7fff4ca-2fb82eb0637mr40527841fa.21.1729506657513;
        Mon, 21 Oct 2024 03:30:57 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae1217bsm4522711fa.112.2024.10.21.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:30:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:30:35 +0300
Subject: [PATCH v2 07/11] clk: qcom: rpmh: add support for SAR2130P
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-clocks-v2-7-383e5eb123a2@linaro.org>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
In-Reply-To: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LnoCXGHzd5t7+0pN06MF228za9Lu0FM1Oe64mRLrAEg=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi1MbkWvYiZofhgCqZ4ggNTsip56ovOEn1CSN
 cuI/felXXiJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYtTAAKCRAU23LtvoBl
 uE4SD/9ZtaF7M0grDGlmhdJonGZSBLSd5cuwulIlqIkLAAnV7pCdtXbckraOuGKAO5UDTpCpaKQ
 /1CkHFWbcIc83zihwDUy7AINVbgoJpznGO1Nqby9SysBfubk6EqXjIG6ayKZTB5nQ3W1nUYtAp7
 IFBEsCY9iJFmpabThGjwS678MkCD7Nh4nOBWm2nhue1konA9XxbHYcyNymgciPN1aGI2qSlx4ns
 eQBkqFJsF987q9lX8mWV4JnFJFMgqNCMbPb9VvNE/jF/kC6MylmK/rKKzNYe7hxYbARqJyU7XQl
 4Uk1DUIFh1JWeI01HYQVgT2EuHMbtDxrVe+ytsj4PLv1AjcDQ40zTbHb4HUrOhJIpAyiKgGqVC+
 86o2Fj2jgvwMxrrB7gvlawuzW25NyF5TM3P5pJVrcIot2ZcYD4p2l0/5LlzeSo923pgEp8lNDFI
 enre8wQzT3/EF1hQVoM/FUdY8zB5/+hcnfvLK98m2Un9NlMr5SOU9fdVO9ZfrCDVoEiWKWmALx+
 xSMxO0pgAdtQtbYQDXHPhu0ohNnLnmAOf/rnw8HmhCoaKQgJf0btaYVKhXgd3unCI1vcQRXct7u
 EDSgF8KeoWRPaG1GyAPvnLYLkcCAja8ImNVpGn330gsV6PBuI4X2NVP64GAcsUV+zZJfJ8Jh2/m
 RWSi2weD9qSc5Rw==
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

