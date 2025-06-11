Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC7622CBF9
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623117; cv=none; b=h1J6325ULRDsuMremQGNErySACTZXXSNTUnBrrrMU/ZgZvHy8qayIlnJNAOob/l5HHa/x6RhPrJ8+JhEVpMCDMkzzwS2Hko8L24QUNfHpsGNCQk0FCMvYNswekCPmtRnH6U25mfI8oSDdDmJ5n1JjREFq2c39dZpjJS7UV+Y4JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623117; c=relaxed/simple;
	bh=uLkW3DQcKIIgVHib4AKQIVSEPy4uT4MPjoilFNj5tRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/VK/xbuypLT0u+rBZILZTYQX6ULw8nfwZrDxD5B1XBP/JiQNCFrqxb+Iz5u7vbyAewEaOthcf6IGuJTMa89vgV6gYc04rck+KOu+B8sIr10bWI0klN++/l5pSp06zZT1Ukw6pABNXMLhjZRiFBzOvvqAMsbKhW7GBnIL14j1nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=DApETb2h; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="DApETb2h"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234c5b57557so59010035ad.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623115; x=1750227915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=DApETb2hsZEWhXaNXn39qAjIm51iYesPlMrA8VTbm7ew33yX80i7uH/TPJNJK6wY8z
         V8BNYvco/eOvjqD27/k5MUiLjWIl0rdsWm60ZV3EJtPmUIkf1wywt+VJHZIJJBXDEy0H
         Uvlcux4yCEyma8Q1PvclYw9Bbgrl3DOngukQdjdwpHXbZVv0ph1kgiiYLUo+r+vWxO4F
         3z9/Ht2+wQ5n6fx9entZIZ8zlmhTkttylrHWVVTBWws7wEA+sozI/zi0O6/vWz0JQGRV
         fa4tsnScl+6tPKb9+b5Dx82EYpz0S7THiOxtztHpGUX7xSPmdZqw7WNVCRJNkXcIsDgT
         IH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623115; x=1750227915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=gjEwP3om3dv/8XVC9Il6hR62C8IgmvKRRqpqz/agKb+wCIJQWERCRJ7PbpsbmN/fyX
         XxEmvSnZVgxZOyNc7ViQFuV/zZJwCX3EsGswItBo648++39bitY+AxWrO0E4Ey3qlUDt
         S8VmdRL2eMibUAxhbb5+l8ORXo5kpMjZyt2TnKZOMt4sPNuujtTFEw6mQP3aIFn0VhbR
         rLUBSqbuLZ8eI7kONH0pg6BgjZWa+BkCLuoqivt4kMIFpLm6apTHr6kTEf6B7nDBDjFW
         FeU2ouKAxcWWOpFG/51PMzsGYnOGLfrpd1jCkQePFetPDEOSEIGNJoEnrGmQ/73RRd7R
         cTIA==
X-Forwarded-Encrypted: i=1; AJvYcCVSCizK1f7rKvyZrsHn6dopDAH86iSpY0nGzg+eKT+ngTlvwmDmbpQN3i9wkHAUT2Hfnh6j/ITdK18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrl8gQFnaX54Wvk1uXNM0X7rZ7alv8J5bxikDd1MvvZOd2zPT
	GrXvDHnKpzfC7dIWHWQ/9tdLKWzQuftqc7knWeDz292mMWWwH567e/G6FjTd60kjFgM=
X-Gm-Gg: ASbGncuM/59X0KZzwnmjqPOEfBCm3unZE2Q2Q2OGRa/Mlh+nFZInRidVTAJ1HMyv+z7
	l51cRUxaJKO9vusW1a7N5cb5TTkGDtvOFZ8D4b317B5w5rnCnogxcyJhhnsUoW91caNCYjEqtcD
	HlEDcVYG/E1cArWD0I+Xo50LBvzHakhyuLFZ4yTOACAkIXX7UAsiDEjWt5cnnwzL/DD/ZED4QbR
	AnK26Xbgwo33dnwI/atta5CCuojLDZzJRkfufcamA9Msg9ny0FgtOJEDT6296bxOi/cSXl4XNet
	ZTcts9iejZ4u1zLQBvCiFT1iVydhoSPms2K1YMVLOgMfvbYDUEOUpJgWV7CP9krDgXfyM/NOptG
	7ugBEu1FXDqr4AihDgXsMZaQVFg==
X-Google-Smtp-Source: AGHT+IFnqBNnTwbehZbdbVmid5c+EUoLDt9iVtCEphlQwJCdvquAFaXOuTjhhB4h2PkL4dhMiL1o0Q==
X-Received: by 2002:a17:902:e741:b0:234:c8f6:1b05 with SMTP id d9443c01a7336-236426b7493mr21510465ad.52.1749623115115;
        Tue, 10 Jun 2025 23:25:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:14 -0700 (PDT)
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
Subject: [PATCH v5 16/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Wed, 11 Jun 2025 11:52:31 +0530
Message-ID: <20250611062238.636753-17-apatel@ventanamicro.com>
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

Currently, the interrupt controller list is created without any order.
Create the list sorted with the GSI base of the interrupt controllers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..33c073e2e71d 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -115,7 +115,7 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element;
+	struct riscv_ext_intc_list *ext_intc_element, *node;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
@@ -125,7 +125,12 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	list_add_tail(&ext_intc_element->list, &node->list);
 	return 0;
 }
 
-- 
2.43.0

