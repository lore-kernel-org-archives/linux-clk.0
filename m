Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265182144D7
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433341; cv=none; b=IVJd2gq8v9r3rBaYcdn8/7wIfGOpOsk7HMc8wMuGkdojnJzO4f3AlydFiExrUw4nOASilsYqyxV/CqU8zicBBYVyE0t9Lc+NGcRNSZVjJZdsUN0Jb1o5nCZXdF6wSw/dTC0Xb3shoDJNSJKXyohdLJe1JaY1TpufwcnWbWwa3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433341; c=relaxed/simple;
	bh=vvd5aEr1EHa2kYCEzZk7/ahZeLh22JQayJGJfQ0Amwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ec5gKoUToXwnOnNT9Yjjjvs/isO9jR3lmFiI99P+d2kpYoRC201PMJ1/9eNwP93WEwDYTTQSVbi3aoHwvg63O8oEih6jyp8xQnDW5GnfGuIBjvqP/9BPvojvVaQjyRYcVXpmf2QVc6QHq8MmHQ0iT4V5ZZx5fEDa8GDWcmjAE0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=deEezXLT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="deEezXLT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23c703c471dso1217055ad.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433338; x=1752038138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=deEezXLTMUc7jReGIsMaqikCJeoA+K9+Ii3ZlRcHzAvdaeg/mmcINdo7lQctiJZ3wr
         1WmwoPPZlOV+maB8PecY/OnbmL+krofCpiRmDYu7EneqoHuo3ZHfbmbwuOl+BFKpPFty
         lsKLCQjTSa+BvIB767OHGFieY2ujl0C73M5T6mbYACuFHMwTiMsaRWwia2X/YdAu9DS3
         4liqc0o/axsJb9ZSSPsq4ipC9O3syJ167sJHKdpjjsy1x+nnQAa+0xRRfwIUXh1YCtEf
         UNYwtb9hCF8ZStOQMjJc/qDNNw4Qf5+zHKP1QUbUDlL6b4PV59wDqVOmD/oIJ0qQlOqT
         wVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433338; x=1752038138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=WECkT3qwv/OeEvBYkt2OP+GkBrZATBpm+CFDNVY3tDg1JcFmOD3xIZV673C2ufvZjz
         n0nIdiT0u9mDb+HlnB0QnoIeWTGc2UC/HwcBew3ownLQgKumOJuqfVWrEo8htFGjv96F
         bHnXijgfXMQwdlCqXgslIuv1hR00sjepLDTmVtif9/iLvb+REOT2Z3BwLRvnKgZfCt9X
         y6XZLDKngHwCoXf1fISSzF4h3MbEU3nIm68nnMhumCspH0nv7KbqBBUgi1uSqM9G1ehB
         CjCUX84Cb5uHx+6InawX/IExu43NZHgVZb0p1G9d1mh0L/3ob+Ot/xm/yw+JalSfcNum
         GgMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmMJcU9RD8Ex7OtituXIApfHNgAzZZ+/dpSth850JpUTgQEpAymwxPYAWSfZD+gwh8m1jqYA7Hi8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMXoatDQtIsF71C7+1PHMwQJ5k3Q5w/0Mt/i0RJZ3wBCG7Vd7P
	EF6exJBkfV3oIK3pwOrAQrdHNchbYkvgX67vhNMx8hltacLFqZUiciRnsY2QZK1hew8=
X-Gm-Gg: ASbGncvO0XwRLQifZAfn5WKADQhMa2JWiZJYmadMJWOcbtZrRpj3n8AI+AVG+FnVa6V
	hG++RMgeBGiR3WeFGXpCTezWsVnDd3IJii5XBoxoI6v93cUshpAMg33Ke5gYGBaTPU8+JRTB51c
	cW75/6ZL+O88ivD64ZItHsdYL9VDjoQCi7G3No4kQhmSal28TJvGFlTUXewM/op6O8yoMId9rM0
	3r1SAD6F8+6fIr1HW1nwaKFT9BPuY5PRXQ8K+nVGTWzSPL7YVoVyMZXuE6ZKeRSO7mAK0xMmcVo
	aV/2WrOd9kIHd/qeRDEIXMFV7UMqrGjuwdZ4OquboWBcJ4bM6lg8f+bD6789VOTo+DRKTmuZb+q
	6Jr3264+WMPtOxsaLcWusce3IJGE=
X-Google-Smtp-Source: AGHT+IFGXbh9c2Bzrg+n0L83k/iOpiHjIddjs0COzT8LmyyeoGEyCI13QifJfOuXuLEn4svubKrHpw==
X-Received: by 2002:a17:902:d4c5:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-23c6e7eb70cmr19839295ad.15.1751433338295;
        Tue, 01 Jul 2025 22:15:38 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:15:37 -0700 (PDT)
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
Subject: [PATCH v7 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Wed,  2 Jul 2025 10:43:33 +0530
Message-ID: <20250702051345.1460497-13-apatel@ventanamicro.com>
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

