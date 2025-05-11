Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E59F257AD5
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970968; cv=none; b=gRbsd0r7lTS+BESC+cbZIpirYO/ljDwcBBfOFhjXjUth+JUJlEqNcnz1IYL7H5RqQtomkPrM6dbnY4rgKufNAL8SVmMUrwjh5QreXDmClOgkoeWlvQQ8ISAIpZwqIpUrMQuCFLCA1cja/8aRn7CUAbmCh1N7iAp2mICnIDz1/ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970968; c=relaxed/simple;
	bh=2c0c8jsJfWRci4YgLo4Jwd+/KiY2TElC2GWw/k+HR44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tWMqBb5aFvfPMjbvp02iTCFljYjwlXVWWjijdNF4X6s8S5Fp1r2mJxXRCjgWWoB7erO9ocH74EoBWF8+Oqwf7TiiS2d2Mu+wNnpiHkHBMoaaCyyZVH5GnQaOKNKBRqPyCaoS954DhhaNltgasdFdA3hS87F4laNQLzFtjQ43ZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EkbRdAaU; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EkbRdAaU"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so2186897a12.1
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970966; x=1747575766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL0ekEHf+9tk1LYRRg9x2F3+Sqxj6qvGnxsbEos9s5Y=;
        b=EkbRdAaUAU6qLgzMqOGrizv1qSaaWwft+hPRk7nOLOj2HzHWdeX12lQ2iJobsBhsYh
         2nCfbsO707lEKJj+Sbj2ZJSaWtqF7tHeqYgNOocSjhKhQ3YXp/tdwXSaTRctcPGDwVRh
         5srszSV9B/ijuMoVEwhCGhf8UZPLoeQWaJTFLvFE3SwQCPJ0sKkCfcm2Ym2zTij6T+gA
         PwXBPirtA49iuiYihIoHHgvvJL2Z7PsLL3gcLxDv7DysbEef4MOhoxcGnsslTmypdvTY
         bVQsJ4pmni/GjqMdt8q+RM5VXuhk8JgVfJPlYgFRFSXQ0jqSMs27Op4LNZ9ESdXHlIZS
         l09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970966; x=1747575766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL0ekEHf+9tk1LYRRg9x2F3+Sqxj6qvGnxsbEos9s5Y=;
        b=DEeespjGGlhu5+Ceh8CcTEsDEsjGk4w7An50gKDYjKIW7VMB6NUFP7CvnH+2t6VfJp
         8/Azh3DfbKCX73dj5ZQ7YxBliBwSCey+msxNfcmgVLQ7GrHOSoLiOB6jjUC7ZyEb0/Ss
         iF7Zj2nWokgRS/8MvsJWAEO1sF1gWbqh/QrfpeWN6aU8BJFXmoFqRosB3tpcGT6qcevA
         xu9ZZbMZakpMl8Z321X6nJVUA1AiDhr+t0oVAG+LHjNwsEhok9BlBoJtlEtBxZ5uRYUr
         0LGSA0CMt5pYKzvNRXEeO7TBHjER30YijKDKLqcoVwc6rE6J6cFge5pyC+q3T6mY5V1F
         p2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVYtZkkx8QXhiLYhSgT5xKXF+TDP9loJfhJtp1jEjHwU+0DEQP+xsuVvue6qgtHc4VxVAPjNzk0754=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9NVptxcRrS0XBMwEyi6fbJE10tn6xYETMRXPohwIkkZTqkNK/
	m7qiekQd0zfyH+Yyoy6rw+u2ol0kVlPbFU65JE0I1YiICIKFxjfJwZ3nR+rLoCI=
X-Gm-Gg: ASbGncu9Ax4lXxLNgpNDHUIoArLhZb4fWHGH2lCvIk1BBTKAnW1cLj6humWnECKgHPe
	twbHJVTWdTgxyDVJ5fnJW+RwLi1ZZ0nZn+AqzqN2SACmUoW988EW9DfIwikSUkMMm0M6SJ8O6Yr
	R3c7MXPsidgL/MJcHyfsRQlQIhw/UaBeKTHadqEx4CHCOY1SVigszkXBmxtixhVegubm4sFTrsJ
	jzf2unqDUteXr/w/Tm+g1Ypd87YdR+Psf0tADTa+9krBxhsO5NvfiT7lCefUJR3wypNss+Z5zyt
	h9dAac7VvRsvugje6mjSTbWn9zDX4zNk852DuEGvLUzRx2kGO23k5TgPQEl6DAwMviT4Q6BxXwB
	jo8ARp95yUyYmvg==
X-Google-Smtp-Source: AGHT+IFD9aro01q26Oqr2tLLTgh9Uxp62papfpR06AdmrrPoZMhToINHO7wyBBWzA9lmGnJCy0hp7w==
X-Received: by 2002:a17:902:e393:b0:22f:b25b:8e93 with SMTP id d9443c01a7336-22fc918d15cmr122283765ad.48.1746970966248;
        Sun, 11 May 2025 06:42:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:45 -0700 (PDT)
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
Subject: [PATCH v3 19/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Sun, 11 May 2025 19:09:35 +0530
Message-ID: <20250511133939.801777-20-apatel@ventanamicro.com>
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

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI device will provide GSIs to downstream devices
(such as GED) so add it to the RISC-V GSI to fwnode mapping.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  1 +
 drivers/acpi/riscv/irq.c     | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index ef4aff62fba7..d28f90a25421 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -30,6 +30,7 @@ enum riscv_irqchip_type {
 	ACPI_RISCV_IRQCHIP_IMSIC	= 0x01,
 	ACPI_RISCV_IRQCHIP_PLIC		= 0x02,
 	ACPI_RISCV_IRQCHIP_APLIC	= 0x03,
+	ACPI_RISCV_IRQCHIP_SMSI		= 0x04,
 };
 
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 2ce311042627..42f79940a69d 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -173,6 +173,33 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	return 0;
 }
 
+static acpi_status __init riscv_acpi_create_gsi_map_smsi(acpi_handle handle, u32 level,
+							 void *context, void **return_value)
+{
+	acpi_status status;
+	u64 gbase;
+
+	if (!acpi_has_method(handle, "_GSB")) {
+		acpi_handle_err(handle, "_GSB method not found\n");
+		return AE_ERROR;
+	}
+
+	status = acpi_evaluate_integer(handle, "_GSB", NULL, &gbase);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to evaluate _GSB method\n");
+		return status;
+	}
+
+	riscv_acpi_register_ext_intc(gbase, 0, 0, 0, ACPI_RISCV_IRQCHIP_SMSI);
+	status = riscv_acpi_update_gsi_handle((u32)gbase, handle);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to find the GSI mapping entry\n");
+		return status;
+	}
+
+	return AE_OK;
+}
+
 static acpi_status __init riscv_acpi_create_gsi_map(acpi_handle handle, u32 level,
 						    void *context, void **return_value)
 {
@@ -227,6 +254,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
 	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
 		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+
+	/* Unlike PLIC/APLIC, SYSMSI doesn't have MADT */
+	acpi_get_devices("RSCV0006", riscv_acpi_create_gsi_map_smsi, NULL, NULL);
 }
 
 static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
-- 
2.43.0

