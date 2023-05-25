Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B43C7EE32
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 12:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241043AbjEYM3y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 08:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241095AbjEYM3t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 08:29:49 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE8F194
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:47 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30ac4e7f37bso295929f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017785; x=1687609785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVu9HOtYzHZwvpuN2gTTPEs8228CUSLathJuRQieOBU=;
        b=FYFUUoDfFC8eDhN6tmFQqkssXETTQaFCFsulLoqLxKzJ9aTnu4Jqi3+pVv4eZGmyuV
         OaTd6IN2zZw4Z50Rwrjy8vYtNSx+jjEWoYXiw7TXPNcdGZDyW4Y6RVA3R4/XXeaXdZR2
         qVoyhem44nKHOo5GsCLPY6B6DleSpLZh77gYEZfuhpj+rcWafLYqtIZRlh2rU7uDyImC
         yZkIEpX6z89xt/DAPEMO/8SJaO30bNRVrv/wYVob466v2sHIX6TjfXE5SdZzRMb0eW5d
         s2sE6dZAJg7thq5C2CKeaWWq4vX3Ql0QyRqJ+DpHsZpIv2nXYzs+P88VXApzMY4UC+p7
         iP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017785; x=1687609785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVu9HOtYzHZwvpuN2gTTPEs8228CUSLathJuRQieOBU=;
        b=W7im9zv5knnfJWi9VkgOHpTZTDrSjf02M2TcmU5NAdWukrXGjzwUEZp+HpwFXLIQT3
         IYtcqq9B/VjRvhOIIEWLQAIdYj8ur3T4EdH61lVdwL63p4GA971P/MHyxcYT81u/yY2n
         y+YB94Nal2fScO6I6OIZgqhsi86/wOPHkEFnUxkj4V6OSaT2uKPIM2+RNmg8k88OOMDB
         2WDMPl3mp5rV7iF3Xn2DLSihNyG1lhW9yKLQuyje7ax+wV9sP4LIuM6Pp+LguIe2KR4k
         uWIHeRoWDj+kkvB56ct991CdNqyiY0TzO5EE/pGjTZl/ZMvl20ksSNoxVKdgy0xpmySv
         TnUw==
X-Gm-Message-State: AC+VfDxsFokhnsYIBwVkRMplFZA5X2gsedKEUXJU2TTFx94yNT+Jrh6J
        UztBYJzbqz86cWif+qbnp6aakA==
X-Google-Smtp-Source: ACHHUZ5HN68fH+D1Pu6OBgTuX6kbLu1MmsCbnS7/Lt81SO83ztw+98yOn5rhMJzCCEj95ibFumMYQg==
X-Received: by 2002:a5d:4a92:0:b0:309:43a2:8e9f with SMTP id o18-20020a5d4a92000000b0030943a28e9fmr2173055wrq.27.1685017785708;
        Thu, 25 May 2023 05:29:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003062b2c5255sm1700227wrm.40.2023.05.25.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:44 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/6] dt-bindings: clock: Add YAML schemas for LPASS AUDIOCC and reset on SC8280XP
Date:   Thu, 25 May 2023 13:29:26 +0100
Message-Id: <20230525122930.17141-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml         | 11 +++++++++++
 include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h     |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index 08a9ae60a365..0557e74d3c3b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - qcom,sc8280xp-lpassaudiocc
       - qcom,sc8280xp-lpasscc
 
   qcom,adsp-pil-mode:
@@ -45,6 +46,16 @@ required:
 additionalProperties: false
 
 examples:
+  - |
+    #include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
+    lpass_audiocc: clock-controller@32a9000 {
+        compatible = "qcom,sc8280xp-lpassaudiocc";
+        reg = <0x032a9000 0x1000>;
+        qcom,adsp-pil-mode;
+        #reset-cells = <1>;
+        #clock-cells = <1>;
+    };
+
   - |
     #include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
     lpasscc: clock-controller@33e0000 {
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
2.21.0

