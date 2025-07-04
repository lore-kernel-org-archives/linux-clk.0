Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE38279DBF
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612761; cv=none; b=g0ytTDQcXjUaPaJCOM612IrzVzQpEthN12pYYM8MK3fiWr9RpZSDq/3PsGA4GHRvuJ5k8dMEPpFg6OUKnlxHKgcEKXAmT5eVmYLjwKmj5X6Sa0o9ru+PuxHhE5eOWHFclvdoMspAHsETz1TSVshRdvt5U9eWg6LAuDXGsJI96iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612761; c=relaxed/simple;
	bh=gqZpMXPd6DL/+kfXUibwUL8SSmPMehps7IgssTY7RG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUU27au3Eai4jkH18tA74s0qrjPdMGjwJrUEFuHYyAZW+ntWVJQCQLbMX3MQkpr+ad/VUApZi9fvlaRSmyT63L/8NSPbpmvIwBzx8WXxAbOdHTfVir7ZP2jbo2Yl29KCrMUdIh1ikKZu4qMUqcvES4MJBT1yXNNI1GcMkDEumzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jKa++m2T; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jKa++m2T"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313cde344d4so713748a91.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612759; x=1752217559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=jKa++m2T/65KYJ+zWi42iHYdOOtk8WxWplz35AjpfZV98KGo0Cn9inyx1iz63hPl4I
         5m+apzuY/lX01xNaFrnMI5sIZcM9njQsW4cIR5/hP79Zs7I9jO0wX9KdLOtVLrWIg7Bv
         Uvj20kppz7ilK6DBOfi4ncIA89QtfDl8BQfAIytPZ0B+UnShkXmXbYscQHmVCVZKLS2j
         E4vYAMsK4MGjdc5V68pmS5VsJT27O17Ht1ZFvefh2GWGX+GWYoUPvqi1cFgWpS3hGYuD
         YFhCdHFyZvWvauQu7fQEaUBR2d8AElNxXVKYNuInjIbqFEwoEDKJhO7WG6NFEQWdlMfq
         jikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612759; x=1752217559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=WL3DS36XcHiXgctitZoEUDZ7LyAZwWp8BGOIUkRDgVJpL8ktKQpvo8I8D9Of2vljjI
         wx5y6KZ+fsl0MCXYT7t/+lZYf2jL+iX44J58+rw1e7LURSH6c0+tPEkHaZ3LJD4IkhWj
         VZwB9APFj+VcMCfaKyPd0rRs4jT/Y1thhuwEQNi08AhDF8wx6Grf6a4U5xY+KSJV6NNe
         3DpOwl+A+2DsVsXl9ShzjkCbeW5bUHi0D4UsL2QF1Z/3lQ1fduRnNTzqMd4+LyQw8y0S
         a0+PWI+QM4ZbLILQl7bST1hsPvPFQtkeTKmP3osuMO0u8MhNGF3UE3nOm6/5E/0a7h3/
         TWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd19qZFJS/6t0ElBkzq1gJTuxGOb7BByTek80ip9YBjGZiPdBa8ffTZWhnuE132ArNM/KXU45Rrng=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYFOrEi1N3s4wUtqcbtRUqcnsG+1+KQQIAdpIpZlHUyOqOvaO
	D+TmS+Lh5VrZMsaPNl18RVSeAX6LBca8YwbfBuaxVWcgd2iWYB0MQXiPtKeSmcjZIHI=
X-Gm-Gg: ASbGncvR+Gs9F4RhcF2Io7Qa17pcbwKETPA7Lnb3+68U1n5QbiafwAUC/SYDDdV0bKB
	Bgkihd557PCFXpjUrfSqphyhr31K6XmGBdR6aFgAc0HnenfGzM31BU31If4b975RrglUYyqxGol
	TOs3WjMVig8LDAXQbXlgqhNYwDQ4D1C9UWq/5Hqm/q65/oZTfW8DvBbRgS9tOOK6vulxZCMH2en
	rO2SLGVr7+WtuiHJclUdCobel7gqnmH0VY7Q1nBcGyEYuMzn40PaVXjtQsGyg+hiKxCJ41eK70D
	4B8TIk/uZ2nMYWao4n9hf3SlDVi+633Mf+qF2Z+peED6xHvQYTvpK8Ly1e3En6azjgofhz6P4n9
	R0PMfkL7660TiuDix2IIRrX3quA==
X-Google-Smtp-Source: AGHT+IEsY9DjJEKtUwl9ZcWbIEnsXVkhcprck0a7/CT8yNIOArahqDh4/mdoR/7EaIpy+0pjEevTMA==
X-Received: by 2002:a17:90a:dfcc:b0:315:cbe0:13b3 with SMTP id 98e67ed59e1d1-31aadcf4962mr1778242a91.7.1751612759095;
        Fri, 04 Jul 2025 00:05:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:05:58 -0700 (PDT)
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
Subject: [PATCH v8 09/24] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Fri,  4 Jul 2025 12:33:41 +0530
Message-ID: <20250704070356.1683992-10-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..5d62bf8215c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based clock controller
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
+  system clocks managed by a platform microcontroller. The supervisor
+  software can access RPMI clock service group via SBI MPXY channel or
+  some dedicated supervisor-mode RPMI transport.
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
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#clock-cells":
+    const: 1
+    description:
+      Platform specific CLOCK_ID as defined by the RISC-V Platform Management
+      Interface (RPMI) specification.
+
+required:
+  - compatible
+  - mboxes
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0

