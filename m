Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9462DA753
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249013; cv=none; b=eJHWPzkEH9oF/HtVg5m+vCY6nNhy/+XB6zl3gSY4qeDvCzqCFhBQJqeWFE4+lwFOsqKRQ6vGu4UT0w6Oirh7sL/mxKT5WoHWbadNpbkAlyTIVn0vKIp4HQ6rFFwtbf3sW6/VzXGxjqS2W5krOPDYPgBT//3JYl3jA2TQTh7YafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249013; c=relaxed/simple;
	bh=HmUGIQxKVHOETiXQmbQMVfvnbNgiP89D8IFlOG4Z2e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tV2R34/IlwFDqf4Csnei83ADG/ooto+8aQSINSZKqUgTFUURCJBRKhZNbsol4weBkCJRIfpw9ygAODY4+CM2kNC+feCMWPrnAU6qg0QAvyG/VLq7+DAlSl9I3Z8UptieVjRDvHADjD1xn5JGXmdo0Mh9h3YmCGI7LtiZa24IGco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ka38MkA/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ka38MkA/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748c3afd0dbso1789739b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249011; x=1750853811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=ka38MkA/QrDwQU5RJ0sYhorcPJ1AWTjxxOff5PQkpWFvT60FlIyDkuhh3Ez9Ti7c8U
         QU8YLx7FcJWKZaFgf794saJZQkp3ZhFDLcRkPw3PsPesSlMg+JI4oqSs9kb9UQ13qkGM
         cb7YSiqqVF4q8LJNwgf/RYg2TqgJjGIuHnUIoksyEf6ww3ctaCLn40eliKIm2aRLa3LR
         Wj/Qk92Tmx1AI1H+QKcNFGN3KzMTg86ekAI7SBvqAChNQHg9vOSkMvCKZZH/g6VM9iwH
         NppkfuVWm91+GOqmgONLHInoGXA2wHjwFNJlLVAJ5u2teX8tjXu5jrXNJHjPxAaHPKTC
         tyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249011; x=1750853811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=BYx8F77/yYQSzk8tswTpM89E9wj8OYMZrREZnnVx1CNhTzQavms4w0D0vNzGsSo/mR
         sFtcYeqNwGhE3O3KVqxzX7rNT+j7G3fZ5Cx8gKcxp30O0EaAiQl9tKNQvmCcRakPv01J
         KzbRoWldbxIcLOMbI+uNIf3FRjmO9OrsEbcxOIEV8DgMiTi0fu3nanScM5xTJaS+IIIU
         JkwuuTympe5w0PlNlpaNnuxemK25/TwrKsKlxSmcdvEqb/a+4IMBH3Hw3yKOsth9DkGJ
         DTdAp0fPRLRjgLhpKeUoMdQ6sLUJ08LjsZxuV3a5Twnzp87KDsWz9xu/KSfLAUUtdTvv
         6JYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfinqZGmHXm9QIRr05k49VgwXJhQ4VeUTuQTThInmOCdpF5jnrl9y2aVftfBkI011iLIqry42E69k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmEUTl68tkycC1BoL3UIUMfcpMWPTKHIZCDK390B6Ag32JZpK
	gfl6Fjffbgzn0PtuRY1yiHa4Zf1Af0BwvTbH0IgPWSXA6NDUIX3vc4O4CLw0J1GYat8=
X-Gm-Gg: ASbGncsx54g6loDOQQy9sGehINvlNxCrXwhJuQiMIY52BnFcusxuEHQWJc2hw1ARTau
	0rFKXNlnL/84M5zWK4EPkCoSGJZG+R898LbAoyg0ooub+C0CYJKAMNZjM2ox5TP2hhVweIs+r4H
	Zn6deU7ScEhOozbhHKmVOiy+TrfEiC/gfH29ktYkNk/+1FxAIovCOcAKmHS/WnOIf7HJFSuyzQm
	TZiuMdn0SXG8CYcfAv9Nl//W/7t4T9Wx9Yed1uansqr8UnCpE5eObBByBaIzwEG+Me8ClyNyywz
	2S2Jg+/GEI/1fPpjQRhLmZ4KDaXecdqHtj1MQmrjwMT6DKiwI6asGKqYLFFUgSW8EkdxW0zDE/c
	SHwXVgJb/LKLHXJEggQ==
X-Google-Smtp-Source: AGHT+IGBu9f7X1d5EGUhRQ9j96q5jUjwVSBF0M5vehfN7EkXrctEjP/TYemz83ALSInZEF27aHmtjA==
X-Received: by 2002:a05:6a00:148a:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-7489cdeef7emr22605339b3a.1.1750249010475;
        Wed, 18 Jun 2025 05:16:50 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:49 -0700 (PDT)
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
Subject: [PATCH v6 18/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Wed, 18 Jun 2025 17:43:53 +0530
Message-ID: <20250618121358.503781-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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

