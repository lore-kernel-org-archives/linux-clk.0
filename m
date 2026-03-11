Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11083EAC62
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254399; cv=none; b=aa7++FTK9ahU1tx64w8BVEl7BEbwc3Rwkjl6Z5lELm3sVe5ViDzF75khyh8DtJRIj7fd5iTe5PvJ0he51inNlwM9Rh+3wQKcb9Iz+4mEAYc1G2cx1B2YmQdGegbzJYJ0MRDNWBoT1F5LF0NUjRjfcR7vEENRNgyQ2mpA9dADVgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254399; c=relaxed/simple;
	bh=lrGDoJIvEkpE2zwVZAdPXIJFuUAnlEGbHR8d+YDnzFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JfhTUmu7RxZ6+5UqKDPVr4vVob9RBH/XN7J5VCdDO8UAxxp6McCUx3c0Azt57LXDWGGt+XfEAwhqMNOf2pbvtwea5e4/ZinYHHbw5d4o/sRSt34/SpEqJnaoWrUZvkfTlfPNr05RJJfjinZQI9T+Est0ak4dZWzrnrgHgVqOhTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9RkZO3v; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9RkZO3v"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so1766415e9.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254394; x=1773859194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUyetPRGCWNiIDdvvCLAWBXfwDnSDbUudDfLRd5zU4g=;
        b=h9RkZO3vr78Pq8IWHVmTz2vzzyODAAbi7cjf5PGaJNfDNHQ5lAYOoph7PuKSlZrN0y
         kCI3wZLVMgdHCFQ4Lsl2Hl3ssk5bDyJwGFrif3zA+KD+ou+fd+qwtKwR4rug4oJOrdUW
         PjzBf1psgrmPqSS0nF1EtVy+D480iRbYAMEstsT+323tNv06wrrDvEQCkMJpu6mHw3jo
         7I7klp1yFa08gbomItuicuKcVOcDT5fsGm9CS5brTTC2Xd5Kxeh5qXWhPzXujwRMf3r+
         EEEnC64JBvxSfNc/GBr1TeVFEGujpzC0DmmhwIWMwI3n1gzA/08IehEblVbwYW5+mieQ
         GunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254394; x=1773859194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUyetPRGCWNiIDdvvCLAWBXfwDnSDbUudDfLRd5zU4g=;
        b=f7VtzFAXrGNMoLu9vS9cS8vXx/SlezTvIoQvblxybuC1uz5LkhW5Pj9lyiuc8gQZSf
         DZP47/2c55D88Nm4MsKGMXMYV8Z+B7gD29KAyDMIyPIw/E7k+ProiGiMuBVIuTMnaV2+
         wtMMeQlhnxN9tO6XMZjUIEIudbMXtFSlrYmT0uhCFYUSSEPdx9S7QY/bwRsxT1XqU4p0
         qzrTsWHLv32R0nezejTXEyj4MkkWcpEgfDvV33riI57rUmjP+DZe1yRz7zUY/woPnO/a
         CTgolGccrw3JLuHrAV3DERIsUCqcnMRuWOv7+ynUvawsRkwUwARB51IVTrU3KxwMz+AZ
         CyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpLRSzbW34h2whx250PCii8aH0N60qus3qAHPROG1SfHxJH1iiYUSISZRKIz0qkgC0T6c9N/VPAsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrE6/604DlQ++RqU3oJ1NqMd17t4km0ap4AclClEh3+HJ8hl8
	xU4xDqKN863W36QkSiVzD3USbJzt4MNC3Fr1zGhHnkP/ZBsOfYHchgy5
X-Gm-Gg: ATEYQzwiCmV/sW7ZnUUqv4hVnpq1GyXAWwnve1igOcNhIjrtchFweh/2dCDnhsaNCo9
	vItbA1hefbBciqxsDbfn54Xm25K9TgJPZNGbELkTEFEkQc811lQrOSArYaVQAwVe6ykNCD9Qd//
	VRYHk1EYQO1b4Wjy+UY2dXiPn3d4egDooSUwWW/0myWeFgqyi4Gx0uun2FXNDDL5bJli0VwhcWS
	05ohmbV/Sl6A1L36E5JDHLJFkFUBmbIjPTbypavJmxWe3j15tAqn0ejm4OCNQqDl4J2Nmf0JMZc
	mWaWNXfHJkFvvEyVGxv4bB7E9DSk/n17S4hDqAFTYcEo3GymiNv8ebdr5bDSQnDjmPdsMll/Mjf
	IHWVcKda7dVPNHc8jcoiPcdE3L4+tWDfB20wtYSzIIAeQy7iK62Rsi4qunq3girdA0VXj1KTogJ
	a1FYW1cJJhO7aUQ3mOWSh7pEJ4k2pqzYwfINX1ohJ/kFxS1cUkWn2e5ls=
X-Received: by 2002:a05:600c:3b1a:b0:485:34b3:8585 with SMTP id 5b1f17b1804b1-4854b0d6ca4mr69627935e9.8.1773254393880;
        Wed, 11 Mar 2026 11:39:53 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:53 -0700 (PDT)
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
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for IPQ6018
Date: Wed, 11 Mar 2026 19:39:38 +0100
Message-ID: <20260311183942.10134-2-ansuelsmth@gmail.com>
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

The CMN PLL block in the IPQ6018 SoC takes 48 MHz as the reference
input clock. Its output clocks are the bias_pll_cc_clk (300 MHz) and
bias_pll_nss_noc_clk (416.5 MHz) clocks used by the networking
subsystem.

Add the related compatible for IPQ6018 to the ipq9574-cmn-pll
generic schema.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml      |  1 +
 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index 817d51135fbf..3827cb9fdff3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - qcom,ipq5018-cmn-pll
       - qcom,ipq5424-cmn-pll
+      - qcom,ipq6018-cmn-pll
       - qcom,ipq9574-cmn-pll
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h
new file mode 100644
index 000000000000..28d325beb073
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ6018_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ6018_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ6018_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ6018. */
+#define IPQ6018_BIAS_PLL_CC_CLK			1
+#define IPQ6018_BIAS_PLL_NSS_NOC_CLK		2
+#endif
-- 
2.53.0

