Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956671C8639
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162948; cv=none; b=u52uHBul6XhNyUrfs9acMoMOZ4KVrKce7woB9kfcm8pkxXNi6WTfu2zLqESsn3vLHpAdum6siyUHj1DM1EEP7TWF8n2AeCeqv5UJrmg1UjhGdtTZYNmpN+INzO1UPGeTOYHqa/L27gWyVZa7vcWUkyHKeSKTscRRChYcp1cI98k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162948; c=relaxed/simple;
	bh=jCfuPkwpFJl2q7jmzk6VEllmsuHOcm1t3a2xapvV24I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=laWWOsuAnBgF6iEqByIupdKkqPmmpoiZ2nY2nqwAbmrjWsZHBgJxBmkD0Z/ABqemlOYuBzXjGCx/uMJPLIhhwQNNNpi32NZd98/jWrsGIbU+up/36jd14a2PQIQge7Fs6+xcmFdYV6Eal+8ix92uNE9urAyqLcWxnru1Mb0XviI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pBnRgwQm; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pBnRgwQm"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so877046b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162945; x=1748767745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=pBnRgwQmsbo2GyRqSCnhr+dz5mLieFeDBLegzz9RdyD6OaSWK0NCKyJXhUywsSlavv
         VqK8XToACDYrGcAugAX9x9ZSiGOtZTpngLUM5cNTzWSPGMVF6/4EKytmnR/YOjKmWR+s
         qlgfMSz0t9ixxRZD67iDVYegDPzQdobwupEq4JJEKG4H/IubX9lLBEzfUO3GX2vrlqzl
         yGn/XOWDIyJwIoe7lWCEqQ6x0eMHdxL72w+FbHrJBf3v/WPe8pYn1XHXlP1lurCnTYRG
         t78q3gPgp0LSE5j7fF5HqtywQXDS/9zvEbSnXyombTmoBw9g1VnYXTfX4ZmaJxIknLD7
         SlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162945; x=1748767745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=byf9pZgnkeR5wjms2vkdngFUEZYxBCFHVjgt3YL4nomup31RwrotYkk0Wn+uQqmMxU
         l3gdV8lMMn4JDqQx9lAt6UxWjEAJtUODi6Mww1O4SqwqZM+numvMQdxTroUx2nZ+/YIE
         yvkLb1Rruy/MWWe2Yj5BXel5Gq7MpYF7D/keCfopzyn3M+iSZY0chKnzo1KuOozsjQ/r
         oNQJk9YAMiN0vDgNJcfMD5IugqNqNAcEvpUmyE1EHx9lljXKAHTrbbt//4DHUou9soIs
         HfYT9+gYBt7DrtLPRVzaccKhLd50mIParU4WXyqdHYPhoM/Tvky8q0h0mYVYfi1ZEfXF
         kCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+l4189vxUjx4/BaOW4XJmQa61vR+sUnEPSY6uaiXWOy7JDsGcMR4yqJq1xaZkG/lSVVv/CzeYj1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80R8zUPS2gyCfGnVPTDZh4A3GKxe9FESpM3U4qhIJczueBB+A
	a+MXOoErMR43A4Er3Rs5iwPsCJV2st64uCZaQsHs192ub3tFQpKrzmL+SU1bq2rBCbU=
X-Gm-Gg: ASbGncv1nXJNGtdTTcYhoZdS1GCiBnNtZ/lxshrrudqcyfqJiX2EwzDr3WvAbyD8/aB
	M/+tlv7pqVUxGFd3TF+WmFZ/g4/+AuyaTF4TjaW/b9AEUi9EftfG+dOYm1xpp2/BzHatW956F8k
	C9yIM8nIlc3i5FMDG5RujXnjkxmxQ0AzwMnLqJBjqlSRiMN6DF5AylVP3KfZreUorEA4gkrobnK
	lyy2C34ocOq6LeAby3ooMtwrdhXQpP7+19xT4qSBxAMX3VzEA1yi4ouqpr1Wu05n+6NV8tRIK3L
	kdVKgvDF0a/TXmK4nMFMRlDoHsxccWV0bzeR3qWTYi+62R4v1nWezdsuw2c/WqmsUCuvcb2ot0h
	aMo2m7A2T
X-Google-Smtp-Source: AGHT+IH/fcI4Z7YkM4eWj7+IfWaRWzXa4Www+cl3fFM30tPCyJdhZKdj4mWnUuJpZel2KT/5AvPyKw==
X-Received: by 2002:a05:6a21:3403:b0:204:432e:5fa4 with SMTP id adf61e73a8af0-2188c299855mr8237866637.23.1748162944740;
        Sun, 25 May 2025 01:49:04 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:04 -0700 (PDT)
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
Subject: [PATCH v4 12/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Sun, 25 May 2025 14:16:59 +0530
Message-ID: <20250525084710.1665648-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..ac13cec0666e
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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

