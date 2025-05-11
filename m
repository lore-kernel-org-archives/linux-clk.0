Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706532571B9
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970824; cv=none; b=dbbpxobnOzeR17bFWsNSf7gPtrn8JuOo42+/AhE//Do0GtqGjq4Lv1L8hNA9QsIcubK5etCGf8utI0BNchA04ygXaCvRd/gaS1aHpmJOheitUCBTXGTQ2kYuL6/UdC5blUipkRwbJr7w8Q9gH38C3g7APqjFeDvq8GXNDSBDAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970824; c=relaxed/simple;
	bh=Yl8n+NuSj0Dh4NoYbgYuQLhM+H3lJRU0XlWccNljPto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyZkIDYAGejYHBHCBwNi+3871OJBGMQS2qg942gmMkQYfvSVjOeBLsVPmD46QT2qQhs+5rNkQNhThImNrkFWXSONmZaDV0mv4TP8sa5W1hJP9AAv7gAbHS1eXZ1toSQJtqc7rwg82G+e+csM7Dw46BcA8wmThacooEFRv/E5scE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OpoUpqWS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OpoUpqWS"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b239763eeddso1860298a12.1
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970822; x=1747575622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ6NtnG6XOe7TLAPrIn93jkcqu9DK5X4kG8nXgTaGD4=;
        b=OpoUpqWSgIU1YqIIIhjkFIpLOwEXPzDAfvX+hRR7rEdwNu244g20mRHhjovN/qyCtP
         DQnKV8FWFpq71mWzV0eKoRMBERYhvVT2k8FkHpli1I7KtMnXBVR6p6jqzUDHQo3HIoLX
         oV/elgmgnNoamAOLomnA/JUDQcbY//MhnqHzQo9U2XvLHypQ857V2v6AGwOCclvdv5A+
         V2y8f+X75JgoSQwEny8b3CgNk2O7bGtnleREZ9antNDZLYu9KJBF3O1u/uV+wUGJaHtY
         EjIYiyAgspmvYNeN8noYQX8nqw79kK7OSzPsew20SQC4d9r723FQklC/MLZIb4RdErgu
         6kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970822; x=1747575622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ6NtnG6XOe7TLAPrIn93jkcqu9DK5X4kG8nXgTaGD4=;
        b=TGp6HRNtkboRVqjLCGcn2tDjWpg8gs7dDjEULtnwaYpY8uywRnya6IH4aTOQiXG5uP
         PoBAUZNGi0Eccg4svvtJjRbbrJM+4xKFrLvThyZfzHRfulPfUZMFoY+RO/TOmT62dGpS
         TXaRIpaL24uthDrzznsddSD0AFclQdj4NHjot/AV46o9i4vPd2XOmmzOXoyAqe/Temrr
         9UfIlb+/qKAeVj4HAcxY7KE6E4f6ZYHukoXjc722j4FY9pY+GcQ+4H8mqAXcvbNPLsfW
         mRa/QrmvEAXJGKFy2xhrp1OUDNPvNWxc5AEYwb8g9e8uW5Lt0DQV2A0UtztKlVJYQYqU
         dvZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn0rAwg+ILgZydckSpf0Nm1kyRnrjYV6/FlYYcweYWGMsgxhqiIQZT21sYuZzZL5SHsjFxBn23Dsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYV+AQ8UcYAT8Z1EoehqzycZSTziF6XnLFbc5ZcefyLO0Yfnen
	yQEQqPhgCjUwGhKvtUJ+YtBAidrH+lIKViyHhdCv/ktFw84bt2KpubDqjpW/dVo=
X-Gm-Gg: ASbGncvKjQl/tLUgZiFAEChE6Q/YOfOgWBrT6PQiz/eHfhktcmlzatGzLdWah4rKHGb
	wWH/BoRnunPeGiYiY2rio0aKgsrzl6A0Z8DTKrNA51GotPVhDjM2zw93+inBNkQCECX4dO/aver
	/7O8H+IP2OjzKrOICg2dfSGS8ygaEi6+slLUdejVChjXbL7BORJW3BO11OYaUODx6XzQru/YI+H
	9YytzwAYxoBIh3gjh1qRYIEfK4GUtLzmYyNLPu2OZFbodyfZqCz+UIxSOI4XSV2RzFMVk9O6naA
	0JXsBVVN56aglVVJTy0uYnMik/B0HryHl8cXSg/681RAV+p4cjzJhq0zW6dWLQZlbBTeIzezirA
	iiIeKTUU6nobDSA==
X-Google-Smtp-Source: AGHT+IEKA4j7Q1E0TWQZL/8OAzQGwFqUuLE93vOIqHVrlSrdxnqy3RYvhsFLnF5FwYsIyUhhIsd/mQ==
X-Received: by 2002:a17:903:2349:b0:22e:50e1:746 with SMTP id d9443c01a7336-22fc8e96196mr143712685ad.36.1746970821472;
        Sun, 11 May 2025 06:40:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:20 -0700 (PDT)
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
Subject: [PATCH v3 02/23] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Sun, 11 May 2025 19:09:18 +0530
Message-ID: <20250511133939.801777-3-apatel@ventanamicro.com>
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

Add device tree bindings for the common RISC-V Platform Management
Interface (RPMI) shared memory transport as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..3194c066d952
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,rpmi-shmem-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Platform Management Interface (RPMI) shared memory mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a common shared
+  memory based RPMI transport. This RPMI shared memory transport integrates as
+  mailbox controller in the SBI implementation or supervisor software whereas
+  each RPMI service group is mailbox client in the SBI implementation and
+  supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,rpmi-shmem-mbox
+
+  reg:
+    oneOf:
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: P2A request queue base address
+          - description: A2P acknowledgment queue base address
+          - description: A2P doorbell address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: P2A request queue base address
+          - description: A2P acknowledgment queue base address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: A2P doorbell address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: p2a-req
+          - const: a2p-ack
+          - const: a2p-doorbell
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: p2a-req
+          - const: a2p-ack
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: a2p-doorbell
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+
+  interrupts:
+    maxItems: 1
+    description:
+      The RPMI shared memory transport supports wired interrupt specified by
+      this property as the P2A doorbell.
+
+  msi-parent:
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a system MSI
+      and this property specifies the target MSI controller.
+
+  riscv,slot-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    description:
+      Power-of-2 RPMI slot size of the RPMI shared memory transport.
+
+  riscv,a2p-doorbell-value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1
+    description:
+      Value written to the 32-bit A2P doorbell register.
+
+  riscv,p2a-doorbell-sysmsi-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a system MSI
+      and this property specifies system MSI index to be used for configuring
+      the P2A doorbell MSI.
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The first cell specifies RPMI service group ID.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - riscv,slot-size
+  - "#mbox-cells"
+
+anyOf:
+  - required:
+      - interrupts
+  - required:
+      - msi-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    // Example 1 (RPMI shared memory with only 2 queues):
+    mailbox@10080000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x10080000 0x10000>,
+              <0x10090000 0x10000>;
+        reg-names = "a2p-req", "p2a-ack";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        #mbox-cells = <1>;
+    };
+  - |
+    // Example 2 (RPMI shared memory with only 4 queues):
+    mailbox@10001000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x10001000 0x800>,
+              <0x10001800 0x800>,
+              <0x10002000 0x800>,
+              <0x10002800 0x800>,
+              <0x10003000 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "a2p-doorbell";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        riscv,a2p-doorbell-value = <0x00008000>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0

