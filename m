Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEE730BBB9
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726675; cv=none; b=RCpxtXVS48IRDFi3ovI71bktsyxilAB5/8cg+r71nLg4br/G3q0d8M4Zl+LDLo4iVxwpZ2aIGJMyUxSMtug2lsR4W4zVu3B6bnTUrhQ81NJtVnoMGK+GmXvKwWMeZKBSQnbCzbECPEhlcQIRFZGH6hmWVYvqS+gLgjhSFi23ags=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726675; c=relaxed/simple;
	bh=NkT+Yg9cYGQ08mwihOyEX0wXQkJh1dzuD63z7Z//UsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lrj0iezANgZUERsIOnR8xe3twhWrVp7i8fZstlQMfnFIAr5oW9D8hg3XWwpaK6TA1b1KyYVlObRjGSSYldPYNaEhRgx/xSS3DlW80/+AOHF7p4h891Zax+rRHOUaGg5AqpUTjSMagG+W+ZohS4iteC02bO2aTWYD/Nn6EWG3IIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZiaUoOg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZiaUoOg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so47323355e9.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 08:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726670; x=1759331470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09aADhRx97hgFBUXBrs2wpmXKNGHwu9T21ONWFuPPkc=;
        b=uZiaUoOgZ0PmSq5Wyx++wurn8P+av3N2E/ggXwBxvyIL3Fk09sZ1h7+5JWrqm+BF01
         UJTdyfK6cXWfAxuPCKJSN1wWtDV4aACVsDNqfm/E/qOJl8tUCs9pTDc7jC6OPSLvnGOm
         lZzzdomIvjriVig5MGtCh3Mmwwk0cdFhkTDC4r/Ug2mYrIUIk8Xwoi5v8jh1Zk+gkaAF
         3TaAxFj+o/FfnXDP+XJPfS9kHkPB63vdOuWlqpegzRr5yoB5MsHrRDXOmvXCoeglLrCQ
         piCJVqNkQtdNzG4oLNGGnyUprRvv36F/PyiZy+wXIDhVN//KVTNrEnTu9quyANR84oUg
         2Fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726670; x=1759331470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09aADhRx97hgFBUXBrs2wpmXKNGHwu9T21ONWFuPPkc=;
        b=pI78Wp0wDaZRXdsrz5f93CjkS+MNt33G2N7eAFBQy+jqALEaOgCj6j9PkK0xe/y/OW
         j2L3Bl0DIpw5omIIc1BLuQDE2Oh9lVPXk2LxMqnPCQce2+Ndv/cEopinQ2eLOabaZAQr
         NxPI0Pi3xHgibi5PTXoGvPnWYw0J6MGPSoxU4jKniaiWC2SEfeq6DjQh0ylqm1qCstli
         ctj6qfMYlew/68BOWBHL/q+/AL347QDcfo3AQUX4yZfWKKr1Pk7mpkCUM2nZlWjCfVm3
         aFeRYcYf55kFFQ4rjz09c39WYgFB6PvgmUMk1PcKz3VfW8olcHCStOtGhcUqTTJFMJIL
         znUg==
X-Forwarded-Encrypted: i=1; AJvYcCXLulFGuIINxpvbwRAW14bRKnS/tN/VSsiXusYLynS1V+Ljrso2GQFWcEwAPVyAyAwQt5hXIrfou1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9A389xXEa0OH1K22k2OvzFgBYV/ra34MvEdDQo7e3n4sR1w14
	T1kmjjyd8YXDZg8T+N2J5ejwapbZkEEibSZjoHyz3c06L1HsLsxW6g7S5eRlL1dBl7w=
X-Gm-Gg: ASbGncs7MmmVbNn2LCR5pNJLB1tcqdUkWuGJ7JjK2RHU/TNtLXdYOqaD//Gj2CO36sn
	HaArG9v20w5EIhb4U85CGd3BuTvrBWuP+MF6VpuIhOoe3OSmOdk99ralzOms5FDBhbRHDBZkTVU
	IKj8WethUDRbFa5Pjcc7ZWGm/eVmDHDtr2wzWXr61Yoz8OPC5wobfdKpyG4wgWgv2NbAlxTR4T3
	y4Vx9WpmXlV+1tMMBt/cQzy2hFespEX3V1zNKDVKVFZBN4u1FaO2BfPpWJ9aQav9wR/JNo/4zt3
	rvwUTIHeOVh/3X8jhAK83n588nmVFC66sHAmwnWrT9fL6Sb3NkbKwhfhdmKxN45nJe19+mXZ55D
	jKdA0ilEoRYM++Yni5hA42G4F+Ad5sKEfCLKDCVtMrsBPIDHfxPpg4vLDh/f9oJS/nV0z6+qR3A
	k=
X-Google-Smtp-Source: AGHT+IEs8QQ7m3gKJ792ZHmSzLEcZBZ4i1CTXbR5D1PZeV8nN8Q4fLpYid2Xg1E6ZQRkaWTb8EXBNg==
X-Received: by 2002:a05:600c:4686:b0:45f:29e4:92ff with SMTP id 5b1f17b1804b1-46e329e4e87mr2559865e9.17.1758726670313;
        Wed, 24 Sep 2025 08:11:10 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:11:00 +0000
Subject: [PATCH v5 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-clk-v5-1-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
In-Reply-To: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726668; l=3182;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=NkT+Yg9cYGQ08mwihOyEX0wXQkJh1dzuD63z7Z//UsU=;
 b=XV1rlGn+zByellycKzW8IPoG9nI0fOQeoVrNmoZlVgT6Gi5o6TgZ4a67vO6MX5vbPdR65Dv3R
 aPujGM0WjaOA27mL0pW6hLtNDiuiCIpedYIQ6aCyTj6JTkwfMz+UUXQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the
Alive Clock and Power Manager (ACPM) interface.

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference its
clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
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
2.51.0.536.g15c5d4f767-goog

