Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C2FC43612
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 03:34:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0567620656
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 03:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="kt5uwZj0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfAODeE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jan 2019 22:34:04 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39698 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbfAODeD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Jan 2019 22:34:03 -0500
Received: by mail-pf1-f193.google.com with SMTP id r136so622269pfc.6
        for <linux-clk@vger.kernel.org>; Mon, 14 Jan 2019 19:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wGON2lybsGy7FC0OgCUYudVtpokObJD+vq+U001MecQ=;
        b=kt5uwZj0n2jIfhdmMmww8CUoQKLY9VIyrpit7LW9KHb2Y8A+0NVIfw3j0Jb3nTwEsf
         5qi7MQ1We/Fmmg8Rkc4ZKICZFn/0yuLCBmApFxOa2eE5YgqO2os5oq8o8TtpxaSbFmuQ
         hiJe336DjVtBrAgMtEKNYL2ZywH9BXbOPsPfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wGON2lybsGy7FC0OgCUYudVtpokObJD+vq+U001MecQ=;
        b=WXA9UzUGrVR/jQeN12R+W4WdKe6EF5DTtoEv01o3LaZa6eAiLlCbKRGjIO5kavzu2B
         KlrOCwXhcC5EgYwvnl5Nzko2FlnS2wfPhBS0vl8rrSesIllC2HCwMYU5hzcAVpNAAu/1
         NxZOU+h+NTifavtZxV7fxbe+NtG1DfvqFw4nY1bAcpvoQ/gxPGPdM3ugXxPo3kWSBEU9
         IVLDvJlRZ3tvnZW/MnMWRJqKkyrzmAgQtSEZOb8pb6033jyD3T1ralN4CSn2mIupqc+3
         S+FlSRJ92XayHdHyDf34tYS9Tvwyj6/yIDtqkHWjIypP+b8wdMgTlZtmOxiLgHFBjfwk
         l/bg==
X-Gm-Message-State: AJcUukfJopdHLizJd1BOlFdgR4MxN4PcZFSFXE6F+eEzO6IYBVqJfmgA
        QnuinX24/6Sjf0jNopRbaMpO
X-Google-Smtp-Source: ALg8bN5230LUY/wn9nCxtf+4tYuSySJK3C/+zqeuTSEYcGrKHPg2vzAts66SahVhWg++8iiXT/edEw==
X-Received: by 2002:a65:4946:: with SMTP id q6mr1769075pgs.201.1547523242855;
        Mon, 14 Jan 2019 19:34:02 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6084:4813:7cd6:42d1:f14c:3e90])
        by smtp.gmail.com with ESMTPSA id s9sm2137023pgl.88.2019.01.14.19.33.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jan 2019 19:34:02 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/6] clk: actions: Add configurable PLL delay
Date:   Tue, 15 Jan 2019 09:03:35 +0530
Message-Id: <20190115033340.25016-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

S500 SoC requires configurable delay for different PLLs. Hence, add
a separate macro for declaring a PLL with configurable delay and also
modify the existing OWL_PLL_NO_PARENT macro to use default delay so
that no need to modify the existing S700/S900 drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/actions/owl-pll.c |  2 +-
 drivers/clk/actions/owl-pll.h | 30 ++++++++++++++++++++++++------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 058e06d7099f..02437bdedf4d 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -179,7 +179,7 @@ static int owl_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(common->regmap, pll_hw->reg, reg);
 
-	udelay(PLL_STABILITY_WAIT_US);
+	udelay(pll_hw->delay);
 
 	return 0;
 }
diff --git a/drivers/clk/actions/owl-pll.h b/drivers/clk/actions/owl-pll.h
index 0aae30abd5dc..6fb0d45bb088 100644
--- a/drivers/clk/actions/owl-pll.h
+++ b/drivers/clk/actions/owl-pll.h
@@ -13,6 +13,8 @@
 
 #include "owl-common.h"
 
+#define OWL_PLL_DEF_DELAY	50
+
 /* last entry should have rate = 0 */
 struct clk_pll_table {
 	unsigned int		val;
@@ -27,6 +29,7 @@ struct owl_pll_hw {
 	u8			width;
 	u8			min_mul;
 	u8			max_mul;
+	u8			delay;
 	const struct clk_pll_table *table;
 };
 
@@ -36,7 +39,7 @@ struct owl_pll {
 };
 
 #define OWL_PLL_HW(_reg, _bfreq, _bit_idx, _shift,			\
-		   _width, _min_mul, _max_mul, _table)			\
+		   _width, _min_mul, _max_mul, _delay, _table)		\
 	{								\
 		.reg		= _reg,					\
 		.bfreq		= _bfreq,				\
@@ -45,6 +48,7 @@ struct owl_pll {
 		.width		= _width,				\
 		.min_mul	= _min_mul,				\
 		.max_mul	= _max_mul,				\
+		.delay		= _delay,				\
 		.table		= _table,				\
 	}
 
@@ -52,8 +56,8 @@ struct owl_pll {
 		_shift, _width, _min_mul, _max_mul, _table, _flags)	\
 	struct owl_pll _struct = {					\
 		.pll_hw	= OWL_PLL_HW(_reg, _bfreq, _bit_idx, _shift,	\
-				     _width, _min_mul,			\
-				     _max_mul, _table),			\
+				     _width, _min_mul, _max_mul,	\
+				     OWL_PLL_DEF_DELAY,	_table),	\
 		.common = {						\
 			.regmap = NULL,					\
 			.hw.init = CLK_HW_INIT(_name,			\
@@ -67,8 +71,23 @@ struct owl_pll {
 		_shift, _width, _min_mul, _max_mul, _table, _flags)	\
 	struct owl_pll _struct = {					\
 		.pll_hw	= OWL_PLL_HW(_reg, _bfreq, _bit_idx, _shift,	\
-				     _width, _min_mul,			\
-				     _max_mul, _table),			\
+				     _width, _min_mul, _max_mul,	\
+				     OWL_PLL_DEF_DELAY,	_table),	\
+		.common = {						\
+			.regmap = NULL,					\
+			.hw.init = CLK_HW_INIT_NO_PARENT(_name,		\
+					       &owl_pll_ops,		\
+					       _flags),			\
+		},							\
+	}
+
+#define OWL_PLL_NO_PARENT_DELAY(_struct, _name, _reg, _bfreq, _bit_idx,	\
+		_shift, _width, _min_mul, _max_mul, _delay, _table,	\
+		_flags)							\
+	struct owl_pll _struct = {					\
+		.pll_hw	= OWL_PLL_HW(_reg, _bfreq, _bit_idx, _shift,	\
+				     _width, _min_mul,  _max_mul,	\
+				     _delay, _table),			\
 		.common = {						\
 			.regmap = NULL,					\
 			.hw.init = CLK_HW_INIT_NO_PARENT(_name,		\
@@ -78,7 +97,6 @@ struct owl_pll {
 	}
 
 #define mul_mask(m)		((1 << ((m)->width)) - 1)
-#define PLL_STABILITY_WAIT_US	(50)
 
 static inline struct owl_pll *hw_to_owl_pll(const struct clk_hw *hw)
 {
-- 
2.17.1

