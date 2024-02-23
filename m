Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211BA14AD04
	for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723315; cv=none; b=odMvt0IC7HEjTffq++R36fLGotZtJ4hx2VBXLWpWlMPFSNWKb3yayp+x43LVJIyORYfr7dApzjBSggYLK4F9QyT93Nm5zQ36a0CSAkIi38ybF96GZK3P8K3wJblkikmkvkAZPIA9dBVE7QvprYW5TvjA3wkb9f9BlD3Qj0bJAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723315; c=relaxed/simple;
	bh=XoBTIW3JvxqyhOVBniaSAgJX/HfeR30N24/h9GELtao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPwopA9ZAoeG+1oKW76FOgYXo7n3x+mOExmU5PpO5l9R+8fHCxJ9DWTDgHP/XHNx0RApgudnGWzYRVIxn39bXa1iFMn3qnYylKR+1KaXmrXh5Rhi8IzOjXN6KBYW3vHdw1qWmd890mBc4DT700wNwUOU2NQmjdq20EvaBE7rLNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pmut1iGu; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pmut1iGu"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so1027815a12.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 13:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723311; x=1709328111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw7Sb/UbJBB5CItex8fl5k2pXl6SWFJwePpg/cbm8hY=;
        b=Pmut1iGuYC+Be1+IOuPzZfMwZ7jJ1MLiVve6RtypjUN4IuM0aMlMhY2jgkOFJYxG6S
         JQwPbhwM6TSuVTSsL2XuN7W6uFG0QVzMs/zSbahDvajrzsQU9tEbG3vb/Dog5BDILELO
         YfhhVWcKu5cf+LxpJYBscNDKYlJhcOvf3boXWyazE/0fpfovd8qwV+rL/7XYEIAgqKCf
         GlvVUq+Jt14mNq0h2DhfmiIKcIEl2mBGWdQCnZzHkKYotH/ykSbmjz+bVlHJn2Jiol8N
         eQ0/D2NsNPI6HXa7oJsF+sxA+l/HuI3RI0NY19Zaont6MLJ/E6OHBPOAIGO76Z8OFXTc
         5NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723311; x=1709328111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw7Sb/UbJBB5CItex8fl5k2pXl6SWFJwePpg/cbm8hY=;
        b=GzvlmuzCy9dJhfwG7minaoPQaSCDvThB258ezcnd/8mejh+od+YkYwrkYMAqZ1NNUV
         kcEXpmHcj2J4rOSyyBjnjPr+DlJmlv12BsCfvrwP9CeumM3AwKDPEmLndBdMmM50b6wp
         z5dMgtGSK5Ad6U9u1bAB7Fu+LVSdhDYQOedha1tDGTISw88lAW3mM9lv4lMTSl087OlN
         B2iprdyiZVvDxQcnkAAvFXh/2sL2cbiXs809nuHSxO9D5la7pKIcRVnvJ9Imm5M7Awxa
         D6EWGzGKVjsGNKbm/m0yURgPhnX91Xl4B5TMGoj4Tm5JrK1bgbzSNyZDZ1s10ZZDovSO
         aweA==
X-Forwarded-Encrypted: i=1; AJvYcCWgSDuhKVFOh/995uRlAhuKl/QzhMawmpd1RcM99+QNy74utFTF0PPIEG4ZNXw/DJVQYiuC0GFC/lF9H9XJhV1RPSkkk9HF8Z86
X-Gm-Message-State: AOJu0YwF7HY3Ho2BwBXI2wPk3zflDc4jdmpSxku8WKmDOpdDSqmtOT5W
	fK/fEppab31dqGfGBxR43HRZpLQW5BzSo6GAHBWCjWeF3dhUscMGPmUno/5uqTM=
X-Google-Smtp-Source: AGHT+IHL6Pzx1TGGvKfgrvOfOfXhSPldAmXKyY7YoG3FxkOX5sd93uGSttNBMbf47J75gpYtdsGfyQ==
X-Received: by 2002:a17:906:31d8:b0:a3e:7ef1:8c91 with SMTP id f24-20020a17090631d800b00a3e7ef18c91mr534343ejf.77.1708723311427;
        Fri, 23 Feb 2024 13:21:51 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id mj8-20020a170906af8800b00a3ee9305b02sm4091226ejb.20.2024.02.23.13.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 13:21:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 23 Feb 2024 22:21:38 +0100
Subject: [PATCH v2 2/7] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708723303; l=4284;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XoBTIW3JvxqyhOVBniaSAgJX/HfeR30N24/h9GELtao=;
 b=iyeNEH8NgtNuGp9PiKFfHoNtEBU5HspXwnqNiwJ8nEArbl48Sx5/eLvJnsYlPRaxxqIXmjPoq
 9KipGQ6ODS0B4x/m28GpVJ7dr7AF+xtGxfu/XHdsgaX67wqlG2hF/vM
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 47 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  3 +++
 2 files changed, 50 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 8a412ef47e16..82b71f24ee7d 100644
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
+EXPORT_SYMBOL(clk_huayra_2290_pll_configure);
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
2.43.2

