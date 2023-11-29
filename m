Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qutbMOhJ"
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A097170F
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:40 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso2384749a12.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701284379; x=1701889179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlDUepmJECDPJhuprnqUu3VqOzP0g1ylAOO9+Ec40Fc=;
        b=qutbMOhJVBo1eaAK6wX5JXfMQchq6V5+TTrZIjuBrnvvemi4hSKfJPzrxiRDIe/nQ/
         TjfD1FwQz/fRQzMRaXeilla1ql+wJPFC1G16GlQhbkVmYevj9xP/ma1vA0ks0oVbu+Zl
         71jRQBxSDJxFYbULEOR7EgoxFG8kmOajWTDf5d6JaNyyJvPizr+qokV/8BiU9J5IES7/
         AlVGgven+RzlrORc9SpKGaNz5SO2SmNDRn7rgtrMqa5nvizkmxkiQVYXIv+3wSFxkGLg
         LxsINhfkB7OJ1kXkRT2vPsmVcRG2VuZIQDwNRz3eIBYqoPx0ZNtO8N4lvYYiyz4FuLfc
         0UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284379; x=1701889179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlDUepmJECDPJhuprnqUu3VqOzP0g1ylAOO9+Ec40Fc=;
        b=GkpGgcOKZUI5uxH6NGOC4QHR2Q3dCY0MADX0IOnQaMBGrxGtB3SgS3B2iftHBTog/s
         6BHz9s7CmAnXiXJkGhNqQBetnDl14g9n4p34ezTvG25/0CsFUQWk00puuS8RC4g5/ZOK
         s8LfGFYCBRYP7aeDhcyvjiFqiXEhiIwm2urBsPVEHzGrVJm+sfdh3CBfXKAjTuoOWUvl
         iu7kBPoJGdI3rVxiHQznRif/AHDlLQB8Xmei3HJRYWaXeXtSgls6Kp9JqsFI0DN9wNGA
         edphgROHMFtL71b1f8Pc3e4toQU7jFlJJTRoWlO3ybX7Wu3acUPvAfPiGzQBBDxcpJ42
         xvTA==
X-Gm-Message-State: AOJu0Yx+VEnU7Lj5YdcBJxWs7jlJemW5xHZzIWECCTcA3NkvLzrGEky0
	UZe0tyUBka+5AK+1W+zIagGKYw==
X-Google-Smtp-Source: AGHT+IGrFuuirgbflWVWu41OzF03NDDuEMuQXDJ+cEw++BBXMgKEaWD9G1+yl9mYtK5v0zFbHw9X8A==
X-Received: by 2002:a17:906:f811:b0:a0f:1882:d5e with SMTP id kh17-20020a170906f81100b00a0f18820d5emr7816584ejb.37.1701284379041;
        Wed, 29 Nov 2023 10:59:39 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709061d4b00b009faca59cf38sm8160232ejh.182.2023.11.29.10.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:59:38 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 19:59:25 +0100
Subject: [PATCH v2 06/15] clk: qcom: gpucc-sm6115: Unregister critical
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v2-6-2a583460ef26@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701284367; l=2946;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=L0PymLuHyWV4Yhgl+FgHBcte5FGcWRmHBmwI88u/f0w=;
 b=tqlg8aYXsgxwZazuI492ThhgAeDgh5mPmkZVU+QiLkmD1qTdon0KEaQ7oZzqoxLNuw50o/X6i
 zcYQaJCO5OMAcCUkT3+H7u0oCnQ/FZU/be3nz+a4AtyNjAlX/a0G6A5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some clocks need to be always-on, but we don't really do anything
with them, other than calling enable() once and telling Linux they're
enabled.

Unregister them to save a couple of bytes and, perhaps more
importantly, allow for runtime suspend of the clock controller device,
as CLK_IS_CRITICAL prevents the latter.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm6115.c | 33 +++------------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index fb71c21c9a89..93a50431aef8 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -234,20 +234,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	},
 };
 
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.halt_reg = 0x107c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -336,20 +322,6 @@ static struct clk_branch gpu_cc_cxo_clk = {
 	},
 };
 
-static struct clk_branch gpu_cc_gx_cxo_clk = {
-	.halt_reg = 0x1060,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1060,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_gx_cxo_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_gx_gfx3d_clk = {
 	.halt_reg = 0x1054,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -418,7 +390,6 @@ static struct gdsc gpu_gx_gdsc = {
 };
 
 static struct clk_regmap *gpu_cc_sm6115_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
@@ -426,7 +397,6 @@ static struct clk_regmap *gpu_cc_sm6115_clocks[] = {
 	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
 	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
 	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
-	[GPU_CC_GX_CXO_CLK] = &gpu_cc_gx_cxo_clk.clkr,
 	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
 	[GPU_CC_GX_GFX3D_CLK_SRC] = &gpu_cc_gx_gfx3d_clk_src.clkr,
 	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
@@ -488,6 +458,9 @@ static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 	qcom_branch_set_force_mem_core(regmap, gpu_cc_gx_gfx3d_clk, true);
 	qcom_branch_set_force_periph_on(regmap, gpu_cc_gx_gfx3d_clk, true);
 
+	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x1060); /* GPU_CC_GX_CXO_CLK */
+
 	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
 }
 

-- 
2.43.0

