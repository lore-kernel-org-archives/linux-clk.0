Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123BAC4338F
	for <linux-clk@archiver.kernel.org>; Thu, 19 Aug 2021 05:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4D28610FA
	for <linux-clk@archiver.kernel.org>; Thu, 19 Aug 2021 05:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhHSFaP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Aug 2021 01:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhHSFaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Aug 2021 01:30:15 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B59C061756;
        Wed, 18 Aug 2021 22:29:39 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r9so10100369lfn.3;
        Wed, 18 Aug 2021 22:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NkyQ99fSfjHhX/SIGvNhplWLTZKV19L1/kVLvts/VV8=;
        b=OCGl5RWYQ4U424qw5IpvRjKffDKk9f3E9ILVxmtbXjdmTcZE1s8xrCxmDVYhOyNs3Q
         wyq/MQSY/bhOs6Ezxmb5FnCzP8W6wkptZ6CRUodrhFG+zLrWkOKiMFOEHyu3rI7Di5XI
         +1o/kJn/CEYtaaS2yfsvtgXcIPzrPnCh+vFk8JmKiRAJCmN2SJHY/PgivniAdOlYbMfO
         o8vuTzd7NVXFH0EmHTLZVBqLwoREZ/DURnrTFRf/TFthYlCs+0HWqrOE6A+nBZDtFb9M
         vh38idnrp408yKT7APUdwkVRAQLgI8ILjB7E5jSxO8/ax0ksoHur2VUg4Zt2MUMkIVTQ
         743A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NkyQ99fSfjHhX/SIGvNhplWLTZKV19L1/kVLvts/VV8=;
        b=H+VxuSURJpbSIGTtFy1gPG4Hp4Us825j1ZOL6joSCFrFYBp9h8LqFmFWX9RDWOZGdE
         Pi6bKCo7vkv+dBfTMrbhofQeasJfrfQbg3e8UQzdsjpH20rJp3/2/dhzMaOEAW6L2F6N
         FOExsDKV8oyintuBbsOL2SWT6uyWswbXPy0RRRKU2QgLR10H/0CpuWuURXUSEC/Rpfhv
         zsud3ASmkO/5L8J5SPpwjyGWfIiSSDy4ljp7kajpkrz/Psps/6Ly0RgtlMD+PCEMfijZ
         k/d3Q0fsTkM+fFZi2thrGEbpFVD7M8iGZAmiX7nqj5rNqhcvtw48KHamSWmdYiH+ZpgF
         s8zA==
X-Gm-Message-State: AOAM533iZ/I7tqUZ3VOWHlcoD37kSSeaIkCR9EyqTJtKKeNtYDRVDlHw
        P7QhK97RJ5inO6RkQVlsrC0=
X-Google-Smtp-Source: ABdhPJxQ8zfr6KrADfBGoHThIpvNI58GOifyv7ZdegN8ZzvixxWVRDRq9O1sdokhZOWlv4FQdEAOcA==
X-Received: by 2002:ac2:4106:: with SMTP id b6mr8965460lfi.89.1629350977641;
        Wed, 18 Aug 2021 22:29:37 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s13sm186464lfd.53.2021.08.18.22.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 22:29:37 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: clock: brcm,iproc-clocks: fix armpll properties
Date:   Thu, 19 Aug 2021 07:29:18 +0200
Message-Id: <20210819052918.6753-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

armpll clocks (available on Cygnus and Northstar Plus) are simple clocks
with no cells. Adjust binding props #clock-cells and clock-output-names
to handle them.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/clock/brcm,iproc-clocks.yaml     | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
index 1174c9aa9934..5ad147d265e6 100644
--- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
@@ -61,13 +61,30 @@ properties:
     maxItems: 1
 
   '#clock-cells':
-    const: 1
+    true
 
   clock-output-names:
     minItems: 1
     maxItems: 45
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,cygnus-armpll
+              - brcm,nsp-armpll
+    then:
+      properties:
+        '#clock-cells':
+          const: 0
+    else:
+      properties:
+        '#clock-cells':
+          const: 1
+      required:
+        - clock-output-names
   - if:
       properties:
         compatible:
@@ -358,7 +375,6 @@ required:
   - reg
   - clocks
   - '#clock-cells'
-  - clock-output-names
 
 additionalProperties: false
 
@@ -392,3 +408,10 @@ examples:
         clocks = <&osc2>;
         clock-output-names = "keypad", "adc/touch", "pwm";
     };
+  - |
+    arm_clk@0 {
+        #clock-cells = <0>;
+        compatible = "brcm,nsp-armpll";
+        clocks = <&osc>;
+        reg = <0x0 0x1000>;
+    };
-- 
2.26.2

