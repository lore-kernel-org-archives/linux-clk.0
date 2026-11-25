Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641208;
	b=xdHapuFe9SKq1jjv3JuhPPpnveiuP5nzy5MhmfenCrQTy0WjAJOF33y+Nkrz3GXIfD5N
	 1RkxrH59pLKYX0S8+GSiAQNhN2+EcKPXvwkXqfVWTGpB9BsQ6IvZMnGeu9YSIeVJ6v5mW
	 ijWB1y+UXRmZTe/UAAaCwhovnMQe46qLVqXA/eAVBlwrElEcmatkXC4Ps5QLKFMAyS1q2
	 Zofytx52q7W3szLYviwxDTSHCRNu4ct5nnMZdSn0z6LgG+MDMLFVcTfz+omq2VVHoAlIc
	 jaPkRHh/K1IsEfCs8r7XZ47YY/HvMO4GUHp6IgDkWyP6yE5i9ILrFxOwZpWLfEHwu2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rMA4lAFiUy/mbWPg6Kl2z9WAvu/Yy/1A3FfHztcMwb4=;
	b=BBEffepLj6Vr90VWzmF3es9a+lYFGxO0UMOSvn7kL8GkmeWISU1Fj//3ToLQkG6P9pPc
	 Zlmdu038bVkTuLbwtFR19iw0W1SqCr8EYReIJMFb5IfipQ56d8INhsPk18MGHYW4qa1nf
	 2TAxpg/4swxL1UgUEjYpapeAXOczGoZBY2sATR8OKj8iXLKWQ9XbhZjJhG1SndbT+H6zJ
	 6nQo8L2QYzWpS0uETD7yd1zGg29PmdcSbHnYgs87BItGArgHE7w2fdvsIKohcu6Hmnfvd
	 EcPkPC1ahN/Am3thhlCj5hGFk1EKUqvcUgJy+Bp9OF6HaS+d9CJQBvueOY3lGrYKosA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K3DJaNyD;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE6606A330
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DCE6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K3DJaNyD
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so4416231fa.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795641206; x=1796246006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMA4lAFiUy/mbWPg6Kl2z9WAvu/Yy/1A3FfHztcMwb4=;
        b=K3DJaNyD1gnPAynTJwXTQkvn/HuKIQhRJoCjxyB/mWrO4kdxMTbXRTx2r/usQLgc6z
         IzaFdCmNXYUSIfB+xDxhGuf5Z22Uj7Q1FbCZ3y1rKPY53D5X9CWyirIhaU8uLyhlVjdc
         EKSY8qMke+dxyHQw0rLwSxE+bX7+xjN4N6kg+bOulko7ZyyxhpZEF3P/maA72Na7NXX2
         +MMeAMu0tCxuhHZlBAOiba/5mE7wulkKN8EBIKtyrvwJwA1v4+ZqkbvWDNyaN5K69k59
         GBPkZg8qJSy2JCgSvML5+wOwWR05gsMC+LtvSBS36O0RTDNhJmmsx9Hr509Z5kU4S9ax
         71/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641206; x=1796246006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMA4lAFiUy/mbWPg6Kl2z9WAvu/Yy/1A3FfHztcMwb4=;
        b=0IFWanlO9HWgdfX69s8328yLUR0rLE/Bz4kq+OXBgY76I8jCTJQGiF+vd2tU6aPK/4
         3YjPtCuoeY1J8/YT6U+TlcmtIJugxa88omereUKJFL2hc8bk0tL0txrthQTV8ygrztvC
         uTmJJ7vejG8lfCwvWoSjvQu0EHn8HJJnETm7FSRmTuxVZ8VRDNw3iMebrs1OgvsCEvmV
         KzhCzq64hpUY0/9+LciyRLAxSKUa2MRS4bfKfMela47jsTVYMz0RM63flQiJgQ7jYEEg
         sHuyNiB+ITm9FCyLNk+f1vyEqnHLxVWQgYT8a410ZJYbDmd/U1JnnJoE4dAKIzRlrvBH
         19kA==
X-Forwarded-Encrypted: i=1; AL+hErFvMLvbckGNWRjB4UERa7v/BgK+U2AQGSwN2WlzTywMsWIqluovLGPfKiBLNpV/Lpda7fSazzoWsIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LDmLqxKi5kckPKoPoJU6mHOfDmKj5XfrgbdGqpm2+MvpS+6sf
	Iewq9eOLn31owMRlE0GXgyGrli+to1hZK3keLjZT55R1D3APqtae8S+8DahyHdGPB5Q=
X-Gm-Gg: AZFdTZdRsOQgnX/NSWkNkzxg6g9awnnItAF9Rpy3dPUT3OFuSZe7LbAYibEHL6OWxlT
	USKqN/S83WOT61XgeYYLqJw+IDkL/fe0OWwYJNMM9ao2PFg4urWOl5B/axdfK/RYHXypAjMN387
	OLCw5oLP7Bk1zEtnnoZMDljlg1tCgnzX2hQ14m+tlSjhoCU3FVfQYoD95NmS//lfKY8EbZsQi3M
	6hJdUNv2njBj1r8c9ktb7MbxlatfNzqvBRO9J2reVwl+jyluc4o2LawCqSewSntd5mZoPE71Rk5
	w+isbB8GTMLVyloyCtidytY+XMHLD3YxAbbEtepqm1rg/swrFREWN+EOhMHCAzG6M8LKvcWLTU9
	x/dBowASSY5BKEPmPTnNhhulRaH27pE0uWimUXoLsudCU5xiJcgydq3EdmTP/8YlgPK2ZKJ8Y5r
	XThf0Aqr8n3nQqMuNe68+nCLhhSFHDR3+twYovqVcxRuNtLQlHa+8Vh7i/TjUcN9lJ6iDoVIYwl
	u+5VC4ETKZsgAIrEi81GO5OIw35kw+sVuiKRvzFPLJyGsaBItKKNnroQyvh1p+Gkl8QW/txpZE0
	gUbi7+yZDpb5EHEvc8NYBZ/7lu/MMRKngIn6Vj1DUe6Mb3oEw9sp3f7xZW/XDzPTAvsJfg==
X-Received: by 2002:a05:6512:2514:b0:5bf:a66f:e5e with SMTP id 2adb3069b0e04-5c1bc57989bmr7086630e87.0.1795641205624;
        Wed, 25 Nov 2026 13:13:25 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4858972e87.23.2026.11.25.13.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:13:25 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: Configure SC8280XP Lucid 5LPE PLLs properly
Date: Wed, 25 Nov 2026 23:13:14 +0200
Message-ID: <20261125211315.1437946-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
References: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SC8280XP camera, display and GPU clock controller Lucid 5LPE PLLs
are configured as Lucid PLLs, however clk_lucid_pll_configure() is
a macro for clk_trion_pll_configure(), which sets PLL_UPDATE_BYPASS bit,
while clk_lucid_5lpe_pll_configure() does not do it. Configure the PLLs
by the Lucid 5LPE specific function and describe the PLLs and their post
dividers by the Lucid 5LPE PLL type expectedly.

Suggested-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c  | 46 +++++++++++++++---------------
 drivers/clk/qcom/dispcc-sc8280xp.c | 25 +++++++++-------
 drivers/clk/qcom/gpucc-sc8280xp.c  |  8 +++---
 3 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index b0f1d40d1df5..d14cb46a19af 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -70,7 +70,7 @@ static struct clk_alpha_pll camcc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll0",
@@ -93,7 +93,7 @@ static struct clk_alpha_pll_postdiv camcc_pll0_out_even = {
 	.post_div_table = post_div_table_camcc_pll0_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll0_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll0_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -115,7 +115,7 @@ static struct clk_alpha_pll_postdiv camcc_pll0_out_odd = {
 	.post_div_table = post_div_table_camcc_pll0_out_odd,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll0_out_odd),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll0_out_odd",
 		.parent_hws = (const struct clk_hw*[]){
@@ -145,7 +145,7 @@ static struct clk_alpha_pll camcc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll1",
@@ -168,7 +168,7 @@ static struct clk_alpha_pll_postdiv camcc_pll1_out_even = {
 	.post_div_table = post_div_table_camcc_pll1_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll1_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll1_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -223,7 +223,7 @@ static struct clk_alpha_pll camcc_pll3 = {
 	.offset = 0x3000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll3",
@@ -246,7 +246,7 @@ static struct clk_alpha_pll_postdiv camcc_pll3_out_even = {
 	.post_div_table = post_div_table_camcc_pll3_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll3_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll3_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -276,7 +276,7 @@ static struct clk_alpha_pll camcc_pll4 = {
 	.offset = 0x4000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll4",
@@ -299,7 +299,7 @@ static struct clk_alpha_pll_postdiv camcc_pll4_out_even = {
 	.post_div_table = post_div_table_camcc_pll4_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll4_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll4_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -329,7 +329,7 @@ static struct clk_alpha_pll camcc_pll5 = {
 	.offset = 0x10000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll5",
@@ -352,7 +352,7 @@ static struct clk_alpha_pll_postdiv camcc_pll5_out_even = {
 	.post_div_table = post_div_table_camcc_pll5_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll5_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll5_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -382,7 +382,7 @@ static struct clk_alpha_pll camcc_pll6 = {
 	.offset = 0x11000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll6",
@@ -405,7 +405,7 @@ static struct clk_alpha_pll_postdiv camcc_pll6_out_even = {
 	.post_div_table = post_div_table_camcc_pll6_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll6_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll6_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -435,7 +435,7 @@ static struct clk_alpha_pll camcc_pll7 = {
 	.offset = 0x12000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camcc_pll7",
@@ -458,7 +458,7 @@ static struct clk_alpha_pll_postdiv camcc_pll7_out_even = {
 	.post_div_table = post_div_table_camcc_pll7_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll7_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll7_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -480,7 +480,7 @@ static struct clk_alpha_pll_postdiv camcc_pll7_out_odd = {
 	.post_div_table = post_div_table_camcc_pll7_out_odd,
 	.num_post_div = ARRAY_SIZE(post_div_table_camcc_pll7_out_odd),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camcc_pll7_out_odd",
 		.parent_hws = (const struct clk_hw*[]){
@@ -3012,14 +3012,14 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
-	clk_lucid_pll_configure(&camcc_pll0, regmap, &camcc_pll0_config);
-	clk_lucid_pll_configure(&camcc_pll1, regmap, &camcc_pll1_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll0, regmap, &camcc_pll0_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll1, regmap, &camcc_pll1_config);
 	clk_zonda_pll_configure(&camcc_pll2, regmap, &camcc_pll2_config);
-	clk_lucid_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
-	clk_lucid_pll_configure(&camcc_pll4, regmap, &camcc_pll4_config);
-	clk_lucid_pll_configure(&camcc_pll5, regmap, &camcc_pll5_config);
-	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
-	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll4, regmap, &camcc_pll4_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll5, regmap, &camcc_pll5_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
+	clk_lucid_5lpe_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 96b3e5505279..1d09fa9e7a94 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -85,7 +85,7 @@ static struct clk_alpha_pll disp0_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp0_cc_pll0",
@@ -100,7 +100,7 @@ static struct clk_alpha_pll disp1_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp1_cc_pll0",
@@ -129,7 +129,7 @@ static struct clk_alpha_pll disp0_cc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp0_cc_pll1",
@@ -144,7 +144,7 @@ static struct clk_alpha_pll disp1_cc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp1_cc_pll1",
@@ -166,7 +166,7 @@ static struct clk_alpha_pll_postdiv disp0_cc_pll1_out_even = {
 	.post_div_table = post_div_table_disp_cc_pll1_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_disp_cc_pll1_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp0_cc_pll1_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -183,7 +183,7 @@ static struct clk_alpha_pll_postdiv disp1_cc_pll1_out_even = {
 	.post_div_table = post_div_table_disp_cc_pll1_out_even,
 	.num_post_div = ARRAY_SIZE(post_div_table_disp_cc_pll1_out_even),
 	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp1_cc_pll1_out_even",
 		.parent_hws = (const struct clk_hw*[]){
@@ -212,7 +212,7 @@ static struct clk_alpha_pll disp0_cc_pll2 = {
 	.offset = 0x9000,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp0_cc_pll2",
@@ -227,7 +227,7 @@ static struct clk_alpha_pll disp1_cc_pll2 = {
 	.offset = 0x9000,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp1_cc_pll2",
@@ -3173,9 +3173,12 @@ static int disp_cc_sc8280xp_probe(struct platform_device *pdev)
 		goto out_pm_runtime_put;
 	}
 
-	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL0]), regmap, &disp_cc_pll0_config);
-	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL1]), regmap, &disp_cc_pll1_config);
-	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL2]), regmap, &disp_cc_pll2_config);
+	clk_lucid_5lpe_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL0]),
+				     regmap, &disp_cc_pll0_config);
+	clk_lucid_5lpe_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL1]),
+				     regmap, &disp_cc_pll1_config);
+	clk_lucid_5lpe_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL2]),
+				     regmap, &disp_cc_pll2_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
 	if (ret)
diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index 2ccc083a4f98..36d2b028f288 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -59,7 +59,7 @@ static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_pll0",
@@ -88,7 +88,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.offset = 0x100,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_pll1",
@@ -453,8 +453,8 @@ static int gpu_cc_sc8280xp_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+	clk_lucid_5lpe_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_lucid_5lpe_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc8280xp_desc, regmap);
 	pm_runtime_put(&pdev->dev);
-- 
2.53.0

