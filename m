Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9917622A814
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623135; cv=none; b=AI1Tr2PTsT0p3cbBoPPWeAQHDnsfpWVz/1e2n/dXYZtqP52sOV2EyB6nOZQcPNqT6tyUIKEUEvvlp33UHnwqR03vKU+Vx9TBLoL38YsSb6RMDmqbB8kXvGas7sbeO0VsbHgFGzw+uswwibQ6X7FBXHwLe5rmOHaYn0EhYe4Mgbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623135; c=relaxed/simple;
	bh=HmUGIQxKVHOETiXQmbQMVfvnbNgiP89D8IFlOG4Z2e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcs58yZtgT1FgX5ntZl2WqDUTP3Th/I5lx4ZUs4Qcg2Ye0h/smpbsfykFinj/twaYKdDgDL3sTn5LtMRKOzaaPLQR1grjJNm4yopyIXNEA3cIIrCOEJPaGf5Kej8DmPNPj8bVsyxlBeAtm4+VAczEpBUpjAv1M+0GI6toSBMOSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=B2jJZpiG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="B2jJZpiG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2349f096605so74900945ad.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623133; x=1750227933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=B2jJZpiGg04yarCx6myK6NWU1VEtVsnvm4x62tzl4Hj/+gAzyWgYqRFySwYer3bgIb
         SLil8J4EKO0sYng9FZNUEaeIe2yt7qpq5hgghEINKzave+u+Tb6OIOA5PtBRAyGsEpda
         sR9U5f8tPCVAOIlBnlhNW50DMV1NO8Lg33y6vCGWh8//wQ/uAnkqwB5lPviKyWePyevp
         tbSn1fVZzIuYy3t5Cu79iTLSiw9UpQK+pdsdXkh+iQqpCrih/GBGLiLjpPQT6BHi3A6I
         1UoLd3WWeX+Zyt+g6suIqv5CkEMIVkieOm3eiyNlKwrx2hk8oB0PJmoFPnEy2JwtecTs
         HV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623133; x=1750227933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=Pn44qIEKFQlggZdsC3VNvkd4tPQWnHDtBJ3Vaic/vAd6O8qV4ziMj5gyEI9RPwAAy8
         F/fakIHzCm+1/H9XvWqH02O/9UUbrK/lPF0kYoCTVeiFhaabOKxGA9BUfCyC+3g8K5QL
         iScCYiBWi1+L1sW3tawLMSZY6+wXe91EtWZsaFJ2YAgxi4NnyCR4ox1+E5eV6bsa2msA
         6sadMYGeXS1v3rPkNSy+SNFJmWUJ6iV/yN8xN+CO9ueV7D7V5lWyeO1BFxrKbfxCcxH6
         gZlvqUhh3ia5y/GDfHrHuL6Dr4cd6ksIa+Hfk8AqQt83JixdqLcskR+2L0Tno2C6jGbW
         Mu7g==
X-Forwarded-Encrypted: i=1; AJvYcCX9c74h7bj8tpUehGTydOQw7+3R9gZojHDbYFJ67gv9H+0JBBjnWL/1rrt40iOdRYhKabxqZgeky7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SosoNShvHGX9eu1guAZJZlE94P9gYiwTuiC0bsZ8p9nBjyj/
	me+cGBrfXt6mXBTyBnMV2ihu0r6i6nvw17ZuAMONyalmeGrl+mLmx8yAOj2AneyZOw4=
X-Gm-Gg: ASbGnctayhkbjQbgZ/OeraKRZmkyMmvUR41EKvbSq4MlhIBuDKmHpR1NqBumC7E2gui
	+TOVpkTE4MG6ao6ly4ykTDV4ysgTihVtFJl0I8lpksUl6q4ifPfvLnMaIygNQNHuhYWSv+66X+w
	rSQS3beeeWuNNNiRm36LBHVDqlxLjEW8oFXyvdRLZEFqcBOykVZxLlije6Pdgu7orMZdPHe7NiO
	qCsq50ari1Dx7QWYM6dm2yU0j6wpaRWkLzrvpTKwv5DbS39fEevkfOVVCEZ9a6UyuYuqL2GFnqk
	xbzGX7QT+FpF79Y52H2PXfawMHU427GQXmM75XBfOO4LSjb/YFKDuIKh9DyrpCADNtlfRE3iVcI
	crJq8pLM8Z+zIQhJqAxjzYAsF3Fp7i0ntfvHB
X-Google-Smtp-Source: AGHT+IEwIvq+MzJvJvKzSGNR//1g1SyAHTIWb/Bau/CEh4PRJwyomTrDPbcTXddUHnHcaNXUPycI9Q==
X-Received: by 2002:a17:902:ccc8:b0:234:b422:7120 with SMTP id d9443c01a7336-23641a8bef9mr26337945ad.9.1749623132858;
        Tue, 10 Jun 2025 23:25:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:32 -0700 (PDT)
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
Subject: [PATCH v5 18/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Wed, 11 Jun 2025 11:52:33 +0530
Message-ID: <20250611062238.636753-19-apatel@ventanamicro.com>
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
index 2caf049f09c8..9c9d22f5165e 100644
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

