Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7725A646
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695779; cv=none; b=Ze3DFCtJB9dNeTAn9DcRvC01kVLcIfss0rFhc0E7BhwC71JE/QgvibhTSyLYow5wZ1MFP/p7sN/BRb87xphJBggIMWCaYp4nyma+HrmHpM7ruWN+HaZ5p8lle0QaJyf9OQSbiaHJmew72kwqIcXsEQZZKyg9EkDUGWtVx+z1J80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695779; c=relaxed/simple;
	bh=vvd5aEr1EHa2kYCEzZk7/ahZeLh22JQayJGJfQ0Amwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbU+rtf2Ikw2+EVaL/a1UUognk65dZNLFH//wp+oRTzWN/66694c93u+LyLSXUoAEFRJsmESqF0bDkGexuaGtCGRWLH5KyG4nwLgtjiobH4ZZcN4YUqPM7vTneYIsSBt4wwU739S/LOJkmExVDx0f+1VmHqOZf4e/kO14uWOz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pC6Zhspp; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pC6Zhspp"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso3531042a12.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695776; x=1754300576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=pC6ZhsppemA/gQFcXJG5rYxee+F8x1yDCO7x4bhe1mftvUos+LnoGhoj4w67n3nkm3
         6IKwfOQqIbTJKoDqnjFpPli7oyK+gWz36i40oA446mATf5KFxA+6r+LyiGVzeEWfpK4a
         PLY98JSC+wyDgbC6tm2zwK0usARmQIquPEhMhqzMOSCAkEGtPtsd/DcY2aUGm26TxgUA
         YBDR8JwGTnNoiX20WOMVj4bFzzgshbcd8OsVdSKhhmDV+6nZ0Da0Yajc+kEQBz/6rlJu
         04xRKdUhKlGWsXfr1sG6Jn9xLcOvZGk0Z+QRvMz3rot0ApEum+AvpkhW0WPjX5q5p1JX
         G+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695776; x=1754300576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=neYs5fbACSNIeSxXa54IA3rkzDIpp+HoJjDbKs9caG4k4DUoZiL09INxbetsBMcoP5
         q6Ar7OO62YhkLuRra3M6iZmqShfKREQahApsD4AfkHvStKVt56err24bj4lQmv0W9bQo
         4MLfef6t3plPBsAb7tgpNnSc+wbVI540zHprfoWSWeLZS1KuFkdLRhNd3vVVxix52oQd
         sodbOkqNc6b+LslmigPuUqMJOKiP+eCpI4nHb+DkahZxy5KPwbIqyBThyimjAf1c9Bov
         6M2dRc+9tf5yfpYsVuhgh2SsOCE/sogUAxkJJsV4/yWz6Vv06S47AMYyiJ1h4b0D4A2w
         fGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP/2KlUGD+TJTo1yEitOu092wfZ1Xop0iTiJGWegefc5oB4y60rGMQZyrzEExUJHu8KmuHV9LjI/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YySnvb0/bxXUaRiv4spVUmWYrECe6v7JKK5XKjEaCNujwuH/Zqr
	xjtC8CNutiJPcasMcXgMt7A00pwW1z5SXJFaz+KyYwpbTskavwTR1TQgNcUZFGgFcz4=
X-Gm-Gg: ASbGncsg48+PE3AEQEtaKccAxzTpujwA56gguAInaM2dmXCVpm1FJy2vP2drPZyq/Oa
	CflunpZKT3tlHKE9hK70zZ09aPTRWPNGJZjQz/zOLIIEqMC93FL3CS3yWjkYKH8UHPYamB7PEEt
	gGvw3RCIq6g/CLwpmO1OXDr/iGBo5HGgvgeUXv9XkSIxg6RVUZfW0yqZTSj1x6PHGZuRcNlHX0R
	1cBgL5vCN+7DIdV1RQjc2BSif7E0ZYNZq3MauWMut38PRJb3L1GXHpcDo9dIiqrPxeCqrjuJzmi
	JYsN7DOvnGiY6LFynTtQm76azBKHhhL4jwWQeac/OQeg9levKDluy3dkvUWuvdUBhRgK1gtr0NJ
	9FNft4+avFE+OA7yBcq2VY8Hck6cEpYZyj+I6Xrgpl6yS6ZOed9PCUvwC/Lbt3ZmSh/jYmVY=
X-Google-Smtp-Source: AGHT+IE55WnQ+0hhA7deATb8trRi0xgCBfiD8wcO0VoqZffzpD+pSQGytlvo6enrgswNtFBESe1LjA==
X-Received: by 2002:a17:90b:35cb:b0:312:da0d:3d85 with SMTP id 98e67ed59e1d1-31e7773626amr16294249a91.6.1753695776305;
        Mon, 28 Jul 2025 02:42:56 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:42:55 -0700 (PDT)
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
Subject: [PATCH v9 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Mon, 28 Jul 2025 15:10:20 +0530
Message-ID: <20250728094032.63545-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
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

