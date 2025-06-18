Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968FA2EAB79
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248952; cv=none; b=IlQBVO4+OLA+SUXLXnSQtm4WEMEZfuUrURPA3pGTlVgCt5VrKwX91i8NRVHYkS4oC44d3Y6Gk4QHydRLw3fUFc4kMLhNLzgQxkEqkI0HSSuXP8Q8Hn8YlMB7JrtB/JxZ9/3CJ8TciIx2g2Ps281yXSFXlKU6dK5rLbKIk+587iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248952; c=relaxed/simple;
	bh=vvd5aEr1EHa2kYCEzZk7/ahZeLh22JQayJGJfQ0Amwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXXTiOBzOacnR95MENLN3cOnwk4agpEfnpuYjDAuiCUdakeOqwsPJyMjQHuP0qk1ZAae8SDrlfo7wCo9Ped5B3LCbQxFtySkIXJSjWfdveoi83cZ3CY8mXIN6CvdZqyAGU+r4Ozpe2WGD0PTuGKlpzZNAgp3ZwvRo9B7wWzfTyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jj1XWjsO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jj1XWjsO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74264d1832eso7629969b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248949; x=1750853749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=jj1XWjsObftt8ntveRiOwVOvqBJNSoS3uzmLTGuBks0NxgcuZy/FhSkLdrKVeQn7kE
         XcA9mK9cvHF2kgze5TC64In0EToqQbmLlw0i0Fdol0RA9GFe7ud45C2ZjG4oZoofXJIT
         XSriXI/SJMOzT0LK2VKx4ykl7/Rl4qRbf4C8eQb1VnP1qRVgpLgS5KYeyjD5vQkvxmxp
         BbcttEKV8UFe/8ep8lBJyqlE5xsoR7qe2rN0gfuwEKzxDaRJwHI/K4dbfL+DQSxUyGsx
         6bKb5VPsuwYiniq1ByaKCEi8vqtMHNiqH+aYWKAVsgFFYEBlv1aZwDYY4HPEhknHMvAP
         GGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248949; x=1750853749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=gCZgki9AqYkjr2ee0avqQfwtZ+A7gseqCaVAJhKD1kT8SPO0VC243I+Qgwt2eoqJmd
         O1pRy7RRuN2cM5YdAe89Of1VpDKvNU/44H9yhbCn+IFcNKILqzn1ONYzff8D88kOROgs
         ALErXUvSjYWXI7qpLqImOnlNuJCyawJvhTE3Ol1hjAH/fNqx+WhaLe+ZTdNI2stMH/bq
         /LQlxliN+222ONZOon28crBK7YiyRxFaz1LYmyjX1PQ0D8LayZm/uR/g8bsu4GkMZ2PE
         O6b0k6qwF+zosqO2n1uSecprUMHmaWuq52xy5JLIlcEXDEBxgDY/f3Fz2kAd2ekFnF9J
         XjLw==
X-Forwarded-Encrypted: i=1; AJvYcCWem6yZysJ0liQMtXkNbaYlLbGgCMbqvgyrhe4svhPq0OJhybDOP6GAkqWkHVlC9M9zlJz3kQjk60M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzycr727zMaCXqzH5HGmB5hEG/T4HJGhSTsxgRax5zFPsLLGNLe
	y8O8zrqmQ3q5GbpK4GZk8xZXq28pvyob/VWp4YXRgMfR9M3nGpNe7f8aFA8urugXN68QVdfXMpn
	KR5YA
X-Gm-Gg: ASbGncvxQHK4RmCdfQ2CxJJ76RhAi1h4aGHL8BxpIU4gwkcf33IXtC0sdyd+mXlSjf3
	GB1xEL0hbvn3lQR5GPQXlbjLi2ONH505/ZBU1dzPRd47rPa+0I04m0nOjCML+jUSV4KrLbWqkNM
	WUPohPl/CIqkQKWQ9848wvTDmSfLS7ob3TYzTnpSGGshWOR/hRsULdawgYibHpUGPQviabH1QEj
	6u2/mVcP4Df6Wpj5DFXMrUFWcVx3l1egOGTnzs75EY5XY6PaA4RA3gtR0j5JGLiLTKVy1CArre/
	VLAmXDDqMfnMZdHSqWym+WJbeBsDOoPxlxdSCwKYxbCoNjtcDdDgK73NOWDp0yARuDn8hOrnVyk
	cP8cuklhocUjl1mDzuQ==
X-Google-Smtp-Source: AGHT+IHxs4vjlsnXTSH4C1JU0OK5uY0YpaUonPTvMCQRhAQ03vPs2MAjvWgsEbCbaT+xabScrZbGxQ==
X-Received: by 2002:a05:6a00:9093:b0:748:de24:1ad5 with SMTP id d2e1a72fcca58-748de241b48mr6070569b3a.11.1750248948709;
        Wed, 18 Jun 2025 05:15:48 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:48 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 11/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Wed, 18 Jun 2025 17:43:46 +0530
Message-ID: <20250618121358.503781-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

