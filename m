Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034C1EDA2F
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162978; cv=none; b=kBLxqfhd3DHQ1xargY0HB+mpW6BJc+Hbd/p4sqQKs4UXxCsUVZ4z7xBLX29A+vDzn/fc7ht/bP3fJUPv35NKGGR2DL7SV3HXGvZ2AtxFPbUDeKVbrfK/WTu+qczNND2MDLiFLtxxAGZFqWrneKR/Xg0YDdhcjXbC9DsK5xC2CCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162978; c=relaxed/simple;
	bh=BiKDpKKLxE/k6ZY8kMmrwXJi+9HFJObjqUV7Aozt30A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nu4qOjuwmBPeGhf4j96fcG+7WsLcOxTXFAuQlrbUmXSf9FSgzxgr9oi8SIuMqeCyE9K6vmk3OriarPTrYkUkcz0HAwZXF4QTZFljbWPySMXjkWVN8FqlEdot75gGewJDwF05bOjW8OAZi58C9UrOu1Wo65uyFt1Qo/ZG1jaBu2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=i2vPtOoY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="i2vPtOoY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c27df0daso894711b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162977; x=1748767777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=i2vPtOoY8rgAgb0c9M2NNSFOPbvXJ6i4lfA24uoKjwFtGJJBS8nmMsjVU21AfDj9nF
         1a8HbAk1N4ZBQGloyu9oz9hNrDZ8LcXM9JLKuODnOvxZVtivwVKis7ABRwoohpyAZnVD
         qZt5FAqC+Omq01fVg7gIyVNqo0bDK3DUNPrd0hur+BbIxBeupd18bEkdZCp/HdE7wQ0e
         F0HK1zH4X15sIDJ/aPdbzt0SU+rHVhQk8SCl6PUa1nDUP/wyTaWXs/4EVfqQl01uD/0Q
         tHD/2/3fdq9D14eVDNulD7Sf+O5Gx6+fUsUD3WU+0jiCKO6Qo6lGNs2iaHoWSJoaQObP
         4stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162977; x=1748767777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=DJTXh8bOzZsz03SsdmWYiZ1ix+BNQTnLRBFHFGIbK8LFjPCAHpmNjuTK6HVMY8PJhy
         0eiShu42OPyD1T2I9EnBZDjeuNhPeTRlLKC3ckU71ESihIovZR1g6PudzdN5bz9Yp9fy
         J/O1XOcsHmM1d+qYpCstg8aFYlgSmXAA8Bw/01RKoNZqKtkTSvUUVL+ATayWgCiJI2xa
         2uaplx/ZVptKYQaXaFGR+OoFJ6/1Owrf02a9N7OJ7tgVbzzWI5Y8pJOulglgF9MYXTWf
         rQu8DRoeQqLvkvTAxIwPoh8q73xGOrrxXZ8LXqsB8dhL/lxHFv3WVU0Qja6u0y26LOuO
         8e8w==
X-Forwarded-Encrypted: i=1; AJvYcCW3gaYjAMS/YgDk3pZ0PqjuvIewjD2XOPBZUQ0ppqSdzypl+EeCAtB9xnFzhD3zWCbc6xcQts60tRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+27WHhVW8ho5sKJ19A9Gtook4/2XC/jyQy2VAJcn5jgkoy0v
	8rK5ZrN9k7LnYt5AT0pHTW2BQi8sqkeweLp0+gIUbpk0mVx4Wpc0z+N2l/AqlRCPvcc=
X-Gm-Gg: ASbGncve7r14JXbmybAhipU2S9LLSTTDk4zD0vd1nqeBouIjQOjS/8fddq7GdgxZymv
	OA49sISDRdGRVSzZXZXMYLlBXf819/wWkI74/YId6/WnAPgOVD+32GjdpH1T7LvGNp+y8F1fVMx
	E0Y37NaDFDL/HWhf225Fq6qOBG/EPBbth3wOJpM4Z9bFIgBR0EZ5zoBivBj+KfcgQXG8afTUnK5
	MGPvxJUuBIpmK6C0gisgGK5rZsb4tLCHHLDjcx/+9Ns77ZSV4rXTd1+O+h2VwNDiQw2NlGUoN+I
	fbBEoP/hysl0k0uv6Kd84fre7pPxKW81gFC8VkBcTfzAzbkyhZtfDmhIfsm+tc+CJOkHZCzARKG
	afx1mviTq
X-Google-Smtp-Source: AGHT+IEMtmYq1fIqRMzhXzdfqRTh3cIPR7oyaCz2qQz6tIkocykg6S0/hjESUlPztU71trdqlLiVMQ==
X-Received: by 2002:a05:6a21:600c:b0:1f5:619a:7f4c with SMTP id adf61e73a8af0-2188c329374mr9918942637.29.1748162976641;
        Sun, 25 May 2025 01:49:36 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:36 -0700 (PDT)
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
Subject: [PATCH v4 16/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Sun, 25 May 2025 14:17:03 +0530
Message-ID: <20250525084710.1665648-17-apatel@ventanamicro.com>
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

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

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

