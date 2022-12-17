Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED5CC3DA71
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiLQAYE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiLQAXJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:09 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951127E28E
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:36 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m29so5659178lfo.11
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQd6fEi9T0SyCrU04rzrAmLD94Prg130f6sYRRF8ULo=;
        b=DalwbcNPRqWzttpfL6mU239BU+MZj7eOuIVs+lAROtfloko78wi4hlRBwbk+gr0maT
         BJkFV4KvPGB7SfIWkce8v9eaC72Gdq6N52RnRcYFCYSHF46ria5/OFzuH89Or1drUjJk
         klUgWQJsq8TopohCtPHmto2TTdyqUwdmkSBG6gAmjz/tFE6jF/6JpF20nE0g3vlUxGZ4
         IAoxNAPW//ROn32VVgJkU56i1HFdsGAviIGLenAsdnwjU9TIHWkak/lmXHd/T/F2MJ7C
         hYg5MfxxxnkEFbEhfgH62dOFxrrjh1NdevIgbvpmNRt73zrM0CzOC3Y+dl4jWBLyARRb
         zYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQd6fEi9T0SyCrU04rzrAmLD94Prg130f6sYRRF8ULo=;
        b=DC9ksqwxr986OSfL0HTWw5uVzFteK4NzaHG4rJ9rxFDf3VTR5aOiMne3XzPnCDts7M
         7l+1CQTeXRX+uU8yTDNGlQDgHU1Q//V+8bWiLwr48bUMlnL63Yo3d6HqjAcDDRnFuUw5
         r+xRPjnMvRltFiZGa5YWzqFr7rpZOqLZh0QAj3c+Cd0dzp5O++kY00IPOcVBLsEIYNPF
         y8O39sfgs1FnYRKhZwUypvwMV8M2zCD1AHv3tvMxmTEJBdoQYI+J1jDnqUJzS2DMtVmb
         oySUFL8eTCvWssokm17nlwCk3KAolI+tXR5u0fRR+1II2EYNA2PqMTTLa/okRP4EJnAM
         6tLg==
X-Gm-Message-State: ANoB5pnI3awfhI06L6CTzC4P3byFUQasyE3JzVg2t8LOaOILQqI8L4wP
        kdF4hE6yyOd5T7w89Xcw1Lys44QLRA6eLRN57QI=
X-Google-Smtp-Source: AA0mqf4lLua9GXXjrHDaAaXSK1A5VIUTVfkkAwoXUy4aG+HoSgMUd5cfVZ2QyFesFHqh6wV7umrFZA==
X-Received: by 2002:a05:6512:22cb:b0:4b6:e3d5:a8c2 with SMTP id g11-20020a05651222cb00b004b6e3d5a8c2mr9160616lfu.13.1671236256175;
        Fri, 16 Dec 2022 16:17:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 06/15] clk: qcom: gcc-qcs404: fix names of the DSI clocks used as parents
Date:   Sat, 17 Dec 2022 02:17:21 +0200
Message-Id: <20221217001730.540502-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The QCS404 uses 28nm LPM DSI PHY, which registers dsi0pll and
dsi0pllbyte clocks. Fix all DSI PHY clock names used as parents inside
the GCC driver.

Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index c48326da1bb3..23562096298d 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -115,7 +115,7 @@ static const struct parent_map gcc_parent_map_5[] = {
 
 static const char * const gcc_parent_names_5[] = {
 	"cxo",
-	"dsi0pll_byteclk_src",
+	"dsi0pllbyte",
 	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
@@ -129,7 +129,7 @@ static const struct parent_map gcc_parent_map_6[] = {
 
 static const char * const gcc_parent_names_6[] = {
 	"cxo",
-	"dsi0_phy_pll_out_byteclk",
+	"dsi0pllbyte",
 	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
@@ -175,7 +175,7 @@ static const struct parent_map gcc_parent_map_9[] = {
 static const char * const gcc_parent_names_9[] = {
 	"cxo",
 	"gpll0_out_main",
-	"dsi0_phy_pll_out_dsiclk",
+	"dsi0pll",
 	"gpll6_out_aux",
 	"core_bi_pll_test_se",
 };
@@ -213,7 +213,7 @@ static const struct parent_map gcc_parent_map_12[] = {
 
 static const char * const gcc_parent_names_12[] = {
 	"cxo",
-	"dsi0pll_pclk_src",
+	"dsi0pll",
 	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
-- 
2.35.1

