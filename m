Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B46EC87FDC
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 05:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235363AbjFLFja (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 01:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234941AbjFLFj2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 01:39:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4288AE69
        for <linux-clk@vger.kernel.org>; Sun, 11 Jun 2023 22:39:26 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f629ccb8ebso4418566e87.1
        for <linux-clk@vger.kernel.org>; Sun, 11 Jun 2023 22:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686548364; x=1689140364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3XrlP3qxGGbuMeyHpbUTgn9VuSrjhayHzqHOlF2VRg=;
        b=cEMdGuL89H/fBK/hrDnEwKkZXZoJ0OUmsU+EQ/gwvB/yBFhGsoLuQrtxhGect2whhV
         TyMAeGFLPBdr1PC8ulLzzWPIb/jqu0lC+ZpV+/CqijhBFPqpCWZTQDLXji1UOojKsCcL
         vtEzDKdT+MDUm7pFuEOru2IE4keXIAVv0Zc9u0A0AIxdwnxSdhJjDkbtY+phXOSenYYX
         9gdGouv88NjsyYBNosNOoCZ7z+7UyX3qQn38Y0YfQuYuF+z2UA+9CzIbMjmpaMzTU6zk
         hDnwjvB8FUEECO3+dL57pf9EkhP6KRIPKeWnxdibL1BAU5ofNFC0D/nLMXJPcflo0K3m
         n0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548364; x=1689140364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3XrlP3qxGGbuMeyHpbUTgn9VuSrjhayHzqHOlF2VRg=;
        b=Ia2cofboeFgn6NYMCH1dvjQfvq+sceNEU0UEL2L3FtE4aXIH7xehuTkvh0qEk4iwqM
         eIjWg2Lyfa/j0ulCxS2PIgFgW9t3j/mBtqBs3uEpvs2H0wdRP0CIsfHPdU9S2qMwFtu4
         SX516iEeGSC0uBJa28SR4tT1KsZPjeCoegUaOD+8oUHhIS8hA0C6bl4xppKJQcNtjgq2
         hPeGC/jLyDBjeK3n9jlLu6PNGuBvChg6fnhigw/Gi53TdlpsplrebK/WuvW6yGtHRn1C
         bQFMmyiA8a2aYDI8FLFkw5kD2gEzfnKUTlAeTYG97cOU5G8tTo2DT8oVWLDUk9y6oZwd
         q5Cw==
X-Gm-Message-State: AC+VfDyaRe+423TRyYjinoaCd898r3/OYnafn78o2SQ7OUGrLOFjMrPq
        BQBPVHYHfVpHWdgXlBYV53HTRw==
X-Google-Smtp-Source: ACHHUZ5Rt7kSjxAgZ2EuBEP9nABNPmD18A8ONgsSEqAa4+c/iDsem3zIxfurYPgYBJ2RN93F7jHrhQ==
X-Received: by 2002:a19:2d58:0:b0:4f6:2a63:d3fc with SMTP id t24-20020a192d58000000b004f62a63d3fcmr2882685lft.32.1686548364629;
        Sun, 11 Jun 2023 22:39:24 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b004f38260f196sm1324125lfe.218.2023.06.11.22.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 01/18] dt-bindings: opp: opp-v2-kryo-cpu: support Qualcomm Krait SoCs
Date:   Mon, 12 Jun 2023 08:39:05 +0300
Message-Id: <20230612053922.3284394-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Exted the opp-v2-kryo-cpu.yaml to support defining OPP tables for the
previous generation of Qualcomm CPUs, 32-bit Krait-based platforms.

It makes no sense to use 'operating-points-v2-kryo-cpu' compatibility
node for the Krait cores. Add support for the Krait-specific
'operating-points-v2-krait-cpu' compatibility string and the relevant
opp-microvolt subclasses properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/opp/opp-v2-kryo-cpu.yaml      | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
index bbbad31ae4ca..93ec778bf333 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
@@ -26,7 +26,9 @@ description: |
 
 properties:
   compatible:
-    const: operating-points-v2-kryo-cpu
+    enum:
+      - operating-points-v2-krait-cpu
+      - operating-points-v2-kryo-cpu
 
   nvmem-cells:
     description: |
@@ -63,14 +65,15 @@ patternProperties:
           5:  MSM8996SG, speedbin 1
           6:  MSM8996SG, speedbin 2
           7-31:  unused
-        enum: [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
-               0x9, 0xd, 0xe, 0xf,
-               0x10, 0x20, 0x30, 0x70]
+        $ref: /schemas/types.yaml#/definitions/uint32
 
       clock-latency-ns: true
 
       required-opps: true
 
+    patternProperties:
+      '^opp-microvolt-speed[0-9]+-pvs[0-9]+$': true
+
     required:
       - opp-hz
 
-- 
2.39.2

