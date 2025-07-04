Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01806270ECD
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612659; cv=none; b=b9gKgm5+p6XYHY+RQ+zeZl5XViEWjypEt7nMvo92fF842tKkkm/Nc/8cB7Z7dVLOpxHmWd5uihUDQMDWpy8CXUdIX3IfU6LgGXFU2d0w9o9ugAT03eZ4r0YArl0dYrXvM02PNuS5WBrUkZ+Fnyx6FwxN/w0Y0SGrIpWtO4GoCpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612659; c=relaxed/simple;
	bh=q2EmQLeYA4OKxgp19CQ265DwJ8OtmojXAvRLvrYct94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPtcbwb3GqgMnVU6Z7Djv9bpmIsrKg8BaZ493JivLbnB2K1x5FKiubdWv8kII7a7MemizwNwj03/REwfr3HpNhf8D4Nsv8Lut9SufdAyjufA7eCzOtD+s7rpPBnv+EHPu80H2srm8+BDmwBLYdQndwYzO7HlVkq1Bl92ix1bI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aL4BoyPa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aL4BoyPa"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23aeac7d77aso6740395ad.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612657; x=1752217457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNV4yYQMrOJDAS1UrXmWT/jHR79hA6tazWjsnWTTuMk=;
        b=aL4BoyPa4hlbauunorYanQx1fNfpwIxFf5M6t5sQn1ldlfxjBnXakNsUJi+suKn+OU
         SC4+fpH8GUS0GKcqhIJ0dznmaXipHwM8BiXH4qomDiB03jqbZZrs/ffzk/SaGWz6bPCe
         UPFYvLH7iNbCc1CzOoidmG9uF8VAFOltTB5wCWm/0UvqaHPW/pKqCpO0N/8x+cRa6ag0
         kbLVC8iZtjBQwIdkXBdwRdXzDugrP+LBIktJzWU7YKqZifZlpHYzAc5hq1wNV/hlAVSq
         42HO8/FybZyTzFXEh1lkquuW2xgsFBbyhLDKod7u9lSKrsrTKPsJ6GFskkx1R8URVhT/
         jVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612657; x=1752217457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNV4yYQMrOJDAS1UrXmWT/jHR79hA6tazWjsnWTTuMk=;
        b=whUmLABqnTQSkY2gAQ+q+St+F8CeuyHi1Pjm2pv0E/hBgsQ5vUNC28TIiLHIP9FR5z
         iogrPKL5XmcyrgGzqQxkozTVo55gPI2QaM3UuoZTKv9i/aaNM7FA0l9W0f4OUZFCorQ5
         cYyZ3GrRvTli6XD4X2IYMjArorDcEwQDg9IE+lTF0RVZtZWT4gDoXBtuTgpuXuxuGwyH
         nDXJua5WTaU3uwgWlAlGogWA52bfWmmsVZLvVpgP0Vx4oEL1894k6YeVi51CwN5Hw1ew
         W1YsPU4gDq8c1WVWeq+/l50SFGeYd5FGr13iYXfPvJNTTTrI50+mIeTDqs73vGvm728F
         nMwA==
X-Forwarded-Encrypted: i=1; AJvYcCWN9o9nJoME8Y+JtsFaxf9kUYQMOcxPFUu8FPJvcEzCpU66wallYoDOAJQ7aGfSH7VNv9YZgThHFUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFIJlKLTn3FEhAqjKcN+PI2qTcHktJb7jCXPoBEhBnNwIxd9MH
	VIZlFgIlYh3orLGRWLsXFi8/WBDcmM3B+/1KsTurRUdO/HzKyaeJplcI4uipBNhHCbc=
X-Gm-Gg: ASbGncviQDzsdp7QBCAGr+RD67EsVZLUuim780Vamk0jl23oG+oMrwhw0OvPqyrTNmq
	i/HUq85KmGK+nAaOvC54h8LheJW4StQRShNZOH2Up99Cq4HoGNjBghDuzbGabDGKr6sZwdmhyB0
	0JA5oT7niqQ5IbGKUDLzNtm2azMvB/lfMqlgefk1pUSr4XMJ3TqV/BDUU0svSJtfmqeXQw8M9p7
	k2v5szXj5iGv4/7uJ2GDwyu9GissuyIY7osVoLNZCX9dQzo7kSJDodwUWRnrkC7BH1ASFdC8vwH
	07GSGaqITekjmRIrccT4LHx7md99RHb7ZgZoYpB3k3dosciUTCQ9M6obgufmTvGJqa24DMYatz5
	2Lvk8c+Wt7PdDouu6AMamY5mA9Q==
X-Google-Smtp-Source: AGHT+IE6Selq5x5dbP8GjsTtUsdcC1T2xdo7xnrlnnZL2hnwCQn7lKmnlLU2hnm1nIy+2TTjIKdA+Q==
X-Received: by 2002:a17:903:32c1:b0:235:e8da:8d6 with SMTP id d9443c01a7336-23c8609bfe2mr29264605ad.2.1751612657098;
        Fri, 04 Jul 2025 00:04:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:04:16 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 00/24] Linux SBI MPXY and RPMI drivers
Date: Fri,  4 Jul 2025 12:33:32 +0530
Message-ID: <20250704070356.1683992-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
are frozen and finished public review at the RISC-V International.

Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
and RPMI system MSI driver This series also includes ACPI support
for SBI MPXY mailbox controller and RPMI system MSI drivers.

These patches can be found in the riscv_sbi_mpxy_mailbox_v8 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Changes since v7:
 - Addressed comments on PATCH3, PATCH7, PATCH10, PATCH14, and PATCH21

Changes since v6:
 - Rebased the series on Linux-6.16-rc4
 - Added Stephen's Reviewed-by in appropriate patches
 - Addressed Andy's comments on PATCH5, PATCH6, PATCH9, and PATCH14
 - New PATCH6 in this series which is factored-out from PATCH7

Changes since v5:
 - Rebased the series on Linux-6.16-rc2
 - Added Conor's Reviewed-by in all DT binding patches
 - Addressed Andy's comments on PATCH5
 - Addressed Tglx's comments on PATCH12 and PATCH21

Changes since v4:
 - Rebased the series on Linux-6.16-rc1
 - Dropped PATCH1 since a similar change is already merged
   https://lore.kernel.org/linux-riscv/20250523101932.1594077-4-cleger@rivosinc.com/
 - Addressed Andy's comments on PATCH4, PATCH5, PATCH6, PATCH7,
   PATCH13, and PATCH17
 - Addressed Atish's comments on PATCH11 and PATCH12
 - Addressed Conor's comments on PATCH9

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
  dt-bindings: mailbox: Add bindings for RPMI shared memory transport
  dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
  RISC-V: Add defines for the SBI message proxy extension
  mailbox: Add common header for RPMI messages sent via mailbox
  mailbox: Allow controller specific mapping using fwnode
  byteorder: Add memcpy_to_le32() and memcpy_from_le32()
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

Sunil V L (9):
  ACPI: property: Refactor acpi_fwnode_get_reference_args() to support
    nargs_prop
  ACPI: Add support for nargs_prop in acpi_fwnode_get_reference_args()
  ACPI: scan: Update honor list for RPMI System MSI
  ACPI: RISC-V: Create interrupt controller list in sorted order
  ACPI: RISC-V: Add support to update gsi range
  ACPI: RISC-V: Add RPMI System MSI to GSI mapping
  irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
  mailbox/riscv-sbi-mpxy: Add ACPI support
  irqchip/riscv-rpmi-sysmsi: Add ACPI support

 .../bindings/clock/riscv,rpmi-clock.yaml      |   64 ++
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml |   64 ++
 .../riscv,rpmi-mpxy-system-msi.yaml           |   67 ++
 .../riscv,rpmi-system-msi.yaml                |   74 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  124 ++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
 MAINTAINERS                                   |   15 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    6 +
 arch/riscv/include/asm/sbi.h                  |   63 +
 drivers/acpi/property.c                       |  128 ++-
 drivers/acpi/riscv/irq.c                      |   75 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  616 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-imsic-early.c       |    2 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  328 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   65 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1017 +++++++++++++++++
 include/linux/byteorder/generic.h             |   16 +
 include/linux/mailbox/riscv-rpmi-message.h    |  243 ++++
 include/linux/mailbox_controller.h            |    3 +
 include/linux/wordpart.h                      |   16 +
 29 files changed, 2990 insertions(+), 83 deletions(-)
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

