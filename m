Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BA2CDB474
	for <linux-clk@archiver.kernel.org>; Fri, 20 Oct 2023 11:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377166AbjJTLeg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Oct 2023 07:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377142AbjJTLec (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Oct 2023 07:34:32 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D7CD5E
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2023 04:34:29 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c3c8adb27so108019866b.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2023 04:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1697801668; x=1698406468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXvJpV0gpvSkUrAaGppJnbjeNlJABP+T2f/Ne1XnKTw=;
        b=QkYBgQhmBFsfyP73EUzOvZDT/GEJnHObufFs6IWBqgMHsWUH0M+iq/NS7ChVHnELi+
         rMNjEwbss/U1MdOxoCC3BBAsUj9tHA4cyJF/Ke8jwfCFQy3xRYtPwwKD5l3+svQCzm1v
         MT5Ku8eM9TQ/ttWUdVeMNrcHK11HFBPm9Hp4l/BVkWk+QRDJbMrRlE0RK5bF8m86owCm
         7IvUEbaqsmI+Uzp5JP4ADmGLAN0Pf322LI+E2WtoODzKLyqrUJmMizB7yoCge9xU14qK
         jX8ldJcjtBPil0rdqXrjHWuoxuJ5JuNMNK+KAgqu2eATCyurVyRShtZ+1FCl3YaliAE4
         T4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697801668; x=1698406468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXvJpV0gpvSkUrAaGppJnbjeNlJABP+T2f/Ne1XnKTw=;
        b=qrY4Ogl/1QMIUzkrurOBluPyaoJTwDj9UTpKsbhx6hYfwbJJFA2Bw3bLDYBiCyuCpn
         SeOnwu13/fuo+IaOaqIb3xJxJIBwRGYMJ+M/V0la57bzvRnnk2b0848gae4c3o8/PPq1
         zWvWV3JhAIW/1pRtc2/yPSYlTS/W6pKYXXInnLLg/Qa6dlsFUBldT8wvXrIBqdevZ6mJ
         pMXyROq40d8YmQIAcHyaqMva/mxli0NRQUEugddzG6GHxCzqVMFfBOvofOiYWhWGlVej
         uaAaqSG5AV1iuDzFaH2xK5pVk3QCot2X2FEBxeSmm8Fy/UKNiO3su0ZAVuq+GLIMRDv0
         fRGA==
X-Gm-Message-State: AOJu0YzXvSU4gYeDRD705geEn5+gNXmYUT+fwKqAB7hS/kSP20Co02T6
        cweU7Ek9kedutxmQJnuUmEOGDa2oDRXQJJdCmqbaJg==
X-Google-Smtp-Source: AGHT+IE2cqRe/b7SznA5f9wgW3W00fTFZ38FmRaqPeuDiU4EW9+UF4yLZznf7d1onwrlLkBbX3ltTg==
X-Received: by 2002:a17:907:86a0:b0:9bd:fc4a:c70b with SMTP id qa32-20020a17090786a000b009bdfc4ac70bmr1310791ejc.70.1697801668164;
        Fri, 20 Oct 2023 04:34:28 -0700 (PDT)
Received: from capella.localdomain ([193.89.194.60])
        by smtp.gmail.com with ESMTPSA id ce10-20020a170906b24a00b009b654751c14sm1300320ejb.47.2023.10.20.04.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 04:34:27 -0700 (PDT)
From:   =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date:   Fri, 20 Oct 2023 13:34:16 +0200
Subject: [PATCH v5 3/3] clk: si5351: allow PLLs to be adjusted without
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231020-alvin-clk-si5351-no-pll-reset-v5-3-f0c1ba537f88@bang-olufsen.dk>
References: <20231020-alvin-clk-si5351-no-pll-reset-v5-0-f0c1ba537f88@bang-olufsen.dk>
In-Reply-To: <20231020-alvin-clk-si5351-no-pll-reset-v5-0-f0c1ba537f88@bang-olufsen.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Jacob Siverskog <jacob@teenage.engineering>,
        Sergej Sawazki <sergej@taudac.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Introduce a new PLL reset mode flag which controls whether or not to
reset a PLL after adjusting its rate. The mode can be configured through
platform data or device tree.

Since commit 6dc669a22c77 ("clk: si5351: Add PLL soft reset"), the
driver unconditionally resets a PLL whenever its rate is adjusted.
The rationale was that a PLL reset was required to get three outputs
working at the same time. Before this change, the driver never reset the
PLLs.

Commit b26ff127c52c ("clk: si5351: Apply PLL soft reset before enabling
the outputs") subsequently introduced an option to reset the PLL when
enabling a clock output that sourced it. Here, the rationale was that
this is required to get a deterministic phase relationship between
multiple output clocks.

This clearly shows that it is useful to reset the PLLs in applications
where multiple clock outputs are used. However, the Si5351 also allows
for glitch-free rate adjustment of its PLLs if one avoids resetting the
PLL. In our audio application where a single Si5351 clock output is used
to supply a runtime adjustable bit clock, this unconditional PLL reset
behaviour introduces unwanted glitches in the clock output.

It would appear that the problem being solved in the former commit
may be solved by using the optional device tree property introduced in
the latter commit, obviating the need for an unconditional PLL reset
after rate adjustment. But it's not OK to break the default behaviour of
the driver, and it cannot be assumed that all device trees are using the
property introduced in the latter commit. Hence, the new behaviour is
made opt-in.

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Cc: Jacob Siverskog <jacob@teenage.engineering>
Cc: Sergej Sawazki <sergej@taudac.com>
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
 drivers/clk/clk-si5351.c             | 47 +++++++++++++++++++++++++++++++++---
 include/linux/platform_data/si5351.h |  2 ++
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index cbf7cde01157..bed0fe3bfa08 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -506,6 +506,8 @@ static int si5351_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	struct si5351_platform_data *pdata =
+		hwdata->drvdata->client->dev.platform_data;
 	u8 reg = (hwdata->num == 0) ? SI5351_PLLA_PARAMETERS :
 		SI5351_PLLB_PARAMETERS;
 
@@ -518,9 +520,10 @@ static int si5351_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		(hwdata->params.p2 == 0) ? SI5351_CLK_INTEGER_MODE : 0);
 
 	/* Do a pll soft reset on the affected pll */
-	si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
-			 hwdata->num == 0 ? SI5351_PLL_RESET_A :
-					    SI5351_PLL_RESET_B);
+	if (pdata->pll_reset[hwdata->num])
+		si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
+				 hwdata->num == 0 ? SI5351_PLL_RESET_A :
+						    SI5351_PLL_RESET_B);
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: p1 = %lu, p2 = %lu, p3 = %lu, parent_rate = %lu, rate = %lu\n",
@@ -1222,6 +1225,44 @@ static int si5351_dt_parse(struct i2c_client *client,
 		}
 	}
 
+	/*
+	 * Parse PLL reset mode. For compatibility with older device trees, the
+	 * default is to always reset a PLL after setting its rate.
+	 */
+	pdata->pll_reset[0] = true;
+	pdata->pll_reset[1] = true;
+
+	of_property_for_each_u32(np, "silabs,pll-reset-mode", prop, p, num) {
+		if (num >= 2) {
+			dev_err(&client->dev,
+				"invalid pll %d on pll-reset-mode prop\n", num);
+			return -EINVAL;
+		}
+
+		p = of_prop_next_u32(prop, p, &val);
+		if (!p) {
+			dev_err(&client->dev,
+				"missing pll-reset-mode for pll %d\n", num);
+			return -EINVAL;
+		}
+
+		switch (val) {
+		case 0:
+			/* Reset PLL whenever its rate is adjusted */
+			pdata->pll_reset[num] = true;
+			break;
+		case 1:
+			/* Don't reset PLL whenever its rate is adjusted */
+			pdata->pll_reset[num] = false;
+			break;
+		default:
+			dev_err(&client->dev,
+				"invalid pll-reset-mode %d for pll %d\n", val,
+				num);
+			return -EINVAL;
+		}
+	}
+
 	/* per clkout properties */
 	for_each_child_of_node(np, child) {
 		if (of_property_read_u32(child, "reg", &num)) {
diff --git a/include/linux/platform_data/si5351.h b/include/linux/platform_data/si5351.h
index c71a2dd66143..5f412a615532 100644
--- a/include/linux/platform_data/si5351.h
+++ b/include/linux/platform_data/si5351.h
@@ -105,10 +105,12 @@ struct si5351_clkout_config {
  * @clk_xtal: xtal input clock
  * @clk_clkin: clkin input clock
  * @pll_src: array of pll source clock setting
+ * @pll_reset: array indicating if plls should be reset after setting the rate
  * @clkout: array of clkout configuration
  */
 struct si5351_platform_data {
 	enum si5351_pll_src pll_src[2];
+	bool pll_reset[2];
 	struct si5351_clkout_config clkout[8];
 };
 

-- 
2.42.0

