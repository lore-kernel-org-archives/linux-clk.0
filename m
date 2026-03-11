Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4BE3EAC73
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 18:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254401; cv=none; b=jfCwZOBzr3oZXe4sYW/bOMlL+pOSj/vaJFwxM/rOKLGo4AAz0cfu5rgkx/xFqF52q4keLdXKk8Yr94CVOzj4Cjy4522rNuH1Kr1xKSO3MFC89ZCLmDFzkoSApFHfuV3+oVgitLXJYfPmH6D3aOdWuIY4jJHPaWLfvfK5AP4tSKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254401; c=relaxed/simple;
	bh=bOHPBQ0aYx6SAIc648QFt0cLdnRYKGWij10f0xB33bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMgtc4INDacNdO9IO7sJGe+ZYeqIjxyCH79lFzDuoKem8LZ2D8VBY3SurjGfmkIPtd48FctBo8cldBLL3npVIqkrkO7JaPnHNBbGGvHjDu9omOoYaNA/T7pG6wmOaK4BihdIliqG6BF0Tezbd2EQWy5/61uhChBGYrPAXLEsxyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii0BOMsu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii0BOMsu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853aec185aso1302845e9.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254396; x=1773859196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bqQzzLIz4/2pIlQmC2M8z8Isqupt1gR0Wb/uv4yzLI=;
        b=Ii0BOMsu7NtOBIAA5wSp9HFI/TZucg/y7U8VjdPQueXY2WkMAZHFnDjv+VRCcQX91N
         jL+3waHpt7T/A9VN5rejpjbAnb4mF9zNZOrdJyp1nznuE7GKbN+LDBC6MSIoTJ7DtPY9
         fcPx/PS4RSGxXUZ2t7keUqc8wSGBRH7HJ/T4sApxdWQo2Ug4tfaudML/bKIo7/qySl/M
         8fl7VF4etMQ8jmwSdyTN8RrRoM5uqICOcpwgJRD/R35qg2o4/INZizp09k+rPE363I81
         v4pDCdZCk6kVi0TB/yC39eEzJBGVh3yex7xKzXFDmpMZiQ2o1zrx2UYbkXP6BVGz89XM
         rgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254396; x=1773859196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6bqQzzLIz4/2pIlQmC2M8z8Isqupt1gR0Wb/uv4yzLI=;
        b=BYQUCYD9IX6fB76VZFATnFF4LTZ1DFnWNKaGOPC/XVN2+Hc3XoyhaIhVvoE/SoNhIB
         rBjBlK8Y3OYgXc3rqcVscK1LEk6NRp29rfHjfkwjjmxU8fo2Oc87rekwyIe4UcJNt+YS
         sf7uKX/nkvNMswXgDRXgQ21YGGrJ0WO5P5TReo0+6TwAnoapHRzYEqYcLTo8VhKfjmSy
         dntAlzwhH7k+SQwg6LWOomc8U24f6jOkHdDV+1Exy00bVezDDxNxo+ojdZdkCGE5A17Y
         Rks/vd4dyMaeaQKv36UZwokUzloUAA1fuMKCXo2dc6DD0e45QAVneb7I2PhUltjIs8sN
         VQKg==
X-Forwarded-Encrypted: i=1; AJvYcCXNIT3oeBp0SSbv5aXxsDhOEf9BfNm1cU96Gtome8X23lg+gXToJC1grCxYW67dP5ooOON7XxZB9fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTM9QOrWk4kLpyrhWirtfyYd6BpftJ2fyKCqS48ej2Dbs1B9E
	pId3ghFNWUOy2fBbTplNkJPUhiPfdfyB6O5j6lgEyioHsPyez7dUuy3e
X-Gm-Gg: ATEYQzynIgpmdJphKkaGQ6PGeRTxjZO+XBBFmx7SczC8bRdc4ytgfILYCfMlhmLC79x
	rLyzktNMMVu4Lxi+ttb7s2RKm5iTk0BZLo+bXkBGwmTxGLewbBaovX3YelOQ/2wXrOtOQ0SRmf5
	Q5yurDwe+F65GDhM8sNnNWXHpCkqG7SMBen0/bJ99Q5Bx5QyCELr+hgx4uih1xa11cdwHiCP+5V
	5s1RXH2ILT37EkEAOcvi9Rv0h+WHu5uB9x/5iyICv6UjJa8Dr+BTInceuPWG/c9r+SzO/vj3+Xx
	qTxaK8GZZJnVWE3kx8WwEpDnOIHl/+Gd42Vs3IxryNswtRBSnnDs1/OyHc9CxXY96EWOVkyNfGg
	UVhJkwIa8JYGneV3ncd3WNNtRft1U3ogE3oX/5bm53rpIWWreQn/iH1OjlHRk9DVjEI3PoT9mKy
	f9LJxpfJJ5wR0+wy2wOPMxN/AQWgamFLIuWcFp8S3vAbDVBoa0n6VCp5U=
X-Received: by 2002:a05:600c:8b38:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-4854b0be1b5mr64371825e9.12.1773254396189;
        Wed, 11 Mar 2026 11:39:56 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 3/4] dt-bindings: clock: qcom: Add CMN PLL support for IPQ8074
Date: Wed, 11 Mar 2026 19:39:40 +0100
Message-ID: <20260311183942.10134-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311183942.10134-1-ansuelsmth@gmail.com>
References: <20260311183942.10134-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Crispin <john@phrozen.org>

The CMN PLL block in the IPQ8074 SoC takes 48 MHz as the reference
input clock. Its output clocks are the bias_pll_cc_clk (300 MHz) and
bias_pll_nss_noc_clk (416.5 MHz) clocks used by the networking
subsystem.

Add the related compatible for IPQ8074 to the ipq9574-cmn-pll
generic schema.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml      |  1 +
 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index 3827cb9fdff3..de338c05190f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,ipq5018-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq6018-cmn-pll
+      - qcom,ipq8074-cmn-pll
       - qcom,ipq9574-cmn-pll
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h
new file mode 100644
index 000000000000..354258a481c2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ8074_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ8074_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ8074_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ8074. */
+#define IPQ8074_BIAS_PLL_CC_CLK			1
+#define IPQ8074_BIAS_PLL_NSS_NOC_CLK		2
+#endif
-- 
2.53.0

