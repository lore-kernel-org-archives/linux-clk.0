Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23F41FDE3D
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433415; cv=none; b=PSB68SRQ/GzlfxUvjvL7+xGNnOWjLqmHEbwzVTeEI5JH5VhIRFtZHBpntGmKjqxi9G604FoSWmNbtReqvyRl/Oujs6QMww8fI375uItYjKp8hcNvcCevJeSkS1njrC+82Ka9Bof65TDmB44dlZEbxaqfiPYUtl0JdmM4ZFu/jJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433415; c=relaxed/simple;
	bh=MnWssIe2gPHfcipP/eIFfuXpaV0J/C/5d3IRgfnAQHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpg6tFqY4lkbTvM+zBSJHkbSZ7ZvZqgl6eQX8buw79RsO93ImolaZXBRG0pK0HADcMaAgjbMIvgt8yarfLbswR/YGpY/kPnLTnGQOwlV4QNpT7lnRKi1xvvYWmNg3LD2poRXa3cRHT49wF6f8SeKbmNclypWca0uw7FrkAdzpXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=VmV/HXWb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="VmV/HXWb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23c703c471dso1225025ad.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433413; x=1752038213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=VmV/HXWbgXKfhol/oezCExwtDqo8rz8f8/fOQyRbSDWyE3eCoUDcjykVIz9WVdvBm9
         8s8Eje0kJ6oCZwZtBeqhFpbtapJjE3QHvjmmv2/bHBtbWWH+pQ4kDZHqZAwdsJrApwAx
         J9WRExciZ6/7bUpCjuSAejwzE3Nn80cg6G9Gx7CbuFMPk0UOCs9Ym+gjBNX7LY5l+ss6
         tykg1iCyevJP7dCAoAW9mYPRAOFWn/wxp3jouytad0wUka8qCX8pNleiJEHiCSSnbN0K
         mJ3clnoQbzE9KhiC577HTsz2TLllDVz7pNqffsaiAYv8LFpn8r1vUzjzgQDvee/zV3e8
         EHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433413; x=1752038213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=etTQKF86QnqDpw4eI/4mWOddr5F/dNAF4b9EzP1kTgGwYHjxCWPgZJqGtp7epjLx9V
         4gYnxOuMVQ+SPzxY0duv0CYPtHXueiOVn72wXtCuqqDF6bn0elwGrna1ozP/GqEppN5/
         TfuaEuBpgGTUvqTdIDG6qi7iYGXNweOM+r7AGF2+fHaNK2PcfcXdnRUk7MPRXNXOyetI
         7uBbU6+8E4HGCAEEBI+MbmcTdkk+0VIqNSEj9zbT5jn6rmRkSoR/rl1EscISTDPAWJih
         cQgIq/6aA1gK+71RwSIpLYrFgQrzXikJkGfmrfBXlYsfCNfdn6sVRrVeu6bnJfP1Ni3E
         fPrA==
X-Forwarded-Encrypted: i=1; AJvYcCV5scCp8eA5jvOxjfeUpqud26bxec0MB2MzFiCOgx/MjdnuUa4/K2ahBOo3+XtfshYVUKRSNlfwd3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYlVOAnlDOBx7WBzm3JqQD2pK8MQBVMEzpAgyFZmqG3XthX+c2
	+uOJHP7+W9b0WqNyrTdyvfUl0JuZKEIgZiZpQJBEJ5UpOGU0cgDma0IivhRsk6o93Rg=
X-Gm-Gg: ASbGncsac5Rl3ortYsIlWUA8NtRLKbedDzp9XITZ8xgeiRFSK455VUl6hZglKzbv+/o
	3AA4gkgpcuzmO12UbgwnxWztdoC4hzb2Ws62qI1iJc00BngtBKdIQd8PLfsqeWysaED4kZUJWUX
	0kztl1I/agWKzUT8zDMCwy9mvcC8jr0ZXs1Hk4LxYBotkJUE32uJS2McnHjBcZyceUyLY4nbSWN
	4kXorL6cIfQzLDh9arRrNeNroMP202Nk6EsWqS3NX705Obr7VesGRU6K6ZUAV4KvFGtBl3cwQVA
	kaFlxbv/rqIUi/DaFFj4iSou8Kn/3/8ZUjTUgNHU37W5v2t93MGeWlmftWEB5btR3Cemt9sALBM
	BZeLlQ6xyZx86t1VudwHvZydPOZE=
X-Google-Smtp-Source: AGHT+IEB3xOr/KqlSjqwIoxg7iMcYneYBHYIFdD/yKkygLO37mz3QttZMjHHl/DW5Dvd44FsOdfqIA==
X-Received: by 2002:a17:902:f542:b0:235:e1e4:edb0 with SMTP id d9443c01a7336-23c6e83ea60mr21119575ad.22.1751433412835;
        Tue, 01 Jul 2025 22:16:52 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:52 -0700 (PDT)
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
Subject: [PATCH v7 22/24] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Wed,  2 Jul 2025 10:43:43 +0530
Message-ID: <20250702051345.1460497-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                 |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 47 +++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 96bf6aa55681..dfa8cc0e23dd 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -619,7 +619,7 @@ config RISCV_IMSIC
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index c42fceab71fa..6b64a93d3c87 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2025 Ventana Micro Systems Inc. */
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/device.h>
@@ -9,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -209,6 +211,8 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct fwnode_handle *fwnode;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -239,6 +243,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	}
 	priv->nr_irqs = rc;
 
+	fwnode = dev_fwnode(dev);
+	if (is_acpi_node(fwnode)) {
+		u32 nr_irqs;
+
+		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
+					     &nr_irqs, NULL);
+		if (rc) {
+			dev_err(dev, "failed to find GSI mapping\n");
+			return rc;
+		}
+
+		/* Update with actual GSI range */
+		if (nr_irqs != priv->nr_irqs)
+			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
+	}
+
 	/* Set the device MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
 		/*
@@ -248,8 +268,15 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (dev_of_node(dev))
+		if (is_of_node(fwnode)) {
 			of_msi_configure(dev, dev_of_node(dev));
+		} else if (is_acpi_device_node(fwnode)) {
+			struct irq_domain *msi_domain;
+
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			mbox_free_channel(priv->chan);
@@ -264,6 +291,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
 	}
 
+#ifdef CONFIG_ACPI
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev)
+		acpi_dev_clear_dependencies(adev);
+#endif
+
 	dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
 	return 0;
 }
@@ -273,10 +307,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
 	{}
 };
 
+static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
+	{ "RSCV0006" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
+
 static struct platform_driver rpmi_sysmsi_driver = {
 	.driver = {
-		.name		= "rpmi-sysmsi",
-		.of_match_table	= rpmi_sysmsi_match,
+		.name			= "rpmi-sysmsi",
+		.of_match_table		= rpmi_sysmsi_match,
+		.acpi_match_table	= acpi_rpmi_sysmsi_match,
 	},
 	.probe = rpmi_sysmsi_probe,
 };
-- 
2.43.0

