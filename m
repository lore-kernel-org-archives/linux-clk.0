Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0641C7EE2E
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 10:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbjEPKwx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 06:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjEPKww (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 06:52:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8641C173D
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 03:52:50 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9659443fb56so2190413266b.2
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684234369; x=1686826369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hF51UpgXYYq6zOrvaemkFFkj4jV0bZfFI3phEQ7J+70=;
        b=KcpQ7OOlvZ3QBwGOV4qt4YegK0tdde4lYGzpKBgCHp8hVukZ0J2v+/KQXEG4SjfVq0
         8HGZe+cxJGmmw7qzuD1aJvPb6eg5rgiAU4NzNplf3AgudGxUIOiOF9pvO6Dgv8UkyM9p
         y1LsG/0S0a72DNAfcrD6dQZsNPRL2cOknmvGdNPRZv2h4ebdOj7VarABTAbGyxX2qzsl
         KpVu1wWk5ImS1yx/KCmRBLF0WXEVd/VGuqMhgxcMu7qzcoO+FQJ410AV30xT67wQ96BS
         MT9K99VSuer1ygp5x1bIMeEpQMg9B9EQPm/XH/7MVTx9JRMj1Q99TGC4DrmlOkeICF3v
         Pkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684234369; x=1686826369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hF51UpgXYYq6zOrvaemkFFkj4jV0bZfFI3phEQ7J+70=;
        b=Qdmqzj2tohknogZwlqCoMVQE3g+BGiaXMtkLJcrpt4qYhdrSpiTWf9U6iB/mkpOiEA
         4IQNeA0cwg0XJdy73Ycmz4lLT9Jr3Gr1AQc9lhUmHP6LLASF4A8QCcNdGtqGUzalWGrG
         ALGiVPzBx39JLFHcEJGtmX+pZFby2w7k/ldO+Vhj+h7Pc8pKgoV3xNniMEvrZhfUvDqm
         0M+sp55ASavNtsTyhutO9Vgo3sr0Le5xJhn4x/TDJ1Ie6YN04p42D38xTuJLJoTbPhLO
         zAQ8QKC3r/pd+tkoFh9sjjfuP9NMjTfWqKfH/RvmlifL7osA0b+atZ9f294U5tCGsd4+
         KeCA==
X-Gm-Message-State: AC+VfDzmqJJSP6pmtU2KMwyhXSu8FLgsRg9kmuYpZfda2tz6mDBnX8PX
        mp62nnaKwSYrtWhJnNfMnC5CCQ==
X-Google-Smtp-Source: ACHHUZ52EQ6KF6tJIdMYLES2qCnQbPEYBFEgWdMCmPqFzcahNpu23hDoTCwtUoRRZYFqZPCciw9ExA==
X-Received: by 2002:a17:906:ef0d:b0:94e:ed5d:c864 with SMTP id f13-20020a170906ef0d00b0094eed5dc864mr36254964ejs.19.1684234368991;
        Tue, 16 May 2023 03:52:48 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067a0100b0096b0e93193asm3679019ejo.90.2023.05.16.03.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 03:52:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: clock: qcom,gcc-sc7280: document CX power domain
Date:   Tue, 16 May 2023 12:52:41 +0200
Message-Id: <20230516105241.30091-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516105241.30091-1-krzysztof.kozlowski@linaro.org>
References: <20230516105241.30091-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GCC clock controller needs CX power domain, at least according to
DTS:

  sc7280-herobrine-crd-pro.dtb: clock-controller@100000: Unevaluated properties are not allowed ('power-domains' was unexpected)

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tags
---
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
index 947b47168cec..ff0b18bbb0fc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
@@ -43,6 +43,10 @@ properties:
       - const: ufs_phy_tx_symbol_0_clk
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
@@ -56,6 +60,8 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
     clock-controller@100000 {
       compatible = "qcom,gcc-sc7280";
       reg = <0x00100000 0x1f0000>;
@@ -71,6 +77,7 @@ examples:
                      "pcie_1_pipe_clk", "ufs_phy_rx_symbol_0_clk",
                      "ufs_phy_rx_symbol_1_clk", "ufs_phy_tx_symbol_0_clk",
                      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+      power-domains = <&rpmhpd SC7280_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.34.1

