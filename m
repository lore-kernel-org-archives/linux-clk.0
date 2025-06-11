Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925AB22D4F2
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623073; cv=none; b=oFuMsuapAo2NERjbysDZbgLzGQlRVU7QNv6LTlTUQUmu9Q+W/wm6ydYZtZAXTy3HKQ9SuQNYcUjjaARJxtSCkLA46jxTziFyqzI5kVCf4tWVMt2RUZj8D33kkBUx31+xrEaeS4cycPL2LHbt+yF3SiDxhh7NMyGQ085+zkMC3l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623073; c=relaxed/simple;
	bh=8kvFLEv/hykXIxvvHlFxYncEhD8VC0PQqlwZgaO68IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJx71WCNYhAXwNMINmNbx31v0vhCAYvpWpm3rJZXhwszeSYihJb/MGl+cEZsi4X+ALrvtqTRhINazCCiNBWR5iHEIerfiHv2pQP6qqHZPlf8CgCP+ZyypmBLyyjGgOM1eWbuD4MqAi434Mcwc7ntJ055NLGefqB/axKduaCBfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YhNIoPCH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YhNIoPCH"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2349f096605so74892735ad.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623071; x=1750227871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIz85jrszx9X2n7VJMwt6ECwmZMzZVLMduOipCTmFkU=;
        b=YhNIoPCHI27jgGe0L83ONZEY8nSfvRjg9rbB1JWZWWQaSYBRDlqfxpJx2DyCSNg2lI
         XoWhPSMqxljJH9S4ednZbFc2yBBNKJVm/flB34ny8PvalTMQ7mwMLJPToFhMzL4yncnY
         vcg70HtoQRuQyXck1ZkiV9OG+V/F+Kc9yomw4Ays4sBVlnBTNsfKaHwmeWzaCBenu7+H
         7JGB7w633l+hNpaR9udMRG9MStAtn66IAKGsAq7LDTu4hiJiNctfsKoE0x+gh+hlaRrm
         EoeppGYpsvZcdB0m2KYxzJbfpVTQSgcScSeXcVMCZg/wRvsgA5Ynml5DDrWxrUIqx5/l
         tnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623071; x=1750227871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIz85jrszx9X2n7VJMwt6ECwmZMzZVLMduOipCTmFkU=;
        b=Ax8BSrdaYFGvSx1secqvBrzyPCW23GFH3J74sc7H9qpde1aRH4Aq1OIJSpzdIVJscl
         opwK4/dGL1d3CfTZXL2UDwGEewbuPjNU99gsMNMyJj9rJ/8nvVZYwhh9WyEwuUsfCuJf
         nG+S1LIRdLkeveqEFrl59is4VATJIhcC7toJBskEQf2Hy+TRIHNP92+QWNAzX+G1AooC
         6W5yFlp/wTXmpxrJPvVCVvFADLxyT9gWGk6Bza9Qw8qlBuU35ZnfugAEU0t8ALZHxOf9
         582i2s+5uGid2hWAAfT/EuS/JOtNFXzmdL8R5A8r5BVK+1V7k7SR24rNmhO9xzHedigp
         xPUA==
X-Forwarded-Encrypted: i=1; AJvYcCVGeU7WwieGI9iCVlMFP3tKv5WK2pAUEurXcb/c9gO6H9/AfAzsNtTMI+QDlL7uomdw5rSd3nuQVU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvY66vdryo0VwkH6dGY8hKp2yyBikI1lKWK7T8YM8CJUKKjyrz
	DUSljE0HW+jMp8mwsjMRkPDNwWRFR1ylYpye0b4+V088MsR2jH8Cz+7q7KJy5kVAxPA=
X-Gm-Gg: ASbGncuWqIT/VrN01mb3+K5KuHZKHUnHCfH9f3CUt372kVuVuE4dMfbCcAieNsCc+x8
	oWD3vQvNxckOmIQ475ZYs0vDjmdCXUFYsvACUNodjgLohCH/qdBHGG3g2KJ1Ul4dd3/0eYxY5r/
	M/oGHZqrMgh4dZ3Y8E4tXBbQDsSEAfcrlfUsXG04PsN/Ywl1KI1QT1ynJvOcYEK+0orQSRPAFjW
	WO/NZrPCqKTntLkcpChF7/zqnA1p9yoLACxKfqFPlwfloqDIWlkhTCrO7i249IqdEA9z39HnX7g
	kXAZLe3oYhFxDyIKBvIBeGhtGdg1ByjutRrAyit0iXHPtJqZ30g2jOs3G3057HsndM/BhIeFrLw
	7Sk8jVMJk7NPN6KearqVAgqUsYULaC5y1FaQ1
X-Google-Smtp-Source: AGHT+IHC5ty5QP/q1J3Y57ZfLhayT8WeAP8B2wlbdhm3ivVDvErbI2rY6NWs1ziwWXlteWWsGN8o0g==
X-Received: by 2002:a17:903:41cb:b0:235:efbb:953c with SMTP id d9443c01a7336-23641a9a43bmr26770115ad.13.1749623070681;
        Tue, 10 Jun 2025 23:24:30 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:30 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 11/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Wed, 11 Jun 2025 11:52:26 +0530
Message-ID: <20250611062238.636753-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RPMI system MSI service group
based interrupt controller for the supervisor software.

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..b10a0532e586
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based interrupt controller
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines system MSI service group which
+  allow application processors to receive MSIs upon system events
+  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
+  event, memory hotplug event, etc from the platform microcontroller.
+  The supervisor software can access RPMI system MSI service group via
+  SBI MPXY channel or some dedicated supervisor-mode RPMI transport.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  msi-parent: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - msi-parent
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "riscv,rpmi-system-msi";
+        mboxes = <&mpxy_mbox 0x2000 0x0>;
+        msi-parent = <&imsic_slevel>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
+...
-- 
2.43.0

