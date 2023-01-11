Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D3CC54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238692AbjAKUF2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239627AbjAKUFD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:05:03 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8951043D92
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:34 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bq39so25246361lfb.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcTrQNFFbWCL7GgAo7RNP0TzY01GvFcQgkQKLT8ew64=;
        b=GvnUTovdSaH2y/t2hZgjAMqhy0bL8GpaM2GmZ7CRWjrVpGkVO7YZGCrV2S0bH5/x4R
         h2YAWuD6xrgAZBG+j+7Dhjb9nmz+YSdRgkUgjApy2zaz+uJJu5Vd0YRm+WIONodwtRpE
         7qMrgDab9BAKeROCPZfv2Ty5Tgic/tLqewdIJDGtBAjxLyuaEi8xa/5Y7b6zL2LoCop7
         SMKRX72A+2bVNNFJgrmaXYXfwtkaDGKFG+zz9tEzs2yb5MrKuvhr0J81OtfESfHz2Gnr
         rA0XSDxGmmWQS+E1+iyIGt4bUMo8Qu7Hjg3+273ahAJfXlfzYff1NWmmz/pGbs8pmAya
         4Z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcTrQNFFbWCL7GgAo7RNP0TzY01GvFcQgkQKLT8ew64=;
        b=lrwh4B8FE9u3dyUX0ZeeU2Ry0wMV/Dx69Qbttg+eJZ9AF6DZMvDdQbCpULgi+GrVWr
         p6xDPfxxC7v51v1yC+nVKzSnM8dzRRuPa5Z2vin+V1RZEtJGU6r2VNuPQWj/4gE0YJ7c
         4OF4Rdahf2sYG/4WKogtx9OMsDu1Nq+PKx7Hk4Yr8a9MJUcoU8tuwKEjDgSODfe2OkIS
         T4Ot0Pd24/h2q3cszU52sTBKwV6HBzjRHJfLN9S296AKQ33pJNlkzLUSQf1tg/uAEIrp
         3xgjo3pyocKq55vIQ7HsKvmzzjdlo1J/0lo6sb6mSg7boIFEayOZGqk42OuMx3XzVmAV
         a3Aw==
X-Gm-Message-State: AFqh2kor2tDhYCRbkrEOF1xgvJ1FnGplvtDR+0KvFay9u6v/t43oV0wV
        rP0/Z/LtoAbnKL2uYfbRnL0FD7jD8iQaOGAT
X-Google-Smtp-Source: AMrXdXu0iCRkiiReh19/Xr0H079pJ0g71zSpaJfuuYIcqiIji5/Tx9DsEseAgyhkwDvwR//d+1WMfA==
X-Received: by 2002:ac2:5df2:0:b0:4aa:7821:8021 with SMTP id z18-20020ac25df2000000b004aa78218021mr24329911lfq.34.1673467293337;
        Wed, 11 Jan 2023 12:01:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:32 -0800 (PST)
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
Subject: [PATCH v2 06/14] clk: qcom: cpu-8996: skip ACD init if the setup is valid
Date:   Wed, 11 Jan 2023 23:01:20 +0300
Message-Id: <20230111200128.2593359-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Check whether L2 registers contain correct values and skip programming
if they are valid. This follows the code present downstream.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 0e0c00d44c6f..7e5246ca7e7f 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -472,10 +472,15 @@ static void __iomem *base;
 static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
 {
 	u64 hwid;
+	u32 val;
 	unsigned long flags;
 
 	spin_lock_irqsave(&qcom_clk_acd_lock, flags);
 
+	val = kryo_l2_get_indirect_reg(L2ACDTD_REG);
+	if (val == 0x00006a11)
+		goto out;
+
 	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
 
 	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
@@ -492,6 +497,7 @@ static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
 		writel(0xf, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
 	}
 
+out:
 	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
 }
 
-- 
2.30.2

