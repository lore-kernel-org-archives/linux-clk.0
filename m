Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8226CE39
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490372; cv=none; b=o7OsSucoLbHcPk+GU5mDGpp5mQsLKJkh8xKg+CiMDP7q707BIBFLBc5UR6kebIjETChIxgqWYr60edVoCunnxApJR//sMdstarzD2WNI888eK7UFagsvkN2N2nn4DR/nyZNGRcMO5thgXcdhjc25AAnJLmEP/JgfYeB5UcdXAyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490372; c=relaxed/simple;
	bh=rmp0C7txImCtQLNbB7l+5FEegOeoCIFY/QO5lS8kFpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQhnSwFKZEkjD2B8gw9xfJhAnSiqrQEpv0BEk/1H2wkgOUsHVwJkejAS6YbHJJha3N0JJ42WtSxgQvuryXXEYHFzVPhNEyOFUvXsLq2vPOrTYjcJ9yGzIi4Hl250c2FtrCZXqkllppSKPhykKuq0mUCRKTzj1rmv6AvglfDeC9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=f/muIKnc; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="f/muIKnc"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso2572315a91.1
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490370; x=1756095170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSO7EIKKecSXu2aYLs1QJ6fLwvTSI8gnzNqTWtwR7X8=;
        b=f/muIKncdv+8+MqViP76GMiDIwEkNn5v4o/bl7hIktLc3CB3iOfanexZ/7gz2A+ECI
         RTPTBD0F0gjYTkl/CW1qgZE7rj6tuQD/bWQt0aoa3SFeojCjQWdSV1tAuNjTZlhCYbjN
         ProQJhkQKvZqzAH1Oq9T31DQHvFVZBIt9RfdxThzDtX0dLQA3qinijADW+PEMeV1OaId
         ZLg1B4HyGlwhwQ4pqVCNuTKtYnUXoiwIDfoRF3Krd0NWX+uMOqSb/uAMldSOPfA7WaIi
         gVO6aj5oyPVJM9/C/pe4O4bM82pFV0bGIEyfcC2IEaPCk1QvI8e5N9PvtrkRwGm6cFA7
         nK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490370; x=1756095170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSO7EIKKecSXu2aYLs1QJ6fLwvTSI8gnzNqTWtwR7X8=;
        b=q79xDZe4C0KS0zJyRvd1v293G2e/aTTy+xFLwBH1TPNRKFohUzpBeFIgh3Salkxf4H
         M2gnps1nIHa8JpwPOR9AwfVn7z44eo+iePg/hwaatDSO+vMqjngru7olxNia0ZZ1WM5X
         dfLPMskzr7EctsBuqOh6UJeA4noovf+mG4N1m3bSyW0eOXM68m6/BIZq7//Nt15JPdnn
         7PUxu+yh+y2srjYTGJIlYXlfNr1R+Nz3bMldf1Pzdn0OAM4txR5/9u3WxUxGVuUIle54
         1uEzx797D2uQCVDS6mMqR0ppRFqDkkYUrnHa2AhLfKSi8DtGx1+8CEfPusf7Gq35dg+9
         pQLw==
X-Forwarded-Encrypted: i=1; AJvYcCVwKshy8rpyPvend3TL84jUT46RJKo5jmnvkQlvqjDIRnTzAmi29QBdbr/BWJoPE3Es5FOH4eXcfIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz67Ne8H9dANZtgAyhCG6eP+i+UxwsXeu/eNkbD9EgWRkfFmD+j
	r4zwHy1nnZYuKz7NvkmvvvdvW0pdvCFvQvVvlgMdj6t4oIpSQCX0ihCXS2FKGHxpqIg=
X-Gm-Gg: ASbGnctKekKKx8Kn/g8k0cVOr/y4owFK4z6H7g1BFTMBXgZT0yARbgkED0h5nhuF6qt
	XsoKLycnVpKXzQul6UXclZqTYnUaOhP2lnxHZ+eajh8LhLcsVSEcNiE8woyeZThu+PGlxUJ6Ku7
	Th86sW5L+NMwScajQGmZP3M4i7wDIrhg/MMYL54TMYuIgcq8PTRPZVQYhxMoj9e3KVMvsgQwLlA
	x7Ek0NfMaWo1PfgWSMNBi7S40empREhorhHAhc8wHxGyrtGIeW2URxjQ5bOIZm5uTeUwksuoTzD
	eyDUWYBT3bWED/4HWW5z2Fiik+HH7QfDCSCoVLnvms0/Wu/VAf9c3smtFagC7mSx64G9YB388W4
	NtAgRvOU6x9wSQqL0bucR6hpk/ddD6jo7S5cBPRfpqpuKL3jyCyDH0VEPFlySCoQe
X-Google-Smtp-Source: AGHT+IExLgk4LFH6XvWJh2TlOkeN2K8sXn/NODhuvQLQVVN3l8PFGUqseotWWhf1jijDquDiamajVA==
X-Received: by 2002:a17:90b:55c4:b0:31f:30a6:56ff with SMTP id 98e67ed59e1d1-32342141f5bmr14558099a91.19.1755490370228;
        Sun, 17 Aug 2025 21:12:50 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:49 -0700 (PDT)
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
Subject: [PATCH v10 20/24] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Mon, 18 Aug 2025 09:39:16 +0530
Message-ID: <20250818040920.272664-21-apatel@ventanamicro.com>
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

ACPI based loadable drivers which need MSIs will also need
imsic_acpi_get_fwnode() to update the device MSI domain so
export this function.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 2709cacf4855..2c4c682627b8 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -233,6 +234,7 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
 {
 	return imsic_acpi_fwnode;
 }
+EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
 
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
-- 
2.43.0

