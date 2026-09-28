Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5284F96C3
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628908; cv=none; b=M4Abq1gGUyHeCpi/38MnnZiswx0z/wtokfNryofEZPTqHWO0oqIaMlH2gJp/vCxR+keAi+0hxkcs04YjOgT8vM3Z1ySf/kuFefgUa6o0vsVHvTs9FFqvNsbC5Xc46INPPDVKpgNz4CZnf66LaoAQr3BTb+bdUgjumy0ANbC0ri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628908; c=relaxed/simple;
	bh=IetCF2iLNTqjr0dcd7lwVVmU5VHZQGADh8wvTdWo6og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzV3FvU5S446vpXCrsAKjLVu5ziYKCO1KaKzBwNayMmURISSm3u+cppkugepkGS7dsgkqvpbbQrTdcrtUTeJFrT6SyQdCEZA+fdiHXut/mxf06bKaor0k2T8cHLqKEnoFRmfk0Pom8e8UOUxhkIcKgLhOF60jyBqpcKZMRd9v5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OomBSJQO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OomBSJQO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso21587045e9.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628905; x=1791233705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXzj0ZFYh/jUSpJwEEvbFV0ZjydMgR9QhJ6OmvWu+pM=;
        b=OomBSJQOYVacvCDFa8wDC1pIfyB6RMLB0zbpJR5uwZXXYAynivWD+RBuLFbtcrmADJ
         TGfmKxoPPZbbK6uERlQ142yRW9gB2dBJ931PrD6t1EwftM+eJdMkdtbVl8NqhNg029MD
         jok3Zo6maCC1VHRLoNkJKr3Rq5peq6I3mF9+M8jzWooPBo4ORE3e489pBFGXW7T1y1vg
         dCTH57tJs+GbGOIoO3MPc01EGbYhDIsXxwHkoBXzr02eO+iCnC4XWbHByYOr3InhRxzY
         X4IJfKBIsueT16udoj3j13aPRBnZnOVWHdlYYi0a5vVUxsRXEU+TOapGNRdERQVvLVdz
         pAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628905; x=1791233705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXzj0ZFYh/jUSpJwEEvbFV0ZjydMgR9QhJ6OmvWu+pM=;
        b=VaRj7nWKe92O4jUZfP8X7nnbw7xsDxftF2I0qZw640fHkuAwHkabfcdrK0xVSGuo2s
         Ip2dx5mgD/f3yiFbnA9UeoVHu7yGAVQ5NtHlPSaQRwIj5iSElba87bwoYz+g9apWOvnu
         i3n1NLz1NFH/XzaiO7qn3Wi5Mn1Jc0d4ngEd16WRuzMsiM3oEdio72mBsk/ULnTzjMhy
         iUAWaCQhwRZ3Hzq9pX6gJpkqC5hjpllRpByznqgCs8vzabPxcVLyfmG2apV9SeS1yml1
         Bu1uNEkQX1FwXDk0EDm5EIcpqCZ/XBa8iy4MzWvZHR+Zx34poNC3Qx1b96jbkVKMUbcy
         FaNw==
X-Forwarded-Encrypted: i=1; AKwUvByWOq0NrUW4Wgot1Z3OzRZ/LWI4iR/tYAIvHDLMUCNYqwTwLDLC0q/OHij2CipYjDUkujWIT7IJsVc=@vger.kernel.org
X-Gm-Message-State: AFuF++l5Q1e4UXq8tjLE7kEMkCMYhdjn8vLgTwLOL0cyow8sKGV+Y/ni
	AMcfU5clFGrgcmLEDP+jmPMlPkVITwNLGh+KRuFi+2LBi0B4rImr9k0ANIqEuu1zukw=
X-Gm-Gg: AYBFou1lLF97mWGH3izCqY6R6ziHGomLlCrtY/PUljiwCzN7G8Ac5NImBtdsfW+HUde
	M590nyR08ArSJ9NSkF+0ais1gjTPTRWiZG0c53OjU+RX5qL5lVM0l3/izP+EtyINCwWQQmneS7S
	K3JMdk6KEhufoU7qOZnzwRaiSbXHpQEW7dwV5lR8gQgqqXkXsCmmFVMn0K/1omJh38weHmZNQKK
	aQJEbwhd3sZkwz4minQdHOderZ7D06RpU7ZgcnI3GMnLC/DKKpj1FRd9Zch6S6ucki66nVYZ939
	fSriqgmyXM3IWkbk4YDCn/olKrVA4wZX0y6lerziIpelUt9Wfq1a8ITomQ6I8TfW7iHkWIo+1bk
	pYdITrZC9sKjXjugknCCt1DaZzjFNZp3UTlMu9NdhLkI+Al52/mWIetPxc/UwKv00fE0zFiNIZ8
	wxV5ABZICqi9vNCMjqaMxavrwiEvDogFT3gs29hpXQ87lbFEDX0WkVddTHkjhEy4vmgrytiUWh7
	AdkdkbxotSxZiRg7SZ5lHgSp51Yp8vu9wiM1u0PTSVbJ2HgxLgb/FsYpfz6puVgf/J70Vtd
X-Received: by 2002:a05:600c:4f50:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a008b11c38mr44624795e9.22.1790628905176;
        Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 28 Sep 2026 21:55:02 +0100
Subject: [PATCH v2 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-1-717acef9469a@linaro.org>
References: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
In-Reply-To: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The Exynos850 SoC incorporates an APM co-processor. Communication with this
hardware block is done using the ACPM protocol, which handles IPC messages
for clocks, power, thermal management and PMIC control. In this
architecture, the ACPM firmware running on the APM acts as the central
supervisor or arbiter for shared system resources, handling requests from
clients or agents such as an OSPM. In this design, the OSPM is one of
several clients or agents communicating with APM.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Additionally, the ACPM firmware implementation on Exynos850 does not cover
all clock management operations (such as clock rate reads over ACPM IPC).
To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
called domains, add 'clocks' and 'clock-names' properties to reference the
underlying physical clocks.

Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines for
Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
specific PMIC child nodes for Exynos850.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 54 +++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 +++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..f9ef5645b8bb 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1
@@ -33,6 +35,20 @@ properties:
       appropriately with the clock scaling. The argument is the ID of the
       clock contained by the firmware messages.
 
+  clocks:
+    minItems: 1
+    maxItems: 9
+    description:
+      Phandles to the underlying clocks associated with each ACPM clock
+      domain. This property relates to ACPM firmware variants where not all
+      clock operations are implemented.
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+    description:
+      Names of the ACPM clock domains corresponding to entries in 'clocks'.
+
   mboxes:
     maxItems: 1
 
@@ -77,6 +93,42 @@ required:
   - mboxes
   - shmem
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-acpm-ipc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-acpm-ipc
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: mif
+            - const: int
+            - const: cpucl0
+            - const: cpucl1
+            - const: g3d
+            - const: aud
+            - const: cam
+            - const: disp
+            - const: cp
+        pmic: false
+        pmic-1: false
+        pmic-2: false
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include/dt-bindings/clock/samsung,exynos850-acpm.h
new file mode 100644
index 000000000000..87fc6ccc1d99
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Device Tree binding constants for Exynos850 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+
+#define EXYNOS850_CLK_ACPM_DVFS_MIF			0
+#define EXYNOS850_CLK_ACPM_DVFS_INT			1
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0			2
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1			3
+#define EXYNOS850_CLK_ACPM_DVFS_G3D			4
+#define EXYNOS850_CLK_ACPM_DVFS_AUD			5
+#define EXYNOS850_CLK_ACPM_DVFS_CAM			6
+#define EXYNOS850_CLK_ACPM_DVFS_DISP			7
+#define EXYNOS850_CLK_ACPM_DVFS_CP			8
+
+#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */

-- 
2.51.0

