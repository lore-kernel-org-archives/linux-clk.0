Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F222D4C7
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623037; cv=none; b=syjVWRpSB7tpvcgPeRXYGNF9+r/rw/lkHvbDUgScyjYuVVkPkD7hdfMrS9NGzyFFcTFnNBrH1+Ft34PXycoPspMGG+RiE55cNFDhOqd7B5ghM9lavCdySzptE4v3Umbjuwzq8CPJgyA2ZS34/CrmRNMY3+xf3w/qh2dxOAGm44U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623037; c=relaxed/simple;
	bh=ixtMiU2D4CI1HtrYrYpElhcrFaz7rwFs2Q8kTElmxqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7GoubA7h/pPsYhP2p12GtJm01QfoBS/XKhlclUeVeZkitxSI1srztKDC2wS39MK3zfpsYlkIzVd4LxVxjaPMsVHokALt0aKD0JHKyyq27evMIMEpf9o+7a6NISUtvcdbrbfUG5+JO1YebHLECt+hYt+lGQq8YKxnYi/dzsX0YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=kwD1nFQl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="kwD1nFQl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2360ff7ac1bso29899965ad.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623035; x=1750227835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwcoSzaHJb2ZCurp/5PmtA9kG6Ysfjka/p/8DDzX1ZM=;
        b=kwD1nFQlke8qAryYMGsggQ3VsGwfpOZ0QD1iUSx+cs5djaanqnCpWtVdnlMhgGQgDE
         K4qcaEE20UiAAs641m/KDHhPDIZeOsoRGTcUNNey5kyYAniFjn/n6vqiri+w2wXYcqiY
         LtuBQ/rftbuG+r9r7qQpEKvORj4nTJcxUI+F7bsxEI/BQXaUehqZa7FP+NcZHL4Og5jg
         Jl2BO6aaglx0hROdfb6qeZKZpy3OKf6ijz3k6P3rexeb6YOHpfFsPu4vk8l9k5I+zCc6
         4XCoufjMVEiB2eVk+I2udVeqnMdfPfNUbWMmUxiEpZW1XjDvUM3RplJ0ljgFuzv1aAXV
         LfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623035; x=1750227835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwcoSzaHJb2ZCurp/5PmtA9kG6Ysfjka/p/8DDzX1ZM=;
        b=lspvVbdS5JI3Fh+8WBLO955kiMWCitl1Y6nlBB8ar7EHlA1dKgMBDLjQ9p7hiSZxe1
         uj7BAkTobhvoepT+V4Q3Tun+IRS/oyBGNYJELrx7nqDhDK9eBRddxCogiJtWQRlODyaF
         yBRRucfk/IEtZbtj+o49NCLOPHzRqvsc0e/hrGW5XoMarQnElx37LYw6N8taw5qKnm6m
         RcKNGQCZQZp5sdFBD2zCMEwDcBTxdWpVf1QcZr4wA9RBAPDVQhvuE2U5kE1mQsuyADPU
         fZhBuuFm0Kickk1x37WilypTMcA+r8Xu7pLxaa6bErHVI0ArOV8FZpTJSDfWOLuZqMzC
         bvgA==
X-Forwarded-Encrypted: i=1; AJvYcCVrviOR1ajg/+whzi8o843h/OUBayOjgmOj39UNhQvHsjYe3YwX3lWGN9Vi8MLQPXnkFrOL6UzyYYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIpTTimSMJ4QQ1RCTLySzxTPs3vljvQoElbQBrX7/OMEaYmUEf
	fNZy9vL9fe4NKU5X/QF6/ZICX+PKEsMEwqKY6eogkbYNWB0U3sVrbnO58ircr+VnLhg=
X-Gm-Gg: ASbGncunlORN6jR5vAkJlKK1E2Q0W6VNxFo4kN3qoqrNzNp+XB+8wH15TOMZwbVtvM6
	iq1L/1su58hLpYdaMYxDzT8bv10XBxX3uR8tKzbHHm1aaDDmcqyL6+N2C0hcn15zwfIPztMiBm4
	HsTmr73uvW4JN78/VWMFe/xeh1dn143IgbDDjPFNt5rKk4ipkMrqbLCLhDk5IaryahrzyNT0aIm
	8YtNb65dahpcInXAT6xLaIj1VakWMvrNaKw1bVvflhctJAaR8ItzOKssb1/IHv2itNUyXdJGFVk
	styZGXK33tkiZVTeoJP4BH225DruFmaV0V+TuNsvrUJyZXjToCH31C6ywnw5H5g9L/4V/3SlsUe
	7Oo2rgqvBHs1sSmEdsVsI7a1XwP8KGLydAg1r
X-Google-Smtp-Source: AGHT+IG9id6m8Zy9UeNhLHSX7++7xXKKHDlsuc22eIa03d0VgxiugN4v4fTC06zY+RU03tXIbah2jg==
X-Received: by 2002:a17:902:d552:b0:224:1af1:87f4 with SMTP id d9443c01a7336-23641abe7c2mr35316405ad.22.1749623034551;
        Tue, 10 Jun 2025 23:23:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:54 -0700 (PDT)
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
Subject: [PATCH v5 07/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Wed, 11 Jun 2025 11:52:22 +0530
Message-ID: <20250611062238.636753-8-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

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

