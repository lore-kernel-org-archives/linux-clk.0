Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED523A2548;
	Wed,  4 Mar 2026 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632174; cv=none; b=eXdkHh8S8CUkHLV7dlerm/jjVG1RgizjfwjWg097VaL2W5oYR7TUdkcsKfFbZ4dZGAr5JisSumVcGZY3WLFoREP7j9/4PNcq6TLW10f4mCDwcWrSkKsGLbBEWdXtKtqrxuuc4+StNjnmnL2TeZcaB6hS0vbuHltXfvAb2rxMNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632174; c=relaxed/simple;
	bh=/zvBIzViXCnmWq7gAFkzLYQ4qp66HHM4tREbVGDHlSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KeqNgdNvjdiGdEyzuo7vYuYJPyp64qfyN1QFL1GuCVQDRBT5/x8M3WT+KrHZCDKXHzOIQDrEXt6B6D2jVyao5UnQjl8bdQu7istwDf+VPezIyrvweRyaOZZizu4IBaj9j+Zt2svSfuw/BmWIY1wiS2zuUIJwLRygeWgWShhiq6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+86SidY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+86SidY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00A5C19423;
	Wed,  4 Mar 2026 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772632174;
	bh=/zvBIzViXCnmWq7gAFkzLYQ4qp66HHM4tREbVGDHlSw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O+86SidYVzgGfADskDgfvB9b5U8U+FxSxiNUoKu8oyOI/n4tBjrh95ceJ8QrnYpFR
	 RwM5lTc7Pfas5+ls5dhoQ4Ww7gKWr16wZ72vm0SZMtAHr4MZ2Bmb6q85SVC4ks7nfS
	 0pMoTFlFCIYWvwf2XNk3CLI0BxLvHqO2W4mlnMTCViLPmG5cOuYTeJriQl128B+tS4
	 YswAD4k5LMiTkbi/5D/wxBH4J7MGAi03t/BywaugEVqnWi1ywMtqFASnMYnY+toftT
	 OX11fO7vMB6RzHnihbQobran38jw8LlT/r9affLAvbROeDVNr5jYqIeyTAbxp3uhc8
	 CHT0IWQ0fIlQA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 04 Mar 2026 14:48:31 +0100
Subject: [PATCH 5/5] clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock rate
 setting
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772632145; l=2287;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NNT+5t8wCjqytWn7XBoP1TYWjfPiD/E23LUsV9YkTNA=;
 b=WEO9Ka/BxSEUArJaB1rInGNmXKWVrM9V4zbtrmVWlmwGGr+eiwmmhuOTxza5W7eRlUfryn5bE
 rNe01NO0vMtC/WJDxyJYH/pDw60eg5vdBXjLujslVoOzSmlp7lb+xF3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The clock tree for byte_clk_src is as follows:

   ┌──────byte0_clk_src─────┐
   │                        │
byte0_clk            byte0_div_clk_src
                            │
                     byte0_intf_clk

If both of its direct children have CLK_SET_RATE_PARENT with different
requests, byte0_clk_src (and its parent) will be reconfigured. In this
case, byte0_intf should strictly follow the rate of byte0_clk (with
some adjustments based on PHY mode).

Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.

Fixes: e700bfd2f976 ("clk: qcom: Add support for Display clock Controllers on SA8775P")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc0-sa8775p.c | 2 --
 drivers/clk/qcom/dispcc1-sa8775p.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
index aeda9cf4bfee..b248fa970587 100644
--- a/drivers/clk/qcom/dispcc0-sa8775p.c
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -591,7 +591,6 @@ static struct clk_regmap_div mdss_0_disp_cc_mdss_byte0_div_clk_src = {
 			&mdss_0_disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -606,7 +605,6 @@ static struct clk_regmap_div mdss_0_disp_cc_mdss_byte1_div_clk_src = {
 			&mdss_0_disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
index cd55d1c11902..9882edbb79f9 100644
--- a/drivers/clk/qcom/dispcc1-sa8775p.c
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -591,7 +591,6 @@ static struct clk_regmap_div mdss_1_disp_cc_mdss_byte0_div_clk_src = {
 			&mdss_1_disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -606,7 +605,6 @@ static struct clk_regmap_div mdss_1_disp_cc_mdss_byte1_div_clk_src = {
 			&mdss_1_disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };

-- 
2.53.0

