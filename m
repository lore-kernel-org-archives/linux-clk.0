Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AF7C433B4
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 19:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E5A5611C9
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 19:56:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhEMT6G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 May 2021 15:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbhEMT6D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 May 2021 15:58:03 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FD7C061756
        for <linux-clk@vger.kernel.org>; Thu, 13 May 2021 12:56:52 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id 197so26685261qkl.12
        for <linux-clk@vger.kernel.org>; Thu, 13 May 2021 12:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ImB00rCkO3Du5fe7tW03c3z2e4cEx+x9KwGSBQTfV8Y=;
        b=MYFZYZfeOsnayRhW4lf4ZMW7Qg1ZxX5/VeI5As9fUKYtgLYeIfesf4bvt4LNtZOd+n
         mkh1Pl/j62eJYdcFcF8Y2m6ir8r1lBayar5pI5GS/9TfjCguiGAxUpRTjmDCYN3YH2Mm
         Z0AnoB/pz5FOM4R1rfgdwYatRIcNVvXv6Dd1QJICdDN2iC66ipJ+K+zDXDw9M/IMJJ/4
         0jQySlzbudom8C/dZwF2oQFXMydcug0llFJ2F8aLGsh62K9YKz2SVWcD6csBXeZZ+rYR
         CUCXvys1qHCIdb/JwjDUvGntkYEyNUIEFy25Qpq7Qy4zk5fQUo6uUWx6Xx10j9hFMVTx
         ejTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ImB00rCkO3Du5fe7tW03c3z2e4cEx+x9KwGSBQTfV8Y=;
        b=j4HzTc8WtCiu12Hk9djDLyaVfao1o18melz2RlzQ6YAv8mYGSSwZ5rAA3yj/ib2sar
         F556nQWMpbEd7vKDqR9HpvJfS8rV4FNpTuBSlgutZ+OgN6d/gz0qCyD3wSKcKjmg0yuq
         BoftaBkD2qsryJWo8VevwvrHxjSHO54v9HMpReUal1p10pHj80b3iBDExymP40vvTJZh
         qPnI8sphGN/C6X7lzjqXoKRCeMldiUvvpqyqT81eHT95ShwssLZ2NZL3dResGAqKlUi7
         l2RGA78F/uYsHYlzPXnMoFpKYXsYJT0yaGGJDkIdTgM/Qs0nVndI4POehUGEPgTEbjsJ
         vQeg==
X-Gm-Message-State: AOAM530lpad5PxH1W8NHiENufiYNWUJafwJcfJu4WOzfJ+Jpn/HyFWfC
        xR8WYiH8bSLe6Lux5yCb10ZsmA==
X-Google-Smtp-Source: ABdhPJx1RtfJ/l4n/RuqVFt93meQ5WMhpxPL9gL8UNj3gRu1WJT/XnnZlFikpcxf3KQh0hdKj1TlWA==
X-Received: by 2002:ae9:ed86:: with SMTP id c128mr32927476qkg.224.1620935811744;
        Thu, 13 May 2021 12:56:51 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id h12sm3211228qkj.52.2021.05.13.12.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 12:56:51 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] dt-bindings: clock: add QCOM SM8350 display clock bindings
Date:   Thu, 13 May 2021 15:56:17 -0400
Message-Id: <20210513195617.15068-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513195617.15068-1-jonathan@marek.ca>
References: <20210513195617.15068-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with add the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
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

