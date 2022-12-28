Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E22CC63797
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbiL1NdA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbiL1Ncw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:32:52 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2595FAF1
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id y25so23637161lfa.9
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnLG6ctkWmWWmxyjHcMbEzhfightxs9Tnr6vaHqsfeM=;
        b=sx4Qt0XjUvJrHqSdoE5EJ2a4qmjChPd9KodwtOFUXTS16j3EuuEkak6wAq/ltLDBSs
         Jr9jKvj99yIsnBg56DihPXJbLSqMCcjApxJYpoCzPld/qOoNe4lqh6NH+oX12eZbtWSg
         /bpqTElfT1+NS/sPeRKXuD91bQ2ZYtBvDpDA+cOjqjvlOKqF3KsHIDCsbqW6BM54cN28
         CB8bFE1dSyw7DHZo2Er2syyBLt+8PL+sqNaWzIL3iXy1r054jDwBVmH21cEVewyiu5WH
         Obsp1p2mCYve8t6kDObQjwdmAtoU+l1TpOQN8Jo2LQ7lrIqOAL//wAuuQNegYGVbVauT
         Z+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnLG6ctkWmWWmxyjHcMbEzhfightxs9Tnr6vaHqsfeM=;
        b=tXRvp9w609vI+hFcPtd5mcZMOH/5jAaSId00hiHF5Jcdr4WxN4bfi0ejRhWr31qxGE
         pUItzSQcZ7yiL0TvUoz7muv/i4n84h12hZgVuXrTHruU6gZZ3orbOj6XErSPu9a2MuEf
         hzuryuNx12RclfpuFMXjEfNU5pOL9mj8/VMYCXkcjdSR+Cti9qWm6GxP9ynSa7BO6N3E
         jIujwcevgE5OhfxxZHrtTUHRT5sPcMC49eDg8ZNP4SZp9nIqTU/ssFa17XZYPaveFJju
         VP2f5sDebb63D7QHofIVtmgEV4C3U46N6sijdRi7L3KQyGNb4zOUHZOZqqk8NrYCGNlr
         Ua5w==
X-Gm-Message-State: AFqh2kofoUkdlFwlzDHDj68xKrkBNtJUdpXCvGdnbSk8kQaC2ylt0+Yu
        +3CYYT9WNNHw0IvWkxGb0R7x6Q==
X-Google-Smtp-Source: AMrXdXu8F/nWim33VJENvAjGRMoQMzPIdjwysn4tyFOUROjLrtbV3zD6Jku7eQZtS8P+gvwjeVoBWw==
X-Received: by 2002:a19:7513:0:b0:4b0:38f1:1266 with SMTP id y19-20020a197513000000b004b038f11266mr9407241lfe.34.1672234371233;
        Wed, 28 Dec 2022 05:32:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:50 -0800 (PST)
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
Subject: [PATCH 07/16] dt-bindings: clock: qcom: gcc-sm8450: drop test clock
Date:   Wed, 28 Dec 2022 15:32:34 +0200
Message-Id: <20221228133243.3052132-8-dmitry.baryshkov@linaro.org>
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
 include/dt-bindings/clock/qcom,gcc-sm8450.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sm8450.h b/include/dt-bindings/clock/qcom,gcc-sm8450.h
index cf1469312c4c..9679410843a0 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8450.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8450.h
@@ -8,7 +8,6 @@
 #define _DT_BINDINGS_CLK_QCOM_GCC_SM8450_H
 
 /* GCC HW clocks */
-#define CORE_BI_PLL_TEST_SE					0
 #define PCIE_0_PIPE_CLK						1
 #define PCIE_1_PHY_AUX_CLK					2
 #define PCIE_1_PIPE_CLK						3
-- 
2.35.1

