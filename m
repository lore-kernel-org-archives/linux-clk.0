Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7550EC678D5
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235423AbjAKUFq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239461AbjAKUFJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:05:09 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAD243E7B
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:37 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m6so25185616lfj.11
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AhipNdUlWN9AbhRoLOzZ2NK2gpWaDz53TgzowVTocw=;
        b=vVseMsNl/fnycuWjL+GkVuuHrIfpklbvsArrvX7DjP/oV2lVGHV0Gpr+zUy711Rphh
         UNw3tdBrB8DHf9DfTFh/fqBQjCPVkhdYSCYaK1OQJL1aXdk57sYsEqlT2fhNPvW3K+F8
         huxAhYYBxDpSFXGvvO5IzeQ02kNk7IoQuWKXrYJb6T37Ih+FTWBp4jsKq+oRA/GnPLEB
         tPd+ieFYRiKzfskyf+pUB0QCghSjPFskJjqric4iN22TmVuBsxvd2z63wPi5wzlw0c3I
         0idkMzSxEkYJmoZI8zqn/kzoUMwBcJVSVgeLyldKsJvcsrpK8ayoSZ/5C9dQCqQ5uFhP
         fang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AhipNdUlWN9AbhRoLOzZ2NK2gpWaDz53TgzowVTocw=;
        b=h4BnzjfPL4Tdg8+NlOBeltHGij3yEsa+HMqpqWmm1hNOvugDv18qYB/MnqLjwvwbbq
         b1hzIu8WmGNo0y9KNf+HgoogXg2Dzn0XNKLqR0+jNLA6l02hqREP9B4PuAzCgeQylneK
         wGrWk8gFFfALUMpYXay0n2+KPKC0xIay2P7JxNZHw/HnkLlh4KixfjIqQEatcNGb+LFW
         eYezrVMnRndY4kqLGt0ifyawZEeDmx3eVg6lbvNJzI9azaADr2FK82SiG7u3+FXLUPvM
         ej9AH4s90wx0ddZcO4BPnjEnbzGz6K9/8csJemHQg4JLJnKw6Dk0XZz8viMKfxxKutyi
         vhsQ==
X-Gm-Message-State: AFqh2kp+W1kcAZyjDuI4nhN7NzD1QN65xXxuBcHtQe3lqS9+diUzhDZf
        ArElqUB+KJBTgHgA4w39cfFkJQ==
X-Google-Smtp-Source: AMrXdXscBDLfjBm9UEO5cdhWcddQ6TVaLenXKaOBbu6Tjk733VqD9MXSYFTZ1bN6GFuyajzraCbPQg==
X-Received: by 2002:a05:6512:2805:b0:4b7:1cc:ed56 with SMTP id cf5-20020a056512280500b004b701cced56mr3285439lfb.35.1673467296630;
        Wed, 11 Jan 2023 12:01:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:36 -0800 (PST)
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
Subject: [PATCH v2 11/14] clk: qcom: cpu-8996: fix ACD initialization
Date:   Wed, 11 Jan 2023 23:01:25 +0300
Message-Id: <20230111200128.2593359-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The vendor kernel applies different order while programming SSSCTL and
L2ACDCR registers on power and performance clusters. However it was
demonstrated that doing this upstream results in the board reset. Make
both clusters use the same sequence, which fixes the reset.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 47c58bb5f21a..1c00eb629b61 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -475,9 +475,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	return ret;
 }
 
-#define CPU_AFINITY_MASK 0xFFF
-#define PWRCL_CPU_REG_MASK 0x3
-#define PERFCL_CPU_REG_MASK 0x103
+#define CPU_CLUSTER_AFFINITY_MASK 0xf00
+#define PWRCL_AFFINITY_MASK 0x000
+#define PERFCL_AFFINITY_MASK 0x100
 
 #define L2ACDCR_REG 0x580ULL
 #define L2ACDTD_REG 0x581ULL
@@ -498,21 +498,17 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
 	if (val == 0x00006a11)
 		goto out;
 
-	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
-
 	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
 	kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000e0f0f);
 	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
 
-	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
-		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
-		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
-	}
+	kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
 
-	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
-		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
+	hwid = read_cpuid_mpidr();
+	if ((hwid & CPU_CLUSTER_AFFINITY_MASK) == PWRCL_AFFINITY_MASK)
+		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
+	else
 		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
-	}
 
 out:
 	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
-- 
2.30.2

