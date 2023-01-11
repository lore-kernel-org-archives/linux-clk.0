Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5BCC54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239640AbjAKUFW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235941AbjAKUFA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:05:00 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549A243D83
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:31 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bq39so25246142lfb.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1ASsGHKR4g4CL9h7lZg2fjHvPvUGBMoSRXi8aiWL9Y=;
        b=q6QvlWvpc+I/UFMgOrF72FBjP9/gHbyqnY9vd6VHx0PMznYAYQaBr5Ty3Ou9rdGnSC
         zLuInp2zpjHsa2022aKJ7dY2ymDfTzcBWXymtnIAPhSzrnAP84rwZtmuVpKZAcrO8lUi
         +t8uQ7Y2Vt1fQzwK4vzALyFQ71/uOPyOJHF0WE9tAo2KN4Ju2svnknDahb7bLp5lzmgW
         J0e6G3NDsWjPGzkbndP2QdRQB4ipxYsnL11fXCRaLmKqAY03DLebopICM9Sm9YMfCiD4
         NVkxQa0iWQrhXmpd9kSEmkoTapNjM42e+yt/3RejYBTBR6ELK7Nu7lQYAm6kU82T3QeP
         /1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1ASsGHKR4g4CL9h7lZg2fjHvPvUGBMoSRXi8aiWL9Y=;
        b=DSHAK0hgHPjIRpMfofwpecvCzsRtb2KAzidIHSIo7/Fxjb5i4GBX2hk6eJyHan0L1v
         cQVHPCYsbNICDRpO58E2kh9CkFgQFKsbYh71hGmiI9Umr6beZpQSEN6DKitRNfgDBqzB
         ZyThqvQ+Y4SJ7n0sJ0uXxehGlIM0BhIGrjYTDNHhht9NH2d2bPcoyuAMBm7iXKh+CXnY
         SpD40tXJF7BRUHc9RmHw0+Wuche++1hzeQ+rb4XZ71mCFn+tph1gGxRGcAYWUZ30Mlqt
         D8GxKJp/Mjy3v6QNgFDFraxhdVKKmN++y7Wz2iKvLYOHb74LdAKWsKTIXx+q0Lj5saZg
         HL5Q==
X-Gm-Message-State: AFqh2kpzLZBx8xWg9CwFsP5b/AxeTAPWCbhA97RTMXRzmG08Pp/RqeUK
        OOQP6UVW+fUqjHx78dgzslQajA==
X-Google-Smtp-Source: AMrXdXusoRB/zu8OQvNTrMxPqTtHu9WNrzP+Ui9KgTN++eC8qoxDFNjZtSDbfLDNI4eme+kF/sRjPA==
X-Received: by 2002:a05:6512:22c8:b0:4cb:88c:c795 with SMTP id g8-20020a05651222c800b004cb088cc795mr20736546lfu.23.1673467289722;
        Wed, 11 Jan 2023 12:01:29 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:29 -0800 (PST)
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
Subject: [PATCH v2 01/14] dt-bindings: clock: qcom,msm8996-apcc: add sys_apcs_aux clock
Date:   Wed, 11 Jan 2023 23:01:15 +0300
Message-Id: <20230111200128.2593359-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MSM8996 CPU clock controller can make use of the sys_apcs_aux clock.
Add it to the bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,msm8996-apcc.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
index c4971234fef8..fcace96c72eb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -27,10 +27,12 @@ properties:
   clocks:
     items:
       - description: XO source
+      - description: SYS APCS AUX clock
 
   clock-names:
     items:
       - const: xo
+      - const: sys_apcs_aux
 
 required:
   - compatible
@@ -48,6 +50,6 @@ examples:
         reg = <0x6400000 0x90000>;
         #clock-cells = <1>;
 
-        clocks = <&xo_board>;
-        clock-names = "xo";
+        clocks = <&xo_board>, <&apcs_glb>;
+        clock-names = "xo", "sys_apcs_aux";
     };
-- 
2.30.2

