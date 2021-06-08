Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E969C47082
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jun 2021 14:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D45A61003
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jun 2021 14:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbhFHObE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jun 2021 10:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhFHObB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jun 2021 10:31:01 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04403C061574
        for <linux-clk@vger.kernel.org>; Tue,  8 Jun 2021 07:29:08 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id t20so15396475qtx.8
        for <linux-clk@vger.kernel.org>; Tue, 08 Jun 2021 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ya4sSOjySMHGjVVWLWrWfBjZGU/UNkNaSi2rQLK5WkI=;
        b=1X5vWiICSrpwWJEznutissR6pu/5bj0Ju4L12Omxfb3SP/Za4+dbBmiY5ac1YZbKIK
         ZG13VmDs1K+v5GcUYx9Wwwv2H6/36pMlI7sLQ13lWvQNb9cG4O+rGaWEmLbbXhb6UUxh
         5esOht+eSbhW/L4rTNDyaCRQzfpBW8sDQ6SN4xJOjmkYLM4j3/QgHBS4m24oAVKNAiAC
         czFQVsq/j33+Q72tzzg3NZaPvn3E0ncGwKDHzqNRVU1K+swCemhYaJeSINjAwyAyLxp+
         Cw7O0VRMEYe77xyeurCssl/ojJtN0mIqs6ld3PD6xrEGp44zgFGp7vK4Ic4gsyJN91Nh
         3yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ya4sSOjySMHGjVVWLWrWfBjZGU/UNkNaSi2rQLK5WkI=;
        b=gjS7098Fybj55G/+AGwqIr3SQf8YcdwVJn1sCjNzFYeHNy67HIyyVQj2jwfacRu06y
         WyIv1wt/3hloneiSWif/moRL1x8LSc/pC4UWUu/W53zJta90dPHaN6y2r6zQ56gU77dQ
         bai3rS8M6kV/RJcSyvRVapv3cObsxsGXjeCMvvMhIsGSyAAJONX1AKlxCO0ER/lgoB86
         smXnHE9fRWQuhi0m3oGWzsFhD5SXkHlYn0zfk0mwYxp0Za9L+lD4ukGGDZ2YdsVw7pdd
         fFJa416+ChXTlZagwMhM7pFpTd/InNB6nuZiR9CyWc2EVewem0D71tMaMslBPDcEC+CI
         CW1g==
X-Gm-Message-State: AOAM5328QsyIVdxv6XTyp440mK5S8Q2BjuNiNVXiQPFl7E+T+A+UNRY6
        t0TbIJuOJoJ04SOlzzitgZIB2A==
X-Google-Smtp-Source: ABdhPJwXYMw9s+35IctDKhPg2MZvfzZqU2XLhwmUCtvJaU+eoTE/zoB5Ljo1Tzq6Z54HDxylEPn7EQ==
X-Received: by 2002:a05:622a:154:: with SMTP id v20mr21676270qtw.91.1623162547243;
        Tue, 08 Jun 2021 07:29:07 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id v6sm11838748qkv.54.2021.06.08.07.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:29:06 -0700 (PDT)
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
Subject: [PATCH v3 2/2] dt-bindings: clock: add QCOM SM8350 display clock bindings
Date:   Tue,  8 Jun 2021 10:27:07 -0400
Message-Id: <20210608142707.19637-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608142707.19637-1-jonathan@marek.ca>
References: <20210608142707.19637-1-jonathan@marek.ca>
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

