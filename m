Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1520493495-3084-4-git-send-email-anischal@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Nischal <anischal@codeaurora.org>
References: <1520493495-3084-1-git-send-email-anischal@codeaurora.org>
 <1520493495-3084-4-git-send-email-anischal@codeaurora.org>
Message-ID: <152150242792.254778.8044280968962039576@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 3/4] clk: qcom: Add support for controlling Fabia PLL
Date: Mon, 19 Mar 2018 16:33:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-03-07 23:18:14)
> Fabia PLL is a Digital Frequency Locked Loop (DFLL) clock
> generator which has a wide range of frequency output. It
> supports dynamic updating of the output frequency
> ("frequency slewing") without need to turn off the PLL
> before configuration. Add support for initial configuration
> and programming sequence to control fabia PLLs.
> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> ---

Applied to clk-next with a little adjustment below:


diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-=
pll.c
index e6b8d62e5175..9722b701fbdb 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -891,8 +891,9 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 	int ret;
 	struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
 	u32 val, opmode_val;
+	struct regmap *regmap =3D pll->clkr.regmap;
 =

-	ret =3D regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
+	ret =3D regmap_read(regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return ret;
 =

@@ -904,8 +905,7 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 		return wait_for_pll_enable_active(pll);
 	}
 =

-	/* Read opmode value */
-	ret =3D regmap_read(pll->clkr.regmap, PLL_OPMODE(pll), &opmode_val);
+	ret =3D regmap_read(regmap, PLL_OPMODE(pll), &opmode_val);
 	if (ret)
 		return ret;
 =

@@ -913,30 +913,20 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 	if ((opmode_val & FABIA_OPMODE_RUN) && (val & PLL_OUTCTRL))
 		return 0;
 =

-	/* Disable PLL output */
-	ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
-							PLL_OUTCTRL, 0);
+	ret =3D regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
 	if (ret)
 		return ret;
 =

-	/* Set Operation mode to STANBY */
-	ret =3D regmap_write(pll->clkr.regmap, PLL_OPMODE(pll),
-							FABIA_OPMODE_STANDBY);
+	ret =3D regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_STANDBY);
 	if (ret)
 		return ret;
 =

-	/* PLL should be in STANDBY mode before continuing */
-	mb();
-
-	/* Bring PLL out of reset */
-	ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
-						PLL_RESET_N, PLL_RESET_N);
+	ret =3D regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N,
+				 PLL_RESET_N);
 	if (ret)
 		return ret;
 =

-	/* Set Operation mode to RUN */
-	ret =3D regmap_write(pll->clkr.regmap, PLL_OPMODE(pll),
-							FABIA_OPMODE_RUN);
+	ret =3D regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_RUN);
 	if (ret)
 		return ret;
 =

@@ -944,22 +934,13 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 =

-	/* Enable the main PLL output */
-	ret =3D regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
-				FABIA_PLL_OUT_MASK, FABIA_PLL_OUT_MASK);
-	if (ret)
-		return ret;
-
-	/* Enable PLL outputs */
-	ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
-						PLL_OUTCTRL, PLL_OUTCTRL);
+	ret =3D regmap_update_bits(regmap, PLL_USER_CTL(pll),
+				 FABIA_PLL_OUT_MASK, FABIA_PLL_OUT_MASK);
 	if (ret)
 		return ret;
 =

-	/* Ensure that the write above goes through before returning. */
-	mb();
-
-	return ret;
+	return regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL,
+				 PLL_OUTCTRL);
 }
 =

 static void alpha_pll_fabia_disable(struct clk_hw *hw)
@@ -967,8 +948,9 @@ static void alpha_pll_fabia_disable(struct clk_hw *hw)
 	int ret;
 	struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
 	u32 val;
+	struct regmap *regmap =3D pll->clkr.regmap;
 =

-	ret =3D regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
+	ret =3D regmap_read(regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return;
 =

@@ -978,23 +960,18 @@ static void alpha_pll_fabia_disable(struct clk_hw *hw)
 		return;
 	}
 =

-	/* Disable PLL outputs */
-	ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
-							PLL_OUTCTRL, 0);
+	ret =3D regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
 	if (ret)
 		return;
 =

 	/* Disable main outputs */
-	ret =3D regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
-							FABIA_PLL_OUT_MASK, 0);
+	ret =3D regmap_update_bits(regmap, PLL_USER_CTL(pll), FABIA_PLL_OUT_MASK,
+				 0);
 	if (ret)
 		return;
 =

 	/* Place the PLL in STANDBY */
-	ret =3D regmap_write(pll->clkr.regmap, PLL_OPMODE(pll),
-							FABIA_OPMODE_STANDBY);
-	if (ret)
-		return;
+	regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_STANDBY);
 }
 =

 static unsigned long alpha_pll_fabia_recalc_rate(struct clk_hw *hw,
