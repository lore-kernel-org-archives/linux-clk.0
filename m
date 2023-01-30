Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82649C61DA4
	for <linux-clk@archiver.kernel.org>; Mon, 30 Jan 2023 15:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237359AbjA3PdM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236704AbjA3PdI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 10:33:08 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E2D3CE1F
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 07:33:07 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id m2so32372911ejb.8
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 07:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZ+Opwm6jcHi17rVDvjxU6dDxEIV55VJ/74LTubqrB0=;
        b=IIsKysQyfCEF6p8MD7eRzgo1qyjPHfvIoZIZD20jvXGEqHunHJgD+iefDncyUoDLDL
         Xilf0NPG2xYwQB/LMJpet6CBbmQISUxlLxsn+3BfC0t6WSQfEkh/iZkI/MU2tE2DsyDS
         g/fuiM6QIAJ8nlCWWSvWAuwaNj/vByor50sU6f82ewwupm7rBmLUBroQ7nARX9NRpYA8
         gos/iWhl2ZzEv8ET7VXpXkF7FWgGdMe7trjQl7Wb6XwbeaqPeHjfiNlIUfvz1+2VoikS
         maGu+P0ccozlCBOGjbnHKwhgkp5DQ+VBx6Hska4gzUywJczogaAU3HykW79KCrqBFUPg
         7pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ+Opwm6jcHi17rVDvjxU6dDxEIV55VJ/74LTubqrB0=;
        b=1mrhf46WpCp7CdOASQbA6J7P92QuLpnS3OP7oVWfbPaQQUFC40zPejZfybNTPoFBr5
         3yXJMCBYBZtzwMUspoOyiFloLLTblrJRsGkuc63HcN2A8ShItT3mOMo3S8m0asaLttVA
         iqBGPnn3w/UDVtr+W3C/acxauH+4X3rs1e1Ol5G0lTM9K2GBS8t9DDN5w0t6MMMQOQLE
         oP2uv14BeE/5dNXUokIPI9x6q6GPAkQzh+F6hQjiz73Gd7ff/mH/SdZF6fSypy6B7GTM
         w9y9EnPRBUQ9EkjhgCirjUQ4Za6d2BnyJ78UhYRo2TGsagKxO7EKpkhtXACBhdUPKY5+
         iXGA==
X-Gm-Message-State: AFqh2kr1+PGBQdJDcRJDPUbOuKv6igEccuclNZfuQnBLi3oLQyEW9o9U
        4VSmse6zQeOdPP414D5imBuVng==
X-Google-Smtp-Source: AMrXdXv27LWMAuhyic7dKtXBukIAkn9o3CCikAJH885uC/dOHah7SGrpccYqvG3LkXJne3LMQ0LrFA==
X-Received: by 2002:a17:906:a058:b0:84d:4e9b:ace5 with SMTP id bg24-20020a170906a05800b0084d4e9bace5mr48508058ejb.67.1675092785563;
        Mon, 30 Jan 2023 07:33:05 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906054700b00878769f1e6bsm6805773eja.55.2023.01.30.07.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:33:05 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] clk: qcom: branch: Add helper functions for setting retain bits
Date:   Mon, 30 Jan 2023 16:32:45 +0100
Message-Id: <20230130153252.2310882-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
References: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
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
v2 -> v3:

- New patch

 drivers/clk/qcom/clk-branch.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 17a58119165e..d8fc7b93ef6d 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -37,6 +37,29 @@ struct clk_branch {
 	struct clk_regmap clkr;
 };
 
+/* Branch clock common bits for HLOS-owned clocks */
+#define CBCR_FORCE_MEM_CORE_ON		BIT(14)
+#define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
+#define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
+
+static inline void qcom_branch_set_force_mem_core(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_CORE_ON,
+			   on ? CBCR_FORCE_MEM_CORE_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_on(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_PERIPH_ON,
+			   on ? CBCR_FORCE_MEM_PERIPH_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_off(struct regmap *regmap, u32 reg, bool on)
+{
+	regmap_update_bits(regmap, reg, CBCR_FORCE_MEM_PERIPH_OFF,
+			   on ? CBCR_FORCE_MEM_PERIPH_OFF : 0);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
-- 
2.39.1

