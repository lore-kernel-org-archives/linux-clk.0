Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442242641C3
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695847; cv=none; b=f5cOrmcRiy3B3gTXlve3sxGCLgLAFYi+k5iTBSqRa3n9AsU8mTUTeDjGpABtI0UB+CVmxWNPy1PIyMUzYOVU9MVCilXHbJyDKV0Y64S7sy57mqZT2WU3VYn30K7WbyTmqfjpMjpYmJiCCPbeqjOFGe3kktAfi9egd/XajiYblT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695847; c=relaxed/simple;
	bh=HmUGIQxKVHOETiXQmbQMVfvnbNgiP89D8IFlOG4Z2e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCRRs/FWiHOImVFvplbf7XfIClXywd/oNrsC9yVE0b+kRsBGiGMtJuw52O7N4Lvc9XsVqAZB6QiDQ/d4ucf3mF0lLnsto7d92T6wmG0BTzrKhFPolisa4/hx5Uw1OEoZ4i5CuqTvw91QscN0ykqKrX/YUwaRBJYprK7OkIvLUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Q7E0l9qj; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Q7E0l9qj"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31e3d29b0ffso3872931a91.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695845; x=1754300645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=Q7E0l9qj8Rtmp8vavpQiUhcqpOSoqPcb0AD3+cZ0E2+mMXcToKKAAD14bdd/DSEPw6
         j7TI5g3ke3kq2Vbvr6XO5Tt72t1ZfophnmIz8vQGWI8oaSlbZgcEk+E4bm67vb7rnHt+
         UXLUC03wfR0TTXOaIXsJpYAKwbJCA4ucuFd7ueaqJ4V0nDvGe6JPTAOFTXdoXNA/jOYn
         nMnrONiJtWYJ0rp+k2E8sPrfWE9L3nsrhKEz7cVLFE7ESuYjephrRkRWYTk6qX7Z9qT4
         IQMKfqtxugRAfxt9RITo7pPaQ9GO0aiJyL4uYvfRF9Epba8OXLu+aqXx1nTb6FMC1kiX
         x8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695845; x=1754300645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=lUYCARHlJb6tG53hyrRPKoUtxq7NdULjbd/OfKC6QFuXSNd9ZEoptDSkvHY89YBtNO
         rI4U8e+4pH9PJr5GRdi7odhbge3NlFOx9LnEmS0dpUM+jwGpQxmNc8B4rv//gB+BUzCY
         795pKke14mwq8BiwRXQbtlQlob2uGflxYPd2ony+mZMDqEkEYVBEfZSKpjNk92Ba0mYS
         HInMGXQEkHnnLmvjVgOLDqR7ybSmffrMDDf6MvXIWh2BQuBaMXyS5fD3N8176ctIY1J7
         3bPVO6J3+I+le9bwSnpdVgWAE3Vbuf8xUIuCKxypFFGAl159d+bSke0z3lqpQHYz2TRP
         mYAA==
X-Forwarded-Encrypted: i=1; AJvYcCUCBjAjd7uqvR2l4iWneKsgeXLLZrRDhl3bMyWiTEgY9ceXLHtmi8PK9rk0grtXOi1fL1ds1Pbui2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeUgabIQUPYXqo3c22XRPvDrY82yQSO79K8SDswlAgjWC/j5TJ
	bs8Uyyve75Sv3KMcPn7v0Ec930HQI1yU4G2oinMJreGEiB2bgoGQN/mOnJ49ZBIBznI=
X-Gm-Gg: ASbGncuBF4Aw9Bijf8JTj/F9w88PBi1+fHN+a1BTeRAkVgWfaCfw1uswoQj7B8dXbjC
	a/15y4lXkrYjB5EVG3eZKK+6AQG93rEAQ1/1ICaaYDriqSHUp/11U/R09XemH+9q7RminR5tzIG
	SS3vZZ/b7M36PMve5M6Y2Ool11fo5VITkWnS67uHXbQilHEgVN4bXtxrFdLPgk82QKSyIOeF0aR
	Kgqi18A1ruW3dytaNtIRDNLhemXVk73rDXslkdtmtKVWJ9TQUeUYllFGm1FzWYSCcB2J0EODUfM
	4GwkKIuitA4mE3ThDL/MFQ3bFGMwetTSuUpu0YZJvIBZPIHN1VeE7sQ/Z+alhXBEDNjYHOkKruJ
	2iXBZ4DvViqw+wTxcbCoda7GJ1qR43+JsEtkTAeaD/gxNqoKXdZZ+kWkcpprzixobJvWL0sc=
X-Google-Smtp-Source: AGHT+IE4g5l7pfzIpeMkicrYGgtf68TEV55Fd+qHkkxzNZ7lt9wZcfCKxLtocnW3t1JCAeR3r08rOw==
X-Received: by 2002:a17:90a:ec8f:b0:31e:424e:5303 with SMTP id 98e67ed59e1d1-31e77b1f040mr13775831a91.34.1753695844469;
        Mon, 28 Jul 2025 02:44:04 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:03 -0700 (PDT)
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
Subject: [PATCH v9 19/24] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Mon, 28 Jul 2025 15:10:27 +0530
Message-ID: <20250728094032.63545-20-apatel@ventanamicro.com>
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

