Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE4FC7EE22
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 11:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbjERLkn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 07:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjERLkl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 07:40:41 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7694D1FDC
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 04:40:17 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30949241c65so485368f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684409994; x=1687001994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HG4Vbyr7PlG0lpY1RSxwlZMOHt+XOR7/ovgh8gARZlM=;
        b=kbczseXt+Cf+wUhPfg3lOvHXPHqqYE7Mh28Vz0DG3Tus2Fb0O+v8jSSfk+sOsXfJej
         yFsMiR9F7FxX/XYGxM4urkPI0/lSKkx1ogJoX/ZhscTnCYQue3lPgolwI0KZ20oL5QUX
         XWn4zTIG5bKgqf67r94YkjPGJmgiyOlu4LYYiGUjSoTCUICGLzyxRRi9tHT4E2Gu8MWC
         gLEW6MZFNeeusp28Fca11GDy+1QJC2RvJ4JmpebUHRoXeILJscP8flYNw/+i4Ne/kFAZ
         y7aMlICfq5PLz8ul8AnbZst/iPbLSy7wAID9g1T00xAXXWI4OssILrA0Fjl2YQg7GJXi
         PUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684409994; x=1687001994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HG4Vbyr7PlG0lpY1RSxwlZMOHt+XOR7/ovgh8gARZlM=;
        b=LVmGqnjS1HEEapp3hdWv4rmFlIFJHO4f6/mDXlvYVnhYeYyPs/MfHGSYVfDTctxHUu
         1RDnM500rzTPVn9UkYxA1p/dJQifLGd5hQjzcksEgsC04L+05GMEsRXA3HUfrWPc0BWY
         UgmQ/IZ3nM5iu/5BmdcKoRH6qxsEdAa7s1GErsQI5lFU1x/h8eR86aBQs8WYh5Ov6BOA
         rm6/0NDEZ1lExRsiMAyv/gCb5IjkWyLExmhFDwcFMsVrUTqnFUkQp1GVeKWvS3h23RDP
         ehAvEN4MWtcUSNLjqJwgyCnISDFjhxpLmiSy0Ff37TDHNppwhgkE9WDM9JGvDADSqPAO
         g71g==
X-Gm-Message-State: AC+VfDyxN2Wrc/5l8L6qLneNEc3MLJnuglwXO/t4+Xa60waz4zVKKJlt
        rfcx0yBE+JlzHTJ6NeX3wC7zww==
X-Google-Smtp-Source: ACHHUZ45vjuEaH9D5GBYXWDkM1nucUH5ctXYjl87CMZOxDISAypwtYW5WXGFDuw5yYrlwsiHTzA7Eg==
X-Received: by 2002:adf:f484:0:b0:306:3ec9:99c5 with SMTP id l4-20020adff484000000b003063ec999c5mr1398646wro.9.1684409994340;
        Thu, 18 May 2023 04:39:54 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d568e000000b003047d5b8817sm1897135wrv.80.2023.05.18.04.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 04:39:53 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/5] dt-bindings: clock: Add YAML schemas for LPASS AUDIOCC and reset on SC8280XP
Date:   Thu, 18 May 2023 12:37:57 +0100
Message-Id: <20230518113800.339158-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
References: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The LPASS(Low Power Audio Subsystem) Audio clock provider provides reset
controller support when is driven by the Q6DSP.
This patch adds support for those resets and adds IDs for clients
to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml         | 11 +++++++++++
 include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h     |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index 7c30614a0af9..394833819ba3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     enum:
       - qcom,sc8280xp-lpasscc
+      - qcom,sc8280xp-lpassaudiocc
 
   '#reset-cells':
     const: 1
@@ -45,6 +46,16 @@ required:
 additionalProperties: false
 
 examples:
+  - |
+    #include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
+    lpass_audiocc: clock-controller@3300000 {
+      compatible = "qcom,sc8280xp-lpassaudiocc";
+      reg = <0x32a9000 0x1000>;
+      #reset-cells = <1>;
+      #clock-cells = <1>;
+      qcom,adsp-pil-mode;
+    };
+
   - |
     #include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
     lpasscc: clock-controller@3900000 {
diff --git a/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h b/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
index df800ea2741c..d190d57fc81a 100644
--- a/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+++ b/include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
@@ -6,6 +6,11 @@
 #ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_SC8280XP_H
 #define _DT_BINDINGS_CLK_QCOM_LPASSCC_SC8280XP_H
 
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+
 /* LPASS TCSR */
 #define LPASS_AUDIO_SWR_TX_CGCR				0
 
-- 
2.25.1

