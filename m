Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0011FCD03
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572739; cv=none; b=JHqBBJzelakYFfjvjg/L5v085shQdTwSigUbGedqOI3xEdamlOUfan0vBoStsMG82FQihTRYXUy8MCH3/09cbpY9Wc1hIgESog8egmcR1ol+XRaqiUdnc8AwKf6Tnflg29nqQ1F06817ImtCA20GQ+ve9YvoNV2IaL4GRr5mGEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572739; c=relaxed/simple;
	bh=XvE6Vcit10jj+EGi7W0UE9JcLMFnOwfkX8uYHZdyz0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQi6NPE/QnYzywGCpxZfz2nybar0mxApiAyJ7uCCc3sY1TTHMtVIVAvU9wLQcLtaonRbBcmnGCIA2LNluG0MSBl0BqYRYw4KSaTHZTE8EvE8rlzUVbChLALX2EZE53r6Sxbh/6V/VyV6KqwqwpZ9tJbPkwZSAvvfWwb3byWzFcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QfoqgTyz; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QfoqgTyz"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467a3c85e11so25773331cf.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572735; x=1739177535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtaZk8L3qjlS8UU58qulSnorfsC0dbtiDK1e5t15IP8=;
        b=QfoqgTyzLrOvVtcHhcX92iOfZ3EAVZX9HJ575jqQdzqlYeNGNb/OUa249VRxtu/zy6
         meIz/rHELUHMZvIY0tHu/9w/jLdrbyV1iBV7iOku0GBrljU6n/pSoQYBrMZZoGQJk3A7
         n8WofZup43BaUxXe6w5GKeIPp2xYBSsq+V73937mNnR8Qc0vxwgqbSRn4MIa/NbmFW9L
         IuzdSax+ffAD39SW8O1PTLWr/6R8ENAc/eF2xdsfH4nFpRu2R2usru0kmw7NOOfYqfDa
         LxOOHZo8kFBX722Q6lvThAHkgfUWmSKIRJd52SXDAD14IWy51YmzXawQc1KuGl9lv2jF
         M4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572735; x=1739177535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtaZk8L3qjlS8UU58qulSnorfsC0dbtiDK1e5t15IP8=;
        b=s89m3C8gRAcP1lmtcoQUdQt4Bwfn5QokVA1DJljw38nrY9wrb1elGSIHXTwunXwgwl
         dIMDcqQnKE74fWhRgYUp6trnjaQze7gyCQkYaEqRTfXU9JK6sP3KOOfeL1C4PVYYqbZn
         4jd8ZtGhrqdFQh6B+jloYkSZ14pCI+yrsKf7ayjVVq/VxJlONZFn7MxgE64zggMe09Gb
         5TjY2Oj1iK35oh1RANPr6ZXxLj5ASs8RSD+73riutTkdw94PZVObChNcc1j9dB4Gk9pP
         L9l9sLk4MShm+eEtfjw0NmuW7Qv5/cm5dkzxodvDyfBn31ougAsJXLfXEyNzZaIh/5AK
         5BNA==
X-Forwarded-Encrypted: i=1; AJvYcCWvVsSJJUo+r1wRrxkiPmv5BM2wY+arU0cFBluTo3zTO90zmDEcf44GHgkSFBqf/HuURmTJFqVV9F4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNiQq7R3aCLZpQ6zAlke9ykKvTlwNR63pXri5wAdPidu0Px6X
	KHo6stw6ShoEWgC1RhHuhAf4Qxo+tXChucoDoHrhg6G4Nzu1wZlYd3yPFCw0TuQ=
X-Gm-Gg: ASbGnctffzYGVsD5fmxqDE1M5Yw8LfztDiuV9dBMw3Mj8aHz2SvJtFAUUskp/MZw2Aa
	+97prwRSTLoM2GDgZuvHCd9iF6TczaCkv17e2G+MwR9NeajR3UUc5Y44feOYI2IpM6NmB+MiIHc
	hdURFu85665tBRKExYARGuaMR9B/GQRqSJxF+ilFw9LCnd74PMemIiE5JmwJPvYyHd2t4TEXwh+
	pnHwIsKvJcmGfFnvf22bfA4313CINiz5ExkkW7CTAmOCdFxZh+lxQvULfJzUMyQMV7FZDeXwu1Z
	/8/uaZ1+IPQRbr23kJh73HElMskgk6Z7NyfqxMDu2XEG7rBjFMGyxkI=
X-Google-Smtp-Source: AGHT+IHyOsiVqCAtnNa8Q481eo/B2M8Ztab6qXUkekooWXnznAT6Se1XFkIj6MwCVgjL4f2KC2DyyQ==
X-Received: by 2002:a05:622a:4108:b0:469:715:d94c with SMTP id d75a77b69052e-46fd0a123abmr298052801cf.6.1738572735411;
        Mon, 03 Feb 2025 00:52:15 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:14 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 14/17] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Mon,  3 Feb 2025 14:19:03 +0530
Message-ID: <20250203084906.681418-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
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
 drivers/acpi/riscv/irq.c     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..144f97189112 100644
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
index cced960c2aef..c141975c62b3 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -129,6 +129,36 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
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
+	/*
+	 * TODO - find out number of interrupts from ACPI method
+	 */
+	riscv_acpi_register_ext_intc(gbase, 4, 0, 0, ACPI_RISCV_IRQCHIP_SMSI);
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
@@ -183,6 +213,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
 	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
 		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+
+	/* Unlike PLIC/APLIC, SYSMSI doesn't have MADT */
+	acpi_get_devices("RSCV0006", riscv_acpi_create_gsi_map_smsi, NULL, NULL);
 }
 
 static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
-- 
2.43.0

