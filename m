Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFF256C9C
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695817; cv=none; b=FPp3PKoY9hcnBgi5UR/GwXD4oeg0m5R/r+sDUEoSO3qXcuiYTf1cTB7lcpzyRAh7WuuUunf78IhnHOYDmI43azkqxnDXOQs3nD1OAl3B0w1P5xzKVa2b29mnwTJ4215H78Kg293PtYzKY0TGTnP54XESxZzo1/jvZpOaUJ1WHMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695817; c=relaxed/simple;
	bh=kOJ0GefeAd9UEbFEyV014zsaaRwCNdDHSJBAudKVMFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6l5j1pGwphETFDPNlbIOb1h5O5BdNM0D63BuuVXqQoNzdnAp0bNkiBF0p7o+i/HloJrdUnjzwlIwaKlfD7GlwqqyY1PFmhbbwdEb3IDV1Iyt9GoQDdSUXr+kQLyqUrlR3Xi9WjLpvEtFWyWF7VrSOxLNpakskhy8MHt8G1dETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cWzB7nAn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cWzB7nAn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-31c4a546cc2so3454939a91.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695815; x=1754300615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=cWzB7nAne7WaBgumQDLegBZ4RXLzfBSG/L294xG/VxC/UnUVMFt17qjq3E/JmIfoUj
         QWA5olhy3v+z50MJnYBbBCgxTrBVC4I5wYMDbBgSLm9ZwDCHlFLlbNAN2PpcDSgPG1hA
         wZSmRCXrU1VvgR7/7ibyd/R+cPWy3ygDBcPL+FrDzNQqJBa9PVSjSAs+tvNtkvpAXKg/
         OMzWtuy5Nh9hHK5Qgd/7l+KfooZuDye7YDvdAqCNGb/uLLgRJcVn6TO9FkZLenJ6VxKa
         X2febJTHe7WCB3D+PEtgYPzQRbItyWOYEqo/OpftRm6UAgaQ4trgn7YaqXk2ji+lSTIc
         jHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695815; x=1754300615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=cFAtuar7Q+J9pRkbhDTFfGuThSTo1RcUZdP58Kk124p+XkMYx46pN24a2N8T5LKLfc
         E8BtCr4JLCNOiiHSdwTan+jDelYsLXMsYccfHi52R4wdr3yG5X0ryJzDiggeH8m3vael
         wAWRwpxYoHKW2Xeon4kkwGibbkUAZdGtCznT9N0bda4qSqh4Qd+rCoxsHPSTrnpmMgTx
         qckwS2hbbbBoPF1h8hWsJV1ejvWP4bKMhHTAzR/Hjd0t0lv3MW0v0b37axYVOuXJRRi5
         jlqdNKtd/l4RcsSfcr6H97/EjzdKNqwGa1zKkxmOikbQP7xbgsLnMsz2U5jYHFcEg0fA
         bmRg==
X-Forwarded-Encrypted: i=1; AJvYcCUGKT1HcqiSNFd16Uz2fudQMRQPqoGQTifyuEsyr//epWpNssRvcCYgquhFdUQz7XAxeEVeSseAbCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQP1m4LT/tGDiyzzZyrOk+l03RnpD6nrHS7zLljb3/pS6E+ld1
	y+o1PHhKZGT8Me4Lhpn5h7RrEHUQiRw5Ix+57LIQeBtmA4uU/O2CTjHtNrL0CSumVsg=
X-Gm-Gg: ASbGncsvOsnJPUl7CKsSn3ldLPHBR+EB5p8VRVT0dY+aRd3Y+n6pDU6/WFwi0ad+cOR
	+4bHzuEAmEZ0JZCHPqZPK9EgB3umhhBgcsxl6WznrLbhs2yZnKdlQkc5KuvU64pZfspzhOHK33r
	DL0vYi5MQA7M5eXK95EULnZD0wiV3gCTF14Mr8+zjo8SKllYYrXeoZITjhX5E5Cx//EVP1m/u1d
	gIZK43lFWBVW5f2EiL6YiuWCOVoQbujXHYDEIX7qGRyTheaTYReU6tZ2G5MT9ZnzN4TIxrG0jSt
	5zc8NWPlEBY8tsxqPENC8ew310y7e8s/++9J7flEj0cYSwbnYbHy7Iirmh8afVV++2M/cbPh+no
	P2h9yuAkCoQHhEJBktEVyRM991dywXRicz0OSdPevXa3MWPkDeJrfNoOpyHXE
X-Google-Smtp-Source: AGHT+IFdcj9UyigKt6rPUnP9ob7R5oKYx3exa18ogG0RTJ8u+ssoeGzkdetp2bS/IhUP8p/ILwtVag==
X-Received: by 2002:a17:90b:584b:b0:311:e305:4e97 with SMTP id 98e67ed59e1d1-31e77a01261mr16532165a91.19.1753695815287;
        Mon, 28 Jul 2025 02:43:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:34 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v9 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Mon, 28 Jul 2025 15:10:24 +0530
Message-ID: <20250728094032.63545-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..54181b03b345 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"RSCV0005", /* RISC-V SBI MPXY MBOX */
+	"RSCV0006", /* RISC-V RPMI SYSMSI */
 	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
-- 
2.43.0

