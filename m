Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B0272E4A
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612682; cv=none; b=KFwoXdalwoPL7CuzWwOOCf2Yk4kqt5REtxSI1ZQLuMMRjZuebBjt4CYxPB87TkSyX8AwiqU8Oret6COdw8uIazLUFmiM6JnGajRGnCgGBEOvmzyuPtm86WE/Crf+/e1PjMKg2nZETaSGGapBa+5pRVlyAgY/DPRLP0C7CMYN4/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612682; c=relaxed/simple;
	bh=wpGteD02sLvwEnKA7TBa2+SX4iYwOSU082ERtl6/Vjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9SIOWwSG08zgcH1eDTjoGp8ZLZKUEOqtw6wKqTVpyZAjvlFA7IVh3aPuZzkkOQn9xFppIouWrC7Yr6kAotBwak8xn5IJxoedUVC2wa/80jhVlGvHdV/USdRpGE6MkC9DMmdhkSyW3chmZLnHiaa+YdpxyIfaIUj9CR6wYktdJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=B2kDdazX; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="B2kDdazX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so476624a12.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612680; x=1752217480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=B2kDdazXn9KyGYigqxoSW87e6P/A0PbahzqZvgnUWRnwiF+sYQwO1BERzfrkh+CexP
         0dP7FeIvhiKQ/n1TRPjcvGTDVNYfiV0/AGna8CBP7oHR7ZXlKGaBiVqXCbYGr+/Y090a
         oBdseL1DdlUEftAaBLZVSUCZmq2kifU4HWDY5+FEod0zA8AiauNHlDc7dUlW/QBYTxC/
         iGmKHFA/OWGliQ0u5IfH1p5wy8ZdCzb6sUwDHWJJyF/mPul80zU/QeUJ0QMJyNX5nCIo
         2+2nTIn9DOO7xeZRBBmiLQGZSJ8TmZA7HbTP8pbRPgONNVHn4qfzw85hcv3fIwq2RqdR
         41Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612680; x=1752217480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=ghfb/cGbiLpAHqnk4m2juxLRCW7gYuXa0bHQpjAA6xgg5UcK/M9sUrBzY0sDX54NTo
         dCLVWAAtyZaXWpcOBxbzjWbDeMQiwg9cAD5MyWmbOed1SK7koO1ug0Ytg7wQ4mV/aufz
         Xsv2GdBxAMBQVgPSSgcj3HflykKh3ZEDX2fvz/rROgXno3wJIiaAnGfaHjNK6HsvyM5c
         GtmsoxYuOh7HFpB22rNKMQ/mIS6R5myYk6Oi5HhdM/DQrCfNvBdpmTmcrDYw8EwL1TM0
         CTnSkZIuVFidTS8OsHZgSyH6VSblLF8kt8gxE7ajAra6CkGk1PknhppypcPUOCt2Hpa4
         EBEA==
X-Forwarded-Encrypted: i=1; AJvYcCW1BfTlL6Jpz8aBYE9/lkupi+uc5B9gbrbU5B2z5wWKSX/+MTS2o/KCbdJWZgAviSBZmerZ8d/GEss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fsmJrpmdglrCV6ynN4NBu3la3Wb1mAbelZMwSAPQN2EAXCG3
	VGrYR/FaZtXqsehfKnFdv4Z8ypvp+HzDjbY8fK3RvKeRIdFn6BwIxzby82D9G6ovKBg=
X-Gm-Gg: ASbGncv+myQT0EKaCetZjKFooc2NjQkj1+INwPHs0yV8jF+s7DhktymO0mIy97yZ5kK
	K04sYSzAMvfHeVrUG1BT5Gbw0/Z5S97I06yMNlFtJFjvkvBgqKucv88/HN0/ap4qhz/Yit3apAN
	lLsiatPyRfzGfnK2JSBV49ABfAnI8oBAPC4387Ede1Un/ZZA3AHgiV58f7Tu8pDOkaN+tCi1iQy
	bdMg9ASReJDhWl+TroQlf1sXfEmljzznbgbccOi7z5mGWH8kQbTXJzroLGFhzVS5ukJlyBnG7tI
	/biau8Fi3OkZ44bOWYYhT7oh+TN697+Usd8Cc+G8mDmsKZWGBNcKR/JpfKqRPGRAtFCyMNd77CH
	3AwvuC3T8IFS80hhl32a4eK4poQ==
X-Google-Smtp-Source: AGHT+IH7pAY4DEaeFD0g/LqQ4vl0f8jxx2LFhaIvUOj/iUdZwYT735N07dZ29I38RmiE/z8zxFQSjA==
X-Received: by 2002:a17:90b:48cc:b0:312:26d9:d5b2 with SMTP id 98e67ed59e1d1-31aac212971mr3321434a91.0.1751612679913;
        Fri, 04 Jul 2025 00:04:39 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:04:39 -0700 (PDT)
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
Subject: [PATCH v8 02/24] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Fri,  4 Jul 2025 12:33:34 +0530
Message-ID: <20250704070356.1683992-3-apatel@ventanamicro.com>
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

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..061437a0b45a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
+  software to send messages through the SBI implementation (M-mode
+  firmware or HS-mode hypervisor). The underlying message protocol
+  and message format used by the supervisor software could be some
+  other standard protocol compatible with the SBI MPXY extension
+  (such as RISC-V Platform Management Interface (RPMI) [2]).
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,sbi-mpxy-mbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell specifies channel_id of the SBI MPXY channel,
+      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
+
+required:
+  - compatible
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mailbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0

