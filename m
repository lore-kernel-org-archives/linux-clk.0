Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14395272E4A
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612899; cv=none; b=iN14/BBxuBr1A671lZ9hK5cpkKVQSP8G//iaHGzF3a2of/yHi0VUcnlEdq6bo8f6ESJKwesXG6vRO/9hO2UIDR/9J7PZ+wCPTT2zGc8ktDSjyIDET3Td8vk5BoQIIigES1nznBYTRWv9t/5FlklJErDSsuz9cS9tVro0YsLTrBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612899; c=relaxed/simple;
	bh=yxQ4/nao3TsSttA60EEZOodcoM/3MIN6VuOsCs7ivus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWD0bvjiqIxCyuENUfAqTavwOLRiJ45HqjRD4tbuws6vD5QcoqKdKzZkfm3h4tpZ4QCQ7D17JAb9Ob31t1NZs4PmUD0tAYJTnopQ1Vx1lVxLVu205gCdqbHgVBqL52u3QERenq0vnmU3Q/H/dbhBvg2S8lv0l55Rx9MxKwZl5x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=KN9hr0Xs; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="KN9hr0Xs"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af6a315b491so600693a12.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612897; x=1752217697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg2C8aGrSqthMYzi8AM2pKamXBwNz1uMo88H+80YoNE=;
        b=KN9hr0XsDD4ihdeBZTZlix/Um2RnhH13f54mSjiUqWWcXlDatZ/MVh9OBsLOZUmLDy
         SEeLz8yqCJ/I3XjZNb4Vjfg3n0TSGQn5JJjBPkU0POIEBluFhowzthbmmLKCwOhaUR22
         j8RDks1avGGHJxXz8SyD66J19kTM2ERKMTTK5C2lq7VfAdy2xCAi6PRIgVZlbiRBv5we
         iYC8KTqK+HEjYQyo1TRLR5VxX/JbXWcaiCwXc7ZVFHFqGixchQEouqR6G4LDhbwOuclG
         SrutBXAVFyGsGnQq3zegCu60mNOqMxaIEaRYzu7vuAvfgXb/HKcaMvuSIHHGhnt3s0rq
         pkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612897; x=1752217697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hg2C8aGrSqthMYzi8AM2pKamXBwNz1uMo88H+80YoNE=;
        b=ValoGljlEI7vY7ZfZyrGwtIbCAfGtLl8abhmdyXHSUh7jcJiTJUC08zn79hVA41KW3
         rrqU6ADmvtBDV02KC0G0mJz+FnBVdsgterhUsiQGHg8N6T9icwlGaS/j/i3lS1mPXmt6
         xBVz+ZuqCCSoLWAaSumdWOLFid+NAPy5zc8oy/ls8xKo6bR1/TxOXBQrblUtsWCOLJ+N
         CUtRr5O39siXzmKWoZFBiQhqSKsAs/t/F1D11vw3XIP/xwMY7DJzuObjFWidB7IpP81a
         CNZzI1q5nd7xpnBg4ZhDuzWoVgIdsxyP7BIXkRRORFohQe0SYMjkHmiathuccR5v9gae
         wDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNj5BkyAXMNAas94S0IDKGkEHIqiCzF9yHchNq8pq/POgRHfPnXwdKgP7CGHcDnbnoURLU70JB3jY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/tf5yFUku+07ZjQypl6OBvAcKNX/+xAoofuzTHGZBPqzyisQ
	pB/Cm2VEX26rVOuTKicFJKx6ajmdvwoCuibdMgJIrPnXWi+3zoFThPb6I0bENYhzUT4=
X-Gm-Gg: ASbGnctxPMPFxarJ2R/6V6Zy+eFGYVcMvtd9PgMxdUhXl11qJaaFbz/GAtpBg8txFoZ
	coqh4zZm0NuYCMrIH6wQyz0D9R/MvIo2fMC3u1r6O1z/UgPqrB1zL+XSv/6jstuUl6JNTKL28yT
	YlOXfub0ElaGDI2DMzE5m5E1oFhEagXGsg4JWdSxlWtbKEUhvMCqsst8yLK6TP/u6hv12YNt1BC
	sUjSlANH6Ml+/+Ul7wws2fVROHVP1/ey9l9KepyNFWGknq8HbwaBl0I0tVEDqF03NQY3eltN9Mj
	xyynX+nsXnnhql9SlKJwiVIK9WKMS0gZ46vY35zodkevfk2I+FxXfjh15J+0sW3y//gK9nVbC89
	ZVrlq0P1gESBsvNpw3z7H4w1Vrg==
X-Google-Smtp-Source: AGHT+IFT5Pa0dkoRqff/joV4++Kb+3u576Zbjs98XhITYJ3V0wKn/H8sYSAtGybI3ynT60XjUmc+dg==
X-Received: by 2002:a17:90b:568b:b0:313:db0b:75e4 with SMTP id 98e67ed59e1d1-31aac5333cfmr2825712a91.33.1751612897430;
        Fri, 04 Jul 2025 00:08:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:16 -0700 (PDT)
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
Subject: [PATCH v8 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Fri,  4 Jul 2025 12:33:53 +0530
Message-ID: <20250704070356.1683992-22-apatel@ventanamicro.com>
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 1a8a74d3ad4b..a739088c3d4c 100644
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
 #include <linux/minmax.h>
@@ -902,6 +904,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 	 * explicitly configure here.
 	 */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -909,8 +913,15 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 
 		if (!dev_get_msi_domain(dev))
 			return -EPROBE_DEFER;
@@ -958,6 +969,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -977,10 +995,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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

