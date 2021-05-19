Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945E8C433ED
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 00:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A18E61246
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 00:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234721AbhESAUj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 May 2021 20:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234542AbhESAUi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 May 2021 20:20:38 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9044C061761
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 17:19:19 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id h7so5293850qvs.12
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ya4sSOjySMHGjVVWLWrWfBjZGU/UNkNaSi2rQLK5WkI=;
        b=dgR0jZfPugb1vJ6AMdf0SFLrD7qlnWMdO85o1cRnR++JEcxOi464/LprwILu/TDG1T
         GXfq4n65XTy653sRWBW4Gmm3Eq2RPYoMdVC5VmtnEhr6JQFnvZWRrhoqcfMJDtBLGCvH
         CnF2K+6XwGU+dd7cbE1e5b7JsS1ek7cABHLqn+Qp30zp7C3Cfa/GB2mH78GutSI6zTDF
         qShfcvujoAF2FX3OndvJmtB3GMacy1AZypxOqK0Zhq9LuedC/a0SmvlbSU+HYXCIGCsx
         L9Zw2G1BSmTNkwGxDtd17hOSrFoUA8o5F2p5UezVPI7VuhpQXaRUENPAyMSHz8/RxG7a
         HTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ya4sSOjySMHGjVVWLWrWfBjZGU/UNkNaSi2rQLK5WkI=;
        b=t1YIWPgc5q1W4CDmEXjoM0Z8aX0jOmghSj6BVma65wYpWeOm8TxpeMejRmwzRIXDBL
         6ivqxJmD7IIHJeno3Y75H+KxRX/JUr6K9Mya+DKN46/H7z3HUcktee8nDwQ3CysooII0
         VY6WSasKI52e8WH58e3GSmvZYCbYc1atoc8fMlvW3u5boSf+r3r46sEo3jMfIahppjvz
         Rcjk/vIIkmOX8sJDV+AtZQlnmfxDq+V85+57HygLxZ+y59JZmgZ4OR9/DID+hqkg5Bl1
         7dpwV8L/h0zaG/hNCanaPDfJZTmIQe5m6p+KZheakyi9r/Oj86rZ9+Fvw45Bqudt8/vm
         RMkg==
X-Gm-Message-State: AOAM530GGnNEhxJJiz1teUuF69/I/0mZSvpEyX8afwcLbtQQ8L6h4guo
        4rFXiWrW9QEC0QNWwTa1z1XL9Q==
X-Google-Smtp-Source: ABdhPJwYXbSRGZh4yAsyxeZTUi/2xCvEgR/QeTo+ZBXTGsrF34zvxgnmkdi2Js6f+e2PAkuYw9il+g==
X-Received: by 2002:a0c:eed4:: with SMTP id h20mr9086949qvs.40.1621383558985;
        Tue, 18 May 2021 17:19:18 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id i9sm14998529qtg.18.2021.05.18.17.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 17:19:18 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] dt-bindings: clock: add QCOM SM8350 display clock bindings
Date:   Tue, 18 May 2021 20:18:02 -0400
Message-Id: <20210519001802.1863-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210519001802.1863-1-jonathan@marek.ca>
References: <20210519001802.1863-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
 include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..8f414642445e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,24 +4,26 @@
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
     enum:
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
2.26.1

