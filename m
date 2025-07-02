Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBBC22FE0A
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433371; cv=none; b=lGXaO2vr45Sul8j8Pj5s7c1UKYRs8n3hHkjtw580M1D22FmmlwrkvkDTtacMm/cxUcm2CAqbmUTf/WpaYfcdhnJjMM6xjE0CPOxh9mCgsS7WMz+O4Z6OeqOCUy6qzIlASDKPzXlnefsi7r9jp5p0Lkte/i93bkoreiGm0EWEpaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433371; c=relaxed/simple;
	bh=vaT9fKqdkrP7eBvkYV5AtQjKTPo8A3kQSz0hOZrkoeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yf7UyhXKQHEoN4u3lCinVDhs68X8Hnq1niRV5jdgECUfsesOUGyVbFqXJI/lTZFcf8J/s73/7dffII5xj1fadUH6Z1AcK2N2agzRhqbyOuZI3FTGXjqQVp5bDIGV794XmalCPxy8Rcd+sxUIWJmh1Yht+oyIUM3bCBhgDC6RqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=oepCvIPh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="oepCvIPh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2363616a1a6so34849265ad.3
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433368; x=1752038168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=oepCvIPh+8/OnytSok5GnubT1nWHOdXXZ7LOkAVvKZWR9yL4hSOvdJ0KMX0V5paano
         WmM6ogESHX/1Z5ijmUpb8jAU76UYrgb/cteTSW8r5oP5+dm371bQqhmZncFoYsScWmMq
         zUYX60Nx9Mmhm5gj+X+39xuPbugYZtNlxOytdAHEHoGxaizpLax0SeGr3BnNAvQHcDDa
         9iZ+B3CX33L3BV12tBq4ULdboxl9Fmg0WWq0+WSRZR7qEQ3bewrYogxHR6NhaFgPiXlU
         xT/aNhKy/MCB2BEMokVXagtHbZfUmmFFBdhDJfrTmYfELEPeVTYaeQIGSLgFCLej/dcW
         7BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433368; x=1752038168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=XcdDNOZqBkp+1aBvljrUqerwr1J47xZGA9Apk1z26+tLdgGOTW0BHhr0aNhKg+9YAs
         ghKwQxbfqBz6Kz8s8sgIfgQbdgvgyvRc4buHgy3E1wAaMZJd3Awuz65l8Xkf+JDbnJLl
         nPj/Z0g4BT+I8Ly7YzeA9yyo6SWOGwwPixIIoB6dAroI+Uk/feJ2PRoIWrWUCeczs+6k
         7Zh6p/oV3Je8he50m1DaekDNu7WkfBzvJZM4QIfTlACnBeWTTPZDB5kXA46Rghln/DdZ
         Q/OUh7KbJ6kAr1qPjDcZVrglAlE+M1WEOCb8GKK3Q4QdMQDhVFpjA7gHVDQW4OJMIF4L
         IS2A==
X-Forwarded-Encrypted: i=1; AJvYcCUVM/Qdxeps2WiLR/BL9VCCVTIk53eiVOKtGKoT5RbHFoa7oEsTe75rL27ii66dCelwVDghiS97bkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHnDmO0LlvKCXWfZmsabZgK0Z1hmhvc9UkO/Th3J8e5E2Bs/It
	VKL/a/TsVOWFfgb+vqxBH+RWbkXsfKvZEArEBHL0n/PpAaRtLP4dIG2TUpIqN7P9r0A=
X-Gm-Gg: ASbGnctl62uj+Z8a55gmH/mrg62T/iiawk1dEIDCUMybbKhjTTQt6kKrUjtLF9fKjQt
	yAlmBd2C8FOCMwIvUNKuOeA0hRt0AycVfTfkKynYqukGltXnLU8eRBoNIPDg7Zz3gQjmRAwVZRB
	LK05L4YY7Mw3279KGiqEJo5liHrzmn5C+uqxIBKx373kCJgJARGaR5AU7iSdRu9xgnpfmFp+Bkj
	yGLL8YrrX4zAz03BvWkkMIW1peK7w+/3+ANlXZEtFHgt1+utDbUOojgON9+857EahKf95kFIgZ5
	1Y6gmdV641uF5CpSrrGhurOg0lFRgAsXMmhFWPHTs9e7SUVy5YXOVYsuPjvJWORiFA3BrfyJTJI
	dQk/hkcFctFkAwtS0
X-Google-Smtp-Source: AGHT+IFKKOiOcB60DEsZKqmVfcXE0dhCOXPWFAp2kRuerlsj/aT4QarUNKrpH9hQuOyq/8oYcK2PvQ==
X-Received: by 2002:a17:903:3c4d:b0:237:d486:706a with SMTP id d9443c01a7336-23c6e584257mr21721685ad.48.1751433368200;
        Tue, 01 Jul 2025 22:16:08 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:07 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Wed,  2 Jul 2025 10:43:37 +0530
Message-ID: <20250702051345.1460497-17-apatel@ventanamicro.com>
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

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
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

