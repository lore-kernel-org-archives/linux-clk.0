Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D83C05027
	for <linux-clk@archiver.kernel.org>; Wed,  1 Feb 2023 18:37:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjBAShF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Feb 2023 13:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjBAShF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 13:37:05 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C6D80033
        for <linux-clk@vger.kernel.org>; Wed,  1 Feb 2023 10:36:33 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v10so18640142edi.8
        for <linux-clk@vger.kernel.org>; Wed, 01 Feb 2023 10:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDicGkl+5x/PXSx3Dad29Z0zKYmJ8UAe01LZn9BX9P0=;
        b=lgatjYCVYPzRwVfKLWY0TbmS/6NaTm3qJxDaz+9esYJTY2atIDNJW5P+PvnrBmkuoP
         PJIjR6y5RscfxilsEijJ5S6XK/ozSce/dShr0Z1cdxBus5mtmVxe8reJwdkYQbEj7Uhs
         irGlD9UO2FEm2YJUriY6EnY7tqRJmerb2hdXKFppLyhIqfh5/CVABupPoOUXGAfvwhKR
         Qqb0jTbVarpsIwGeA/Ga7X4ttifcAmmlXFcF5BQJQ1+6mtbIgtV4jLalogay5i5UODtB
         ziKBng7yJfNtFh5VDjxCGMqGhQDsiX3dRc2j5OAot2bDYG3GMWd4wjmSGdR2Mvyu4qA8
         QJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDicGkl+5x/PXSx3Dad29Z0zKYmJ8UAe01LZn9BX9P0=;
        b=o3thQIdJdBPF9T8XVhKMRgOT2MHUNGOkkF5buwxq9Y59Bm8NF8g34RleV8dAxmsHV1
         VXIQ8jI79c4J6yhxT8WIfgFZq3CK5/J5DMiMo4WeanjfJFfUimO9kDdcriBQPHUJG05a
         9A5TLbhZHR8x0JF+LESgkzBso8rGqkqGZHb89mekBbz076/iuqRYJPfi77ePOYFohquS
         m99nApqhiUW+xU7xvfMwnGLaKOaPMMObt4hzizzfRKSG68sT7VvAoPJJ+oyTPP1UBc3u
         16heOlnM/wvmhRJzHHVmEPgoC3ylppRi+a7E1H8k6ruBI9C7Rxfwyve1EP2/wuYIGwt7
         y65g==
X-Gm-Message-State: AO0yUKXG2sAGOWLHj19uVNq4SG69T+Eaobr9wALIhin9NaCer4bSu3PV
        hVhSMenPlV7/Wwkor4W15Y+n2Q==
X-Google-Smtp-Source: AK7set9JGY1MR1r8KkizFypTJD/0/NyT4I6S6iUmAHWh1KbkYcTW9e2q5lqjie6NgWNoNsxLvRL8Ng==
X-Received: by 2002:a05:6402:1bcc:b0:499:b672:ee30 with SMTP id ch12-20020a0564021bcc00b00499b672ee30mr3154277edb.11.1675276591697;
        Wed, 01 Feb 2023 10:36:31 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id t13-20020a50d70d000000b00458b41d9460sm10297508edi.92.2023.02.01.10.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:36:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/10] clk: qcom: branch: Add helper functions for setting retain bits
Date:   Wed,  1 Feb 2023 19:36:17 +0100
Message-Id: <20230201183626.351211-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201183626.351211-1-konrad.dybcio@linaro.org>
References: <20230201183626.351211-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Most Qualcomm branch clocks come with a pretty usual set of bits that
can enable memory retention by means of not turning off parts of the
memory logic. Add them to the common header file and introduce helper
functions for setting them instead of using magic writes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v4 -> v5:

- Make the helpers accept clk_branch instead of u64 reg

 drivers/clk/qcom/clk-branch.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 17a58119165e..55b3a2c3afed 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -37,6 +37,32 @@ struct clk_branch {
 	struct clk_regmap clkr;
 };
 
+/* Branch clock common bits for HLOS-owned clocks */
+#define CBCR_FORCE_MEM_CORE_ON		BIT(14)
+#define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
+#define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
+
+static inline void qcom_branch_set_force_mem_core(struct regmap *regmap,
+						  struct clk_branch clk, bool on)
+{
+	regmap_update_bits(regmap, clk.halt_reg, CBCR_FORCE_MEM_CORE_ON,
+			   on ? CBCR_FORCE_MEM_CORE_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_on(struct regmap *regmap,
+						   struct clk_branch clk, bool on)
+{
+	regmap_update_bits(regmap, clk.halt_reg, CBCR_FORCE_MEM_PERIPH_ON,
+			   on ? CBCR_FORCE_MEM_PERIPH_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_off(struct regmap *regmap,
+						    struct clk_branch clk, bool on)
+{
+	regmap_update_bits(regmap, clk.halt_reg, CBCR_FORCE_MEM_PERIPH_OFF,
+			   on ? CBCR_FORCE_MEM_PERIPH_OFF : 0);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
-- 
2.39.1

