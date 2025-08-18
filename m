Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5972690C0
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490382; cv=none; b=SXA6eMSr0ybSTH3WmlrDN1FuTrDKtToTzo2L1NA7wT5TXxY/2Y+i54gm9Xu/im8gEknhKwhjcOHrNkLVkvsKkgC8zUaCs0f9JHLt0rRSuWfgWaKGqQidtoXYCPAAMdTo55hpvfXN0MhPBr8At8KxRjX4gQ45Nz9xWx9iCFxYS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490382; c=relaxed/simple;
	bh=9oHSmkR5BSlb6YNScWRBlcLQba4czDyHg5KKv03AfE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBcaH1K7w8g3TjMrs/CS7nLhL2Lfc/s2HL5Cn/O+MFpJTypMnACHAH9lqu85E1vvhm9Y/5rLM5C9SJRj68meD3Ytvnm9NaTaFMTBtGCz77DSWhPmSkfnzmbX+MxwJKPF0gXk7pM5UsiFTfKCnAbou4LYCis7gHLoXcgeAIhGVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ZQU6pGq4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ZQU6pGq4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2445806e03cso36600515ad.1
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490379; x=1756095179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnjod1mifEH5b/qp1WwSmznv0TnT3EP+iS7ZheWdF/Q=;
        b=ZQU6pGq49xLt203UFDhovN5ehXlzwLU/swqWGF0ISp5UyXYxy4QlNgVzQqln/Qj5iQ
         bBUy7HyJX/VuxLeYIYzfiPTDaqd48zwYisiBNQIZA9AXPuF5j8a+Q/U/FypAmC1QEhAN
         xS0Nhxk8pHckBqA0M80HCSfXb4Sd0+LO/EIBw8a7psCelLfeMUVVUS5CLceTOxPjReik
         c/YYeox/81VkTW3YyJ1leQg+wyBlptDk1lx+umCWbwC7jxDdncoL0CiY2oofMTlfAPjF
         +TX72D+x4kCB46szYhYxc+mQ/Xbr2SjxPbw8FbLfhkmIifROIDvJzrQldpDQx8sm1nQX
         txLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490379; x=1756095179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnjod1mifEH5b/qp1WwSmznv0TnT3EP+iS7ZheWdF/Q=;
        b=ca8hAA8a4KvIRSRDo82jyamjD9saXXui2S399eRi2iVdOZUM5n6vBch4Ds6lhvdOpT
         T54rwriiJnJld4YwrzAqD4x1ATEFmq3HBaK0Jm4PeOOHQsr/Eb/o3AVxr27h0io/sx0y
         J/5+646oiVs+Ghq+4a0uZQ1eUf638QrcN7ppJnnPKbgqHkdB0ExGMqX+OUJ6/1Yi1I8k
         rc6lFK64qDQBvSq5C/qCsHABBerTJv2JHrnQBJa05x5LK4Peb67vmIFm9yCZAc2Dc+hv
         2NvJBYfePO2eeqABXGY36CKOX5JtTwNi/DAktWPkqI9/fcEuYuyCYe3RQwJwpqb+P8JR
         EU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSZzdQR6zeiaf1jLNRfrgzxfQ+wJ+v8IHSRG+D8OEQnzGrovJejo1+s9ToWeLmJjcJo4ciB9n2+Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgIB1bmFYWyS+O4x293YEnlR1PT4+Iu7N6Ka6KK8RI5JyoW0BP
	pBZaw2m+d3VJyHoDba8qK8bN3U+zAUQxFKiiP+kUejJD+cEBae3/sHQBYlVgd6HXCHs=
X-Gm-Gg: ASbGnctUitWeBgMor8H5szjQ+UKzZgoOTVacwVJd5T1VtDqkGWBzdVnL0ukMeRW5en1
	X8azKH79Ovl6FKGhy3jhIeBSh6IR8Xjh8pfuB5u2yXBVu/3os2Lfr60U1HFgaBF6bWgCHy5oBwF
	Gb2dQNt4VVbcWRETIYJu7ElWiZCZqIIojQ4sc4K2Mknnrv6a8+gbNi1mEpODYBlyf93Y4EHQDuy
	59vaigu9UjIs8u1xFzliArb69hxVltyM1B6KkB8qbaUV2TRdU2OStWEg7zQT1b6lyK/Ohb09idM
	Rb9pHBBHgSdmph8glKDyRdd66QfZ+JuXm8d+lcZtrWY1o7DnL5mONECxlx9o19srFnvGAxysd8D
	6s3QfSiCUycPCz+Cwlc0D2zx8o3pxBGxhrjBPSMtbp1HRfqiyrj8r/Q==
X-Google-Smtp-Source: AGHT+IG8j5so9LT6XTGWsEtufkwowpwix82la3oqJqNnsExlbLVaOnLWc/li5RhrKLvcU04tm9JZeA==
X-Received: by 2002:a17:903:1983:b0:240:38f8:ed05 with SMTP id d9443c01a7336-2446d8f36edmr131628175ad.36.1755490378108;
        Sun, 17 Aug 2025 21:12:58 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:57 -0700 (PDT)
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
Subject: [PATCH v10 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Mon, 18 Aug 2025 09:39:17 +0530
Message-ID: <20250818040920.272664-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
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

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 21404baa6df0..7c9c006b7244 100644
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
@@ -906,6 +908,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		 * explicitly configure here.
 		 */
 		if (!dev_get_msi_domain(dev)) {
+			struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 			/*
 			 * The device MSI domain for OF devices is only set at the
 			 * time of populating/creating OF device. If the device MSI
@@ -913,8 +917,15 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 			 * then we need to set it explicitly before using any platform
 			 * MSI functions.
 			 */
-			if (dev_of_node(dev))
+			if (is_of_node(fwnode)) {
 				of_msi_configure(dev, dev_of_node(dev));
+			} else if (is_acpi_device_node(fwnode)) {
+				struct irq_domain *msi_domain;
+
+				msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+								      DOMAIN_BUS_PLATFORM_MSI);
+				dev_set_msi_domain(dev, msi_domain);
+			}
 
 			if (!dev_get_msi_domain(dev))
 				return -EPROBE_DEFER;
@@ -960,6 +971,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -979,10 +997,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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

