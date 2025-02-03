Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E91FDE29
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572749; cv=none; b=g6+CXFzZYVFX6o1OTSk8XhzOp8F+dRfqSmDOHhmez6bSHQvoxw8mz70coSA0DtEVoBb5SiriJDfHleyQcnHb3+IXuxUyrRIzX0fJunVxXRYiT2LctWr8I0s03qCdPRWXNmGcjH7fpjmTm8cOzSLQzRXLR4Yj5ddEg1R0vX1IVe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572749; c=relaxed/simple;
	bh=bNb2YKEFylNNDD7bzm+MM1t8jVyNKnLY+GSkRRkWRu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZNBauAfeqyu+Hb0HYC7q7HkWRz/cUEJuDND1YOdr6ZPwwfSn4FuqHQ40xACn4efOolXX7iLAStSQyI0G89ZNaEaT5FUAAsz1czMEwdTN7VgWwRRRpeYbA00nHEM0IbaCthdrZoLMLHskQ50O9ODHCnZHiSrankPHe+sBGz+emQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=FgZAcEVZ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="FgZAcEVZ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4678afeb133so44184791cf.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572747; x=1739177547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfhx+B7bNZPEhRIXiDYGdJlXqpYXlIrkdnjsDcgJm/w=;
        b=FgZAcEVZ2cpnNGnOIVgbPzPhDFCpKwfbm2tdrG7UIJv4je6Qejwoef1QISuMKCUCRn
         ECS3QOU+EuYhT6S1mYs5i31LBNnE7pWLZb2IyTpavUDZ8z2dGBlbaIlqd4zMOu4QXrYt
         BhrDrfTv+oKaEZvZrn9PjXhmRTN9X0v5sr3i2rBDX1/v0SGAuT112RlHHkfoMYIcqIQD
         73ynV5nMNhgAhT8guLj27ZHiaxp5YFwwavkusPoCh/8lHoaHM7Ogaa4ZcQTH5CrOjjMh
         Xy20oKMosDdDLko7qDRAgHtG0ZT15q/jrp2jL+UKM1mN8CuxIwjbsxyYZF2pnDH36GoM
         MsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572747; x=1739177547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfhx+B7bNZPEhRIXiDYGdJlXqpYXlIrkdnjsDcgJm/w=;
        b=pS0IoL6+wSlEMU13eDLhjlPJhQtEFkTrSqGDHgUG9MU0cwgQ/Awj285RN5UuBI/2Sv
         nmMmFvOFdwfs+46Ku/yBX8tsXEYthhkE6kf+QMM71vbmVe60L3/g8pFzkVZop45c52CO
         EfnQ7i7MkhJ6mHUPXkkhik1MGxIj6wq87YxbWt4M0UVBUfZT7x/EGT3oBz+tap+nODM/
         rhUmn2RHXhPNo1r7kcADAqwoJ5BvMeeGVncRFFJJ3eXq3SVG9Y30DrHvqYMD/HaPBmIk
         HxN1R8j/FEktR7b0IljpxYuGGePPQBXg/YerB2Fa4+xzNITdL9O3myATJ6gCgvKAbzVL
         O2WA==
X-Forwarded-Encrypted: i=1; AJvYcCV5j2GieOaJeJ9Zavg+sJImgfkm5uScjLdPtx6ePfxUCxPm+Ik7Fy2G4rj6iZ/bG6Y04jge+rsJGTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmPt2kNrI9n/eMPIvCgpDBx2gveI0hCdHgFVwYmBn5fzOx0KU
	4OsvcumxPL1XZS9kLlSKoeQs7qDGxGeA76OVj8uW8bakvEhU9+9nm1THeu1XFuE=
X-Gm-Gg: ASbGnctEMLceYkD1NYfZZLLiU/PFMuoctrz/7Qd4kqXT0CClA2MIgwntI0DNFv9DE3e
	C+F7LvLWLhwMK2qJxwRGevJzQVJ+a3ftlneQUMONJL4YqBNAJUNS9kD/5gu2q5SO0e6CUAgjH6J
	biq1EnVNlWc9Hd0RxtZ6mNuYwPnUd7oxGZeh9jVUiLMyxCegPcRGlc4h2NMqZanrPHXixWigYZq
	GbWdtyoKdDVzDg2tWq4CNPD27RR20qHUtigqg7RFyZ3Ue66r+nzHbSD8WldG8KX/SKYkR5iAuDP
	krswt97FscEB6fdJTaVBpfn1MX7q9pbfZUl4lGXpHLqhOBYjWwK02FE=
X-Google-Smtp-Source: AGHT+IEPC0fQonm+ZMRdOw/pHD+LkJDG4oWSy8Qrtuwi5pVXg6DvO84+wFFDLfBj5S0Srs5BOrRNug==
X-Received: by 2002:ac8:5990:0:b0:467:7076:37c7 with SMTP id d75a77b69052e-46fea10ace0mr175509171cf.22.1738572747168;
        Mon, 03 Feb 2025 00:52:27 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:26 -0800 (PST)
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
Subject: [RFC PATCH v2 15/17] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Mon,  3 Feb 2025 14:19:04 +0530
Message-ID: <20250203084906.681418-16-apatel@ventanamicro.com>
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 4021f62ff487..0ce89970c5bd 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <asm/sbi.h>
 #include <linux/cpu.h>
 #include <linux/err.h>
@@ -12,6 +13,7 @@
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -924,8 +926,16 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -970,6 +980,10 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
 	dev_info(dev, "mailbox registered with %d channels\n",
 		 mbox->channel_count);
 	return 0;
@@ -989,10 +1003,19 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
+	{ "RSCV0005", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
+#endif
+
 static struct platform_driver mpxy_mbox_driver = {
 	.driver = {
 		.name = "riscv-sbi-mpxy-mbox",
 		.of_match_table = mpxy_mbox_of_match,
+		.acpi_match_table = ACPI_PTR(mpxy_mbox_acpi_match),
 	},
 	.probe = mpxy_mbox_probe,
 	.remove = mpxy_mbox_remove,
-- 
2.43.0

