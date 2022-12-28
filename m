Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F9CC4708E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbiL1Swo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbiL1Swm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:42 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5762715F08
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:41 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id s22so17286126ljp.5
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7w7cv/rycyo9tLFe/RTS7bl/f0qnn9z8JqftMfFPoY=;
        b=ssJAGw3OGc/uwlSkDVVP4yWViHQTldQNeYfRekBqa/1vZMnJv3z+RlYqThGQ+UVt4V
         EEh5uQVUas2tD6OWXyUraEV6wWwHM0dd692wcmnZp/L0RA7kvhyegxMXH37PM9ZzD5PN
         hdzGHov/Atbis8wGVbBWiqTziqZK6rwSHgvh8yPyne8UM3Iq08TssxjWRgOEDO+coiw6
         AJbkLnEzRvYabNZa/ZoSPkNEhVmEDfKqH8beATj9aF5/yqiJUipqFacUvl+dFFBw9yW6
         /fEYjz70P/WkLQrZuvJ8WvftckIGUWNr2stBth0DDku3N2QGHLTtieBOI/hAlChknPKL
         /1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7w7cv/rycyo9tLFe/RTS7bl/f0qnn9z8JqftMfFPoY=;
        b=3H+QJ68nECfCCy3WIgJtNy67XzBbsxTrRz3e8ekzrVRM+mmxpC9PvpmG/LpWQIsw1N
         yh6+ymnC/j/k/rNVbXdgd9dY0Pi6pgPcRYCkFpp324aQsnM/yYs0PqCNzxHrmE+3g+v9
         VAKx3J54uhfeOHpbfOw8TD0jtS88kyzzjW7u9fJfm8tiY7u0ZF/S85/5UF9fBZ3VzMBT
         VdEJB9lQrJABzWH5Zt4tZEhVwFBtEZAV3ZGBkV5CdAUtC37ZP5HlMBwdN63uZUiUkKOH
         Ufp4a+NoH36DTR2L6l6AkJ+/NJhxoFRLclg6EbPjh6WRdFwFg72H1iFNlZoEmjFiRn1A
         JaZw==
X-Gm-Message-State: AFqh2ko4ft9raUO6Sxai78qg3e9lFKbYSgp7qV1Sq5cWXSU6oA7imz8y
        vsqwgpOZiC/py04aGm5OhgAWVQ==
X-Google-Smtp-Source: AMrXdXsvzpwi/FuIhQ/1rnNN/ZuJ3dor/p/CpUsrlcpRii6ruHP0KtMLETkIXyjttXQuskBYoSTycw==
X-Received: by 2002:a2e:b553:0:b0:279:ee82:e0f4 with SMTP id a19-20020a2eb553000000b00279ee82e0f4mr5748918ljn.32.1672253559704;
        Wed, 28 Dec 2022 10:52:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:39 -0800 (PST)
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
Subject: [PATCH v2 01/16] dt-bindings: clock: qcom,gcc-msm8998: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 20:52:22 +0200
Message-Id: <20221228185237.3111988-2-dmitry.baryshkov@linaro.org>
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
 .../devicetree/bindings/clock/qcom,gcc-msm8998.yaml         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
index 2d5355cf9def..3c9729050d6f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
@@ -25,7 +25,6 @@ properties:
       - description: Board XO source
       - description: Sleep clock source
       - description: Audio reference clock (Optional clock)
-      - description: PLL test clock source (Optional clock)
     minItems: 2
 
   clock-names:
@@ -33,7 +32,6 @@ properties:
       - const: xo
       - const: sleep_clk
       - const: aud_ref_clk # Optional clock
-      - const: core_bi_pll_test_se # Optional clock
     minItems: 2
 
 required:
@@ -57,11 +55,9 @@ examples:
       reg = <0x00100000 0xb0000>;
       clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
                <&sleep>,
-               <0>,
                <0>;
       clock-names = "xo",
                     "sleep_clk",
-                    "aud_ref_clk",
-                    "core_bi_pll_test_se";
+                    "aud_ref_clk";
     };
 ...
-- 
2.39.0

