Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA33B23237C
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623153; cv=none; b=Pg+TFM7qUm83mdcgytZAm1T4K/L/yBJosSpISeIYi5HEKWunpbW3SAjAQFacuEeZzObmSUO5GGmritgU7JSQPCa/aOupzZnlSjqob4Ne04wFIEVfuEBPeyWxzLAqM3Q0ThWbpdf36pwutMmTtTEWxv/w8BN7XzKuKdBHHw72ZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623153; c=relaxed/simple;
	bh=lpzOjHwOKGYG7no6pJ5n1oiI9rJzwvVEh/x0OT1aKgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SW6ko+3EyvCmo8dtFMlwnIF8vtVPH1Lirh9ULXJh9QocGc+FG6c3YK7/zgj41/CJ3SKGiN/UgNtJ3WAls2TRhwB4Gac6I6Y0c4zmth+vlbzU2GygGPW3eEvaaJyN8x97duldkkksUOr0Lt+c1BkslgV+kTY/DqCAwD9EVF9JGVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ivnoH9Yy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ivnoH9Yy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235ef62066eso78376735ad.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623151; x=1750227951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHGP1kRF/SF7T23OiU1gKTpSZCj2TzVO0PDfKD5QgtI=;
        b=ivnoH9Yyy6qF0hceVzhqQHkyiTFzYZxsz+C64hS31byNoW/KBMHHMW0hShm/LPzjdt
         EnwEg3zCZY0fb7Tk2XAPlBiXuDkoSu2/nPaGCfZEVHY2SY8qGzUSqemnIdqGjH358x1e
         zcJxyQ0a5KC9QlZV4dzd2ZJZkdxheTJSRBA+NyULKY646GwU/ZqiT6vP3B6/i38kkb38
         Iuhoojrl1h25WpxuZBSVSyb+cv2DMrQrLUtf6WeErI6dCaxKFLY4kPfRVHJjkk4Gktc5
         7t9wIw+S/RGvad0rLXCcTNJK8Pqn0tc7hZGpHtiXOAKW23VOMYWI9qEVeKhe3rweTtzl
         49QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623151; x=1750227951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHGP1kRF/SF7T23OiU1gKTpSZCj2TzVO0PDfKD5QgtI=;
        b=q0ftMCDnsVq+zgcqVvPDmnd5dRpcTlRG8EAa99aj5VJi+Py27lqbTaSRcvJkQ5SZPL
         rSX02v4gs7+XANdTYq9kSWkfKCxYSRJ/MCu2DJx22VabgZVF3aYudjHanIAao7XxL6un
         lm7AvrbNL3VW56KznH8DjtPfvE8ChD21jRMuxTP2UK5/qPKf07V+q/owsAC4Yh8EWytM
         hLd3X46RNAR3DYMWAxHdJaESryWuc2tBomZFh3ZERKFAjHunxKbsiey6V0vx7VmSjDrZ
         03zma+QDSY60ppV91yai0uOMlMiNmoVtCCpsUjo0Y+0PflVn4JDMh+SUKrcphiVS9mZ+
         fW4g==
X-Forwarded-Encrypted: i=1; AJvYcCWMh3Kgr1D2W4WXn+jmoq7jKk5fHDtluM6Xwny6R7/dRHqUtgyVulvtCJx4JhYnBClMVY4gCquKVD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KK+pMAaE6uErfxm8136YJYYmPa6O6qipD6JzaxCJPZEikaTu
	7IubtiLUXxEEfRUS2pcDwuvDX5HLQWvPDA5fztA6JMulMmvPB3cbrSGalF0NIy+tzFw=
X-Gm-Gg: ASbGncvXLhXHkEmcSfv8wuEZrVZ57AbG4MJiayOT+i+Nb5B0qQYEqZc3DhPO+zU/lbI
	4YIwT62mK/S6UcMiDne5bVG7aJlEI5bYKj0aS7NMNwOLzqb+w8dYXfcLuBz9fsmf9NPz0EOvYtS
	5L8nsEC7lCEQ1OFjE/I/bzB2dwcjHFz7Dkx2VCd9ilRF3elxO0B75MEn4bUAQgrjcBV0a59r8h/
	/qVRfJCBnxIMorzs0Vcw2BH5brQRUC1l29nCUFA9NZ+CFYU3ov8I/hlk8gZ7N8C612uVi5hticM
	km2ModRM6iFKzQ76Chb0nh8MRHpzIegzka8gM/c9s+tr7EySXpbcZS3qORz5Of6peDy3Aim7+mi
	wmPPcBKk6lmqjoC2S8ybcCQzTpg==
X-Google-Smtp-Source: AGHT+IH6nfiBAkGOIya5bHfPvFUBz/4//w0r17J0S0KttXRyJ2RxRUT8VeWrU3bXJnI2eud8IG6zCQ==
X-Received: by 2002:a17:902:e548:b0:235:779:edfe with SMTP id d9443c01a7336-23641b28c80mr32543345ad.43.1749623151173;
        Tue, 10 Jun 2025 23:25:51 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:50 -0700 (PDT)
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
Subject: [PATCH v5 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Wed, 11 Jun 2025 11:52:35 +0530
Message-ID: <20250611062238.636753-21-apatel@ventanamicro.com>
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ead67345456e..dbc76a254c44 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -5,9 +5,11 @@
  * Copyright (C) 2025 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/mm.h>
@@ -769,6 +771,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 	u32 i, *channel_ids __free(kfree) = NULL;
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int msi_idx, rc;
 
@@ -891,6 +894,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 
 	/* Set the MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -898,8 +903,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (dev_of_node(dev))
+		if (is_of_node(fwnode)) {
 			of_msi_configure(dev, dev_of_node(dev));
+		} else if (is_acpi_device_node(fwnode)) {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -944,6 +954,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -963,10 +980,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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

