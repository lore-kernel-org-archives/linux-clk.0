Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3E13D8B8
	for <linux-clk@vger.kernel.org>; Sat, 17 Aug 2024 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723887972; cv=none; b=U6hYPZ45JjMorrsRDLMAlvaB0LykMnPiQHFpp/P3O29YJMEMCpj056aE72aCIFLa1xmGOdOA1eEvFwgevQ4Dkl8cz5zvfoc5M/MrNPPUmL/KD22NeqWHKfJvVLgppPRhZvyVVkdcRUlDW5ZVgUWjhDfrorThvcIIRVufy/5qCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723887972; c=relaxed/simple;
	bh=CWHFcYPRtRY+Qq7QGzuma85hGAjlXR6aFEhWCuiLKXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ug2TPTBGSuc8U8jhAWChme5Z1wsApGjhz+gdSvlH1DjbgH9vgtAzJdfAyW0Mh94OEhFVmKrAQp+x6O8FdQeLdqgNBNi6CWNq3H0zy24XHJ2MpvgmtIvfZM+YP9VBhcW0FDGZ7qefhJFj+EhQiJcnm7MfyoTfbpObGvs1The3Nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0QvydZZ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0QvydZZ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efd855adbso3513759e87.2
        for <linux-clk@vger.kernel.org>; Sat, 17 Aug 2024 02:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723887969; x=1724492769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wog6RxrWQdPYSZMlgcH4rB8QP2t+UaAUqZpSk10hqww=;
        b=y0QvydZZyYEJmwRen460TbOhaTGX6Ajqn+cRjUu9IcwMNxirts+7W+XKZVjppPYPL/
         lXQtMtqaGi+FuGZJ0FyM1Y4Q30hMehvxH0Bfi74tOO/Z1Z1RdcGiJDTYb0aPhxuRZfgm
         dThgnP9f3SVrQZRm95mJKjyPCkNKzcQJ0MiWKvfIdf/xJouluGhwQqiWynqfA3OLtyHk
         rGUYbHdMwYbbyU66sXU8wWtCha+WAkP/6FcNKaT6JHV6mfniGrjl6ynqMiq2UO+IkK8L
         EMzPsZ16JGTrNzmtAlCA8tqT68zT9SxkF9iwe0jMIimDycoVRkt6m77WhyJvlS4PYLdk
         VzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723887969; x=1724492769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wog6RxrWQdPYSZMlgcH4rB8QP2t+UaAUqZpSk10hqww=;
        b=iPUb1ZSaVLNbPGQIWcJJsiDc0QWpjM1lhNNaXIJEAox3FORbx6j7coJbMRQvJnmRbC
         8bEPvpDwv9FTdy6+/Fxr3PdU3K9wVYA3ElyaP5al80y/L/RLVcLYNCRBZZ45PaF1ETUt
         GWCv57wDB/2MInxXrFlslQlWn0T2LOMuCJiyFTb8AHt/w+5F5ElssX+lVGeo2H3M/XGJ
         FzxuByrfKUDQxKK5AR5hYkv96g2MeVcM6CSNkfAe4P4T9kGOoFugEGbEJg9rqvMMRmO4
         mljRckS08hIA1iYqdOD8rbmfuNiryH1MYHZCgwxA/IUXXZOLT9f2IiwB70Jq8aeLXwrs
         JsrA==
X-Forwarded-Encrypted: i=1; AJvYcCVKhAZdr9s1pjQf0hEOVPs0rTG6fGv84WQiofOY02K5LEl1cYlDmLPWoRtJdTw9PyWEDnFYmMy4HA1TCcWkHaPz5yl1BodqPuz6
X-Gm-Message-State: AOJu0Yyu0fsVpvQ6Ct1XPyGjuex8a52vkYr3ZQofM4W36O6iYGIC6Hdx
	WXrxIxwExEjz8wnazEGi/05cDqTZ3WSJfcla+KJh0dPcGleDo6ihPU+7619YJgE=
X-Google-Smtp-Source: AGHT+IERuJuUpU+XHOnVB6Mjkl8vgEL7ssVayE3dityP1pBDzL5Rj6MmNxvhvWaQNNpOeGGcTqhoWw==
X-Received: by 2002:a05:6512:3188:b0:52d:259d:bd91 with SMTP id 2adb3069b0e04-5331c6a2764mr3473051e87.18.1723887968567;
        Sat, 17 Aug 2024 02:46:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded2931asm97641815e9.17.2024.08.17.02.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 02:46:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: clock: qcom,sc7280-lpasscorecc: order properties to match convention
Date: Sat, 17 Aug 2024 11:46:04 +0200
Message-ID: <20240817094605.27185-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By convention we expect first "compatible", then "reg" and then rest.
Order properties to match convention and what is in "required:" block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Taniya Das <quic_tdas@quicinc.com>
---
 .../clock/qcom,sc7280-lpasscorecc.yaml        | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index deee5423d66e..5e6737c39897 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -18,12 +18,6 @@ description: |
     include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
 
 properties:
-  clocks: true
-
-  clock-names: true
-
-  reg: true
-
   compatible:
     enum:
       - qcom,sc7280-lpassaoncc
@@ -31,12 +25,18 @@ properties:
       - qcom,sc7280-lpasscorecc
       - qcom,sc7280-lpasshm
 
-  power-domains:
-    maxItems: 1
+  reg: true
+
+  clocks: true
+
+  clock-names: true
 
   '#clock-cells':
     const: 1
 
+  power-domains:
+    maxItems: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -57,8 +57,6 @@ required:
   - '#clock-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
-
 allOf:
   - if:
       properties:
@@ -125,6 +123,9 @@ allOf:
 
         reg:
           maxItems: 1
+
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
-- 
2.43.0

