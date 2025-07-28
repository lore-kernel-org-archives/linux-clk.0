Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6984A254B1B
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695768; cv=none; b=ED3nhoF3HPOz5/imTCA9US70iHq8RSDnzaXpZ2zbb5xZYNo+1cU1nHOiyq9ABurTLnwfODrVlh6Q11wek+3lOekPGwQju/TBKyUngbKGRwhBua6Di1DXo4GKnd4xEh8gH/E/0juPi0J58v5OMHvyoX3ca7mBGkxziIITW75pqXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695768; c=relaxed/simple;
	bh=sbelvMc++opfxCsxTvRuuhoDW5jErxOHLIiEYhi1zkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umy0NwYRAaA2vo6ntEnBLfHZm8AiGyN1Fg3F25WVB71eG1mYkpUblV43EHuxyAcyVqlSHuNhfKHK5Ud3Yb0JQwfvDeML4LGDn60yAEEvUsl0D0BpsVVXXnU8zmCYVp3eTl/EtF8qpmm25H6QNtydXYFPgPWQFyDncF3pRbtVy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QNYcZ3wP; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QNYcZ3wP"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so3782562a91.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695767; x=1754300567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=QNYcZ3wPDDDGy7LGkXhiNI18qfdtLYwEviHqt9PtlmAAg5V7N/LdvZU8fgMW78IPv5
         4aJjQo7w8nzSvMpoe4ylFIVxfpdzDbq5er8Ca+HuysGqN5E7pf+//0ez6065cPkTliow
         jLK//ifHEeY8p6eqLIoU+YQ1y5H42Wz7Dk09XE/VeN0qfTCSR8FuzZyPXjZOfjfwNM09
         CSTtWbq91HaAETn+HmfbSWLH0FdEw5knYYCdf0xlLz/e/m1382aaVXC1A/vjkte99Fgo
         OZ2vHBxDJ3JaGNbggRvf+cWwbKQLzrJJPcsvd7H6Yhzwqv3wyec/VuIFk+BgMRKgxwSb
         vsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695767; x=1754300567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=a0YDGTHIKS/8GzvzUHjVEyZrwNOZs0qTOCezeJUq50C2t0DQ571MTtyOVWy9rWQTHK
         sZSxQXgxUMKIgSiU+dbzNqOpxtVn7rNbTnx44/eSX4C7b1NNqYw50OllBlZqK1TG4uzF
         vAWXYOZo27D5RRRcSEeIZY3RSQWGbWwH3sVdYtETCJrIpT+nnIQU+nO8SkGxgDE/F/jt
         R5I2KUhbW5yGjd/ahJVuQdw93ymNtIRKPyc0TqgToy/t+ryADNBYh8DIp1VI0wvj0xIp
         3KK2Oe8iP3SSAiNkC7KM6aWv3Aj2+4Pc4zsYLH1rYRxQyeEnpCi/s9m1Jz/q3vG0UnaA
         O75g==
X-Forwarded-Encrypted: i=1; AJvYcCWUY99qG1IjPhqyNFi5cdrs3jSuHpfrHmgQ05UrZjzaPYX6t0Amt3czWUmzEa0wLgh6x6gyiNV2KVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzggRkvZu63j9nvFhpQ7B8bXWdTtnF+TQsEKoHWysSniWL8Nhbm
	FZK8yqcEgOEdf/fzahoxFoYEpQN56c/YCKtzeYXg9XMSZRt19xFv3jN/NpihVV+KxPY=
X-Gm-Gg: ASbGncs8drgvZYuaeNWzPxc/JI3v4yx8k2ayAX7PTUohEc44xskKGdH0nZ4kOsur337
	hSG+ZljKGmPwoI6vzk64fApwQwvLOJNT44wyF2u6sdz6b3HYeMEgEdulDEZzNYY8mR3OjrJAWyC
	oaejZ6fWbQ4PdeGm4kjc0H8NlOo7e/Wc9YFJ6dSFCpVF7Yr+gRjAC7O7hfWXSwDPauoV2UnuaVO
	sq3Gsn+Vx7tZSlsydAZInRe9rGJ0Im9xYremut7s9rxrvqs+i4kRTUfdgf8DRVjHFz6fIZzCsQP
	HE8rgt2cZ0lSK34//Z0XF5RKlt23pMx55WGE57NthbIfwd69+DIRaokBDmYvjteNM+TnlT1Q2Gr
	YCTbyr0KhgVZfRiv8sOGd/lmAlcJLVL3AsLf571ZzVrzwhWlNldiJ5Cds9TnP58XhQEX45yM=
X-Google-Smtp-Source: AGHT+IGcRASmkNddGc4f04TprnWEk/VB91d1zyko2zPkLaF073cuPivETe+66fbsndZxOaOB4DsHkA==
X-Received: by 2002:a17:90b:3ecb:b0:31e:e066:c81c with SMTP id 98e67ed59e1d1-31ee066d220mr5005093a91.6.1753695766325;
        Mon, 28 Jul 2025 02:42:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:42:45 -0700 (PDT)
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
Subject: [PATCH v9 11/24] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Mon, 28 Jul 2025 15:10:19 +0530
Message-ID: <20250728094032.63545-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

