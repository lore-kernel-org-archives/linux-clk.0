Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F00279DD5
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612877; cv=none; b=a13cYtCqav/64vyj759TLrXloURlI+IHWWdEylr6Uwx1ssKw8CMQ8sp126LQc0+sMhTIKtpglw3EOIUPaTkAt9wEqjOOCyj44qkJ29kMK/Guf26cohCDJ7vU57zjTlAfmWk6LXRv4XT0Bi37ACTHQvaLKy0InYaeFwwxJboY2Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612877; c=relaxed/simple;
	bh=HmUGIQxKVHOETiXQmbQMVfvnbNgiP89D8IFlOG4Z2e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpDnXOwOtf9LMu5gARDDn1NIm3VranipTPusUH37Shgs8dPUiFzCdw2zCWaJFsRDCKDBaP4ofTMRj5kq5+tYOucjbrx1lH1kPP7LOV3libPKJJAzcM1XJdg1oBItE0l6GXLeT7PwqePHPcreZzfX9N5Vd62DWK1Efh8zYpAQyZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=SG5e8kig; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="SG5e8kig"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso506673a12.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612876; x=1752217676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=SG5e8kigGpcfqbY64PzSx4Dq/0T+2aFzBH+zOAiagCwqwdgXj+4A8OC/j4QlEnC5ts
         Jscc3GshuHI9yKvsbc69uQFdOVGL9sl68iVKaAMapixRzVCHUzGt5HxswQU+dhLNpwbk
         xud9db0UymYWx17/qVHu9/D5FsnjlgrPWOO74M6Hf0k0M80mtmlk+xvP/RVOcS/qZWd7
         //ruFeKVVtzpOApjgPIxU3jAoGiRN8kfaEyN9YqLS3KGnnKE5eC//KfZbKTvY4jdqN+Y
         M0K5cmXmh+CT6VhlvlsggG7kvoc4Zp5vS+j/Tc01m49GWrUHND0paXRxNU+eX0W/WYrj
         ywow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612876; x=1752217676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=qgqNfCsE9Rsou1owd5VvL6fzcgg5e0azRA5WWOym4bMTSicri2aSzCIXmNHZHeut3j
         Obzu8QizHbmMbmZwHLjphwVM4JuUvHqKbem+cSqgim18g2zmBDFh5tHKiKAadM+q4TG2
         +pU/hs+gZS52iKnVI75HXdfiEATPcA1rAZkNbWMl8IKKqx9kAI0MNR4rXAPFPOuVbSy1
         CebVMiouiXR9FXttqQt9aazSlW1kECNbHshCcPHZ7f0SbqRsGpOB7q+TDXRol94FP1rG
         TBJx6H7/Bs9toVsRC3eJOkifV0dkhPuOJVj7W9LMIwTz2Nr1RHou12NKMQIKSTakkD0b
         kVwg==
X-Forwarded-Encrypted: i=1; AJvYcCX6AfDucYoNQh0zjhB9pkl0/eG3riKh1/UVnvWkwc1M6/PV4zxUvYepmQir7CJ3Pe+wfUJnUCPjkaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcfor21DEoyg8bBfeHi4HEFPK6ldyG9tB0LqqSBP1aGSNsLgod
	FeJOUumJ0EEykjSjl5Zyr7UpAX6Dq8NrtKbY08H8/S6cdnqF7HVtNd6XZVAOUUdKijE=
X-Gm-Gg: ASbGncu7EH/vCpmlAM0gwyL3zxjLTZ27Vkj1F9s+VP7EJhFndSSoiW6l7zjqrVx4j5j
	zVx2WiTHBb5Wt7MpTBFrG0DYUUoo8TlaWDUAd20BGoL/OVWO9TSUe9peJd2VB3uxWKTGGUSLGCl
	ef3CrctXTdhHOnxbhkjVBj2RLwaK8Ayu4vePalGxEjqX9TG5odCoUUqTGnEs/8/6ZkZbPYHVpZV
	NO3V8D6hI71Nzkt++vuLLj0Fq3Shtk5MAoUr4/iMLgZvHVI47SDgAsTn+dFya+KzmXDmF7Oj5m+
	tN3wuzhqA4jHm7yf2rgm0Ooqr7qD8+fAtPr+F/5W7gAtqhMV51QyV/KHvraWj5YdFMmFD1K+t4G
	X1eeKoVEcgj1rLBa2MxSR6xkCUQ==
X-Google-Smtp-Source: AGHT+IG/03mTyIl4ACwrZWxyGTrvcF6TGZgw6cqAkHeGWIoJt4VduhRgTNhbrtOhLpJY/IUYJNAMug==
X-Received: by 2002:a17:90b:3bcb:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-31aac44b7b2mr2197771a91.8.1751612875556;
        Fri, 04 Jul 2025 00:07:55 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:07:55 -0700 (PDT)
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
Subject: [PATCH v8 19/24] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Fri,  4 Jul 2025 12:33:51 +0530
Message-ID: <20250704070356.1683992-20-apatel@ventanamicro.com>
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

