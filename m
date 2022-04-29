Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F72C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 29 Apr 2022 15:13:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378192AbiD2PQr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Apr 2022 11:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378206AbiD2PQn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Apr 2022 11:16:43 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF2DD4C64
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:13:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id i19so16002073eja.11
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t7lOY18RHlZ0BRHPiFyuqSErNh+XH4pnEzjovY987mo=;
        b=bd4cKg/YJO9uNiXNz2ptctAHSlEMc/8+uk7IpV09iAP/ktqU3v3zz+nlAlPWgUVQlY
         wfjOmNPpz3Or4aKQNrvzy0zCwGRq2GPs5t9BN9zhZmAC7M2cmQVwEm+lcU/w5RS5J1No
         TLUl/IXvCS+5ACzn6DouqT+pel95NaBj4PBWrde3gZ+AXUSzhUUYRN0UKTi8SRQQlUMk
         JqPd8nXzJZGwQEPMGxTXUTiDKXlISc0L8IlNEgq4wdFVBKG/MYdZdjBAk/3X+0NE4wvL
         c2UacIqwny/K30VZ30tfcc3XVGsAhZX8cw90PAuYG/r6vt7UNQqx5itUBDoteK7j8v+Z
         ld/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t7lOY18RHlZ0BRHPiFyuqSErNh+XH4pnEzjovY987mo=;
        b=M7Qiwg60ZXV4RLO83XDVSgZPngUvRmeE6BccX6yQukVNHGoIs1ykNLUySinDqimSbP
         x+ushTlD2Toj2xcr2W0J2RJFIEwxDJDnYO3tYYvF+e1oWq+eX5rDx6ML/lgIC15QroUh
         qQtwepwqyQF0iAs+NFiwDRwnSSnEUWxFn5uZqQ3jHdUxJtcGrdOsvHTjFhotQDNY/OGa
         SWLqLD2kyiGfFA554vExV2ti2mW4ajhipB6VG+xnHeyExSqBun6HWJ4b1SL7gmke6KY6
         ofDoVlu/e6PeMAXkAizzJfiGNEhgv9tGJ4OIWn1VJ6oJrWU76CV/NIlLsmjlft9BTjfM
         Ovfg==
X-Gm-Message-State: AOAM533FMTaELBvsAHpcZqeHOfiKuhPx6rLabOwqSo0IqgvyfZAc22xH
        TOyxhAugL8ClQhJX1XAkP1AfcQ==
X-Google-Smtp-Source: ABdhPJyiUiFYbed8YEoHLc9yAXU/m+TLLx6s5tqKTIOVWFqJ6vqYGODES6q27KDUUvpBQGdpzBVulA==
X-Received: by 2002:a17:906:c14a:b0:6e8:76d0:e0eb with SMTP id dp10-20020a170906c14a00b006e876d0e0ebmr35781195ejc.412.1651245200918;
        Fri, 29 Apr 2022 08:13:20 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id zp15-20020a17090684ef00b006f3ef214e4esm712677ejb.180.2022.04.29.08.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:13:20 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v1 7/9] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Fri, 29 Apr 2022 17:12:45 +0200
Message-Id: <20220429151247.388837-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429151247.388837-1-robert.foss@linaro.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Due to qcom,dispcc-sm8350.h being a symlink, checkpatch is not happy
with this patch. Other than warnings related to this, it should be good.


 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
 include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 31497677e8de..7a8d375e055e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
 
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SM8150 and SM8250.
+  power domains on SM8150/SM8250/SM8350.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sm8150.h
     dt-bindings/clock/qcom,dispcc-sm8250.h
+    dt-bindings/clock/qcom,dispcc-sm8350.h
 
 properties:
   compatible:
@@ -23,6 +24,7 @@ properties:
       - qcom,sc8180x-dispcc
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
+      - qcom,sm8350-dispcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
new file mode 120000
index 000000000000..0312b4544acb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
@@ -0,0 +1 @@
+qcom,dispcc-sm8250.h
\ No newline at end of file
-- 
2.32.0

