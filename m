Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A73C38142
	for <linux-clk@archiver.kernel.org>; Wed,  1 Feb 2023 18:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbjBAShV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Feb 2023 13:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbjBAShU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 13:37:20 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA85A7F68A
        for <linux-clk@vger.kernel.org>; Wed,  1 Feb 2023 10:36:44 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id hx15so34574787ejc.11
        for <linux-clk@vger.kernel.org>; Wed, 01 Feb 2023 10:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXCf2QEFiI/UaJA4L2hQetVotYkWuOmRjSs3LoUx6JE=;
        b=zY3iUDbikuUlCz2+bgIMc1ycTaMuwKI7PI5fZbAZjudVlEaR22XjCYMTGA+E7hjC8v
         O2SBgPtUivnoFg+nNhUMG3sI5EXNtDFpTZsnjwjvkH2BGzGTJvroZ6qmsH6a11/CFGfE
         zPPDU3wG1ScTF+1bUTIZfmH50LFTac7ZDHWttc0UcFJMWfBnBc7GJzrsAMueNSBJTO1h
         Eh0cpDG5s+WKaIh8wgeZopJPtOdJgyKqrVqtTgX6pmK48UwHP9XEUe0DyZ8DQmli8LCM
         Cs8Srlr2GxcP2yRcSl7TUHkm92dcJ8Y4tvGRnpadxRQ9tHVZjFaJGbtSfZyiwyA1ABXB
         IzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXCf2QEFiI/UaJA4L2hQetVotYkWuOmRjSs3LoUx6JE=;
        b=DDTF0c3lv1OSFVGLFFwJ5wHUKB0Ik6uACvDbIkB5MJvWOIlIE6ONyvcZ/z926Znufk
         N4zLeMRJqnEtLqCy9bpC1KlfFAyEf/+TucSugSAGLLkvbA75eObXwj6B0Dd4hccydEEr
         +H1Ja1z180PeDFO7wicbJIB9vCGWGW1p1NQgzXIxvheePWo1L3h3v3bytg3KKYmUFI4Y
         CF2h8WwgH7tt8YukDIPq9QdQToNJ2GiEmOvf28eEcMXFOAm5zxrchrkEBsXCWCHJ1Ufb
         I7cPtA2VbwH2B/EPl8h6wNiDf+RLt/ObwbdybXgFgDdjCPHrg9sF35E5PbgcSv34TJTl
         9rIQ==
X-Gm-Message-State: AO0yUKXp51gx13ds5FJqn3j4siOgBkKJQ9Pncf+gjoL/qURGVxedp/Pv
        QZ91Kv3lrYFRQmRUBWWaefo5ng==
X-Google-Smtp-Source: AK7set+g6R5KH1B7A2ADa+1nbxa2R1ZUk0Ft5BfSO+EbNOnhLHDwVWt+kv+lCXDycCX4VUslNcPeAg==
X-Received: by 2002:a17:906:49da:b0:88a:8e57:f063 with SMTP id w26-20020a17090649da00b0088a8e57f063mr3433423ejv.62.1675276596833;
        Wed, 01 Feb 2023 10:36:36 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id t13-20020a50d70d000000b00458b41d9460sm10297508edi.92.2023.02.01.10.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:36:36 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/10] clk: qcom: branch: Clean up branch enable registers
Date:   Wed,  1 Feb 2023 19:36:20 +0100
Message-Id: <20230201183626.351211-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201183626.351211-1-konrad.dybcio@linaro.org>
References: <20230201183626.351211-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Prefix the "branch enable" registers with CBCR_ to be closer to what
they are actually called in Qualcomm terms, use GENMASK instead of
shifting values around and adjust their usage accordingly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v4 -> v5:

- New patch

 drivers/clk/qcom/clk-branch.c | 10 +++++-----
 drivers/clk/qcom/clk-branch.h |  7 +++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index f2b577b07b7e..ca896ebf7e1b 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -44,17 +44,17 @@ static bool clk_branch2_check_halt(const struct clk_branch *br, bool enabling)
 	u32 val;
 	u32 mask;
 
-	mask = BRANCH_NOC_FSM_STATUS_MASK << BRANCH_NOC_FSM_STATUS_SHIFT;
-	mask |= BRANCH_CLK_OFF;
+	mask = CBCR_NOC_FSM_STATUS;
+	mask |= CBCR_CLK_OFF;
 
 	regmap_read(br->clkr.regmap, br->halt_reg, &val);
 
 	if (enabling) {
 		val &= mask;
-		return (val & BRANCH_CLK_OFF) == 0 ||
-			val == BRANCH_NOC_FSM_STATUS_ON;
+		return (val & CBCR_CLK_OFF) == 0 ||
+			FIELD_GET(CBCR_NOC_FSM_STATUS, val) == FSM_STATUS_ON;
 	} else {
-		return val & BRANCH_CLK_OFF;
+		return val & CBCR_CLK_OFF;
 	}
 }
 
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index cff9ed6653b8..43cd41947ef5 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -38,10 +38,9 @@ struct clk_branch {
 };
 
 /* Branch clock common bits for HLOS-owned clocks */
-#define BRANCH_CLK_OFF			BIT(31)
-#define BRANCH_NOC_FSM_STATUS_SHIFT	28
-#define BRANCH_NOC_FSM_STATUS_MASK	0x7
-#define BRANCH_NOC_FSM_STATUS_ON	(0x2 << BRANCH_NOC_FSM_STATUS_SHIFT)
+#define CBCR_CLK_OFF			BIT(31)
+#define CBCR_NOC_FSM_STATUS		GENMASK(30, 28)
+ #define FSM_STATUS_ON			BIT(1)
 #define CBCR_FORCE_MEM_CORE_ON		BIT(14)
 #define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
-- 
2.39.1

