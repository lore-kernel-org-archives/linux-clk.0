Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2350126463A
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490364; cv=none; b=QGEoCvSuq2FqIlaB7H13uTicRmhUDwuncRYS9s8ogWUO5KBZiekJManmm5vl0zrRIBkVqbfluSPmGiW/hmT4Q1Je8ew3wg9D5GELzTtLlbH9cVie738mKWFR8nquby2dKcqk5z+YMNBUT9nnN839gcc4A7BXpvRTLyNHELS/3oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490364; c=relaxed/simple;
	bh=DvHxs9+w7ltOfoA7/NhOym7TCg3DX9LBOV49nSbNPeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bc8riw589sEt3eppIa0HUjZ2hlrZFVbpuLD2y7GS5BYXnBA9z21Lf1cVBZgtVnzn8P48g/+ada3qfHhdD2yMYpovezxB43cNgYYHbH39kXRAUbNkHk9KggR5wI+ixwj2FufUOX2JNIeODjosFtjRPzhbabLupcaSonGNk4WElMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=LenEERFY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="LenEERFY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso2572269a91.1
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490363; x=1756095163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puANNupOfTPwupiCwBFR/x6cxjL9cWmUBZsMBIE26AA=;
        b=LenEERFYzuQ5AG+K53/dPwiEgjuLOYkSiElCnF0TB+TQlB5vTL4ltKpBibzVDGdUWV
         M5/R4V4FUrhK0pj/WLx8eLFB+Td7E+KzODmb4+Zrqfrft0+G6b2mSuuTJrm64EoT5k/d
         fH9+R8XtyshqQCsZSNmdUAZDAQ5VkX6jLS2Ty7+8SchGmkP6rXDX9UOxARAuxJnoZvwy
         9EeTDXor0zxCVhPVMEfevZxDPGif/xHzIuAn5UGV5kWCSUzA3MKIUNem2xc+Of9CyEUC
         0IGK0XuXbcpm4TfCRHZoX2ih3vTs46ncySWAkPjhLdROL1APb8we4cKbvqcdM9/uTRqX
         Pa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490363; x=1756095163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puANNupOfTPwupiCwBFR/x6cxjL9cWmUBZsMBIE26AA=;
        b=iYaFfTfswKwMiXV4PQlOGLBDuptRTY22ZxXrNJGmZUVsmpMI9WUx3ADtYmiG+oI3lw
         wT0s+UPcNMzEGj5T0UevvXi3inDGUEuJZmds1MYCasi9MFhLWjrlRKfL0LXnPqh9hK+5
         wjp07diAAkEOP2sojGbdR8sZSQqbNrKSN9UEjC2pQMdKnBLByHlY5OeFam/cNQzHnB8E
         zvWT3gZ4MNRcHhhhhkGkX5vQvOCN6X8AZ4xdtIaNFuyC5wjFiyiiGR0TanZkEsO70Rqp
         L/Sfui90Oc+cHlVmIDZVKI5euiBtuL9ObzEAjvs1AGwm64uk/8ZxUpTH2Gu4QUZ7ih3+
         7j1g==
X-Forwarded-Encrypted: i=1; AJvYcCVsrJ4Qg4qa5pAB4X7m2W3EZUKUFLAX44Kp7Ob4wW+efMF1NWxxf5q2lHjnkQgFX1XsQfmb3OVxCc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8hbykdTJsmFPrGQ2/OKmqmaw3zYDq+toXDz07jrDvZ+O5rjQ
	uc3FPmx5N7M/ziiQSBOSUVoaTqCNBEKV/C4ohHqte1Rlomm5AfCCjV40jRa4Vdi1WG0=
X-Gm-Gg: ASbGncsMf7ThTcgHdX/n7S3KMFH29usBYkfyIdj77IjaZWNyv2vUHDl9DeQa8GTwy9E
	MQeCagPgX/2+IQKks0zg3ywHHRpKw+cbDy5vlITYwejLcbjT995ZdpCijF27G145MXUTWP8Qg5k
	+sxUeKFQV/7b7AUabF60z9x5w3mJdwpIcq7DRq8dJuQcsbPkScf7id6p8k6tmGcrT/0mKHJFyQo
	acxpUjd0Ibes23bY8H8VUCZ5pRztKJrFnDAsvB8Wtyj5SkmHa1ozpw9+LfJ0yWbfDK18UZODK9J
	L5Y5W0KodaRsVhNz4P02hvzQ+4AnyGOgDyTCjRRwwByvOAbqjV1n2jNbvk27rgJuJSAJGlHuGWX
	3EZl6pp9GmZtc0vZCcxxy4WyMtasaga/ZfOlgaPIzVbxr24J/TsS/JQ==
X-Google-Smtp-Source: AGHT+IEC3gS3fhyc6UCaYhWEA2S/aXsvy2asvBmFcLedoY4ZJ0Vv6Zyu/0geFA+k87d1XbbA1zhDRg==
X-Received: by 2002:a17:90b:52c6:b0:31c:15d9:8ae with SMTP id 98e67ed59e1d1-3234218df88mr16496712a91.33.1755490362422;
        Sun, 17 Aug 2025 21:12:42 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:41 -0700 (PDT)
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
Subject: [PATCH v10 19/24] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Mon, 18 Aug 2025 09:39:15 +0530
Message-ID: <20250818040920.272664-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
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
index 7ec592fe430a..e29ded3416b4 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -32,6 +32,7 @@ enum riscv_irqchip_type {
 	ACPI_RISCV_IRQCHIP_IMSIC	= 0x01,
 	ACPI_RISCV_IRQCHIP_PLIC		= 0x02,
 	ACPI_RISCV_IRQCHIP_APLIC	= 0x03,
+	ACPI_RISCV_IRQCHIP_SMSI		= 0x04,
 };
 
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cc1928422418..d9a2154d6c6a 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -168,6 +168,33 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
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
@@ -222,6 +249,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
 	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
 		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+
+	/* Unlike PLIC/APLIC, SYSMSI doesn't have MADT */
+	acpi_get_devices("RSCV0006", riscv_acpi_create_gsi_map_smsi, NULL, NULL);
 }
 
 static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
-- 
2.43.0

