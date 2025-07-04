Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FF4274B4C
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612797; cv=none; b=IjD+oKpDHlfzk/K/9l3NheK6N1w9rYU6wG4Jiau+NeXc2x4zTFoJq2nFb4gS91wGqtaubGxhN+2gKi7LzXAGB7HwpRXELgj3K1Pvdz0kMY/S/Lfs33CNe0OShZwwNuOg4/1UjPbcdcyKjOWAERegQK4/PcQTd/j/ixEULpIWCa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612797; c=relaxed/simple;
	bh=vvd5aEr1EHa2kYCEzZk7/ahZeLh22JQayJGJfQ0Amwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/9ZIu6jEdTcL6DOiQElCIzvYf+8iQMSj5jYM+zj3atv5nXLq2qOoFaWyvLzBKJes6IExjwUaWwYT4b7ar4mC4ZQzcEJfOvWhHQUAQ0V8wDTI9oouQj12aAmn2MVyJhhIxS6cxufbD2ECBNFBkHgPBn+dFWf7BvKJ9KF4rHbyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Fz7o/mM2; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Fz7o/mM2"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso583198a91.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612795; x=1752217595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=Fz7o/mM2h6wHFr52IKi9GAm8AHNjyqraj5dYG5FGWOJvO27kxOzYrybKpmooljv9c+
         pFMFuFt9P1xTQ7H9WPJtCKm3rEU4BItOM6vtwyqdXLwIneGwH7XFRUQca+IriU2LyHD0
         42rauiw30qO6o5dpYhTUbAmvHEZY09kLW155rQKioyRiHQTEDez7P+UVQZhJUYFUOmj9
         RIn83CiMI4FOFEHjdHGAC0q+7gYFRyIKBPoeY44FNubot59YfNUdEuxnRtaZoWLvPRsQ
         7XOvszfdvG99kepqHsUzFfS1tfj091yHRwV7UdHoMo2h+gnQPSoI4DBEpQvaTnGyBxb0
         5nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612795; x=1752217595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=aGOLYFCstqOxEFrl9E/Uj9aHet9s9kzUmYLnW4vCk/dghINEQZMOuDOJQ8QbcK4mln
         791MUe+xcRUKkOfZat6X151onKONmA3yWIDT/DzB/wdK5CB5euhYaDdWsY8sYBu5s5sy
         XWStUzqrFT1bAOnYpz5NNgJmk89SagtAcTsM8dOvDV+TTpo83RPsb5NOpzxVXxIGW7A4
         6Y+R0tGSxiSXO42d8fo8hrDLLm8UY/Ykhrxc2qcBJaCXW4WV1IcdbuFlhxHRX13/K2fG
         ktfgxj1Et5+kmM/cn2p0Ae+qfb8ddOu9OFC97slZfIU/lHiBSKhPd2Q0MTGCN4MtH+rR
         nJfg==
X-Forwarded-Encrypted: i=1; AJvYcCUK1yfhtZFWNgzAbg4Z47fSCrTqZzmf7IlaNQf5OFl+4wuYbfffmI6iD+blxZQJW0txwLgU41CoOLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSGKwgEUoItLW0L+ARt4Me3NcgxpV2Z//eiQFqp8xRpI7C54e
	3egX5XZyd82HKx+gLcB0c1d/z4DelVBJXx5ib/C0JlcgUlAfIUenwpZ1SfDEWM9PGIc=
X-Gm-Gg: ASbGncuAiIkO/GQ9p/FXRTkqpMs1n1oJzmxCjVBdxUiYhya/NoDpQnFhw/TbPAY6yRJ
	EgdHghud8oBZbmwVh1027nN+z3DRsRABJp47QR5xzVvs84AIxeGxNVxpGZhMNs/0chNBEsJ0WHb
	gz/VR9NrFEAILqwgX4tgTjb/PNXNWMiMC6wdQ8vYG6JTv6eUDFCaGJFC3ZJy0GBlMM/N9mljd8C
	hrEg17UyOSd13J7hiI/sQBs1AejoB/0Oe2YTIesshkrr6rV/pbD4OmazRifrno8kQGIPPq/O+7r
	1SvyC/BMMwW7ioPr345bRDjMqHQuc19unTT2CUFP+5RWQ/DUr3goDaZH5/yTMZbeTqIIIW2QZ1n
	2CHdGSsdBzFRsDxLdPt+AHbSHeQ==
X-Google-Smtp-Source: AGHT+IEAV0Fc7OQ+p+N3aeKR4hWU5j0k2m9hYRe0Cek5o/FhAH46ghV+wLUFg/vBseqqFoDBfYSrAA==
X-Received: by 2002:a17:90a:d40b:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31aadcf4c5dmr1655175a91.8.1751612795169;
        Fri, 04 Jul 2025 00:06:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:06:34 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Fri,  4 Jul 2025 12:33:44 +0530
Message-ID: <20250704070356.1683992-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
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

