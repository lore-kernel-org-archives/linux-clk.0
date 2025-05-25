Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0527454
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162851; cv=none; b=Z9dfLarT4qClGJgTFXumYdft3zmN9GROGcQZvbEZyL02APiqZMJNOUftV07TowSYQ9cQOmQCNW6aRBo5G5OnWIEywM7BxmOXZMalu4NvRsZK9aoLRutTkJdshsJJ95UngWutcpPiTl+LNAp0IzMqeLpMgXaOZLVKeWRTTbz+HSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162851; c=relaxed/simple;
	bh=qRRaOQGExCSaWWO43saGKKBCU1eK7iK2sd+UThduG8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJNqKm5D+VSC0rX07/iz67ZXc40qck0T8EepMejwko18ASam0PNzwjubZygeVBlr/uzCwTvjW30a9LsQcbd/vDoanWrJ5n5KwohcuUYlgOpBh8UBhvekKL8+38D7yc4XpTOhD3ECNY+upzlQll5Rzy0mxclyGz4l7wiTXtN+YMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cTk2nRzm; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cTk2nRzm"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742b614581dso1216173b3a.3
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162847; x=1748767647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao7Q/xXijY5fH5cbAIEqBGx+ybN0Ql0QjcAKqCvWttA=;
        b=cTk2nRzmet41pwIWrvALnY4INkqnUEnHhieYc6FKRy9kGtfh89v//WVRk/ghsoqokf
         SrUo/O2YXB1H/ZW85bJ/SoJoAkowWqn34LNRg6QhWHrM7l74eRyQmYc8Y7dF2R6Q6mJS
         YYZ4zR+mLHoqAeSkWKIdTt5D7IdimSYe30yE7wbP79QASgLyk/dtBgR7GaWZhAjqUh+r
         2E4DB711jknYAV0wKtDjMPe1UmynqdbmXW6NZ8D6SAsqoeIpnnyov+3oe8Eirmh0OBW9
         rK+mMQK/0KUmWkUxIAf4J6LY6LVbvTLaeQKfbmi/PwaBhNEWQaOXTI53EsujjjJtt9W/
         dLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162847; x=1748767647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ao7Q/xXijY5fH5cbAIEqBGx+ybN0Ql0QjcAKqCvWttA=;
        b=eetP0LzHcsHGnunaALd2odGO/YfRkXLVsIW7mbdIKEWcPMEiRV/Y+sVXwMzBu/c81q
         bEbVWiudaLmBdbzM5YY2PzdLzcy3rZeG0s6UROcs0QB9t2RDjG3r+CSqSFefp6LAWIYe
         7s3HXFZCS6L3W9486R8lRBrYRMZRj9JGE7DtWkjIn5R6nT3E4OlJYwB17TrpAXKKODiz
         22XzHZKCjL9qgvKUwiGp/su7hjmlhgjnT94Ko1DSpRP1HydW3QcP+9if71WYuCt/14Li
         AAVhfLHPzeEkX3e77lF3kjN9dcQQdZ+83TgOYZO30zQj6JIkHI8OMyL9sdDgMRKDU3A6
         pgxg==
X-Forwarded-Encrypted: i=1; AJvYcCXd0tSzOAvOhM8NZX18Y2+WRsx9EdAFsqBcA2GIoo7r3xYDKif7JJjRxAsR4NL7+9EF+QtWu4e72HY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMj9LY1SiF9vXsmvwmMhwDYHJuHOGEDCB4432yWnCvMiSjGnD
	F963ayZS3GjEWSlSZnXxjqbWqa1T/yauN45HgmLLzkiH14fJ6RhXrfZO9a790uVNi5I=
X-Gm-Gg: ASbGncs9+g2I5ci9GUsmc3ACoLs5ytBmzpHSkGyXor9yicDelTxTVylTE33u1JnW7PY
	hBJf+Kyo62o4IgwWjTd1MIm2wtrZYjHfdczqzSUI9jrzmDnW3wiGq3t8hvJVWeN/p6Ij3nnQoHs
	aaWIRn4pvB8rZ/BvF8VhQN+qRm66WHnZ2UmaahGsq2h34ZDqo5D+iDV7nw2sjDcr8bCeZdUw8Bc
	7BFKSE3UubpeAt2wf98jkdUxf9xjGQxVJ1kjULy4u9l8muO02JK8AUMjJnysAeT5NL4L7ywOgH4
	YjmxmfQ82nSETXIt2MVCfN2OS7MorW5NIWBcDZhtd2u5gJSgmqu3j4Gi8IICallJQzW2UmJ7SQA
	oHIJCW0hV
X-Google-Smtp-Source: AGHT+IEc8vlNlubdM7ZcFtUpfAvKcv5TgPvrM2RuQ5WgOI01LJtb0pSWzaY2oJXu3hrpj45QwRe5xA==
X-Received: by 2002:a05:6a21:4592:b0:1f5:8e54:9f10 with SMTP id adf61e73a8af0-2188c374058mr10629850637.34.1748162847430;
        Sun, 25 May 2025 01:47:27 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:47:26 -0700 (PDT)
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
Subject: [PATCH v4 00/23] Linux SBI MPXY and RPMI drivers
Date: Sun, 25 May 2025 14:16:47 +0530
Message-ID: <20250525084710.1665648-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
are frozen and in public review at the RISC-V International.

Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
and RPMI system MSI driver This series also includes ACPI support
for SBI MPXY mailbox controller and RPMI system MSI drivers.

These patches can be found in the riscv_sbi_mpxy_mailbox_v4 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Changes since v3:
 - Rebased the series on Linux-6.15-rc7
 - Updated PATCH2 DT bindings as-per Rob's suggestion
 - Improved request_threaded_irq() usage in PATCH7
 - Updated PATCH10 clk-rpmi driver as-per commments from Andy
 - Updated PATCH13 irq-riscv-rpmi-sysmsi driver as-per comments
   from Andy and Tglx
 - Addressed ACPI related comments in PATCH14, PATCH15, PATCH18,
   PATCH20 and PATCH21

Changes since v2:
 - Dropped the "RFC" tag from series since the SBI v3.0 and
   RPMI v1.0 specifications are now frozen
 - Rebased the series on Linux-6.15-rc5
 - Split PATCH8 of v2 into two patches adding separate DT
   bindings for "riscv,rpmi-mpxy-clock" and "riscv,rpmi-clock"
 - Split PATCH10 of v2 into two patches adding separate DT
   bindings for "riscv,rpmi-mpxy-system-msi" and
   "riscv,rpmi-system-msi"
 - Addressed comments from TGLX on PATCH11 of v2 adding irqchip
   driver for RPMI system MSI
 - Addressed ACPI related comments in PATCH15 and PATCH16 of v2
 - New PATCH17 and PATCH18 in this series

Changes since v1:
 - Addressed DT bindings related comments in PATCH2, PATCH3, and
   PATCH7 of v1 series
 - Addressed comments in PATCH6 and PATCH8 of v1 series
 - New PATCH6 in v2 series to allow fwnode based mailbox channel
   request
 - New PATCH10 and PATCH11 to add RPMI system MSI based interrupt
   controller driver
 - New PATCH12 to PATCH16 which adds ACPI support in SBI MPXY
   mailbox driver and RPMI system MSI driver
 - New PATCH17 to enable required kconfig option to allow graceful
   shutdown on QEMU virt machine

Anup Patel (14):
  riscv: Add new error codes defined by SBI v3.0
  dt-bindings: mailbox: Add bindings for RPMI shared memory transport
  dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
  RISC-V: Add defines for the SBI message proxy extension
  mailbox: Add common header for RPMI messages sent via mailbox
  mailbox: Allow controller specific mapping using fwnode
  mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
  dt-bindings: clock: Add RPMI clock service message proxy bindings
  dt-bindings: clock: Add RPMI clock service controller bindings
  dt-bindings: Add RPMI system MSI message proxy bindings
  dt-bindings: Add RPMI system MSI interrupt controller bindings
  irqchip: Add driver for the RPMI system MSI service group
  RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
  MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers

Rahul Pathak (1):
  clk: Add clock driver for the RISC-V RPMI clock service group

Sunil V L (8):
  ACPI: property: Refactor acpi_fwnode_get_reference_args()
  ACPI: property: Add support for cells property
  ACPI: scan: Update honor list for RPMI System MSI
  ACPI: RISC-V: Create interrupt controller list in sorted order
  ACPI: RISC-V: Add support to update gsi range
  ACPI: RISC-V: Add RPMI System MSI to GSI mapping
  mailbox/riscv-sbi-mpxy: Add ACPI support
  irqchip/riscv-rpmi-sysmsi: Add ACPI support

 .../bindings/clock/riscv,rpmi-clock.yaml      |   61 +
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml |   64 ++
 .../riscv,rpmi-mpxy-system-msi.yaml           |   67 ++
 .../riscv,rpmi-system-msi.yaml                |   74 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  124 ++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
 MAINTAINERS                                   |   15 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    6 +
 arch/riscv/include/asm/sbi.h                  |   72 ++
 drivers/acpi/property.c                       |  123 +-
 drivers/acpi/riscv/irq.c                      |   80 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  589 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  324 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   47 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1003 +++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |  233 ++++
 include/linux/mailbox_controller.h            |    3 +
 include/linux/wordpart.h                      |    8 +
 27 files changed, 2905 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
 create mode 100644 drivers/clk/clk-rpmi.c
 create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

-- 
2.43.0

