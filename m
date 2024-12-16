Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA61FFC44
	for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338927; cv=none; b=mfk5MJdTXWP45rwTsRSZa091q6UXxNIpbJxkNL3CLsetkh2PTbGMVSBMI8UW/cTf9OWCx6WcJsZd1h/XhTTXnhS0Ao0WbgzdCjvwAMAome2kvdPys4jbOgPw+fVI9VJz0ImJ6533rVB0HtflwNd0hLqHp5wrdV8QXRDb41EGatQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338927; c=relaxed/simple;
	bh=UFSwrNE2q4CqRGWxwYODrUgIrnNHkVW1oXV1BV8c6Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHoDpp5v7dowPJW2MllqJw0oA+jDl0lQ8s7ShXe3sV/X42vgbjUzn8DD6pMeV3GuagZqAgd3SeGVY5Wsw00aAl+EY5vJ0XlGul/2fu4oCCbmWKASbYTmInQneTdJAAZwZv7MYz0ehpY3wGTEaRyQjyjJf56WunUPzPlcoFLEfDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=hHDxLc3K; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="hHDxLc3K"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21654fdd5daso30323355ad.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338925; x=1734943725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMO3jfuL5hmIGaCvebBRAsGTgzlAeW19tcp/lCnmhhM=;
        b=hHDxLc3KJQJPyca+DNT99fHqutuVgvb/GfTlCnDE+DDKHJnkAGsXwk3sxVo7zM/Qsp
         p0onINnIBXGGC8rhoG+/PIVh4zEQYPDJdKddM+KF13vRyJXk2pNAPpoA9zoJdxrOjSV7
         hrOMwCLpUTa3Z7JL1xs+yLhM98yfNsuG8z5cw/Ijbh8lGOEN/UwaVrdhvsqfIoXdDJJz
         3/itGEMDTHBAuujZP1opx5ytE+B7DQ2OhqkN0los2FZiG1uuNiOeIgVNVmPn678JA1C5
         xhYSl9Hq5xBJG2nNvkKEo98S5gnB//gVH4IRY6A8YILVBrDgi6k1raE8Uky8WxUPEASW
         IG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338925; x=1734943725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMO3jfuL5hmIGaCvebBRAsGTgzlAeW19tcp/lCnmhhM=;
        b=L/YZN12UT9qBhk8Rbo/PDa6S8uJiLN9K3mBq5R3QaPANJTfvAKrsvKm8rRx5hdteCM
         CLItQru/MMlgs/lJPV668ZngoytfJBVIh/nGPBph3J4+CpYy8/Y05397qLSYy35dmFxV
         RqCMFZKXF13l2pALRUKcTjm6l4kCBnNlY9oqPK1icCDKk+f27eH1WVq9ywrLtI9BojPY
         gvKeZrPFFHg2mZlOcE1e321aPX41sIKW0KxuyEj5vY5mo+jtlcq4dvGjeGzY6ygyzLub
         ryqJ7jzupv+GCLO7eiG4A4h9KT0oP/wWfFLFpPppppiorxCENUpLZPc8al8QIfgH+77y
         UkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwP/jUK4Ipda27QpuCOEfIjpoK35APUb0E8d1sLI1LRra/cZGghauabGGDYNBfnnAq/FpT741Mik8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkZTQdPLCN+GdUceK8ZKA5IGD6MiiDWQ3cNv4cXuUHm55iyAX
	CAltay/mKUt9RwL55/5tVltYzkuosuecTcpbIgWv3MQ6PYN7nOlKjOM1u0u80Rs=
X-Gm-Gg: ASbGncuAr4d/rLJ10DuUgAf/LsQrkJnapiIIa7utX9aLZ6tY3pb6Y6A+7eRKmDyHiwX
	biwgcMMSCo/9jqef6rZZ9EMKlmNFo4dg6j+9KXFT62Xth4Q3M/AhIuce3icwmdPgm9bsuWif4DQ
	pOIs12ubUm729rM5kSsRVwMMoYgkc3dd7XBRBmq0VbmJ2urp7EwClrYk7RTo6K/VrMJI3lPbJ+V
	6NxdeHv8LqEjQpRPgAZ/VyLIpFMW3E882J+hHBJU9UnCxZ/+WNFVKHYlvKw8ftlgzovr9h3kbiy
	RlxKl/IS2b8vYQA=
X-Google-Smtp-Source: AGHT+IFP0telDvRf+8kDLe8zYK7tj9L0Ym2laW4HDpkbeQU6flKJQAmEPGbnSvej/CfGRJih0n5Yog==
X-Received: by 2002:a17:902:d48b:b0:216:60a5:ebfd with SMTP id d9443c01a7336-21892a8483fmr144631265ad.55.1734338925436;
        Mon, 16 Dec 2024 00:48:45 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH 2/8] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Mon, 16 Dec 2024 14:18:11 +0530
Message-ID: <20241216084817.373131-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216084817.373131-1-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
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
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..8d713ba7ffc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
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
+        - description: A2P request queue base address
+        - description: P2A acknowledgment queue base address
+        - description: P2A request queue base address
+        - description: A2P acknowledgment queue base address
+        - description: A2P doorbell address
+      - items:
+        - description: A2P request queue base address
+        - description: P2A acknowledgment queue base address
+        - description: A2P doorbell address
+
+  reg-names:
+    oneOf:
+      - items:
+        - const: a2p-req
+        - const: p2a-ack
+        - const: p2a-req
+        - const: a2p-ack
+        - const: db-reg
+      - items:
+        - const: a2p-req
+        - const: p2a-ack
+        - const: db-reg
+
+  interrupts:
+    minItems: 1
+    maxItems: 1
+    description:
+      The RPMI shared memory transport supports wired interrupt specified by
+      this property as the P2A doorbell.
+
+  msi-parent:
+    description:
+      The RPMI shared memory transport supports MSI as P2A doorbell and this
+      property specifies the target MSI controller.
+
+  riscv,slot-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    description:
+      Power-of-2 RPMI slot size of the RPMI shared memory transport.
+
+  riscv,db-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Update only the register bits of doorbell defined by the mask (32 bit).
+      If this property is not present then mask is assumed to be 0xffffffff.
+
+  riscv,db-value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value written to the doorbell register bits (32-bit access) specified
+      by the riscv,db-mask property. If this property is not present then
+      value is assumed to be 0x1.
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
+        reg = <0x00 0x10080000 0x00 0x10000>,
+              <0x00 0x10090000 0x00 0x10000>,
+              <0x00 0x100a0000 0x00 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "db-reg";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        #mbox-cells = <1>;
+    };
+  - |
+    // Example 2 (RPMI shared memory with only 4 queues):
+    mailbox@10001000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x00 0x10001000 0x00 0x800>,
+              <0x00 0x10001800 0x00 0x800>,
+              <0x00 0x10002000 0x00 0x800>,
+              <0x00 0x10002800 0x00 0x800>,
+              <0x00 0x10003000 0x00 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "db-reg";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        riscv,db-mask = <0x00008000>;
+        riscv,db-value = <0x00008000>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0

