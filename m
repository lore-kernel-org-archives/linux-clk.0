Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68389CCA481
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jun 2022 12:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382197AbiFQM3e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jun 2022 08:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382310AbiFQM3c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jun 2022 08:29:32 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9D35B3FC
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 05:29:28 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id v8so4566585ljj.8
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oHNnWchYP0glpm/h3O6EuFtEW37niNihFIAntU3U2qM=;
        b=fybw1iKICpKIZkDs5feIoiiX2Sp3voJ1bqXXb5Yza03E6s+d+ea+6YHWsyUmCHEEXV
         qgmQirwDIvZ98bJvBqkyWvN+8lg7NoUlK1P2Nv6XeFQ2Bw8pR28OqX1SJUZOHVzcv1xq
         ehvIql3yH8Ai6ptY5HfE3GIJirwirS2aEc03YALHVjSSRiewR1fCd9tpY3yLdzHcb2uL
         GSdBG4TNU2Hxg42zuTwgclwBluCOr6f28L+emSYigMW6iz7GYX+/ZMwFA13E40O8JDch
         Lr3FYdPCkpYrDeu70S8opzpQhEMa8t6y2stYr47h5PfyQR1LgmDvT6fXGs0APzNfti7/
         OcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oHNnWchYP0glpm/h3O6EuFtEW37niNihFIAntU3U2qM=;
        b=l8CAB1iWfTCP9Ek9hDXkVviuT4UZpn6FgzM/SCJaKsJbH1JUPgyjnWujEeiS4hEiWD
         fNGTgY55kMmQ5qTvJtW7iloegBqVFlIuzVGAO3eFEOorqxuSQKsIXQ9bRfTYd7rIX3gR
         NGrz0kAfUHPlXLLkErhLo12crZSgAp64u0SHBgWPljBIhGCe8lmH6+5YiPvY2thtbitl
         uS/xDwUPQEgbFql/KhiPViN4x5ObThrhOX8f4mXRt8he73aEMSVeXRSf3VPxECvNJvac
         o856LTko8/I0BWPcGJtx0XHvGIO9r59YGFV2zymIdj4lFVWikm4UFQnUqXMVwDuhhQ2i
         vp7g==
X-Gm-Message-State: AJIora9PtWnYWsWumHipQ17XetkD35TSzMuKFi8utKvQfoMQnSbnfW0l
        88M0Z8qaBF/vBUsHLKzXlw4rug==
X-Google-Smtp-Source: AGRyM1uI1GyC84F9RcdX6z/cDlIBXO2CNDWdNPdiVJ3ovHpD4cky/2lRtC5c2d1v0s89FbI2NDqvrQ==
X-Received: by 2002:a05:651c:1306:b0:255:6fe5:1ae3 with SMTP id u6-20020a05651c130600b002556fe51ae3mr4569798lja.281.1655468966641;
        Fri, 17 Jun 2022 05:29:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8948000000b0025568a2a018sm539471ljk.129.2022.06.17.05.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:29:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 4/6] clk: qcom: mmcc-msm8996: move clock parent tables down
Date:   Fri, 17 Jun 2022 15:29:20 +0300
Message-Id: <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move clock parent tables down, after the MMPLL declrataions, so that we
can use gpll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 364 ++++++++++++++++----------------
 1 file changed, 182 insertions(+), 182 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index bf0f8eb78989..27c92818c49c 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -45,188 +45,6 @@ enum {
 	P_MMPLL4,
 };
 
-static const struct parent_map mmss_xo_hdmi_map[] = {
-	{ P_XO, 0 },
-	{ P_HDMIPLL, 1 }
-};
-
-static const char * const mmss_xo_hdmi[] = {
-	"xo",
-	"hdmipll"
-};
-
-static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
-	{ P_XO, 0 },
-	{ P_DSI0PLL, 1 },
-	{ P_DSI1PLL, 2 }
-};
-
-static const char * const mmss_xo_dsi0pll_dsi1pll[] = {
-	"xo",
-	"dsi0pll",
-	"dsi1pll"
-};
-
-static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 5 },
-	{ P_GPLL0_DIV, 6 }
-};
-
-static const char * const mmss_xo_gpll0_gpll0_div[] = {
-	"xo",
-	"gpll0",
-	"gpll0_div"
-};
-
-static const struct parent_map mmss_xo_dsibyte_map[] = {
-	{ P_XO, 0 },
-	{ P_DSI0PLL_BYTE, 1 },
-	{ P_DSI1PLL_BYTE, 2 }
-};
-
-static const char * const mmss_xo_dsibyte[] = {
-	"xo",
-	"dsi0pllbyte",
-	"dsi1pllbyte"
-};
-
-static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
-	{ P_XO, 0 },
-	{ P_MMPLL0, 1 },
-	{ P_GPLL0, 5 },
-	{ P_GPLL0_DIV, 6 }
-};
-
-static const char * const mmss_xo_mmpll0_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"gpll0",
-	"gpll0_div"
-};
-
-static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
-	{ P_XO, 0 },
-	{ P_MMPLL0, 1 },
-	{ P_MMPLL1, 2 },
-	{ P_GPLL0, 5 },
-	{ P_GPLL0_DIV, 6 }
-};
-
-static const char * const mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll1",
-	"gpll0",
-	"gpll0_div"
-};
-
-static const struct parent_map mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div_map[] = {
-	{ P_XO, 0 },
-	{ P_MMPLL0, 1 },
-	{ P_MMPLL3, 3 },
-	{ P_GPLL0, 5 },
-	{ P_GPLL0_DIV, 6 }
-};
-
-static const char * const mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll3",
-	"gpll0",
-	"gpll0_div"
-};
-
-static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
-	{ P_XO, 0 },
-	{ P_MMPLL0, 1 },
-	{ P_MMPLL5, 2 },
-	{ P_GPLL0, 5 },
-	{ P_GPLL0_DIV, 6 }
-};
-
-static const char * const mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll5",
-	"gpll0",
-	"gpll0_div"
-};
-
-static const struct parent_map mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div_map[] = {
-	{ P_XO, 0 },
-	{ P_MMPLL0, 1 },
-	{ P_MMPLL4, 3 },
-	{ P_GPLL0, 5 },
-	{ P_GPLL0_DIV, 6 }
-};
-
-static const char * const mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll4",
-	"gpll0",
-	"gpll0_div"
-};
-
-static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_MMPLL0, 1 },
-	{ P_MMPLL9, 2 },
-	{ P_MMPLL2, 3 },
-	{ P_MMPLL8, 4 },
-	{ P_GPLL0, 5 }
-};
-
-static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0[] = {
-	"xo",
-	"mmpll0",
-	"mmpll9",
-	"mmpll2",
-	"mmpll8",
-	"gpll0"
-};
-
-static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div_map[] = {
-	{ P_XO, 0 },
-	{ P_MMPLL0, 1 },
-	{ P_MMPLL9, 2 },
-	{ P_MMPLL2, 3 },
-	{ P_MMPLL8, 4 },
-	{ P_GPLL0, 5 },
-	{ P_GPLL0_DIV, 6 }
-};
-
-static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll9",
-	"mmpll2",
-	"mmpll8",
-	"gpll0",
-	"gpll0_div"
-};
-
-static const struct parent_map mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div_map[] = {
-	{ P_XO, 0 },
-	{ P_MMPLL0, 1 },
-	{ P_MMPLL1, 2 },
-	{ P_MMPLL4, 3 },
-	{ P_MMPLL3, 4 },
-	{ P_GPLL0, 5 },
-	{ P_GPLL0_DIV, 6 }
-};
-
-static const char * const mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll1",
-	"mmpll4",
-	"mmpll3",
-	"gpll0",
-	"gpll0_div"
-};
-
 static struct clk_fixed_factor gpll0_div = {
 	.mult = 1,
 	.div = 2,
@@ -471,6 +289,188 @@ static struct clk_alpha_pll_postdiv mmpll9 = {
 	},
 };
 
+static const struct parent_map mmss_xo_hdmi_map[] = {
+	{ P_XO, 0 },
+	{ P_HDMIPLL, 1 }
+};
+
+static const char * const mmss_xo_hdmi[] = {
+	"xo",
+	"hdmipll"
+};
+
+static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL, 1 },
+	{ P_DSI1PLL, 2 }
+};
+
+static const char * const mmss_xo_dsi0pll_dsi1pll[] = {
+	"xo",
+	"dsi0pll",
+	"dsi1pll"
+};
+
+static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 5 },
+	{ P_GPLL0_DIV, 6 }
+};
+
+static const char * const mmss_xo_gpll0_gpll0_div[] = {
+	"xo",
+	"gpll0",
+	"gpll0_div"
+};
+
+static const struct parent_map mmss_xo_dsibyte_map[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL_BYTE, 1 },
+	{ P_DSI1PLL_BYTE, 2 }
+};
+
+static const char * const mmss_xo_dsibyte[] = {
+	"xo",
+	"dsi0pllbyte",
+	"dsi1pllbyte"
+};
+
+static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
+	{ P_XO, 0 },
+	{ P_MMPLL0, 1 },
+	{ P_GPLL0, 5 },
+	{ P_GPLL0_DIV, 6 }
+};
+
+static const char * const mmss_xo_mmpll0_gpll0_gpll0_div[] = {
+	"xo",
+	"mmpll0",
+	"gpll0",
+	"gpll0_div"
+};
+
+static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
+	{ P_XO, 0 },
+	{ P_MMPLL0, 1 },
+	{ P_MMPLL1, 2 },
+	{ P_GPLL0, 5 },
+	{ P_GPLL0_DIV, 6 }
+};
+
+static const char * const mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
+	"xo",
+	"mmpll0",
+	"mmpll1",
+	"gpll0",
+	"gpll0_div"
+};
+
+static const struct parent_map mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div_map[] = {
+	{ P_XO, 0 },
+	{ P_MMPLL0, 1 },
+	{ P_MMPLL3, 3 },
+	{ P_GPLL0, 5 },
+	{ P_GPLL0_DIV, 6 }
+};
+
+static const char * const mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div[] = {
+	"xo",
+	"mmpll0",
+	"mmpll3",
+	"gpll0",
+	"gpll0_div"
+};
+
+static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
+	{ P_XO, 0 },
+	{ P_MMPLL0, 1 },
+	{ P_MMPLL5, 2 },
+	{ P_GPLL0, 5 },
+	{ P_GPLL0_DIV, 6 }
+};
+
+static const char * const mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
+	"xo",
+	"mmpll0",
+	"mmpll5",
+	"gpll0",
+	"gpll0_div"
+};
+
+static const struct parent_map mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div_map[] = {
+	{ P_XO, 0 },
+	{ P_MMPLL0, 1 },
+	{ P_MMPLL4, 3 },
+	{ P_GPLL0, 5 },
+	{ P_GPLL0_DIV, 6 }
+};
+
+static const char * const mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div[] = {
+	"xo",
+	"mmpll0",
+	"mmpll4",
+	"gpll0",
+	"gpll0_div"
+};
+
+static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_MMPLL0, 1 },
+	{ P_MMPLL9, 2 },
+	{ P_MMPLL2, 3 },
+	{ P_MMPLL8, 4 },
+	{ P_GPLL0, 5 }
+};
+
+static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0[] = {
+	"xo",
+	"mmpll0",
+	"mmpll9",
+	"mmpll2",
+	"mmpll8",
+	"gpll0"
+};
+
+static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div_map[] = {
+	{ P_XO, 0 },
+	{ P_MMPLL0, 1 },
+	{ P_MMPLL9, 2 },
+	{ P_MMPLL2, 3 },
+	{ P_MMPLL8, 4 },
+	{ P_GPLL0, 5 },
+	{ P_GPLL0_DIV, 6 }
+};
+
+static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div[] = {
+	"xo",
+	"mmpll0",
+	"mmpll9",
+	"mmpll2",
+	"mmpll8",
+	"gpll0",
+	"gpll0_div"
+};
+
+static const struct parent_map mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div_map[] = {
+	{ P_XO, 0 },
+	{ P_MMPLL0, 1 },
+	{ P_MMPLL1, 2 },
+	{ P_MMPLL4, 3 },
+	{ P_MMPLL3, 4 },
+	{ P_GPLL0, 5 },
+	{ P_GPLL0_DIV, 6 }
+};
+
+static const char * const mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div[] = {
+	"xo",
+	"mmpll0",
+	"mmpll1",
+	"mmpll4",
+	"mmpll3",
+	"gpll0",
+	"gpll0_div"
+};
+
 static const struct freq_tbl ftbl_ahb_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(40000000, P_GPLL0_DIV, 7.5, 0, 0),
-- 
2.35.1

