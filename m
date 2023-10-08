Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81701E95A92
	for <linux-clk@archiver.kernel.org>; Sun,  8 Oct 2023 11:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344679AbjJHLN4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Oct 2023 07:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344689AbjJHLNx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Oct 2023 07:13:53 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC6CCF
        for <linux-clk@vger.kernel.org>; Sun,  8 Oct 2023 04:13:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9b9ad5760b9so613259966b.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Oct 2023 04:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1696763630; x=1697368430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhFZ+nJk7VLBMeKe+/tLKVPNXDUr9yKyddGx3RvRDwY=;
        b=HjY71/gcJbWI+qb/N0zroB0efOo8NGMoPacpm9r9ET+AClHhpYTS/azQs0tPUC84mM
         +zqlxmO0WyvlXyKDHYXKLjPuBa9S3ByJRQV4mzFF2ZllpLlv6MOFcQq4z2rt5sJXdGRr
         tLsSrcUMz6iItDHYfA5ipp4qYWwdtcJv1gdvEs/n5gtCBDD63rPIazdNWWPvEZcCh5U9
         CUwueZIYGvcVSzywQqGhlSzlJtSlBlD5CTbZVPRW+Lq/yoDwcrbChnttruChByGE7noS
         Z0I6h126dT7mmn6Y9lVBEESMzyLD7b3SQqItumKFd0kyaJXUvZrfISnj1y3j/t64RP3I
         hFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696763630; x=1697368430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhFZ+nJk7VLBMeKe+/tLKVPNXDUr9yKyddGx3RvRDwY=;
        b=fQjDdIS3antVUYkCek9uh3eW+ZguINPwljDvEru9m3KpTAQy1K01YZRNWiKeX8Szd5
         Ykg6lPYY4U7bzxTj+gLF4eHkvNzYd5ZjSP8PQ+lzm0oLvkk+Yh1JrB3iR3KhCX7e8dg1
         FillSvgJoFCe/jBf0VpeyabbPuK2CgruQlbIXSzd/1EYYQEFcdJAvLFVJLzahKLT3VV7
         dJyNq6g3Fto6RiXCicN4ogUFOftziqb4wfYNu0xIxT9A7JK4iCzWKf/WBvFYcd1jggby
         k3t05uvZxyIj9yS9aQX6zFkdS6ez7HJ7QpU4o2rxQB7A4L/qTruo88KAw10qsyTglc2k
         LPBw==
X-Gm-Message-State: AOJu0YzLNWHKvl4E53iYjJgNLvi+iMLRclx1HsEmrt9TwpnybvGCYep5
        MknHJ1NgcHBpqP5WJtyaGBabFg==
X-Google-Smtp-Source: AGHT+IHqf73FvPIuPqGKUmGFv84fMpI8/IalG38dTyBmA3hIe4PvdlgPLHK8adU7NmpGA6Y7dcWxxw==
X-Received: by 2002:a17:907:78c2:b0:9ad:ad5a:939b with SMTP id kv2-20020a17090778c200b009adad5a939bmr11545362ejc.7.1696763630194;
        Sun, 08 Oct 2023 04:13:50 -0700 (PDT)
Received: from capella.localdomain (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id t3-20020a1709064f0300b009b928eb8dd3sm5383396eju.163.2023.10.08.04.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 04:13:49 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Jacob Siverskog <jacob@teenage.engineering>,
        Sergej Sawazki <sergej@taudac.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] clk: si5351: allow PLLs to be adjusted without reset
Date:   Sun,  8 Oct 2023 13:09:39 +0200
Message-ID: <20231008111324.582595-4-alvin@pqrs.dk>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008111324.582595-1-alvin@pqrs.dk>
References: <20231008111324.582595-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 drivers/clk/clk-si5351.c             | 47 ++++++++++++++++++++++++++--
 include/linux/platform_data/si5351.h |  2 ++
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 00fb9b09e030..95d7afb8cfc6 100644
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

