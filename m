Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C74C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  5 May 2022 12:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbiEEMRI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 May 2022 08:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359576AbiEEMRC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2022 08:17:02 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795086452
        for <linux-clk@vger.kernel.org>; Thu,  5 May 2022 05:13:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q14so5318173ljc.12
        for <linux-clk@vger.kernel.org>; Thu, 05 May 2022 05:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Ju33vklhvWDgqYnbUjMvLzeAJEZ3VMZ9ItUEYHT5XI=;
        b=b5jjk6KYz2K6/9phidISJnOvQdlk5mRNcpzbi31vGr7Znq5OomN14j7UdE8KRreR6J
         pkIox4J1FzZMIYFdXHofC7T2cELI8WN1T/az7URKxGKDhxHKAVCHRUNKYG9Rs97xS6ry
         ZfKeRBikfsUjhb0OLxnOlYY3R8DK6cl6Jqw5OkDSCpm9x+i4xyYlBpvAG+wmE0CmVq38
         mboLTvCMMCELOCC5MbzABMPADJq46PtX0WIFL/WmQYkkq1NNeOmFh3UXnjY+rwiI//vz
         qisRsu+U+lWMzJPaHCoKgLhczyq+Gq9m8f882f0xlP8fjzGpWjDK9iCxkIOE1GMTQduR
         XbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Ju33vklhvWDgqYnbUjMvLzeAJEZ3VMZ9ItUEYHT5XI=;
        b=le+zREDjOEAJ4QksASSmsMC2A6OhYtZMInkUc+pxetk1jwsXF803mJG4jxYPyITOKS
         GiU4RufM5dbeVA82XsihvUf+Tl4qMVm70Ogd3aOakTq0YwV0TnxKYABFCies0txZEW//
         XBou/imOG8LYhncGpQNJX0Tza9LsY+ej01wHoQ7zeRe1kYLCpfjgqIyBY4YOmjoovKMl
         ITqqxAMejJWU3LLLue6eaSJOqnku+d4VyaIFvWX070rpthk/4nqrR2rlhvNwYKlQSe7K
         vzb5hQQfIJvSJbLLNW22UtqVi9QW2f0mmszSFejBB0k0lRLWKvf17l20F7tR7MZdq6qF
         VN2w==
X-Gm-Message-State: AOAM532Y51ZTby/slPBjr6Ik4xU2Hmvl9yfoSP4vEVFd9OA0VU+qqegw
        r6t64jrQ9ONlpNhrrlk3sY5q3A==
X-Google-Smtp-Source: ABdhPJxvD1cTPBTsSFfznq/hicADjdofNvDSuyz8nGUARZ2096HeG6QZe7C+K4PSDQ7gPJdt+CA22A==
X-Received: by 2002:a05:651c:1029:b0:24f:ced:9299 with SMTP id w9-20020a05651c102900b0024f0ced9299mr15898360ljm.462.1651752800860;
        Thu, 05 May 2022 05:13:20 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id x2-20020a2ea7c2000000b0024f3d1dae94sm25543ljp.28.2022.05.05.05.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 05:13:20 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Thu,  5 May 2022 15:13:17 +0300
Message-Id: <20220505121317.4121850-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
References: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unify all exported PLL clock configuration functions and data structures
as GPL symbols.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v2 to v3:
* added Bjorn's reviewed-by tag

 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 288692f0ea39..47879ee5a677 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1823,7 +1823,7 @@ const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_5lpe_ops);
 
 const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
 	.enable = alpha_pll_lucid_5lpe_enable,
@@ -1832,14 +1832,14 @@ const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
 	.recalc_rate = clk_trion_pll_recalc_rate,
 	.round_rate = clk_alpha_pll_round_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_fixed_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_5lpe_ops);
 
 const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
 	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
 	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
 
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
@@ -1992,7 +1992,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 
 static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 {
-- 
2.33.0

