Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAC1EF0B0
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163003; cv=none; b=KPIUgr2KfP8bL9uCEKlX9G7NezH/4RJijd8TrnCL4ap4Zpt4xaC6mvpoFx74iS64o98OsaHrb3DeyVTfaF4h3SHSPeirrP8P72c/T+xOCCToguCGFAyyHsfMPpjXPB/1GdOqw7caSyddksEwMB1n7Xw8wn/1b5Db8w2xR/LotxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163003; c=relaxed/simple;
	bh=zDn5/7cgweF8ELtXSMfACZNDQjRTv7MTCPgJxhy29ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBwyjVoyQGbxUhMv5/fagnhQvNHVzGlr2lMGT8YrxnrZEDXYpJPuODbzT5WjLp0nst6BRG6e2ddl74D9EQ4i52OH6iVkwAv8GvLzH31i5xdbmPiElFEwMYE9XkK4Rn/tP8781yE2DKBmq0/w8NuKrywsOTu8I4r9AVr/dYBUXh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=SPbrPqIY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="SPbrPqIY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234593b0613so411435ad.1
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163001; x=1748767801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tk9rsFOMcBi0w2iwyjKL4nID6SkMtfavACIq0xoKWps=;
        b=SPbrPqIYiGt57Km2VY7ZnittLjAy3YbqesR+IVwZkwo+dLuqImR2zMB+mB1Y7FeZr9
         wdwHBHhxSITMnJqUfWeUkmYyvb4LQNvamQIhAaIYlUasHIiJ4t57nBvjMt81wO7xx/Jk
         u6gr8vOVUqwoCSHVYB/ubPHtmY3RVomsNR6cMBR/CmtlpQACcYdXx0FrW1lY3n5zVMpz
         vgk+E1KNUq3mmIq5G/TEoWAxOaPsw/y9jI85mHoGe4+Saw0fkwDzCT7H/KVsWKgAk0aq
         SZInURLfXyCdofvUuEfv8AdkLT2GOVmnNPYPGlqgCt0FpOdQCwQ9KQv1Iud/B5lTo6DB
         YhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163001; x=1748767801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk9rsFOMcBi0w2iwyjKL4nID6SkMtfavACIq0xoKWps=;
        b=f0Y3+CNJ96xlG2B2rj35tb0L0tKktaZS8Zvczwhb4FZRtbax4p0EIasqnku06DV1zQ
         lPLaBp6TAMKM3D7152BtvKu5rT5ynawD19Rqsynsq4Mpb7Ak6rBTNVmFmA5DFNmOsPcv
         YV9mRb5Z33Zwi3MoKkk+qEdZ6Z81sYj+pmIzETFAcMnQq5rtn43FFk6ydyrSViA0+cKh
         EsRe1AN8w36VWDIF4ScDvNnV3IuY7bGANUtZRmsz5V/Xfkq4juSX1pOmWSwMFb6h6dKJ
         CAea37sUS9oHw7ujbicplkA10mpaJWOXFLJYOQBH4HWatLI0FdTFKBfdzZcWXVtL05iH
         5ijw==
X-Forwarded-Encrypted: i=1; AJvYcCVe0wF69dyxoGzeSnBefzrArO64QM/0rkwVhWBFyCX4fq4kExU6LDjiFdEff+8uHmwxJrVS6tJs42E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDwOjOTcq6Gclw69VpilL8I+hK1IAGm7KvhJ+tY3TGS/u4sr5J
	ArzJeo8n/HgPDBpAKcjG+OSnjOn0Gdw65iMe/QCfM4yys9Ai1AJxFruIKlqM3a+s4Pc=
X-Gm-Gg: ASbGncsO2tTwJq7oq5bARCM77kz3NCLNEZ7NlDnTsfdAsG1F1HxuUaHgLwjBHzJZyci
	xxJS+1C9JTnD6Y1s8UIFplSigZ7TJfQVq+bxZlYueYzQpRIrqzw2tli4FvR2KRL4Ive3r2Kfo2g
	bjq2PjdX2NToYspZGCzad1XwVR0OmPlKb6TEQ4k0Ha8wMuMyMRmA0KmL2nYGp4mDnuNjmoaqLDY
	MbhrrnxBsH+Kn7hrqn9Fbfty2cRGS7dJ62sNHzQLS0LbrX1XeTmygQM/5SZz3aXFJWTw6XCeWu0
	1bCYod51mgnKLEjwNVhnRO9ShWKpZD4dcTsG/ZdVV48K+vcag8eZWM8FOpa00n0Fvb/U47cfgfF
	unA6mq0sA
X-Google-Smtp-Source: AGHT+IHd4+b/db3RG7uCJei3SJ2Uvb1+0nClU288A6ml3cofwF28+g4UZ6VjLiZVLsynxXDRsQl3Dg==
X-Received: by 2002:a17:903:3a86:b0:224:23ab:b88b with SMTP id d9443c01a7336-23414f48ec8mr72169465ad.8.1748163000846;
        Sun, 25 May 2025 01:50:00 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:00 -0700 (PDT)
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
Subject: [PATCH v4 19/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Sun, 25 May 2025 14:17:06 +0530
Message-ID: <20250525084710.1665648-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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
index c881cf037f0a..f5e91972b5fa 100644
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

