Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC985C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 12:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbiGLM7e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 08:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbiGLM7c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 08:59:32 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB561FCE1
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:31 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id f2so11051155wrr.6
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+V89geLiLXzM5+1YTX4/D4u8ztE0W1UgBm1oX1c/M4=;
        b=Ic87ot/UqTL7gdD2xPXQJ7rG1601hBJJKdtd7twMd+EWAugAw0Y8nHfI8FtjaEZaPj
         a0Cap9gHOCw/lFuLdwlvUZjlLfbZ+wH2kLwHuuqtP4RV7lfMIL0NAV2ZlpxGetQu1Ce0
         BTTQXu8bB5Yyac2KMAkdX27ENJa48Hm3x5gXaYcbIo9Cocisgt3Nnd8vJI1DVzV0fBfU
         sf2BVWAG2zeETSrfSro8WRe3tPqjDrYJsGXu4vD0uPJWqWOWp3ntVFMAB+5YvIBD+Hnk
         8h1KUnVL+1vDg9jiG6UQg54hl3szcjrGMWyLeEQA0N8avqX3dGbx/0rd2G+uUiSGzmPx
         f1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+V89geLiLXzM5+1YTX4/D4u8ztE0W1UgBm1oX1c/M4=;
        b=ow1xiijva99FqXJ04FAiLM5AhlAZoZA1A/cKbNorUfOFEBlurBiXWK6k+TSCI0vroM
         BQjOWTuknQwxcpbB1+YbSjJpMMXtTh+1NNalkbtwOnwKdorSKr6Roflx6afYFHGIQpi4
         UIcZt7p+psCSozkprC5c0Pp0luqnD7rJfk9PKJx4V+5o5nYyAf+GRH0frXd0spIN0Z0N
         UsSw4fw0spUJn2aXoXC2qRi9mG4loBpN65YOJPf5HRvO4DhfEwiFhbL0D2/RvzbaowON
         MhoLS38O2p1K8OoV5wSSuxPodNGUAfs4ZbsG4My5Ixy7rQGn/bG2e1IX110RYS9MLg1X
         NuuA==
X-Gm-Message-State: AJIora/fRjdMh4QIkKSWesmUCorxep6ATHHn27c8sH9R+8DrSFbhpPLI
        F8kbiuxDfYfYmSfI3gYvzhLGKA==
X-Google-Smtp-Source: AGRyM1vgT8JeJj7PH7ZsY80tk5QjJT0bNzi4XS3L43fl5eeObVK0xDsORjtbC+yu1OHT6P7DpHJZhA==
X-Received: by 2002:a05:6000:1567:b0:21d:abdb:29e1 with SMTP id 7-20020a056000156700b0021dabdb29e1mr7452177wrz.36.1657630769671;
        Tue, 12 Jul 2022 05:59:29 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:29 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 5/6] clk: qcom: gcc-msm8939: Add missing MDSS MDP clock frequencies
Date:   Tue, 12 Jul 2022 13:59:21 +0100
Message-Id: <20220712125922.3461675-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Again the msm8936/msm8939 supports a wider range of operating frequencies
to the antecedent msm8916 from which the msm8939.c driver is derived.

static struct clk_freq_tbl ftbl_gcc_mdss_mdp_clk[] = {
        F(  50000000,      gpll0_out_aux,  16,    0,    0),
        F(  80000000,      gpll0_out_aux,  10,    0,    0),
        F( 100000000,      gpll0_out_aux,   8,    0,    0),
        F( 145500000,      gpll0_out_aux,  5.5,   0,    0),
        F( 153600000,      gpll1_out_main,      4,      0,      0),
        F( 160000000,      gpll0_out_aux,   5,    0,    0),
        F( 177780000,      gpll0_out_aux, 4.5,    0,    0),
        F( 200000000,      gpll0_out_aux,   4,    0,    0),
        F( 266670000,      gpll0_out_aux,   3,    0,    0),
        F( 307200000,      gpll1_out_main,      2,      0,      0),
        F( 366670000,      gpll3_out_aux,   3,        0,    0),
        F_END
};

We are missing 145.5 MHz and 153.6 MHz.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 6b265b68524f2..7f71491d52c4b 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1294,6 +1294,8 @@ static const struct freq_tbl ftbl_gcc_mdss_mdp_clk[] = {
 	F(50000000, P_GPLL0_AUX, 16, 0, 0),
 	F(80000000, P_GPLL0_AUX, 10, 0, 0),
 	F(100000000, P_GPLL0_AUX, 8, 0, 0),
+	F(145500000, P_GPLL0_AUX, 5.5, 0, 0),
+	F(153600000, P_GPLL0, 4, 0, 0),
 	F(160000000, P_GPLL0_AUX, 5, 0, 0),
 	F(177780000, P_GPLL0_AUX, 4.5, 0, 0),
 	F(200000000, P_GPLL0_AUX, 4, 0, 0),
-- 
2.36.1

