Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6330E0F2
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907807; cv=none; b=KyaHUuHh6Y9Bly/jqM86Koc6aJF7/bx2Q8s5KYXWfji/0nBYA5yWOWSPjokR4LhtDX8GqaemZpMobQBS07z/AQEpZxxiNDR4bQeONkZdqLfIj3MF4VSkXqcmr1bmRxVX9QZG3BHC4n/RiXh7f4CjBZGXZMlFk+B1yBOU5G9qW1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907807; c=relaxed/simple;
	bh=ZAh+jVEjk+p7IOugFLPfvW1C8t+Wsd6E695/908UhEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBF3WxlMdWZmFXQS9W+OtB7CtdVCsHXJpAst2SjMSd05F3YO88ByCztI9cX4EIITOR2/W2KIR+bgT3c9dt6V7sKoVR2un5j7oUcXmvWfecMhNPU1xhjDX7zutRzHMroKbGtyTMPwlf2mssXu1qNUALgzjzzS6j6BzRIKTkhiQng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PG7Zix3X; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PG7Zix3X"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b627ea685so55100315e9.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907804; x=1757512604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdN66op9i3NFpyozSjSkCRDl8+TcoAJ7grYzdeqCoIA=;
        b=PG7Zix3XLWyWOeBLSpOiXd6QypdNYxG3Eu4uskAN7Qo/HgNGGTVMjPSN9rMKtXsbMs
         aemI6LkC2vRE2vPkLlo3r4YZWX8d9DumxUEJD9RLgDtLEBNhdonigswYr4fSWHXPGWwf
         0f74ZnYa8cIVEKaUZiT0IPQbcMwzmFSZo/tZS9mzffqII3j0tQoXzTd55ftEiiwPTY+e
         G0Ph4Eyq7gspRHAljEFCBnKNWs0qIQfAc+HYZ4iKTpwBZodM6XH806GxZxiviPdzoRVm
         hBcSgLhUle91aDc7Atoc95Wb7aNqPcpPIU0RHpV15qp2zFEOWW3g3ESiucuQhwaxAUQD
         XlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907804; x=1757512604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdN66op9i3NFpyozSjSkCRDl8+TcoAJ7grYzdeqCoIA=;
        b=KMps8EE9FJo680QQlNmqkqu8kWcq/S6PNpKbRjLud0GrhD1M8Bkw4Bo4/cUq0PnHoC
         ZU2HKFqRrV50HELZJSKWK4uhwgl6nNrhZjLtqLELesSc8T7Xjsrl+ZaLeKecWJfjoU//
         TKuo3n1mnm3qXeakmKRVxXAVFI5qOedPxSojcsO0Y+oW0w3fxWq3bpLnTQ6A/ehhgKfC
         INBT7z+9pTle4KD5SoLdTxMqLHlxKWm2j/SuSbynbwtvooRr1D9G7BELmF/TsREQrHLT
         77jRiq5ZSTt/cvZWF1ODhPnj2rFieBW1HiUtU/p2UJa934l7XyCE5uRs3jLRSTnXHNe4
         auYw==
X-Forwarded-Encrypted: i=1; AJvYcCU14oMTd6UjQC3a8Nbktasg2Kyzjp4ehZ+nKzlOBe0YqaG26nD3owGK+GpACYxMB6NXVwfE/z7Fofg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5AC93HcVRVfNc9iptKE8OJKvswCXsaB/VN1Ujl//pTcI29qRB
	9wLKoymcnHqfRubyaLz9O7eEcQj9ZET5U6XFUaE1clnlqauL43NdeTcnE5ovG+mVU1A=
X-Gm-Gg: ASbGncs7pGWJYF6UDyNBjtrAKstkPf/BqldFP4HEsL1d5CSudj2xF/C2C4Wo6kKWEhQ
	xZMM5zOQzP68p2ttgMwSgmFUBfGBZEx+7A+RWzA66/Z0/xDDJmz1YpSRrT6dafRIi+lT3tvlpSi
	kwn7NID/gGC/SFzETCd1Wj/npyNkl+7I0PyhFr7D4ojryQZslYmR88UzXEFesqz5vOxAIOZR5nO
	aKOgeniLTA5xe/GMmaPxJvj5s64ZXrEGyiWgM9avj4639jDfFFsluTautjtYLjLZH3PcOalUyD2
	vACv2Ug6gpKoZIMUmiSmNu8qFGy4uLi0XrMyIDhWSqEPrS8cinGLiWOyA+mD2MYomMRA0yHIuGr
	4/1TjGPUkAtFSwFIHlVLJnnu6QkkX8alVHuI84j6eXxyVuqTuPGJR+lixCNODflvEhlD2VLhb5E
	wkwg==
X-Google-Smtp-Source: AGHT+IECR6paJMgzBY3Zw3h8Wf7Abdm7g6RlBanKKC46/zidpsFpNnDAQ1oCeBfUT0qxZEn5rcCT3Q==
X-Received: by 2002:a05:600c:a41:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45b8559b8edmr151397345e9.24.1756907804169;
        Wed, 03 Sep 2025 06:56:44 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 13:56:38 +0000
Subject: [PATCH v3 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-clk-v3-1-65ecd42d88c7@linaro.org>
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
In-Reply-To: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=3056;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ZAh+jVEjk+p7IOugFLPfvW1C8t+Wsd6E695/908UhEY=;
 b=LdelR0stuthQLZnXmrirVmjYcak2/o60K97PRS1iSdMsSt8ME/KFQNZUxXFvFnn3X+yQ10ki7
 84Cj4pTH5pdA4SKB7iyec3ofdfwJhKl3k+3XqAq5yNxcOimpT2VF11S
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the
Alive Clock and Power Manager (ACPM) interface.

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference its
clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 11 +++++++++
 include/dt-bindings/clock/google,gs101-acpm.h      | 26 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..d3bca6088d128485618bb2b538ed8596b4ba14f0 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -24,6 +24,15 @@ properties:
   compatible:
     const: google,gs101-acpm-ipc
 
+  "#clock-cells":
+    const: 1
+    description:
+      Clocks that are variable and index based. These clocks don't provide
+      an entire range of values between the limits but only discrete points
+      within the range. The firmware also manages the voltage scaling
+      appropriately with the clock scaling. The argument is the ID of the
+      clock contained by the firmware messages.
+
   mboxes:
     maxItems: 1
 
@@ -45,6 +54,7 @@ properties:
 
 required:
   - compatible
+  - "#clock-cells"
   - mboxes
   - shmem
 
@@ -56,6 +66,7 @@ examples:
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
+        #clock-cells = <1>;
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
diff --git a/include/dt-bindings/clock/google,gs101-acpm.h b/include/dt-bindings/clock/google,gs101-acpm.h
new file mode 100644
index 0000000000000000000000000000000000000000..e2ba89e09fa6209f7c81f554dd511b2619009e5b
--- /dev/null
+++ b/include/dt-bindings/clock/google,gs101-acpm.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Device Tree binding constants for Google gs101 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H
+#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H
+
+#define GS101_CLK_ACPM_DVFS_MIF				0
+#define GS101_CLK_ACPM_DVFS_INT				1
+#define GS101_CLK_ACPM_DVFS_CPUCL0			2
+#define GS101_CLK_ACPM_DVFS_CPUCL1			3
+#define GS101_CLK_ACPM_DVFS_CPUCL2			4
+#define GS101_CLK_ACPM_DVFS_G3D				5
+#define GS101_CLK_ACPM_DVFS_G3DL2			6
+#define GS101_CLK_ACPM_DVFS_TPU				7
+#define GS101_CLK_ACPM_DVFS_INTCAM			8
+#define GS101_CLK_ACPM_DVFS_TNR				9
+#define GS101_CLK_ACPM_DVFS_CAM				10
+#define GS101_CLK_ACPM_DVFS_MFC				11
+#define GS101_CLK_ACPM_DVFS_DISP			12
+#define GS101_CLK_ACPM_DVFS_BO				13
+
+#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H */

-- 
2.51.0.338.gd7d06c2dae-goog

