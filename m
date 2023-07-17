Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF1FC00528
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 15:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbjGQPTQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 11:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbjGQPTP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 11:19:15 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E795C10D
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:13 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so7286019e87.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689607152; x=1692199152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJ0qGiQRfgozs+tcAPQpQ7XtDjcKLWTvi3TAMjuYVrA=;
        b=BorbYIYjhnoPCbMKnNPTMh1c348OYLYDpIk3doZl3rYS4nuxYwYZVrVFqy0jeMf/b7
         XxMGvBrmgas2hOWSWXcwmZhio0h6aONL+FuP9Hqy+4UHKv85hlNzio01ia17Aa1lsxQY
         LF/fWiN1hhKLA7D3NheFXPuZYNzoNKbqvr8UIV2axQFHsUJpIDxc4foV0pTrssUB2Zlq
         icogCGQHqDEHsAS5Ha/kyogr/KAcibx9uGoi2TdO9y33RrHRLa39tJlqCbYuOXleC8f7
         HSUtOLLtrn213X9AGGlBVrQfwj8Wm0VdG2+wsLk4bLBgo2GJk/Htcxm8sysXY+3ne4rF
         f/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607152; x=1692199152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ0qGiQRfgozs+tcAPQpQ7XtDjcKLWTvi3TAMjuYVrA=;
        b=F6WTsO6xpZ15uK7poZCdNJBaX9G5iqkIhB/98JHP4grp5y2+Sf5nf6E96jegkj+Lgx
         PitU8P3+7UIoS4wr8m1GZ96E9ica05gbnQw5bpmgSlQMG8+Mho6KrJakRZrNO45K6rqS
         oXvKjXuS25W8uhqr+6Gg+KN4fRwilsJqRAS887EDSYQS3edJ1sbswTLTZzY5oE5VzG3b
         rJglMT2wm4JfA57y22COEDy3KqTLHTODNfV88IWv4g0vtqfdXlk0LrtiYh8ekrVzJ1Gu
         b0MEUOsoZDbeEsBG2jWZyPWUb/3rDzHDQpqZmrqHOLvVthbRQbB4ZW+A1mDJGGwGX77T
         ACtw==
X-Gm-Message-State: ABy/qLZBNaZQ+J66mGAqtNqTaSAfwi5mgKEqqEjQE0XaXSAafuGV6Csp
        fZKI46JjzI7WGBlFrYxxNkfxCQ==
X-Google-Smtp-Source: APBJJlE0osC3OIG022PFj5LI3UlPGlKCx1sZ/SosM1vC7Hg2fbgwBS906APZdHnvclQjYil0Xl1txQ==
X-Received: by 2002:a19:ca52:0:b0:4f8:6d54:72fb with SMTP id h18-20020a19ca52000000b004f86d5472fbmr7170351lfj.62.1689607152302;
        Mon, 17 Jul 2023 08:19:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004f26d63f823sm2873949lfh.237.2023.07.17.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:19:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 17 Jul 2023 17:19:08 +0200
Subject: [PATCH 01/15] clk: qcom: branch: Add a helper for setting the
 enable bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v1-1-27784d27a4f4@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689607149; l=1295;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6Bd/Fnfm9Yhx1mDIqJ/W7OC8Bh6MqHAA2H25Y3NFUOA=;
 b=W+t3CYvKLcbnd3HBI6U4rTbNjkWhWpjjL8PwzInHpYqquxKS67oW2oR9Eq80nBfv1/IheKGNt
 MivQ+jMFAXVClg3i6dYItzbwkIsd+gg504JipLN5HWewLd5NT3MOQOS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We harcode some clocks to be always-on, as they're essential to the
functioning of the SoC / some peripherals. Add a helper to do so
to make the writes less magic.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 0cf800b9d08d..155818cc8d49 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -47,6 +47,7 @@ struct clk_branch {
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
 #define CBCR_WAKEUP			GENMASK(11, 8)
 #define CBCR_SLEEP			GENMASK(7, 4)
+#define CBCR_CLOCK_ENABLE		BIT(0)
 
 static inline void qcom_branch_set_force_mem_core(struct regmap *regmap,
 						  struct clk_branch clk, bool on)
@@ -81,6 +82,12 @@ static inline void qcom_branch_set_sleep(struct regmap *regmap, struct clk_branc
 			   FIELD_PREP(CBCR_SLEEP, val));
 }
 
+static inline void qcom_branch_set_clk_en(struct regmap *regmap, u32 cbcr)
+{
+	regmap_update_bits(regmap, cbcr, CBCR_CLOCK_ENABLE,
+			   CBCR_CLOCK_ENABLE);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;

-- 
2.41.0

