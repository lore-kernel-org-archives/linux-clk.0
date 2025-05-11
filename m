Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C162257437
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970899; cv=none; b=nwHnqBLeSCad+4U1hQQNltMtcdaxz6AmMyjWYzybcZF18YtdeJjwxzXCLpsPIploQ035oAZMDmtU0U5Xhi6MrcXi/8jOQFh/+4JFYt5i59w2rfi41d/sgrlMeKHE7W77hCrjQ6GfQVE8GJTRMWSehxx1IKKD3PRz+5y7K1fWFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970899; c=relaxed/simple;
	bh=NxBFGj+cri1SvClLb1edobZ1wrGwRBkx4SOQ21bAQOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNyT8ePPDNcPJYrHFa6/jEqE2IrloSbxyJ1r+GKHtU5HA4fxNc/KjG6nun6WEN7XuzzLhPrDRbCQBAGiIUeYpnYJFeBHnSTGG59PlgWZ4/0dYbelvA7uQDLBlyvq/Tv03ZqiA337HmcSysOUsUZotbv+EfYnLloe5IB69TG+NS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Rrc80lsm; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Rrc80lsm"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b1ffeda9363so3510396a12.1
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970897; x=1747575697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=;
        b=Rrc80lsmtVoLHAuMp2yCVcoX+jT3h+8w8rFGo1uF01x8fopV3S5otHKUQCVHuyfCdE
         fiSfwW4b4IgYZhEftZUOEuUapoYK1B2k892LvKWuRFNuGFgp0PRlvLCVD1BnlRarDoNy
         yX2owwCNe1NxaER3+z7Lp4W9VNwtSFNAJ+mDlCrcZSkjqklBWqq6uC9MftZu0OeOWoz5
         Mvilppr659x/i6puRVIQOzAJkiFAapzRU8NMA7YSYqiMWCXgEmKWnc1hP7hYPNVl6iFl
         cY4tu1DxxJucBCjofhGifb3UsigCWGencNR3oLPHpsFahN6Wx0sG8VFqSfLsYnDi4owc
         1TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970897; x=1747575697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=;
        b=R3Es+lRJf2RP2MCqx1zFz0wNcvt5QRoQEqXkOepUeMGaPMI9R9mNWnEaGV6tRzK2MK
         NpNMhIrr0z/N0mot2C/wfs1SiG8PqRs5mu66CiMJCYJB5rSq9nT4dCZmy6H7M2SiMA1E
         WBbUzoS5y9Fp3V2D1jfhao+LTsaa+Qmjf//kTeELhtAMYsjLSuPwsW9MfMtdEG28vSKP
         tsC7m0v5QVREAjk20vDb5MMGM/e6kAsc+2Q/QfjqWHCQRoZt1PQzd8nU5NrK8pKzylUz
         sQo5EbOXxwlOe6yYwTpop8W7AvA3RXR6I2Q8tGAIXRf97KgaTteQ8dlsip+Mxwx7TieS
         8wIg==
X-Forwarded-Encrypted: i=1; AJvYcCXrF9ufZO1x3ffrgq9u+EsWX1bJWNQHdA3Et0dzKgukA9eDqFbO3lb89l7RMjQpjVDFZxVaNrhTtY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3vtIXaMOacTzY0wLIH+MOxUOXUhVeXoY38uSeYfJx7Zm8xw3I
	d1GKsYs+P62oHVGCTS5z/gXz5L+QzQXWcNHwnF0K4cXgE3/9kK8F15iUvd5gM9c=
X-Gm-Gg: ASbGncudZz5AYmJiagZlIUHYEXQEr0bba7LVBWnNZqz++AAi/hptnuasKJ2XVMS71a+
	YNyHtDkoCecHqD3QWPH1/suOlWweWBC+X5Y4aT9U4IHjKsUORk3rj70P1QezP63tP9DDp1sTD4g
	I9B90jZ+7OWvlx7HX/MxW6NgB2EGbSiu2RNi3S47rFLHtfXdQ015G/Nmc/8k6O4A8ACjnXqw7E3
	jw66ZarzYeJ/ijln20NUy+Ie3FYzv/BV0hA5LFZXyRTr+gfn1SVoJzTKOMVQyVvTucDl8ZfNJ/1
	UYMtvV6r80aYU9GYVHToKR0VXecQyjD/a7WS34kswgL2dzn2QoUIWHaC/JTiyL4lfJAjEQC4LWg
	4uNjTEAr3jKM5xA==
X-Google-Smtp-Source: AGHT+IEZtfgx6j1dxRmccdlhlQve03DNV5a4qhTyFu9OpXgdKWOB6OI5l9zeQUqJ0boKf4p0Jt1+Tg==
X-Received: by 2002:a17:902:da87:b0:22e:3aaa:8bc5 with SMTP id d9443c01a7336-22fc8c77e28mr174265425ad.24.1746970897361;
        Sun, 11 May 2025 06:41:37 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:41:36 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 11/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Sun, 11 May 2025 19:09:27 +0530
Message-ID: <20250511133939.801777-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..26dd13731350
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based message proxy
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
+  The SBI implementation machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "riscv,rpmi-mpxy-system-msi";
+        mboxes = <&rpmi_shmem_mbox 0x2>;
+        riscv,sbi-mpxy-channel-id = <0x2000>;
+    };
+...
-- 
2.43.0

