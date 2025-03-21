Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43611D5177
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568353; cv=none; b=JVyYrklbYq1qJUmcAk4Yh1PFrZ7b2EWOV4ASHtDO+jx909VVfPeQQWuJfqxJ+crwfs/ioVoNAchz3E6uhSfGoPI5PhaiqvfdKacNZaCqLWX/jILhhNPRWMF5E/Pa83flkpVN9UeX56J7Aeu2udPMVG0RWItdYB6vp9jC2icDs/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568353; c=relaxed/simple;
	bh=GLAsUw1OONraXoc4O2AxkqLiMT4MdPKRGHr5nbrSBI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yy9zS3abRH0XdyRPIqXgZxcrpmzsbfd4gyvmox9tCR0NGdnq1UIoP4yFPpntZy3uspGiJalCL824ySLqv7naD06WNOgJd7AINuCH+nURCU/qJwwPBcVN4v48tNg6+I0nUywxzjfGNN2IFBy4uiuW6eylNNSsnloMXx/p7lh4Lpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rqXRScU2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rqXRScU2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so317173766b.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742568349; x=1743173149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHERlL971lhRhRNPhw773ZN7phaB0MazKYjf9mnRkOo=;
        b=rqXRScU2DtXHdaciscHnD6KSOKHbxpgIVAGJgAVdUyoF627tNp+VP0sjIqJ9I74l1a
         fYdxqhF2wgbIxtXKgDtPcqZ78D5opVnyAE7wy2d3s3KfWYlvprimXVmrOadae74kxiiq
         9ojxWKaJD4PoBvNHZsjXE5O8yZZNPjcAkkJLPrXsJbNTDd5gvl+itlUxDeizIlTRWvA/
         H3qSvveniv5qWc3UNGiJMCdKNCnod2mVjiI9oTZ2fVE/TdI4iRK9UGg0U1IpbL1F4J96
         cf4qPO/XL31S+QQ8m09L1N0VpDj2SrWcwo0KMb3ctG3wxIXtzr9bVhseh/x26ddvSY8e
         1AQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568349; x=1743173149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHERlL971lhRhRNPhw773ZN7phaB0MazKYjf9mnRkOo=;
        b=pnvFYG9edfBzHTDMHnyeEv3B7SZdYZO5FQyWQDjvl1HJ0T0ZbzL+kCQhCks6B95GUX
         kyHdUGynCjLptsfpOmmxcbP7K3aVFhr9njMDYkFwkIvKX5QhKUYJIKz/Su/TAh03K2uN
         IXnVvsA3RuoAuUOpVNQvMQuMbTo7f0Gw5VzHmKXnBgaUOIteFZtVH3tQbU9nTbF5UKpW
         uOPCeFh4VBGueczFU3zD81MxtjshWn6o+waVwALBw4NdROaJGKCZmPBk46NjMJHb07Z6
         lFcjzjyh+nEzRpHrMUrwRQvQMyjygHXLXP4oj5+G6TMX28QRSO6mzbkTosQ1lDtDxsEe
         clIg==
X-Forwarded-Encrypted: i=1; AJvYcCU3TDxDnBEaQpxr9EJaQGXijPLfcb/s1huajpqBO6YWcEMoWNO4jc/7zDt7qqWImO8z1y8MmKcNvUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMfmL+9Nwl5dtKfEGmB5O2/G9qZsxOZVvHZHMiUukkjps+ShC
	Vhy0fvq37YlCccdx+rvhA1vunaq1gXL5TvhB4kZtZIgXIPXzn5iTP7QrcNX/oec=
X-Gm-Gg: ASbGncsQ/GhRPbXgte3/qE98X0vTApaRD2e7rUCpjCTDhNMAU9TcPu/UObS+NRZpr4i
	05Vt8Yp745ZvEiBnFeCavZyMkVei3e0KpZRPIzL8OuTL6WxfqlfWTRbAly8PCs21c60LS0tz6oH
	Fvu9s3z3qrEGqdWVpxLBHJDOzi3ZKbaMvkI3C3Q1Ycbz6YPnx7nvookTqdAJnWsx7U1Xo1E00tp
	rirOrsoWuC4Wl3io59NhHIe6iwTLisIgH8KZ277fyNkW3DUn2siM6Seqj+KpKWNetC7sXrZwa23
	KDrXC1BKNWPxGvl2uzxwX2Xb12WRNjzSKk5bGRRV0kYGFd+xrRfkSmw2QGcGIqFbd8LepEKRbJt
	/x1ixuzwZlqLCfXozPbD8OR0JyeZH
X-Google-Smtp-Source: AGHT+IFqAX43/zq/hujHzHnH37P90RVIE+VluZyGm3/YhAvwrRM7pYjzxeNBMWHwFGfVNM0d7l7R3w==
X-Received: by 2002:a17:907:7f8c:b0:ac3:cad2:9e53 with SMTP id a640c23a62f3a-ac3f28053b3mr412540766b.55.1742568349002;
        Fri, 21 Mar 2025 07:45:49 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb648acsm168092466b.98.2025.03.21.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:45:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Mar 2025 15:44:59 +0100
Subject: [PATCH 1/3] dt-bindings: clock: add SM6350 QCOM video clock
 bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-sm6350-videocc-v1-1-c5ce1f1483ee@fairphone.com>
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
In-Reply-To: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

From: Konrad Dybcio <konradybcio@kernel.org>

Add device tree bindings for video clock controller for SM6350 SoCs.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 ++++++++++++++++
 include/dt-bindings/clock/qcom,sm6350-videocc.h    | 27 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 340c7e5cf98024dedad6d7db4fea10e9f8077419..5f7738d6835c4ba999402e163fc85a07e3a47a5a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,sm6350-videocc.h
     include/dt-bindings/clock/qcom,videocc-sc7180.h
     include/dt-bindings/clock/qcom,videocc-sc7280.h
     include/dt-bindings/clock/qcom,videocc-sdm845.h
@@ -26,6 +27,7 @@ properties:
       - qcom,sc7180-videocc
       - qcom,sc7280-videocc
       - qcom,sdm845-videocc
+      - qcom,sm6350-videocc
       - qcom,sm8150-videocc
       - qcom,sm8250-videocc
 
@@ -87,6 +89,24 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6350-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Video AHB clock from GCC
+            - description: Board XO source
+            - description: Sleep Clock source
+        clock-names:
+          items:
+            - const: iface
+            - const: bi_tcxo
+            - const: sleep_clk
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/qcom,sm6350-videocc.h b/include/dt-bindings/clock/qcom,sm6350-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..2af7f91fa023bed469bbb2c071d93383dba29441
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6350-videocc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM6350_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM6350_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_PLL0			0
+#define VIDEO_PLL0_OUT_EVEN             1
+#define VIDEO_CC_IRIS_AHB_CLK		2
+#define VIDEO_CC_IRIS_CLK_SRC		3
+#define VIDEO_CC_MVS0_AXI_CLK		4
+#define VIDEO_CC_MVS0_CORE_CLK		5
+#define VIDEO_CC_MVSC_CORE_CLK		6
+#define VIDEO_CC_MVSC_CTL_AXI_CLK	7
+#define VIDEO_CC_SLEEP_CLK		8
+#define VIDEO_CC_SLEEP_CLK_SRC		9
+#define VIDEO_CC_VENUS_AHB_CLK		10
+
+/* GDSCs */
+#define MVSC_GDSC			0
+#define MVS0_GDSC			1
+
+#endif

-- 
2.49.0

