Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A38257420
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970943; cv=none; b=fjWQj1L+yj8CwUKIeZ2QJgrcxVihUZZPki3j62pRRKBvMb2BuDCXEZSs1Ga6oGc0Gz7k441gY2wmcryrXAiHU4l+4QYQtE7qhPcJe+f9HpaIM4c4jcjnAYsIQnRilWug9oeXtfOcJiCmyb6tRTSNHiHZHXjhVoZxIM6adj6g9LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970943; c=relaxed/simple;
	bh=BiKDpKKLxE/k6ZY8kMmrwXJi+9HFJObjqUV7Aozt30A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcYjcxTP2vCreyLu4rpNMKBbIKc+YH4h8gol5pRg5O9p97sceKayl1QnDHgErFLnHHYbO4dYTbNrUlQu08+0OSUZDJzl8RPfcOygdWHWO+ZAiBwaZPSLE7GXWnw+zS0XhE1k17u0zLBxnJzp+3gYy48Y01ebsDSiPUObg7qAn44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=n//j3aCT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="n//j3aCT"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22fa414c565so25115155ad.2
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970941; x=1747575741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=n//j3aCTQDze7HJVK70lCkZrpzub6/BV/wJKMGlDAP+k0V1EMy6J+3/N6ovCwvDuH5
         xiaDFRR+vuAA1mEpegbeIj2i4ZmnWT2pexMhHDponVKCKFa2NV4RpWCEPu6xcruciCaU
         xz4RA1mSto7Q02vDxLuwdVqVyMHtSaBz5Rgej6zaSYEn3FyjHxQjAl+s5fESRkTwreD1
         9XXdTRrUC7qOKDEYjNei8WA1/NN7PoX/koHxpPpphDySymYJDHeDhvcLRA7w4e1VszRa
         q6lufTE8V9SsMmHSgxpgY+7LZcTMNtca5UPtWhg0iNwN5f7qEy46PWjrKiLGJO2zu30l
         u+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970941; x=1747575741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=UzijVj8tQmsYlQfXpJs9Zh5y7A9CJ312ZaR80k8xE0I7fMqWvigLqJ8AJ3SIo0VMRn
         kZoYBy6923WnjSSL15M230RojilQYXuTu6H4jf729Q7km8gV1oxHjO8vlo8KWVwe8xQV
         JGiFJ2xkRkzKKpmQHWc5p7s+A6v/8Lzhq8foGis5MCcfoqzkXYam3YT9ciitdvwa4N0O
         Un+YpJYRM4KoNHbCnDDHMwugdQoRzSmxjD0tzZs1GiOjj+3Qiqkb3jgHx0QfaDhORZs5
         0mmC90hjbWj2rNLK7VWo/NsnkiIwuMl6cDFJ/omi/6JEZMuZNumr/png/ALXmjN/28+g
         +xhA==
X-Forwarded-Encrypted: i=1; AJvYcCXrycJwfBRTd8L2S/YkjOPNn1YMxL0M8Cbx0TCxW2JRrIobueHaa+5xo0gQ1H8jkS8w6Dc60Jlvl64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVL3E8Df7h3XBcY6aYvZ0b4qsV/xsKSabuYdeRumCXhukbBGkr
	Py4TlaqmifEqmsa8zQpUaWBgoUb8Zefuu6G2r/5gbaubGnP2UdG8vXVh+l5YJoo=
X-Gm-Gg: ASbGncs4xGhfbc0+OTmvO7UBrZyZ9Q/m2zCtAvKLocFzg799oDqXB+9czQQN7/G8jcH
	KpwKDg/jvCtRqXCLVcT0bKmuagaNYDTuSmESCYnKdJFn7QCWgiRSLxIakW5T/K/lfNiY1jHH+Yx
	etSvOiFSKJd7RBxEHenSZbv6uNulrIuso8LmQfSv0kxEZwJXX3kut8jdLPBgNjinWcvP3zDQ1k2
	4jK6O3T3fYthdeDlm2x+irIWVbkTyfcfQxFG9kyBqZes5bZgQee30ZIWNn+ZuxO9pwjitBXSE5M
	6v3F7iqPJD0w8i7rmjG8RIaBYWxktUqVYsoAVIisSWYXdlvOkUREWDoGv5GXv54pL2EX4ZXjx+o
	tDy914ulIMsc43A==
X-Google-Smtp-Source: AGHT+IExo0JFN6HOT+mbUBxTAOi/++2rhBZ3oW7UFgUXMGLrtCOMV0AdwEfD4kuAZAW5D079x04psw==
X-Received: by 2002:a17:903:228f:b0:223:4d5e:789d with SMTP id d9443c01a7336-22fc8b415e8mr147781135ad.19.1746970941076;
        Sun, 11 May 2025 06:42:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:20 -0700 (PDT)
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
Subject: [PATCH v3 16/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Sun, 11 May 2025 19:09:32 +0530
Message-ID: <20250511133939.801777-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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

