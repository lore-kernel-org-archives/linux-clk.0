Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4B1FCCFB
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572726; cv=none; b=W8JB1qo9gZk+xdxy5cWhF/c/LDG01vLIqZXcyPPorXkWnceJlrQBz3uSiyVPSZ28lOAw7TJjSaBlJHni8FemVR4Kmkg6t5K+r8ABWNKA97avWVzQ00tTITvfWCQWeyFDMiDiVufZLKi1ijgUFBJ96rQaz6nDhXnjxpkgbYmZkmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572726; c=relaxed/simple;
	bh=DJLPtY9fSqVBTgjSnM4FsYGiupFf6DQ6YZNtl53ByuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1sFEglQC34VMxqqrauFZ6YohtUSpEzRJh/w4MHdUcOIgGU+yhczekbBRhPucJOLi97Knb6M1cn4NTWd+4DsEY7NJnE9Lmmkw1zlwJG9FX7mqO/VxPxwQVjiIHa95QSeyzBidei+3chv3eDLS42MtF6RVxG9AzzmkzHrBJ8uR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QHD2r9Kh; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QHD2r9Kh"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467a1d43821so47867211cf.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572724; x=1739177524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqHKfwEB4phXeApzs0j4obzgLpliUPZiImb73QFVqNg=;
        b=QHD2r9KhgzYkpj+Ek3lp23DEggbnvfBWsrkIBgs+4F2MatGM69ZlCUJ2TI/ZHwO5kc
         tPrY1WKHAj+EGj/eyZDOptlXagzEgbfjJ8coXuMHPKHyATSgRPXR6foaYSsNWjbiD/Sd
         V2CHLFjMEFbuPjMFjCZjx+u3GRA19FrPwQtg/F8Mw2AHTrWCzBm9KSY/MnujKEk672x3
         ieL3VFHElVkAPQjzLSQbizfVLhlXzkJll4c25fHPMjbIdDf46BufXOyhzahSkjk5Oo/j
         T2e4c+1PZuCmQVhAEWQeKBT3PUIR2KXHxaZGiq0R+iNANuFOQln6ITAdkkZcRisqfj6X
         Hd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572724; x=1739177524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqHKfwEB4phXeApzs0j4obzgLpliUPZiImb73QFVqNg=;
        b=oPKJtiVqHPSulq3tnl8fcMAhMtRD7WLM47t67nyR9s8oI8mZ9zq1q+SGUlMZl8dDNc
         TPNeEjHlKq4d+YPa3i9dz9/Y5ALAdqdXpL35PCavyj5AJ0vPeXJg7pry1LVAjkcgQDmz
         4p0aczsCZFFaELdweZ7YNPQFCwMjbLkKpNjNgzbOUkzxVW8kaSNCvl+Tx6WT8nFKleKt
         gWEmCiHFx7iYkdD366lVgGw3UmNs07wLJmguzR5zwjEFGawToEKsst7So7aNQS7TWsao
         wQP9S0l5zv1QYDDEDpROBkunBePJqfWW0UkqIaF6hvR2W03I8PdN9DXKxhxyuJg9lvaY
         UlqA==
X-Forwarded-Encrypted: i=1; AJvYcCW1uibVx6KBGk+YQS8Vto0g3l21nt+ylR7C82RlyaQU4qF+kWuFFTQR2hQ7K8+fhgIzQJ+Tsh03riE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfl9U3sQ0AToFK8MfzauGBs+dmUsrLgDWymRvmg5qXhibZK2gN
	QJtaKi7vskan6KM68bZL6azzoCDHi0zRawG7yRAAJQVJfoVG0VD5h2WF9NEEDIs=
X-Gm-Gg: ASbGncukoixSagT39a+OA7qFxAwMOBZfmX9vXKfJNVxzBTg7f+KJogSwqrd+z+OSkkM
	inIVN4J0QMtlMbURPrJAwXF1fjA0gC2XHBmUWl03GUEgAmqjA541bWIKLqT7hN62nilfIm/23aq
	/NqgIeN601EdjxTrYVT/NeX7b6sJlfyM1jXr111O8HwzlMA+sXElbOscB6vOba/Mx1qFdcMsDjd
	IUqe5Biv9PPLhEvfswDsV/JVdivsV5lDsp6we9r1N35ejXii8upbFLqUKIIItzKqfm3Pv5xMWHS
	9fHLQvz6e5SgjpQ4BgT5rJVmQJQTiN2II/2UpDAxMRPoUBK70gppobg=
X-Google-Smtp-Source: AGHT+IGWVNCE2D8XvH1GGSIfS5LXa9bxJFfSjFmLfIb7zNeOXcqdzBvLSHp2sbBS6h1VqkAcm9r5rQ==
X-Received: by 2002:a05:622a:304:b0:461:7558:892f with SMTP id d75a77b69052e-46fea0ab7d0mr150479241cf.15.1738572724220;
        Mon, 03 Feb 2025 00:52:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:03 -0800 (PST)
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
Subject: [RFC PATCH v2 13/17] ACPI: scan: Update honor list for RPMI System MSI
Date: Mon,  3 Feb 2025 14:19:02 +0530
Message-ID: <20250203084906.681418-14-apatel@ventanamicro.com>
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
index 9f4efa8f75a6..e490b4160612 100644
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

