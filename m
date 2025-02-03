Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC11FC7E1
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572762; cv=none; b=GikJ8I2anrBiwysU9elQmPqhmSIKw2TQ84q9KpwUoN8gKDlDJd84YXF+Qxltrxivhp/YpN3vYjXjILcdB+fd00F9u/JGyXxUSi2y0yPTJBQVBDHGB3F3WbkhNIwPCwpxJC9wzl7RbMEDdsO0bsu7KxQLh0rdbcEw4NnY+7zlw3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572762; c=relaxed/simple;
	bh=UfWFl+WiF9wnff9ghcAYXQF0BAfAo8SLYSUuLg3w0YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3i3bsVKSOKwGswL4c+UPXzz1l80oFav+E5KKzYPmSOJ69jo5UN79gIf1r324oyV4yKL5fAoV48jhO1oVMXDyDUh2X3PynVH7tNsc80CjWGGHF5oSrQGeQjlsIEp0vcCIKHpj9EygdnpATtPvYXebBbCclJpcz5jB262X2lxoT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XBegWBXx; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XBegWBXx"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46df3fc7176so36638401cf.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572759; x=1739177559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMc6tRRbVVjIuFrimhD5cbba2O5fSdoBYlM+WudqAOg=;
        b=XBegWBXx4f7ewx3i5gr5Ehb6or6t6WJN33pqhdut/6stElAgOHoRKiI1uUc0ZbORg1
         VTUGRfBwRz73ERF7mAgbzwN5AjPIJr6AwOUNjOVC7EHUMu8vWipW7XyLqePdpC4QYu5Z
         XHGOvcyZoZGK0o+L3EFEcCsVofJS3XhpBe1GLWk2K93OQzdYFNE9BNwKwiNVzt7oDUID
         JOJCGLCVAWHzfE+Nj5cJt+iThZ3yhrpUo5r1G7Xa2OuT1AoI9Cp3DGmgdDqRyy7994uM
         VxFVemk/hqL6je3nnQHGiaK8Nl8aPsTynTs4T1FaTghQhO7KNxNJ7Wer7pJAJL0V0TYJ
         RBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572759; x=1739177559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMc6tRRbVVjIuFrimhD5cbba2O5fSdoBYlM+WudqAOg=;
        b=mguphx3l2hU8qthfYkGYzXBTSLgaMa9o37Oa0h6eOmnIBaM3OHcEzUF0BjktC6vPe/
         OUVSKHSunAmAWiVMCpxbhxF9jPNQiLTJz4I/hsvK/sik3y3SGUobcyQlhDkkuLnRRUeU
         L7rrXIUeIx62EeCX361sli7NK4RMZwPVt8gSnuqsVpNfaFGi/xAvz20MohtsbpV75odB
         i+ME+KJzj/6THx0ve7CxqxO5/+4IHuR8wVZ0TPq1N5uRbJHBwM+2Lblrc1XYkJng8UAr
         hPW+qTF+dH3h+0AduyDQgjUv9m2jPO40+9Qr/YNZZs+AeQsyd0HyxEwOHOuxuodMRh9w
         lTvA==
X-Forwarded-Encrypted: i=1; AJvYcCV8jf6uCUb720BvWGv98feTEl8XOvHqyh8tsIewfx0hmHhcLW0BTSXz6qA+saNFTnviKHS6JJgp39Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrMUqbqMbRFZ01g7c5YAnsWHI7TSfX09+W5mqgTAUP4nKCOlD
	bnB5eBef5RAIYZ9pt9F26KhWahQICsaprRE18DugqB/MSwuVfrQOtPSM2YdO/r8=
X-Gm-Gg: ASbGnct/kYfdL17Nf9f4TZJ0AQe14tV8ajuumawU8J1vvqkSJeS2x1YmH8bB0WlEhAd
	zNmp5NAkK/1uJmyc+qkIYdmJ8SAAbOXHvFJhId2YyytEVmDQfNbtFcEV9I4FF+z/mjwBGPbH4UF
	lW4QZtJUB8awU4pVJyR5zkWJxru+hsnghSQbU8QvNS967segewxOpcrNk/tyrCNYpBZS7zx59xT
	Wfg412IRjC59WeSaToRD2uhlystjfZZzkwSeARbs9hsiPQGZplOtspg/PNDTtUOJPZ127V4bHjM
	awQ5ogJt+crjDZGxNCotXLVYniSx4mtDvLseJ6mojBIreNYla7IP9n4=
X-Google-Smtp-Source: AGHT+IFAdiGU/iUBycYCxgRM5DsqzJFg3ES5gi2sqFYcXQtsQPK6UBgEZ5OP+FdlHA0Q+Cdlc8Fv6A==
X-Received: by 2002:a05:622a:134e:b0:46c:7152:317e with SMTP id d75a77b69052e-46fd0b753famr297039461cf.42.1738572758960;
        Mon, 03 Feb 2025 00:52:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:38 -0800 (PST)
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
Subject: [RFC PATCH v2 16/17] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Mon,  3 Feb 2025 14:19:05 +0530
Message-ID: <20250203084906.681418-17-apatel@ventanamicro.com>
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

Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                 |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 34 ++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 2ae44354735b..cf96382113ce 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -599,7 +599,7 @@ config RISCV_IMSIC_PCI
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 3022f0924c94..1f03241920bb 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -8,6 +8,7 @@
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -215,6 +216,7 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -223,6 +225,15 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	platform_set_drvdata(pdev, priv);
 
+	if (!is_of_node(dev->fwnode)) {
+		rc = riscv_acpi_get_gsi_info(dev->fwnode, &priv->gsi_base, &id,
+					     &priv->nr_irqs, NULL);
+		if (rc) {
+			dev_err(dev, "failed to find GSI mapping\n");
+			return rc;
+		}
+	}
+
 	/* Setup mailbox client */
 	priv->client.dev		= priv->dev;
 	priv->client.rx_callback	= NULL;
@@ -252,8 +263,16 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev->fwnode))
+		if (is_of_node(dev->fwnode)) {
 			of_msi_configure(dev, to_of_node(dev->fwnode));
+		} else {
+			struct irq_domain *msi_domain;
+
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			if (msi_domain)
+				dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev))
 			return -EPROBE_DEFER;
@@ -264,6 +283,10 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 					  priv->nr_irqs, priv, priv))
 		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
 	dev_info(dev, "%d system MSIs registered\n", priv->nr_irqs);
 	return 0;
 }
@@ -273,10 +296,19 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
 	{}
 };
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
+	{ "RSCV0006", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
+#endif
+
 static struct platform_driver rpmi_sysmsi_driver = {
 	.driver = {
 		.name		= "rpmi-sysmsi",
 		.of_match_table	= rpmi_sysmsi_match,
+		.acpi_match_table	= ACPI_PTR(acpi_rpmi_sysmsi_match),
 	},
 	.probe = rpmi_sysmsi_probe,
 };
-- 
2.43.0

