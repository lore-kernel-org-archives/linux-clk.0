Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E12571D4
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970960; cv=none; b=CS+BaYqVIqzCdkZAdUlRMW8Kevd2Iewmb5KAb1SgsjQx18hlrHtlNlFB+XoH9A8S2fSUZH81JeNJZR5AveEY97t0zR+XMj+G8YaobSF8qxzUz//YycEQDj7WiOk4e3UTIZhGbadhEMubnIWVwbRNP5DpzRgkX11L2/VCahSn27M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970960; c=relaxed/simple;
	bh=K7avSPDIXlqobRpntOaSzj5/NTPpnP31Cu49pMX5sIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCD5o/p8RrSDzslX+Tw5sec/Qtl2Br3uGvcG1HDAMK2U3UCU4oMFVYJDqXPFyC7pWs5cZEPlqDF1dwf9sUGHbGZAyF39wwmxeGOeG6YES4r5wG1hQpWz5HA+66pBhEA2fn65hQxzNqHLe94dH/ivvJIRMQR/VCFtNC4H/EiNXIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cRtp8w0Q; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cRtp8w0Q"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e4db05fe8so33065715ad.0
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970958; x=1747575758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EicnbWAWAWZGOgLLZdl8aWUhfZGM+BMdqy1GBjeEe78=;
        b=cRtp8w0QrtpFdIzSzXtxM2MGOCFGcqDKP9FtywkawKNErKr+53kJATrU6kMdMdLl6x
         ONnmw+pkkSdPo2+tOvxk8yVd6ObNSGmVAZ3OmEvA2trA/uUWXDHJMjPEEQ0WksZMp9g0
         5DcKHZtDUkSs/ULhsKYREm6h2oxMCcfFjgVr6rmLw18vxg9XRFSCL5P9X2HXcn6Oj+Sw
         bSc9lpDAQq61vuRmRUlvh22bVteCu5NM3Oc9WQHBLSeKYtpuonIGOioy3jCZ+62VKAXo
         BEYB2GA3qdSROtVY6H4HKV8sj6rZxCJUXtIEK//J+UB4cIidsA853ZfG+nP5nSuC9FfT
         fb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970958; x=1747575758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EicnbWAWAWZGOgLLZdl8aWUhfZGM+BMdqy1GBjeEe78=;
        b=jJdODhaQr4viYC1sHNeu5nJNUAIfRJoNsgiRkeC20zGwQ9ckt4BhKxMWZRghDzz746
         9A9T8eRzEmtqUSVTwjsGKzeSI20DgL1nC2omg9hbbs44hfdLVjOrlHcdHueWQxVnPDB7
         YZhQxEKdNyMhAt4T7sZFrTBlFYlDdVn/rwtSCt8WC7E7xpWeW8ber5f8jeOu43ZuQCHX
         C260QeSsgvCR2lI7optdStqL9kDHweWjwGOAMxg4PBsDuwALcEOVWHyfjDQ5iGMAz6hV
         Ly7Cs6u8wAeegDr+iGuXJwCY6SBM0a2Rx057/g0G+CKWPN4skoblN5pJGm5YuJk7jJIH
         vVWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxdt2S9XN60D19pl2c3Qp2wF48Pr7iOohzH/MkCfBbT4YyyRGQmDssQ6bJPWJXP76PxHmniK1BwLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YycjxStGuZcLu3rb36dfhW8QSmr/9SrPip24v8t6KAZU4BPXKSU
	dCSjaNUTx1JhvqEPCUzp7t9X0TvWrmN7pK3IPDHsJPOj7xyj/MJZYSQlD8/T6wA=
X-Gm-Gg: ASbGncuxAfzHeJdVdaD0snDQl+yImbVzUeIHPjgGgUoP1O2iV5OsKRk8fPrgy2nFz1x
	MRNS4WJIIEXrDsaf94v1rMT5VrJs2BMgvwC+6O0VckRaoWkNqu0u5v7iySQTNN54d2v1PhtzBm6
	R/lA55n8ztnH+5lStuTK46aKZt2LxA5tYRGG0PqN/N8mIH0DZ9dQ7mVCODVmofqsuFhv5me9DA8
	2yCq1t9dFVYtRY8aIx0vN8txQs1Z3kPusSWkyzpAwsQotRxH15zCZzeJL0wGuIs5AeQGNVB6iWp
	2kGvW+d3Q9NCb9/caxSl39fAs68vWlo2AMkd8GbR70F/wp+z7W6aDG4dCH/53GTyawUhdv7UCbV
	hadK7Z0GaGyZuvw==
X-Google-Smtp-Source: AGHT+IHcv0oB42y9G0S/HkQGQ5hPOUGyXWyhO3DHzdff0XOTKBe+J2a2zxdeZPOiU00EgG5CU4MCpA==
X-Received: by 2002:a17:902:e94d:b0:224:1074:6393 with SMTP id d9443c01a7336-22fc918c44amr161982025ad.43.1746970957821;
        Sun, 11 May 2025 06:42:37 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:37 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/23] ACPI: RISC-V: Add support to update gsi range
Date: Sun, 11 May 2025 19:09:34 +0530
Message-ID: <20250511133939.801777-19-apatel@ventanamicro.com>
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

Some RISC-V interrupt controllers like RPMI based system MSI interrupt
controllers do not have MADT entry defined. These interrupt controllers
exist only in the namespace. ACPI spec defines _GSB method to get the
GSI base of the interrupt controller, However, there is no such standard
method to get the GSI range. To support such interrupt controllers, set
the GSI range of such interrupt controllers to non-overlapping range and
provide API for interrupt controller driver to update it with proper
value.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  5 +++++
 drivers/acpi/riscv/irq.c     | 38 ++++++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..ef4aff62fba7 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -40,6 +40,7 @@ unsigned long acpi_rintc_ext_parent_to_hartid(unsigned int plic_id, unsigned int
 unsigned int acpi_rintc_get_plic_nr_contexts(unsigned int plic_id);
 unsigned int acpi_rintc_get_plic_context(unsigned int plic_id, unsigned int ctxt_idx);
 int __init acpi_rintc_get_imsic_mmio_info(u32 index, struct resource *res);
+int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs);
 
 #else
 static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
@@ -74,6 +75,10 @@ static inline int __init acpi_rintc_get_imsic_mmio_info(u32 index, struct resour
 	return 0;
 }
 
+static inline int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
+{
+	return -1;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 95b4d7574ce3..2ce311042627 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -10,6 +10,8 @@
 
 #include "init.h"
 
+#define RISCV_ACPI_INTC_FLAG_PENDING BIT(0)
+
 struct riscv_ext_intc_list {
 	acpi_handle		handle;
 	u32			gsi_base;
@@ -17,6 +19,7 @@ struct riscv_ext_intc_list {
 	u32			nr_idcs;
 	u32			id;
 	u32			type;
+	u32			flag;
 	struct list_head	list;
 };
 
@@ -69,6 +72,22 @@ static acpi_status riscv_acpi_update_gsi_handle(u32 gsi_base, acpi_handle handle
 	return AE_NOT_FOUND;
 }
 
+int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+
+	list_for_each_entry(ext_intc_element, &ext_intc_list, list) {
+		if (gsi_base == ext_intc_element->gsi_base &&
+		    (ext_intc_element->flag & RISCV_ACPI_INTC_FLAG_PENDING)) {
+			ext_intc_element->nr_irqs = nr_irqs;
+			ext_intc_element->flag &= ~RISCV_ACPI_INTC_FLAG_PENDING;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
 			    u32 *id, u32 *nr_irqs, u32 *nr_idcs)
 {
@@ -115,14 +134,22 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element, *node;
+	struct riscv_ext_intc_list *ext_intc_element, *node, *prev;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
 		return -ENOMEM;
 
 	ext_intc_element->gsi_base = gsi_base;
-	ext_intc_element->nr_irqs = nr_irqs;
+
+	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
+	if (!nr_irqs) {
+		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
+		ext_intc_element->nr_irqs =  U32_MAX - ext_intc_element->gsi_base;
+	} else {
+		ext_intc_element->nr_irqs = nr_irqs;
+	}
+
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
 	if (list_empty(&ext_intc_list)) {
@@ -135,6 +162,13 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 			break;
 	}
 
+	/* Adjust the previous node's GSI range if that has pending registration */
+	prev = list_prev_entry(node, list);
+	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
+		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
+			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
+	}
+
 	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
 	return 0;
 }
-- 
2.43.0

