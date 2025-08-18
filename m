Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB2A259CA7
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490309; cv=none; b=BKDsj5Lipj9bvNfYAJ73JMsyQSkfrpyGdMlZFtfIpeKLLIv/YijZo4uHH9FI1zjNG+a5gDgnSxGtsj9weCvM4y75vZfAGbeFkPC00K6e3ChbElSxhZu3iyzh6P9Yohb3NQfY+T/tAYAV8N5YfH4t8fVZmN4kYhrL8JYcYq47y48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490309; c=relaxed/simple;
	bh=vvd5aEr1EHa2kYCEzZk7/ahZeLh22JQayJGJfQ0Amwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFxxqDSXNn5azo3c7M1EkAlRj4VJgmO8yZHeEqWnQumLkV+VG2Zltb3/eY8316QhkBLqPunJYpCctDsymBXG+xIUFinS9u2KEU7FXiBgUMh8REkDpj7Yj/rz5yd3tD6SNK1X/NsUCvoHRk/O19wKayT9jIp7qEFi6Yg0UxY4NWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=LkAp9ZAl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="LkAp9ZAl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32326e5f058so2559393a91.3
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490307; x=1756095107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=LkAp9ZAl9AZAnnoMhvkKo/0OElAgVHQgVEZ96iNoIKtE/Rc1BhQG3J5sJWECZqdhXs
         EXf6utF772YRVxHbn4KXhs2f8smwlAYiRSbc7PO/M4iD74JSeP5dB7JoUEqLJ9vL1fvi
         YyFmSwDNola/zivTmYvMGnuBZNSTaeVm/E0IE8Vr6Spw687WY/QTtmWJtqxLIFvhz0m2
         yjOHkrtrateXCfka5jY8FHNk1JkoRDPHHyLfQGG042Eb2E1/bVXjHUWfqcKEeS46GANP
         KnwnHmMwHUbEPavFeLryRL18zM4f1TkANtGPj96O2CfTHJqGWPs5dsVba6aLNDsVkyFV
         1Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490307; x=1756095107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=HGHqLEPTerZy5iWa8cloQ6RMvYeIF47L+uN/RdKyj5VactFw1WUOe9CHAHwm+2Gsnt
         LoCQYyPT1/iMoRuZ6GwduHRrtlRBijPUsS5/cFA67lc1geAWQt01Nkt9OnIk5i+L0y/N
         7fZhjRAFMUK0laiJn3AdNLjaa5Y30jUnGroLY7hWZC5uyezS9o59IBDxF4w8QiDfOWHN
         meqO+OzdjoiBO+nrQXyqtl1uU0PGaWtVy/68pdz1cBwkV6vdVmcmly97iUFgeZ8xnzIm
         f5sxKutR6oCe6kJ2uJVB5EoK09vfHN6cq2P5YNmof8jSO7cnL6hXS1lNeclrbQfcqgUo
         CTbA==
X-Forwarded-Encrypted: i=1; AJvYcCW6yrbINMeaZEFC6g6DyPJ9CzEUgO9w+wO5YrpzRWaODhfY5+scCr8NwYo4RHE1JXnPMulHj8OVMKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPPEDo9vQYSWpg+M+LT2/kYnFP61LxPv0WD/6l/c5zQlyPUQy6
	tASqTTAxmYC8W/81ZdBPTUxdFv59qbxuWCnqp+H4LyBUh/YjdEFhelKLVi1eTF03A48=
X-Gm-Gg: ASbGncui522dSWpxZrcSyjXWPLlILnq0wDY/vDhLDTmzXXDmQA8r1cR9l8q1s08lSGm
	le6048Zu/+HWV8MVZlt3EOi2wzK+i2eBqrKIaAvARcpcNXg8K9jaUgPjMYorViKNe42JL5EQGQs
	whrgSEFrnPS3CXMYhZFXGXEUvEx1eCJcc5z0bFEsb0UdSQ8L9B2kdMawCev7bX6alePG5DS2rug
	RtWTtnSdY0tgbe6Jom0rvcuHiVXsyIdUjUjkPxvbKmK4EWtIymylQ14W6Kg3Yr/XEnYL5zERWqp
	GV7NmyP5a3lAcaH6Klo+9YGGHdgFqqcklPwbJxZfEQXNNtCjw2AtUlP/X3GtBCQRsKuk4DRi+ll
	H7NW1CmlaeE91ugLNv3khbGeVk9gcDsOQY3g7NGhJ+l6u50dBhlZysA==
X-Google-Smtp-Source: AGHT+IEgAT9AYq4pQahHXmwpuFEuM/W9qCllak2PA0hDXHdQU0xExFRnQJZQzNUnJraBHIA3ajZAJQ==
X-Received: by 2002:a17:90b:3849:b0:31f:d0:95bc with SMTP id 98e67ed59e1d1-323422386bbmr13467205a91.25.1755490306539;
        Sun, 17 Aug 2025 21:11:46 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:11:46 -0700 (PDT)
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
Subject: [PATCH v10 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Mon, 18 Aug 2025 09:39:08 +0530
Message-ID: <20250818040920.272664-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
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

