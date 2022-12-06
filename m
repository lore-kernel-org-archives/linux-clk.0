Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B186AC63708
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 22:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiLFWpZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 17:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiLFWpX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 17:45:23 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011973E081
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 14:45:22 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id bj12so9822638ejb.13
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 14:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=km3sc4WNJHj66j5ElBLj6gCEbFo3eGIHA8T8y3GC0hSe4ObdQIKin1e7rmMNNmMwrl
         DORT7+YpXsTjcOk2cn2BGWdRpCVG4Iyumpjt1nNEMl7j/gHi6fXdeu6pP8gIb7KOxFW3
         40wS2R3F8/dakst5nRXTpxTLM33grVYz0sJaenbubOjlf20Gtkl8RNMOnqJTm7GXh+ZF
         lhBon/lyPd+ToD2e7FsW00d/dFKpDkGdw/HBMgRIf2lr4CgEm6j4p5vweNzKmLWBY19q
         14h+DlPMwAive9J4aOCnhQa5sj6NeuQ+pPL9te9ONRBWZpircLclEmkZaga237uLOlnY
         +TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=N93lFU8tE1PLm5iYsO6uGC/iEbxKBtSdPharPI8HuFVZgQ0bSRvWaTlqr15gKtck2w
         9fM10UZVBXSEiM92VsRr0dXsDPh4L/Z7MkLDIAU6Z5hspoLs7Lqvwi4hUgn/ZUkI/t8N
         l51D4u7DroMEmB4REM84sdlP8a6YhqdwKd9vhCBqmk93lKjUkHO7Fbo/4wMUSi/ordNm
         xpr3QEd7p+NGxTEVVc2ri28yVmiaD8/UdnpTrRechZiTILQkg1Hd9ZDuR1NXlUbIgAeE
         VjZWLOEk7l2WLWUCBMCDNplcc9XAHlbXTKAsCxXxb+hmfAaSEPDMuA6kjzQZYWpJFCtE
         J31Q==
X-Gm-Message-State: ANoB5pkxCzqRCgngewDV1Aoa9Bf4Vm7i2Ly20PTmgJ/1wWtikMWEDKge
        4HmizA+cRmeBdVtMNtglSka+lw==
X-Google-Smtp-Source: AA0mqf4mhucr8q5TNMbO4UMt96Y5U7B38CIRZFcZoeKoYmM4xcvKhMHJL1+5vX7dRKNkeEuBI0U0RQ==
X-Received: by 2002:a17:906:3a41:b0:78d:9caa:31b7 with SMTP id a1-20020a1709063a4100b0078d9caa31b7mr62814250ejf.263.1670366721498;
        Tue, 06 Dec 2022 14:45:21 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709061bb100b007c0985aa6b0sm7820772ejg.191.2022.12.06.14.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:45:21 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/5] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Wed,  7 Dec 2022 00:45:11 +0200
Message-Id: <20221206224515.1495457-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206224515.1495457-1-abel.vesa@linaro.org>
References: <20221206224515.1495457-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SM8550 has a new fixed divider as child clock of CXO
called CXO_PAD, so add IDs for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/qcom,rpmh.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..f3e0288420ce 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_CXO_PAD_CLK			27
+#define RPMH_CXO_PAD_CLK_A			28
 
 #endif
-- 
2.34.1

