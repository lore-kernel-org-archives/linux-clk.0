Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4095E2309AF
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623063; cv=none; b=EQXWrm7MWnKOLoIrK9b9Pt2wcSQujAv5uIpTW1Df2op1pfwW98kfFK+IQ/qV/n6yvJmwqRduEwaSvzfhK/jzATrvdIswWqfixSAX5umoXQ+3Lsa9/4C9Au3dIDavknvT3WRUPAnvwtpSDjq0qeV8uykp6DuvB1Gq+xBq8nT0mtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623063; c=relaxed/simple;
	bh=mi0izh3V1w9zIu9t+K/AZ06nOfi2ewD/Fyi9Z/NlWW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGkHEe1v6nGBeYv43wqzV+rZ0r43G3pwburyJeaLk76ShV+1zNgwVmiEivyTl7hoAYZykFIAiGvWsFfLRcY4YeTtj42bMv0UTYNPKbVi2xZMsrjoFb9Gqweu7yixzdz25/N82X47pUiRZyXuYEXx65as7Grgj50Rd0bzL7FMgwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=BQURl9rx; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="BQURl9rx"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso6730777a12.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623061; x=1750227861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouV1lfFQuaSRkTiMApd+jhohkzp55I7SRD5LPqlFAqQ=;
        b=BQURl9rxH41i8jWffVV62xJwi0LH0e93chV92Nwbv8C6uKn5BGyPPqW9GveJAFfVh4
         1uzcI0mAEecmCtkFbLMTAam3tWip1swqn4kl45h+d2aEFvcyMm1c6WqeJKTiYFxwIxME
         Lq+yotyqOzsH3ntxdemRijB866dWHv3Jmvjul/xKQ7RZg1KyJ5AC6p1RYqFIZVngGc1a
         XwXWkM3pqZSE0z1zRgJlTSm4YzYKQjXfg9EJgNaCfJ5VWdi4GquZYmyC1eT9GKWnIQIB
         PraHXFXgfV4ihkDQIrZjh6W/TWQ2oHsyk5tOQ5XrI5ne/ypRX9luz4RmGiehvBZ3LHvU
         7BmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623061; x=1750227861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouV1lfFQuaSRkTiMApd+jhohkzp55I7SRD5LPqlFAqQ=;
        b=atmQGudzaRgDQsgFZKCV3NPPTfDB/hOlRoNidLAUrhdDQOtCuMgsQBbUfN7lJ3Kkfg
         zk5q3mZza4FOtiyrUQ4NwU/iS4oDGd8XxzWIAualVMMujdalBnHXwyua72E/fSKhDuO8
         TUAqMTsUhhCzGZ1kH0QkCqrfswoSB+jmVs47WKrDHnDVhZB+MXCjxYA5yu+uMFBtTXUC
         C8IpDtjKVC85zpxYLLizEhoavLOVP5F3c8yF8ZT3+L3Zv2Q5675HQW15TUTDai4RZi8X
         aK2wyfrxkcMxVYim5+2915yP4klI+hXQ1hy8Z2vTIhHN59/8Cw+CK2wF4g8P/YecFsUG
         FVjw==
X-Forwarded-Encrypted: i=1; AJvYcCUZg21mLtU9VVcyuhx4DKpsdp1mC6Y1yi8ys5yQut0L+kF5vscjxMq03Zo0sOdDxrC23WxtjP2fp78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMKfY5T3wdgAUBsqdXjy/C+BNUu6GU8rpSeJYHe5AmPQ6ffzv
	aYegUYg+LzMeO4yrECI3d+hYZAMnv/c6vp/zcXM2rFpcNsKQVqsvn3hPoGkzq844cTU=
X-Gm-Gg: ASbGncuZvQLOnCw4YmrE1fpNHUxSpfK5d9wLpzY80EDQsRqPugJ/AeCRRHjInNq2qg3
	8lyknweywXsnH8kDPmQB/Eyj1gB2ZT53huhoug04oXzecTFXLY0yUCrf+a4OZFcRcgn7KWzJ7Jm
	RqiSnFfo4UhJkeLiFyl/JYEF9HCJIRXn0PsV4qeQD7EBo5S9ARd8k+y2Z5X/RIO8mFxNpR+hYk7
	5GpT9HUf3wIos82sE8ezvO5Hrge5Zr7LLlQjgeRRtUbRnbK9+Fjr73ptZzIXHsz89dpdyJENYH+
	GGW4EVskkC6KgMTLU8S9gJxM2ICKL0Gcqxpo41i20i8blsI2mTVH9pGoWv0xNyJHIJF5xDBJhXZ
	UxKMucQkF+Z21eFSOeCQkLRsPWg==
X-Google-Smtp-Source: AGHT+IF5xkQyWQjwsl09XW4wn7LAnApaVtCZljCguqKxttJEhx2sYRFEJxu4xU+pC+wX1ttAHSWSbA==
X-Received: by 2002:a17:90b:1dcf:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-313b1ef5898mr2232034a91.10.1749623061442;
        Tue, 10 Jun 2025 23:24:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:20 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 10/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Wed, 11 Jun 2025 11:52:25 +0530
Message-ID: <20250611062238.636753-11-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..1991f5c7446a
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
+  The SBI implementation (machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
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

