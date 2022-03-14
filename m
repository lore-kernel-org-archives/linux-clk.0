Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7783FC4167B
	for <linux-clk@archiver.kernel.org>; Mon, 14 Mar 2022 11:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239465AbiCNLpF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240505AbiCNLoC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Mar 2022 07:44:02 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4ACE32C
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:51 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q10so21413857ljc.7
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qq9dTW6gbLY/ve5ehTRpDEnNxOPOXDUjIljMGUur/vM=;
        b=JDYM2WmmHXGLb5VWToLUskc15H+29Tu+HtUvqkKnXKsRP2OTKfjVDK0+xnXhuS7Wc3
         i0NjWGG4aObhW1zNlwWdHf3qGs4APnyWwIT9bb/GF2UBd70EDlZ9VtN3u6gbnITGGT41
         vmUL9JuV0c1mEIjQI3d3NCIoRh9hkwgBa9WkIdjQza/bihuHKiBMti051Jl0yjhAvo6x
         mRTuaa6rqwLsmGpyMkon1Z8bsx9IhSvODQJLW/ZOw95T+OjY68Adpbyg+XQptFIknprE
         r2S8ivOj9mzz7Qb2jAHO0lkAHS9SYXjIVRk27E5LgL45t/u9XmpMj4Aj84QsOor7U89v
         6n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qq9dTW6gbLY/ve5ehTRpDEnNxOPOXDUjIljMGUur/vM=;
        b=TdDGJw2Ut+0COTLuOtAPStu+MkGmGhYlyM/Y1bislQuDfrHSKn5odU7nHc7SOEw0L5
         t8GpJrXD6Yi27E8w3ZboDThJZ2ICXLdr+wMf4NaLxWGbxzRljabrOneNmDicTw/z36NB
         gOjSS3kABod83E8SMszYGff6DcL3BMPH5NqBzOqb14mIlIjt3lPs0FY5uy7lhH7C2k13
         dzyBwaZ7m+v5rnDiqi8zXFmnGbrFavXdpk8hW0Q8rcxXo4L4CGQkVCTYYLVSAXJDAlC+
         mGJk62EzICIawMctzzDDzxatvorThzEZw/zd6i/YEMNnw5hjverMOrWSJ9ET5TaOLowL
         rhjg==
X-Gm-Message-State: AOAM532neEmJ14+uT3lAiG2XZn4t8GG+2uqBLfrAl0jhsMShf9Z+xjiy
        TxkJJvmVncP+8xILzZKNNSu1qQ==
X-Google-Smtp-Source: ABdhPJxAYLeEwbvD+chVwWk4vypPLS9H42TX2q+iWyvPdYlgVj/+Ic0xiSmN+mdUjCBf4MTgpdcpKQ==
X-Received: by 2002:a2e:b706:0:b0:247:ff35:cfd7 with SMTP id j6-20020a2eb706000000b00247ff35cfd7mr13652799ljo.510.1647258169349;
        Mon, 14 Mar 2022 04:42:49 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id g27-20020a19e05b000000b004485c877230sm2840850lfj.235.2022.03.14.04.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:42:49 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Mon, 14 Mar 2022 13:42:48 +0200
Message-Id: <20220314114248.1636620-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unify all exported PLL clock configuration functions and data structures
as GPL symbols.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
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

