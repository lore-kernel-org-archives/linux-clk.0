Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16E228CB2
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622987; cv=none; b=FPSvko5L5cDYjK2K/R1cRY5L7S6xA7Qr2M3MPYpJW3jmAdj4gD1C90yKdtuy1JsR3TACTCdqI+83MshDMTDz5S4jrp/ljIHGSNBVKfGV0MpTYaDuaRgwcPGoYv4Cph1xT3cTZGEZ3RZAo+ip1hJh4JWwRNxIXkQC4DgePoOKv1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622987; c=relaxed/simple;
	bh=JVbOLSnzmZzMPzV2prjcc14AqqWQNhXjC1isd0t3iV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbWbMj7cbS8xbbOSq2JU31W8JrJjX7g9Eg1/U26rsV+Syu6Z0VX+s0LMfYNzD16e+jyUNAnhhKihJ3FpmvTmq1lWDKrg4BGv8GAJB+jKkEN/rUfKu53k+C0ZZxeim6BStI6p8vG5LsIqXLgHEvyySyicvlG9omqvqeFVXekd0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=npOI9e+F; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="npOI9e+F"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3116db72bd7so6911668a91.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749622985; x=1750227785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FfmX95hujCrj9blYJ8BmjyNowtVqVIanAbJjD67+vAA=;
        b=npOI9e+FTTFAqa7innrbDsdZfEizeT3C0ktbg5w8Epj0pLIxd8JJZNJ7PHDb+8uQBm
         x068SgaZDaLpzuxV1nE14VG8FMFk3OiFp5oyjnzVO52ksWMJg85cPmW1ToAF9HEtSLDN
         hpuFsNrNcRlz3gmzB1hGaG5iiN1T1+EujxupWDgG0LG9XFdU0i3nupNRqDEsDFgHODX5
         mPmQ83GRst/JEhWM50VcDazRo6ACUqRz9KDSssd2bDsGmH9KDulI/tsbWOr9I3iY8ovN
         tY3XvThGe4096f26gG5dXGcSZpSa4ItyEnY0r5y3oz29eLKMX/2C7ePFccj8ZYLk0Aqr
         Zcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622985; x=1750227785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfmX95hujCrj9blYJ8BmjyNowtVqVIanAbJjD67+vAA=;
        b=XTOMQXfckUf+WO0NMKKD71smMs6A6ft5LX/AQ2u6zwFm4+IvL4VAq+ouk9XFr8gyBs
         BlB5SDVjmXznh9gihB5z5lFf3jnOwngRbgMRVQQRB8iU1vdlTaPYwFuwsmVt4bGVi9Jx
         q4o7AKh/v34IHeyBwyImZIKER+KierJGLUOaO4Yjp+rX0eeT7NvC6WNm2I7vWXH/Rtky
         cu9hBWxBrpEQFnmaYs5X7xbimCsBrA7BFFWhBGaeRprmfsM4gEPI4Gx+fOD1+Ld7bcJJ
         Zu/FakxqQ4mQHqxOuN796B2g6Aaqz9DM/V+V6hea3n6JT5EdGK2o8P7ZqqUcE9d1Qm2e
         D5Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXErzG/ngg7AvDmLeccfnQc0qIfe52+439fxFw1RvVkQeABtZyOJ3OA+bIZ1fIj+VOSQmiXnsxNtr4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fb6vGP1AMWUKLV50lvV/AScwn7Rk8ozfoh8LBmy66xVow4Vn
	7FquRn30zdJZ4hN3XW6h1/WHjkskAUCMAcYUEwPz7IsycgO0YEzdKDfpieVBOR8QsvM=
X-Gm-Gg: ASbGncspxXDasvO5VgEYODebGjpCoytrJOskMvNBggOB1X0CxzQiWizNt0V7Zwc+FoS
	N8tLnaNWJDBMJrjWPZXIRP8Gn3RWq7FQgtUSnshNr1b3P8XSW2+KLT3xIbwET8gVR+Jy7Pnwahf
	MSj8PFK6i1Ym9fE8m3RW2vQSUYOZAuAMLZYvyocKFwLPrVIgQFvmJfhFl9Catjl0aPiQuJuUsCT
	rkoEmLwMnOdVDZ54YSJfgsXYk2Byb6CriLEzRpmTLa/7LAltAyUsiRpymmDnfVngkW1tyofy7mb
	F5kA5p9hXdwP+ZAYFoBXpH1gBBwkvflsuIDrl18Zc3ZNUYVqrpxJik0EtXie8xg4BUbjo16AUIa
	SKqsUOonKAiI1ryBhLvwCsJYO2w==
X-Google-Smtp-Source: AGHT+IHSrTlgCLaqGGBKm2V552V4xqWgVbVjfWOuolPdJzzx1JsZPHsQKmSOy4XI9x2O/aCfniZVjg==
X-Received: by 2002:a17:902:c94d:b0:235:668:fb00 with SMTP id d9443c01a7336-23641b25d36mr26128145ad.46.1749622972783;
        Tue, 10 Jun 2025 23:22:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:22:52 -0700 (PDT)
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
Subject: [PATCH v5 00/23] Linux SBI MPXY and RPMI drivers
Date: Wed, 11 Jun 2025 11:52:15 +0530
Message-ID: <20250611062238.636753-1-apatel@ventanamicro.com>
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

These patches can be found in the riscv_sbi_mpxy_mailbox_v5 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

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

Anup Patel (13):
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

Sunil V L (9):
  ACPI: property: Refactor acpi_fwnode_get_reference_args()
  ACPI: property: Add support for cells property
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
 arch/riscv/include/asm/sbi.h                  |   61 +
 drivers/acpi/property.c                       |  123 +-
 drivers/acpi/riscv/irq.c                      |   75 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  590 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-imsic-early.c       |    2 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  325 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   45 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1002 +++++++++++++++++
 include/linux/byteorder/generic.h             |   16 +
 include/linux/mailbox/riscv-rpmi-message.h    |  236 ++++
 include/linux/mailbox_controller.h            |    3 +
 include/linux/wordpart.h                      |   16 +
 29 files changed, 2920 insertions(+), 75 deletions(-)
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

