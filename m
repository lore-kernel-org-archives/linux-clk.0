Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74DE13D628
	for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 21:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711487321; cv=none; b=VhN0hP4QO+lhMuePXgEYKTU/C16qO/8Anbxpg1dRPy8NWw5DZfnhtPI3ytO/x3X1Mfmb5ht0WjJUREMOo3ZYsmLUZ6NfIGrAJDs2HXHxbysO5tegVpV/6E3gcDb4LkEhZfMiizD/1Ap4ZnEzG7pYFasH+LxuSzHC71ErLtiRGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711487321; c=relaxed/simple;
	bh=V09JUKCm67dliYKEgBrUKzAMRCxXKZJtHRPs4xkL2c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cr1of6Y5E/OzHO0hcOijdhaBEWthVpzmT1rqLbRIUhYMs4QL6iXT925tNZKfS5tEs3m73cnpoGmrqqdNYK145nHcgtBfVr/X4sryM7vgGLMfFWptSLfkBttU6Miz4oZLKJPzFHerO5Wo1Hu5Gd+2xiThCMYk78OtjjBVu2wxk3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZHmYSBwy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHmYSBwy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4a387ff7acso317410866b.2
        for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 14:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711487317; x=1712092117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pg/3usqzLB3tXWemVm0BR8Q8IDIeXCXs8UCvrLR1r7M=;
        b=ZHmYSBwyUKk31FD26PX1yRN0i3nYYhfTHYiXRH8kWmUHwcSNH6tCiYWIoN61ODE5qY
         UgOcTT7/qGopLk0Ww3TlbVLSyThT7lg9En6l7S+KOvk8O+VFpOJiRB+76Whx58veOcKY
         GWoAc2fxyh4FWQ2Dm5QhLSWTNXNTxfVXY7tM06TisVi7J0yYfjubPIipWydt9miIaXkv
         Ag61t77311+SsRU/zSFgibyT0X7anDXSRB3cl6T/Ubx4jscj66rdaFz5yX1Pi1gwODWm
         oyJIEPqzItX7fnS11kbJbr2zyD2aqzyl5SF1yw+g9V84KGwDfq5LNC3uZLMGJ7YrA1yx
         pBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711487317; x=1712092117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg/3usqzLB3tXWemVm0BR8Q8IDIeXCXs8UCvrLR1r7M=;
        b=OKAKvNDz5eBPtIYGl7o/jBo/WLOlw7nUB0X0Dl4WZ6iEHEa/CwpQ03qIm46ATHOB9P
         dakjYX8gVQnxLvkLEBUipo3GbZOPVuAmAKBgnPfi2KbFjjYorPUVgMLlvBNydPAnLiFg
         a8Ps7+wrrtM1Tm2aCCAO1SCSPPaj9TKTRYfQpI6xTu2E1k6EB3GNlMYI/lRz5N678CUW
         uf0UbxutYoncjrn6w4cFO1YegJYE3ev9dVqYDOosUmNYqTAQ10koNYDlBMk0unu/2rHO
         GYE8PDWL0pptBOJzXcraFBISmnPuzPjwpqj+bKOGrI7Q7LtYjQZLJr29B8+bNc7d10e/
         UN9A==
X-Forwarded-Encrypted: i=1; AJvYcCUbWOM0ByWiTTUlOhciSzY3hfacpf861bIpqBBpXRSJg3UnPXy7pamgqBz3Wlu2uRHVOGBSuheQ6vrzV+C/KYyvADG2uZfIBIHr
X-Gm-Message-State: AOJu0Ywv0D9WDPIf9zV9edTSYOH4uXNaCIjrq/5c6a0xOtOYXAJl2kUM
	OWToFTPcm3KLWHGivUH922/m4mMmKBPF5pWRYF9gLDh5mFHIobX6hmsE51Ms+vY=
X-Google-Smtp-Source: AGHT+IFGKr7mqqmzo56dKbi5g+Z+rdfY0BqGUHJAmEkDlCv5S9NFhcY8qtq5NGfJowqnhPOu1XYG3g==
X-Received: by 2002:a17:907:7d8e:b0:a4d:f902:f505 with SMTP id oz14-20020a1709077d8e00b00a4df902f505mr1805537ejc.43.1711487317064;
        Tue, 26 Mar 2024 14:08:37 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id l19-20020a17090612d300b00a46cffe6d06sm4621697ejb.42.2024.03.26.14.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 14:08:36 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Mar 2024 22:08:24 +0100
Subject: [PATCH v3 2/5] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v3-2-86f67786539a@linaro.org>
References: <20240219-topic-rb1_gpu-v3-0-86f67786539a@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v3-0-86f67786539a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711487311; l=4349;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=V09JUKCm67dliYKEgBrUKzAMRCxXKZJtHRPs4xkL2c8=;
 b=9PfBuMv3e+x8GiGLI4OsDgsq2GJ8ZkgKNXW4uVr1Lss7QnGkrW8XrqlOxsES/z1H1TUxwuBce
 gVOnkDxGTiFDuFJCPqs2z+5+gl6T5BbQJp1F4k/836TNLXVfeywJlQx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
introduced an entry to the alpha offsets array, but diving into QCM2290
downstream and some documentation, it turned out that the name Huayra
apparently has been used quite liberally across many chips, even with
noticeably different hardware.

Introduce another set of offsets and a new configure function for the
Huayra PLL found on QCM2290. This is required e.g. for the consumers
of GPUCC_PLL0 to properly start.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 47 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  3 +++
 2 files changed, 50 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 8a412ef47e16..27ba8aa3e577 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -83,6 +83,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x20,
 		[PLL_OFF_STATUS] = 0x24,
 	},
+	[CLK_ALPHA_PLL_TYPE_HUAYRA_2290] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_CONFIG_CTL] = 0x10,
+		[PLL_OFF_CONFIG_CTL_U] = 0x14,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x18,
+		[PLL_OFF_TEST_CTL] = 0x1c,
+		[PLL_OFF_TEST_CTL_U] = 0x20,
+		[PLL_OFF_TEST_CTL_U1] = 0x24,
+		[PLL_OFF_OPMODE] = 0x28,
+		[PLL_OFF_STATUS] = 0x38,
+	},
 	[CLK_ALPHA_PLL_TYPE_BRAMMO] =  {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
@@ -779,6 +792,40 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return clamp(rate, min_freq, max_freq);
 }
 
+void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				   const struct alpha_pll_config *config)
+{
+	u32 val;
+
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+
+	/* Set PLL_BYPASSNL */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
+	regmap_read(regmap, PLL_MODE(pll), &val);
+
+	/* Wait 5 us between setting BYPASS and deasserting reset */
+	udelay(5);
+
+	/* Take PLL out from reset state */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+	regmap_read(regmap, PLL_MODE(pll), &val);
+
+	/* Wait 50us for PLL_LOCK_DET bit to go high */
+	usleep_range(50, 55);
+
+	/* Enable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
+}
+EXPORT_SYMBOL_GPL(clk_huayra_2290_pll_configure);
+
 static unsigned long
 alpha_huayra_pll_calc_rate(u64 prate, u32 l, u32 a)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index fb6d50263bb9..d1cd52158c17 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -15,6 +15,7 @@
 enum {
 	CLK_ALPHA_PLL_TYPE_DEFAULT,
 	CLK_ALPHA_PLL_TYPE_HUAYRA,
+	CLK_ALPHA_PLL_TYPE_HUAYRA_2290,
 	CLK_ALPHA_PLL_TYPE_BRAMMO,
 	CLK_ALPHA_PLL_TYPE_FABIA,
 	CLK_ALPHA_PLL_TYPE_TRION,
@@ -191,6 +192,8 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
+void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				   const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				const struct alpha_pll_config *config);
 void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,

-- 
2.44.0

