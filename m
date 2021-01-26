Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D528C433E9
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 12:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B89C2311D
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 12:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403932AbhAZMrj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 07:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403861AbhAZMrY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:47:24 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F44C0698C7
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:49 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id b5so16302219wrr.10
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WIsLlUBr7Kh7BZjK4/tzaEQaD5gOhXUmlIRcSEzBbI8=;
        b=KBIuvuxWrh/YHwqRTTMIL423owDV0Nl1IVyou3pBo7m5XVmmufbH5nQK9UNoFci9Eo
         jVd9fgJLVT8P5uq6Tv2hUOZ9+OmlPR2PsLU6f8QlQVValXfKle4l32gUn/QJK8Ifgcv0
         PBMoX2RNgiCpryMQMK1LgBovkr9KiSwo9NDHo9y1CqE+KTyu+vn0zsuofbhM+8uthjoU
         E1fgKyqvTOHvY27HGmHT1IrWVy9fUyTb7ggpapnW8AlsJOW+hn23+BnmfNu51ZVTyIc7
         /PFTwFTeqSl+AFoJMglXVM+qTf0RV0zQXwGfgKA+LqDD261F7dYfnxgJiiTyF2aTIXIX
         PBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WIsLlUBr7Kh7BZjK4/tzaEQaD5gOhXUmlIRcSEzBbI8=;
        b=E4VznWGSEsgYA9d55+KFi8oiIZsEWOBDWJh8wd7EJWbXQviT7twMdbJ0ctRTaOHKXO
         H+b46dv8RzLLz4XEaWFmWsf2zaT7fCU6XYUSRm9rU11z9nHZkad9xP/voCFBd+uCOCGU
         veGOv1lQGdFWaFESehYJ97CRbrw5SCpSj2tRG3UY2ybB7cjQL0DkAO2WsUyRsgj412Hh
         vlvQqiPnFm49rEy5jCzJZ9zJWE2XSTkK7eTHsBTbI9IzuIGGKaV4FqtrbnBonEp1hjfX
         f9EAAi+rBlul/gFQXXCDjl8ewvDqYFQ01VNd7xlvrUlza81j6h5SSl1Z6Afge64eoObA
         BXTQ==
X-Gm-Message-State: AOAM531d7WHnUpKN453DDA9dyQ0Eq6KRMxpcj/pLhZB4zA5y/Rb9EnDM
        7fWEsq7W+NTwCHoXdjWb4/Ufzg==
X-Google-Smtp-Source: ABdhPJw0HLmHdiO+0F1VaKkiHXNhdaDuJI4cogpFC+eE4O4lwiCiOlbdxHobBO6VAE1F0EjG2/oIlA==
X-Received: by 2002:adf:c18d:: with SMTP id x13mr5826470wre.128.1611665148519;
        Tue, 26 Jan 2021 04:45:48 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:47 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 03/21] clk: ti: dpll3xxx: Fix some kernel-doc headers and promote other worthy ones
Date:   Tue, 26 Jan 2021 12:45:22 +0000
Message-Id: <20210126124540.3320214-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/ti/dpll3xxx.c:414: warning: Function parameter or member 'hw' not described in 'omap3_dpll_recalc'
 drivers/clk/ti/dpll3xxx.c:414: warning: Function parameter or member 'parent_rate' not described in 'omap3_dpll_recalc'
 drivers/clk/ti/dpll3xxx.c:414: warning: Excess function parameter 'clk' description in 'omap3_dpll_recalc'
 drivers/clk/ti/dpll3xxx.c:437: warning: Function parameter or member 'hw' not described in 'omap3_noncore_dpll_enable'
 drivers/clk/ti/dpll3xxx.c:437: warning: Excess function parameter 'clk' description in 'omap3_noncore_dpll_enable'
 drivers/clk/ti/dpll3xxx.c:479: warning: Function parameter or member 'hw' not described in 'omap3_noncore_dpll_disable'
 drivers/clk/ti/dpll3xxx.c:479: warning: Excess function parameter 'clk' description in 'omap3_noncore_dpll_disable'
 drivers/clk/ti/dpll3xxx.c:755: warning: Function parameter or member 'hw' not described in 'omap3_clkoutx2_recalc'
 drivers/clk/ti/dpll3xxx.c:755: warning: Function parameter or member 'parent_rate' not described in 'omap3_clkoutx2_recalc'
 drivers/clk/ti/dpll3xxx.c:755: warning: Excess function parameter 'clk' description in 'omap3_clkoutx2_recalc'

Cc: Tero Kristo <kristo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/ti/dpll3xxx.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 2490026948b47..6097b099a5dff 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -125,7 +125,7 @@ static u16 _omap3_dpll_compute_freqsel(struct clk_hw_omap *clk, u8 n)
 	return f;
 }
 
-/*
+/**
  * _omap3_noncore_dpll_lock - instruct a DPLL to lock and wait for readiness
  * @clk: pointer to a DPLL struct clk
  *
@@ -168,7 +168,7 @@ static int _omap3_noncore_dpll_lock(struct clk_hw_omap *clk)
 	return r;
 }
 
-/*
+/**
  * _omap3_noncore_dpll_bypass - instruct a DPLL to bypass and wait for readiness
  * @clk: pointer to a DPLL struct clk
  *
@@ -204,7 +204,7 @@ static int _omap3_noncore_dpll_bypass(struct clk_hw_omap *clk)
 	return r;
 }
 
-/*
+/**
  * _omap3_noncore_dpll_stop - instruct a DPLL to stop
  * @clk: pointer to a DPLL struct clk
  *
@@ -291,7 +291,7 @@ static void _lookup_sddiv(struct clk_hw_omap *clk, u8 *sd_div, u16 m, u8 n)
 	*sd_div = sd;
 }
 
-/*
+/**
  * _omap3_noncore_dpll_program - set non-core DPLL M,N values directly
  * @clk:	struct clk * of DPLL to set
  * @freqsel:	FREQSEL value to set
@@ -406,7 +406,8 @@ static int omap3_noncore_dpll_program(struct clk_hw_omap *clk, u16 freqsel)
 
 /**
  * omap3_dpll_recalc - recalculate DPLL rate
- * @clk: DPLL struct clk
+ * @hw: struct clk_hw containing the DPLL struct clk
+ * @parent_rate: clock rate of the DPLL parent
  *
  * Recalculate and propagate the DPLL rate.
  */
@@ -421,7 +422,7 @@ unsigned long omap3_dpll_recalc(struct clk_hw *hw, unsigned long parent_rate)
 
 /**
  * omap3_noncore_dpll_enable - instruct a DPLL to enter bypass or lock mode
- * @clk: pointer to a DPLL struct clk
+ * @hw: struct clk_hw containing then pointer to a DPLL struct clk
  *
  * Instructs a non-CORE DPLL to enable, e.g., to enter bypass or lock.
  * The choice of modes depends on the DPLL's programmed rate: if it is
@@ -470,7 +471,7 @@ int omap3_noncore_dpll_enable(struct clk_hw *hw)
 
 /**
  * omap3_noncore_dpll_disable - instruct a DPLL to enter low-power stop
- * @clk: pointer to a DPLL struct clk
+ * @hw: struct clk_hw containing then pointer to a DPLL struct clk
  *
  * Instructs a non-CORE DPLL to enter low-power stop.  This function is
  * intended for use in struct clkops.  No return value.
@@ -745,7 +746,8 @@ static struct clk_hw_omap *omap3_find_clkoutx2_dpll(struct clk_hw *hw)
 
 /**
  * omap3_clkoutx2_recalc - recalculate DPLL X2 output virtual clock rate
- * @clk: DPLL output struct clk
+ * @hw: pointer  struct clk_hw
+ * @parent_rate: clock rate of the DPLL parent
  *
  * Using parent clock DPLL data, look up DPLL state.  If locked, set our
  * rate to the dpll_clk * 2; otherwise, just use dpll_clk.
@@ -913,7 +915,7 @@ const struct clk_hw_omap_ops clkhwops_omap3_dpll = {
  * omap3_dpll4_set_rate - set rate for omap3 per-dpll
  * @hw: clock to change
  * @rate: target rate for clock
- * @parent_rate: rate of the parent clock
+ * @parent_rate: clock rate of the DPLL parent
  *
  * Check if the current SoC supports the per-dpll reprogram operation
  * or not, and then do the rate change if supported. Returns -EINVAL
-- 
2.25.1

