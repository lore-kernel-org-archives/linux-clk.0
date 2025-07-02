Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F6218593
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433310; cv=none; b=VyqatUmzpZzr/E5/efi9jt2azYt7p2vogDl1QZCB1IoCbaw2b8DI2Wi2brilq+2/2bu9QG7TqgdbcPF9KzFWjjVvbvmaWKD8eoxpK4ctATYFitnPGk3tg2131NsauDP/VRbLv2jSMVtgnYKo/0A9mbFMayTekSFyjc6LIE+8WVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433310; c=relaxed/simple;
	bh=psnTedHrRclNzYfKOxzNdzEC/lgie9/9OjOQXPUJ9ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeUQ5HwM6jq0s1sBe8rhT272xJeAyQWMft1CkuOXyfV22nvvRFJEHApTnNmAnOX77YqeRyAMfhgf5irw7u1gAO50CLnN9zFxbnQgvQ7qL3FEM9IVvV6pddw10tzoeHAz2gutLhUy+spHkslBGIvv9OMyEY4LvEGNDhkMYVwo3u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MS06SEOK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MS06SEOK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2353a2bc210so37509275ad.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433307; x=1752038107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=MS06SEOKqAq2sDyiM6roZK+5IviUHYOH3c/3h7krrp9PGbPyn05DAhdsp7HfywR+OV
         cqqJrIp5zkghm2GCbrJxiJXnq3Wxz67kvUoK/x3Huy4WS+8KpjuFdKN+NOduUoKO8j34
         n6Gcn0X9v8twNO+x51qfKLunLG6nTJ+0Yty4qzOSOfnS9tWZGzgdNaEqRK3N7bzZZ9Iu
         MWIqxrpOY0n6b1b08Cbl3dBQAIQK4wPELaQXeE8YBF3RSUHlx5KhH7wjSidgP+MFTgpM
         DmOp8sB/y/9sfB/zoZNF4QgFU3lWwnZDzpI2cZ5ZZHA/BQAC+DmLZOg+q8GzueueSYDc
         AWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433307; x=1752038107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=JDYZ+99ZUe9mPEN8URpc5K4t+daCw+AwapBseu12dgzS0qYZ8Kfp+c8yyEIxAaaV36
         KRoZNqntvzmGu9PMvtU8czw3ZLZvKsW/ABodXD2xV2cVsilH9HKoz4N+IydPkosRy4K/
         7LKlu5cS6VUkKnvYQGaXBYqGDDFHW71dJaj2fuDF9FFRm9veXkYUeOU9pPACZDOora9P
         T2nL27cwQR0vTG1scaVD2BQ7GyD8WEYDQNaeoggyqU4CmY6vVvm2ZrgyZERMAohdNjnh
         ioxXFOnio5ftJYXd3bHRCLim8Q28n0SNZVXqvAW4vKTiW9yTIoWrwyR/Jhqo7W2o7cB6
         i96g==
X-Forwarded-Encrypted: i=1; AJvYcCWo/4MKM4ekrh8oIh+lK+LeBk4GjYwy69bPjC04gr2jKzOetWNPI6jgLbt1ZtDgxiilT3dymhvksV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhpZMJBeLtP4677H17WNh4O9nbe760DgzQlYb87gMqs5FDXCD
	Fcs6cs2s4p9r8xaV08KiWzoMnoG5AxadP9l+i7m72qt62lpVKOzswO0yOp7V63ptx8w=
X-Gm-Gg: ASbGncsVAhi7zVDd5GrsKdoeC7Woh1wko+iCzpN8tTi1R1S5KxnPL2xBhw2jU2g6hTx
	fao8QzH0Jf+pjs6rtrKf6sd6AC4HUzM+GL/vIcODkQkuIml/5Xbz22Ud2Cpuux18uAsZgQ05Q6z
	98qRa8Iv+b3P2nl1Ap04g42liIeHclR0jEbL29//SyXuoOl5PHB37cGe3PzUiqN6Wgd79oAnnIm
	sFeOq9fyjP86W6AxUJHTCky7+bv+he1RcDrPKhQivVWSttETUd7yxQ5/LomcsPBS9tKa1LThrNB
	XQ9U9Ba/TxX6+tDBfSURPcWMzqF+m00rN1yVL7CnvY2hcIYRopO6ZVIbIe+nXrKWa4Nyi7hJho6
	jGKqVJK9d3a0MjOwn
X-Google-Smtp-Source: AGHT+IFWsFKRwiLkn4+0FNNQ8TzbjWmTlTzoQeJ28wANDKR6xWxbc9yBEEWGSmlqOiJ156vxO88y8g==
X-Received: by 2002:a17:903:1988:b0:234:f580:a11 with SMTP id d9443c01a7336-23c6e4b9ba9mr22182535ad.19.1751433307410;
        Tue, 01 Jul 2025 22:15:07 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:15:06 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Wed,  2 Jul 2025 10:43:29 +0530
Message-ID: <20250702051345.1460497-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..70ffc88d0110
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based message proxy
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
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The SBI implementation
+  (machine mode firmware or hypervisor) can implement an SBI MPXY channel
+  to allow RPMI clock service group access to the supervisor software.
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
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-clock
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
+    clock-controller {
+        compatible = "riscv,rpmi-mpxy-clock";
+        mboxes = <&rpmi_shmem_mbox 0x8>;
+        riscv,sbi-mpxy-channel-id = <0x1000>;
+    };
+...
-- 
2.43.0

