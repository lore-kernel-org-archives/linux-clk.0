Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F11C8300C
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 20:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbjFIUTW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 16:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbjFIUTU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 16:19:20 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703031B9
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 13:19:19 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b1a6a8e851so24675711fa.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jun 2023 13:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686341958; x=1688933958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SD+82Kp64qdWpl/p0nHwxIb/l/7wz0DuQnwuSSdR/H4=;
        b=OwO3Auy7crryfX+wyX7S6r2o2fCVI6oNqvTgeY15i1gE0hbXu2gsulroECVxaoo9sC
         niEjxY9zH9dpnsNjX/snxyi0+Xx0iAIWGvFMo2afjLUWEMJickIKFW/Isb47V5Fr3nZ2
         AnlnE+j3LsVcsodRYQiFP6fkLXcRoVZZrfciC4kmFpxJTvppJVjC99o6kLysc3B03yjN
         NCzpLqA443Rd0yy68YOhLLikqYMFAZbgQNPWaUSfWqb6yasOoXvsOZaOIz6DNqTeKOOY
         n7CDZtwp9an9glGdZLrSYwHzsrBxsUEz7f7G6BzJA65o6uLMFGZH1qSHc5BcQ0kU1w7V
         kk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686341958; x=1688933958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD+82Kp64qdWpl/p0nHwxIb/l/7wz0DuQnwuSSdR/H4=;
        b=lqZ75UxWuHaJ4HTHXBPasDkRSoHVXTLr6o56ZIX7KKHJDuQ70IAwaZJdEtCdHU8ZrR
         LWX69jU3fw/O0270YMZL0qR7iic2OvuIIM7sMi2i7Prxp8jaTikd37MfRIbL6mEfpgI6
         0KlL4ySsLb9VKELD+8LWfb/wCxkL3Nn2uOlcMTCaZMz5mBoeK49J8g0x/Dea5Ir3A+B+
         7ThDH+ZdRX1J2EPH+falDuTivjmeTERdBPuz10AEpf7pF6712VbWMAn4ktMpS9/UW2Xv
         6jqchwNqMEbgcbOTyMBLyrbLBvz6kBctONoWu/CCH8sHezt1y7sq9GjwZc3KxVBEsmTc
         YxVg==
X-Gm-Message-State: AC+VfDyRXPnQF4wpwvtBCi4atKYUfPlYQWbSvxyFQIR4du1zY81v80yr
        hVpFRj5hWtU+ZDpY9qti5ogtug==
X-Google-Smtp-Source: ACHHUZ7LdOiaJTmOwHVlsOJ+APt3wnSuCgU+CvvBtV+8zV3h6+LeQH7ffqgZLX0oq9ReZ4lq5Lpfnw==
X-Received: by 2002:ac2:465b:0:b0:4f6:4f9a:706e with SMTP id s27-20020ac2465b000000b004f64f9a706emr1631988lfo.15.1686341957684;
        Fri, 09 Jun 2023 13:19:17 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id b18-20020ac25632000000b004f628eb7884sm641349lff.232.2023.06.09.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:19:17 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 09 Jun 2023 22:19:07 +0200
Subject: [PATCH v2 02/22] soc: qcom: smd-rpm: Use tabs for defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v2-2-e5934b07d813@linaro.org>
References: <20230526-topic-smd_icc-v2-0-e5934b07d813@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v2-0-e5934b07d813@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686341953; l=691;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7uAPa6YDjXHLJZjqpcpTS8PIWFtwDRP9qtCSKC7URyY=;
 b=qa3oHWLAPbUw8lJ/y8dB+VV8T9hoLLxb/r+MlOEOVrT1eiCEXbkhS5tyyyg+RB/JAOUo7Sq47
 AHZelBVy83aBdpxj4Krpw7Lqa7eAIdwks9cxjHyJ4xcZTKF+WAixqxy
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use tabs for defines to make things spaced consistently.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/linux/soc/qcom/smd-rpm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index e468f94fa323..99499e4b080e 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -4,8 +4,8 @@
 
 struct qcom_smd_rpm;
 
-#define QCOM_SMD_RPM_ACTIVE_STATE        0
-#define QCOM_SMD_RPM_SLEEP_STATE         1
+#define QCOM_SMD_RPM_ACTIVE_STATE	0
+#define QCOM_SMD_RPM_SLEEP_STATE	1
 #define QCOM_SMD_RPM_STATE_NUM		2
 
 /*

-- 
2.41.0

