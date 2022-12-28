Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99FCC3DA7A
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbiL1Swr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbiL1Swo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:44 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC5014D33
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:43 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id x37so10406835ljq.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRV0cBSMOk6ezUoovi34JcMJADM3mKVE6I4nfLkmye0=;
        b=DoAzLdgLNokGuQx7nwDRWrbaKG387ksnTCGckuAkN0SV+Z1VD9+W08ayH4Da9S9bq/
         c5b8Sijx+VK5DQLSLM9gRh+ObCUWfsOB3KCYpOFqdq4mW8xwQCaQ9Q/qe7OaNaKEOTdJ
         y8eKeYZQvvg0QPqnLCILH42U/Z21HsKuxSgGPYuAEMs2GgctO4NgvLtOoUZHFGwg9A68
         hMIBAiKncFYMN6yx89iT/EKUL+MLXbOtMR1lFQE3S+fAiZ5iShhNQNaeaVQtTH0+7Vui
         W4TFyYGRqQNonJJykPzY2IslD+zQ+k1/sYOswI/VBAOqRjZZirX8So3aA6/7v0jJCrSX
         92Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRV0cBSMOk6ezUoovi34JcMJADM3mKVE6I4nfLkmye0=;
        b=jT5yHCu+MGwionycS7MuXUZERgH/ARVD4TBe38vzUSDL5K088QRrRut56/AhQNkjLw
         BO1GTxFzI5trEnE22S28tm5u6V+DPkW1XASbmR37IQjrvdHXMQzwqOt5KiFPhO9u6Fsd
         JMjPS2Mx/ZrwVXQiGYkweiWcNjf/xGN66IOLG6uJJHve49tY9Jgvp1pUQJ/p7T7HmdtX
         fYuu88QAYzEUQdN5MPUYeIWrNfFCJM6EnLu9oky3S1VYWN45AXfgk4an3siUtZqChPyh
         24+tgXuU0wLXYypCWdtG1BLQkdb9N74EBK44WLZggIN+43Ao2uKY6ijLuryPW3CiD9gR
         fs9Q==
X-Gm-Message-State: AFqh2kqRXNmz4fX97hHMYjrU+zEyi0tlf9gSteHVny3JViKwRs8Z8+qB
        OaAOsWbJQD8Ur7AeZAkruzPCww==
X-Google-Smtp-Source: AMrXdXuVj5Q132g/sdP+a+iwNrSRTPv1A/0QhI9POTWd6iin7ELnIxxRwYfdFwEBupMmF+L8Q0AmTw==
X-Received: by 2002:a2e:bcc7:0:b0:27e:34cf:17b1 with SMTP id z7-20020a2ebcc7000000b0027e34cf17b1mr7342606ljp.29.1672253561488;
        Wed, 28 Dec 2022 10:52:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:40 -0800 (PST)
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
Subject: [PATCH v2 03/16] dt-bindings: clock: qcom,gcc-sdx65: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 20:52:24 +0200
Message-Id: <20221228185237.3111988-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml         | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
index ba62baab916c..523e18d7f150 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
@@ -26,8 +26,6 @@ properties:
       - description: Sleep clock source
       - description: PCIE Pipe clock source
       - description: USB3 phy wrapper pipe clock source
-      - description: PLL test clock source (Optional clock)
-    minItems: 5
 
   clock-names:
     items:
@@ -36,8 +34,6 @@ properties:
       - const: sleep_clk
       - const: pcie_pipe_clk
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
-      - const: core_bi_pll_test_se # Optional clock
-    minItems: 5
 
 required:
   - compatible
@@ -56,9 +52,9 @@ examples:
       compatible = "qcom,gcc-sdx65";
       reg = <0x100000 0x1f7400>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
-               <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>, <&pll_test_clk>;
+               <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
-                    "pcie_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe_clk", "core_bi_pll_test_se";
+                    "pcie_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.39.0

