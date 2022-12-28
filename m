Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A7EC61DB3
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbiL1NdA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbiL1Ncw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:32:52 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8715F5A7
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:51 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y25so23637119lfa.9
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9geNYllAFv/EDrrrYZhMPV0udfvXOAUMaZPXHOy8Y8=;
        b=d2NtHDjcKltV4Etqm3awnf8GCdJCroJbHpudoeaHKTQoi5vIBKNxzB4ZgmxmOeI19Q
         RzZ1LyGFiiIbLFTT6sEYaza4+vx+VAPCGQKvZ98xQIKj6cV3BKAb9UHs5f6lqW3JwURD
         mnNhCuD3FancjpJofSPHJIv95G15r23V2jk5lZYNGkw+mi2ZONW3n3EF8U0g/wv8PQFS
         ngEN5jwl1fI5rj5OzSFB+Q7RoyRm6cOqv+lU94M+hFfRIRr9XwXN+JU7GU3cM+VtQsOt
         pogLyrSZtd/FmkTG2nlLzFuIc0dpeo0SkZ1KPk42wK6o7IQMOgZjt3NbCiI8IaDDqFDn
         O4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9geNYllAFv/EDrrrYZhMPV0udfvXOAUMaZPXHOy8Y8=;
        b=sHD+hIUCaS0/GPe4JsIPFklkTOrU7uMV7euP7KazUyjYdRJYh/AdQJ5woJuw5EK+eO
         jlUGL5wjc37T2s2G3Jlm8WgwMbnrbLU0MI1C4gw4UtDXm1Qoa0MOlhBXDZLPVtWul6wd
         xQxWqcixuOTmQCyHNVZY/uPEioT/5PM2R1uhMHFv1noBp4+LeMgNGHm87zRP8yLFF5FQ
         wIENQAe8aonnEnG32noPEYzG7l5iUvA3aAI/weMIFb+uSu6E2oW16b2xCY3+BlpdwJEH
         DDCj2xcbbpsiRqkdA/WT7FG2s9qcr85DOGt3cgPDzQaWd1mxI08fUqDjyUe3auSYnjoP
         vDHA==
X-Gm-Message-State: AFqh2kqoZnsSCMt2q6MFIG1MYtMnMoG7jxFleq34KHEvkLOhJatefCvS
        tsDKdqBgwQZIzM+CUgQ74SOedA==
X-Google-Smtp-Source: AMrXdXvBn9fle1O57vI9H4eLfrUil8jj8nnXZImnHUpW9eQnaR9IbC2kzCdUuVPHcYA2Zj+1QgHBtg==
X-Received: by 2002:a05:6512:2506:b0:4a7:7d62:2808 with SMTP id be6-20020a056512250600b004a77d622808mr7327571lfb.27.1672234370278;
        Wed, 28 Dec 2022 05:32:50 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:49 -0800 (PST)
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
Subject: [PATCH 06/16] dt-bindings: clock: qcom: gcc-sm8350: drop test clock
Date:   Wed, 28 Dec 2022 15:32:33 +0200
Message-Id: <20221228133243.3052132-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sm8350.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
index f6be3da5f781..529c1b8b0417 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8350.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
@@ -8,7 +8,6 @@
 #define _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
 
 /* GCC HW clocks */
-#define CORE_BI_PLL_TEST_SE					0
 #define PCIE_0_PIPE_CLK						1
 #define PCIE_1_PIPE_CLK						2
 #define UFS_CARD_RX_SYMBOL_0_CLK				3
-- 
2.35.1

