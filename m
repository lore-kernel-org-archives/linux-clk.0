Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EDCC001E0
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 16:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbjG1Q7b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 12:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjG1Q7a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 12:59:30 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF6EB5
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 09:59:28 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so24232855e9.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 09:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690563567; x=1691168367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPB6Zeg9uXKljdUTCujmlGSCtIgPff/6E7o4lT+WLLY=;
        b=A4qlcK5wsi1H/p3dUGzF7qhl8S1SS58cbJpGbIQ7zCqc6LV539c4j9eW5fu5qomPoA
         1d+zqKi0V9iPNDTArvF6aQUUNNqjXiyz4RYsL2BWhbZRAWo2GYIV6aDKe4aCi50y2Cew
         OHI/ONTP+GbnfW0YvLyJTqa7VUEIe1ifJ6dE9vanrxa/mk5Ih0H31npk47OcE4AJMtxb
         8SMPMTAzFkotx9dxeunylfsInKsplrMOyVNOT6trTOxgOsVYzmQDNZo+64rVqTXyqlsH
         RFQG7EiZRGPPvfNDowPSt+ISFWA0qmbyd0ig7Lm6soJiK+9FXSBBYrEws4N84LZPc+Y5
         Ps1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690563567; x=1691168367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPB6Zeg9uXKljdUTCujmlGSCtIgPff/6E7o4lT+WLLY=;
        b=XMD70Q4CB5Z4bdbwZjT4xdcZ6TPotpVkmMYcOkLpTTNGEa7+d3NjXA03ajw00wYhDh
         6NVL2jmxZT5lNuL1tcD5yeocdp9RHn3lZOiR1mY4gz+BKHSX4mrAyPFDNSEo6rwImYe3
         q5ghhHM7kdHmRzv4KwlDasaUqP+HaQ7EWPOsS7MDVSdsWV0KTyQQXwN30YyNRiE4v2YK
         1CArw3UYlt+q3OiNps3EruSBkLgM5FphJG/+dgiRz18ORaU9etqJuqFsXZPYQgYJsYeQ
         Osq6BZ8V73F7aqSly1fuPSBSywL01zep+MzGbaoNpU5PdXf97kt/bXJoFQGtUApRtCUI
         rHbA==
X-Gm-Message-State: ABy/qLa2CtSOOG4x3XSMdkXiGNzroqCjhAJshY0qA/iE5e4cG94dkPq4
        LV3fD01sfG5ednyl5d59aHZO1g==
X-Google-Smtp-Source: APBJJlE4kigzGgz+YXKTvNYunKRWlL0qH+VsPevZCbjdnQuQYwII4IhJbeRelgw6a74DDnOgo7lLWA==
X-Received: by 2002:a1c:7712:0:b0:3f9:82f:bad1 with SMTP id t18-20020a1c7712000000b003f9082fbad1mr2284411wmi.40.1690563566826;
        Fri, 28 Jul 2023 09:59:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v24-20020a1cf718000000b003fc05b89e5bsm4532874wmh.34.2023.07.28.09.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 09:59:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH] dt-bindings: clock: xlnx,versal-clk: drop select:false
Date:   Fri, 28 Jul 2023 18:59:23 +0200
Message-Id: <20230728165923.108589-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

select:false makes the schema basically ignored and not effective, which
is clearly not what we want for a device binding.

Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index e9cf747bf89b..04ea327d5313 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -14,8 +14,6 @@ description: |
   reads required input clock frequencies from the devicetree and acts as clock
   provider for all clock consumers of PS clocks.
 
-select: false
-
 properties:
   compatible:
     oneOf:
-- 
2.34.1

