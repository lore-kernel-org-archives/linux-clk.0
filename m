Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05AB1DDC1B
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163012; cv=none; b=l89g8UIfmRZyPjU9ZH4gkATfoGxfY0MX9Po7Sik9IGNhM/SzW3ZYBYOpu5iK7eeI27OgCbNlU/s1hcowP0zgkcU6KbQ5T5Kq/RkI0s082WUGGeu8GlRzwEN3LSnz9NXTMizWf1/u71tp+8TDfipR8rYWHGkTXAuU0ZWnY+W/5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163012; c=relaxed/simple;
	bh=3EMexVZnQ/uKL1p2c69xumak9aK8eue/GT+CZvSc6Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3ANj93K3kvmPxbD8OnwQoAoX5IeTcsP4zzjJRVDFOy9aQGMGZRV5Ypw2/1F5ntc4y4Ia0xbNnwoHduJR2GHQsNNZ7dPDE/7HDx2qxlg/Gjm6nrueNdFcDjR4a+syRpogaTxpWWZdpLI2WdegFacvKnJ+UcGJneX+fPnsTCk9IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Vb7gsRNy; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Vb7gsRNy"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73712952e1cso890713b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163009; x=1748767809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfqImwLemjECQIdHoY3dB5j6bAppUnYCVT8DSb3UZSo=;
        b=Vb7gsRNyvxhtpaq2q80iin3aAnk45+Q/xJggVDwZX20pzdygGfUsbQVXIfI/173/zv
         D5sir32o83aWOWzQTCY9yRGX4+NOh/u+Zu1+HW3mVdh5R1Yj+W+CnpuSp8lHRmJXdgm8
         9tgA6glRYOWqkalSb7QeDLB4wkEBorq4vaUYNTsCXwzLwPRWdNQSU0Y6EX43WYorIXIS
         t5y4hZFsY/GSex2rTLsZLY+EG4JtK1+yeAScU08ma9Do4UlvcMmyAjjI4gXRpt5oMd6A
         OgOPSSWx61xWaCBMI0VnFE+PWnVP97UTutXvhreQBEWi55ue/wdffFHtv5kuEuf5xrKR
         vAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163009; x=1748767809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfqImwLemjECQIdHoY3dB5j6bAppUnYCVT8DSb3UZSo=;
        b=jiCWluR7fdtiOj1psQumaokAixmVguXBYG+HwXcS1JP5pkU7OtFu4/aqs5DYrp3p08
         h1i/hwMnexuop6GhMLASzSFaJ/gWYvx/9ppDzng+T1fWqMNt/4ktdjiQ6kMYPUNkFsPR
         penxMRrrmUfXbU/zcVMU9Tervdxv+5AvJofDo0thII7WY4RNCz6xPc1hk0tjIic10+qQ
         UM2YNiN0ERVDkzMotv4sPIhC1m1YG0jnQxwFso5oTuLQ5D7llWFsiZovy3QIa1jaYCfM
         X2Lu3wvqs8BybP6Yp7WLdLvt7XHKeeB9dgjsErRaUoqhcJf37f8B67+eg2qPICtv++og
         EL3A==
X-Forwarded-Encrypted: i=1; AJvYcCVfbCP+XF0WcMiTPjojBtAf5Ou63oySArrj5cmXy8v+DhioXo0HGDOc7dVKLrscSOcckH/vJat3Il4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW4XcmrqYKTowontziCG4dSf4Po8MjbwUnoQ2qKdj4RqbZo8oM
	whDmjq9scLzFv6Ttru9nPOKDcTAz52vJQLJVuzpUTAqnP8Do+FMl/MN5qRChUhUH+UA=
X-Gm-Gg: ASbGnctkSJ2dovXBhILIi5/wbTq6QnXFbUjLben9PrOy2o/4Yjqf5O/q++nSyuZLykF
	fYnw0sp6/rmCfQ/75abS3O4dqW/SCEPij7VeMoyX5iab5HtxX1dSADTJsBD+aDL3buHl5J8ItCV
	ZaSGxGIxf7UFLxMpuIbapZ8VeHnophSpWqLN1VM51ZXya7nBuCjg3CmHDALZY9aMmJuJrr9WXBc
	PZR2n0i92O+bSnc0wDSx3a4z584AEHyFxCxHl3VgufuWKUnaiFOiHfJsHUFNViGb/WuplyDXCW6
	Xj4dagVxSwTXVvBtBfyqx6svST8abG2/Onz0tXkOPmXFyg9X/Tpr48qQ1HJD2Zt89hQHpjEsH//
	W01Qw7/wz
X-Google-Smtp-Source: AGHT+IGBMpKQMQCTT7NisaoM1o5YYuoZlK0DnedslPvydIVxR6+tdzcYF9ryA8HgQTUtwWvs2xaGbQ==
X-Received: by 2002:a05:6a21:4781:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2188c28bc20mr7948535637.19.1748163008895;
        Sun, 25 May 2025 01:50:08 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:08 -0700 (PDT)
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
Subject: [PATCH v4 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Sun, 25 May 2025 14:17:07 +0530
Message-ID: <20250525084710.1665648-21-apatel@ventanamicro.com>
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 28 +++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 121ee5fd3d0d..3d71af6321c3 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -6,9 +6,11 @@
  */
 
 #include <asm/sbi.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
@@ -767,6 +769,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int i, msi_idx, rc;
 	u32 *channel_ids;
@@ -892,6 +895,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 
 	/* Set the MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -899,8 +904,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev_fwnode(dev)))
-			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
+		if (is_of_node(fwnode)) {
+			of_msi_configure(dev, to_of_node(fwnode));
+		} else if (is_acpi_device_node(fwnode)) {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -945,6 +955,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev)
+		acpi_dev_clear_dependencies(adev);
+#endif
+
 	dev_info(dev, "mailbox registered with %d channels\n",
 		 mbox->channel_count);
 	return 0;
@@ -964,10 +981,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
+static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
+	{ "RSCV0005" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
+
 static struct platform_driver mpxy_mbox_driver = {
 	.driver = {
 		.name = "riscv-sbi-mpxy-mbox",
 		.of_match_table = mpxy_mbox_of_match,
+		.acpi_match_table = mpxy_mbox_acpi_match,
 	},
 	.probe = mpxy_mbox_probe,
 	.remove = mpxy_mbox_remove,
-- 
2.43.0

