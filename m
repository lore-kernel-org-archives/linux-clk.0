Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8B4C4321E
	for <linux-clk@archiver.kernel.org>; Tue, 28 Dec 2021 04:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhL1Eyc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 23:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbhL1Eyb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 23:54:31 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D35C06173E
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:30 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i31so38858064lfv.10
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZlCo7jdDZ5mFY57HXGUE2eeHXilVOriVsg//qaGNV4w=;
        b=T330XaJoyqjREFkayp1WmvbzinqsWl3ds5eyodr9nho++sWuH1kynEqRXosOPEuIb+
         9bVqny+XzdkzwY10L0pASB0HtylwEYvdLaELzQH0gzjPv0MCYb6wbvfA2lqnTTrjYzH9
         8jfO7AN07UNaG6Bep2AR83F8IBR2yHMFLYeI48K6xdr5N8DhxiIFj8jF4KhsGKtGi5fh
         uneTgX8SXfGP33xmdHZn6aWSpjT/TXP3SWANWYZGG3iOXt2VNElLXCuxLEL8BWDcakPA
         PoSMBuhb4HHItw5KzspGJjNnAfYpyZbz64IC8ce+2mNmJS/oSYSu7I+VxRyUSLYaqfpi
         Rrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZlCo7jdDZ5mFY57HXGUE2eeHXilVOriVsg//qaGNV4w=;
        b=EZQQjQr0mNfaCvz3Zd0wSL4QC3w08ZTAygRQYs2ysSnH1U+Iw9PFSzyA4rFzxazhwb
         9oTuwGojnZsjOZuuialx/SE+yx5vQeOkBNDUcGoNkAa4HwohbqE/ruEuTT7aNcWnat+c
         Pqa7NUqXiUcM1L5XzFR7fffM+InG2i5lBmcCoE7mhOu0LfT2kbr9fw7UK6GpZBBHgmeX
         deQtcrRkmJkXt/aAkR4dt3e83i8tBzqQNPjaKM/t+NR76se6Qs7spZfxU/gY6VY+bAJ9
         Et0VoPaIIphqQCVYhMQGTpiDCXGF1PMKV27sl5y6Jsj690TJH9EodH63g5ogU+XtA3LM
         0d+g==
X-Gm-Message-State: AOAM5302p2Z9mJZY8NOnrCS9zlMkFXJBhx6zyuqmLanxfh/vzQMv7hv7
        K4Mdd+sr/mYm5/xk9Tu3I36KXw==
X-Google-Smtp-Source: ABdhPJwRV7C17vy7K3V2IfQqW4DWzw9wouKmOy7IFBlsEO2BpfEAzcJ1RWuwlQoC479TqC4YkJAiDQ==
X-Received: by 2002:a05:6512:108f:: with SMTP id j15mr17871361lfg.340.1640667269297;
        Mon, 27 Dec 2021 20:54:29 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 14/16] clk: qcom: gcc-msm8996: move clock parent tables down
Date:   Tue, 28 Dec 2021 07:54:13 +0300
Message-Id: <20211228045415.20543-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move clock parent tables down, after the GPLL declrataions, so that we
can use gpll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 184 ++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 4c85b3935a81..8531f2f3665f 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -33,98 +33,6 @@ enum {
 	P_AUD_REF_CLK,
 };
 
-static const struct parent_map gcc_sleep_clk_map[] = {
-	{ P_SLEEP_CLK, 5 }
-};
-
-static const char * const gcc_sleep_clk[] = {
-	"sleep_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 }
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0"
-};
-
-static const struct parent_map gcc_xo_sleep_clk_map[] = {
-	{ P_XO, 0 },
-	{ P_SLEEP_CLK, 5 }
-};
-
-static const char * const gcc_xo_sleep_clk[] = {
-	"xo",
-	"sleep_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll0_early_div"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0",
-	"gpll4"
-};
-
-static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_AUD_REF_CLK, 2 }
-};
-
-static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
-	"xo",
-	"gpll0",
-	"aud_ref_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_SLEEP_CLK, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"sleep_clk",
-	"gpll0_early_div"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll4",
-	"gpll0_early_div"
-};
-
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
@@ -229,6 +137,98 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	},
 };
 
+static const struct parent_map gcc_sleep_clk_map[] = {
+	{ P_SLEEP_CLK, 5 }
+};
+
+static const char * const gcc_sleep_clk[] = {
+	"sleep_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 }
+};
+
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0"
+};
+
+static const struct parent_map gcc_xo_sleep_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_SLEEP_CLK, 5 }
+};
+
+static const char * const gcc_xo_sleep_clk[] = {
+	"xo",
+	"sleep_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"gpll0_early_div"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0",
+	"gpll4"
+};
+
+static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_AUD_REF_CLK, 2 }
+};
+
+static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
+	"xo",
+	"gpll0",
+	"aud_ref_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"sleep_clk",
+	"gpll0_early_div"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"gpll4",
+	"gpll0_early_div"
+};
+
 static const struct freq_tbl ftbl_system_noc_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),
-- 
2.34.1

