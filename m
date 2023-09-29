Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95967E743F4
	for <linux-clk@archiver.kernel.org>; Fri, 29 Sep 2023 05:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjI2Fj3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Sep 2023 01:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbjI2Fj1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2023 01:39:27 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63331AB
        for <linux-clk@vger.kernel.org>; Thu, 28 Sep 2023 22:39:24 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c136ee106so1797050366b.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Sep 2023 22:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695965963; x=1696570763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeROYzXT5X0vhWub03MpkUt5t0C3EfcKOwYZPDuBwCY=;
        b=iXjiS5MxM9RIAEPbwtRNcJX+E8z0R0L93eGAAb5VokHuXB7prx9WreoLZ/twhVQ4CT
         fNA7+ur0PJeFCYSBBeTeDkRPMB38/vfDFRTrfff9015aCVhGMHPaOumXhCZSNZipWmjr
         dw4qNcYNa7GOWt1ERRsNBH16MXTivAB7j5B+4E1rveqQI31jtnpddCyKktl49Is9DOaP
         I3DFzKtSKIBnleD5CcZj1HnRULeIz4NtxaZfnQACtMZhPiGvzXIloMVOxX5GN856dzEp
         L/MvpSJVhIbLhJiUq5bHQ75vsN8kfCHVediG64G/tc+bhjCTuwZiNF5J80p4JAiv6UI0
         TWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965963; x=1696570763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeROYzXT5X0vhWub03MpkUt5t0C3EfcKOwYZPDuBwCY=;
        b=HEE6MpkOvn+iWe3CEIXbjyi3azS2k2RLs/EYGuyL5DfS42O4z42FqSpgv34rbEdM6B
         ou+FsWBQYZKjz3dkNu52/IY1O3Mt2YBBg06qzY/AroUkmJ8fEVtW+q+WqCaVIXdeoCxx
         +ZiI6a3jnibhqCbVkqtJ7LNK1iXMB1MsbQXZ3axpV0QoXDm8Yyofgfn3n1ad27wRU9WJ
         wDHquORi8oqscJLyQ++wUi4RsdZDVN6lUcjfwmJ3XxZqhOBh8wx2vjee3vbMKgJFMcDp
         SAaiD9eEHzq4B24A6thOV7O9Wn0zPdHvmh2YSRmKl/t22TGOQZR9b3PXLOxMddKBJa2M
         GUpA==
X-Gm-Message-State: AOJu0YxSszFnv2KKw3k0k3qh7yEwVdHs0gRf+H3bi8OZjcHCzHKm4tz1
        lrWj4aViJJxYd+dg6qP9bvUSAQ==
X-Google-Smtp-Source: AGHT+IGADEnpx3heQWFHdL/4NzaHz21fAG/RuwtTOzG7s3wQgRBxCwzfIgq/eWl2F+fu8QtXUo2AmA==
X-Received: by 2002:a17:906:100c:b0:9a2:24f9:fabe with SMTP id 12-20020a170906100c00b009a224f9fabemr3031122ejm.66.1695965963508;
        Thu, 28 Sep 2023 22:39:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:39:23 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org, arnd@arndb.de,
        neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/28] clk: renesas: rzg2l: wait for status bit of SD mux before continuing
Date:   Fri, 29 Sep 2023 08:38:49 +0300
Message-Id: <20230929053915.1530607-3-claudiu.beznea@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
References: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hardware user manual of RZ/G2L (r01uh0914ej0130-rzg2l-rzg2lc.pdf,
chapter 7.4.7 Procedure for Switching Clocks by the Dynamic Switching
Frequency Selectors) specifies that we need to check CPG_PL2SDHI_DSEL for
SD clock switching status.

Fixes: eaff33646f4cb ("clk: renesas: rzg2l: Add SDHI clk mux support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- initialized msk

 drivers/clk/renesas/rzg2l-cpg.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 9baae7bb7094..5343d04fd70d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -188,7 +188,8 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	u32 off = GET_REG_OFFSET(hwdata->conf);
 	u32 shift = GET_SHIFT(hwdata->conf);
 	const u32 clk_src_266 = 2;
-	u32 bitmask;
+	u32 msk, val, bitmask;
+	int ret;
 
 	/*
 	 * As per the HW manual, we should not directly switch from 533 MHz to
@@ -202,14 +203,10 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	 * the index to value mapping is done by adding 1 to the index.
 	 */
 	bitmask = (GENMASK(GET_WIDTH(hwdata->conf) - 1, 0) << shift) << 16;
+	msk = off ? CPG_CLKSTATUS_SELSDHI1_STS : CPG_CLKSTATUS_SELSDHI0_STS;
 	if (index != clk_src_266) {
-		u32 msk, val;
-		int ret;
-
 		writel(bitmask | ((clk_src_266 + 1) << shift), priv->base + off);
 
-		msk = off ? CPG_CLKSTATUS_SELSDHI1_STS : CPG_CLKSTATUS_SELSDHI0_STS;
-
 		ret = readl_poll_timeout(priv->base + CPG_CLKSTATUS, val,
 					 !(val & msk), 100,
 					 CPG_SDHI_CLK_SWITCH_STATUS_TIMEOUT_US);
@@ -221,7 +218,13 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 
 	writel(bitmask | ((index + 1) << shift), priv->base + off);
 
-	return 0;
+	ret = readl_poll_timeout(priv->base + CPG_CLKSTATUS, val,
+				 !(val & msk), 100,
+				 CPG_SDHI_CLK_SWITCH_STATUS_TIMEOUT_US);
+	if (ret)
+		dev_err(priv->dev, "failed to switch clk source\n");
+
+	return ret;
 }
 
 static u8 rzg2l_cpg_sd_clk_mux_get_parent(struct clk_hw *hw)
-- 
2.39.2

