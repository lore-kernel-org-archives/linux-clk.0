Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA13C262FD7
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490341; cv=none; b=P7fVjpS7iztsZUpSL3hQNa9Q1HRsNDgvfZ+AcTYtXE4SiGSX7efAFqyadISUAwE5R1gve9bPlGwrwdxWrSqnXOYFHuroixQxTd25ivdpLMCIp3C66N1IcQ46fUQDU0mFj9Z3dJikPjre8fWsu5LU0POK7b9G0kO8jD89H1fo/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490341; c=relaxed/simple;
	bh=kOJ0GefeAd9UEbFEyV014zsaaRwCNdDHSJBAudKVMFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7vnOw48W+nGIGkj0AxeWwx4bE77+6G5WZzJCvplia3nXvitghvtjt5zjFLOxVVYBPsGZwtuzTJmYBL7U7hQSi8pwGBi/tdADrE70fEEJZQg2hmI8SdJBN681oFaNUxBZODAJ+YeAqMqhIiKlXaBTmFoIAZOAAWIMFkNVCPgG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gHN/DfWh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gHN/DfWh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-323267bc0a8so4747490a91.1
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490339; x=1756095139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=gHN/DfWhvd9pYjqIf7Ywp47g4kPdbsIoTCKr69b6cmVonTL2k5NcKk9wr/FnDXGzTZ
         hmzBsbbuSIGykBo1Nfci9MhpUoPx/LHe+ybwwGQAnE30YaXokLNp5m1qKpWL/raIuWAu
         qA7XcEf/zzjSMbo3Ef2OMqq1ciOqwqEUaz42VjuF6mWYsnnPd61AXdLVZ+EB3md6zMtp
         ag9gkrg1mrgDX07KLdkktD2Py6KmTgaGMrm5dS+LX20R70w0iJdnHhP2kN4FdRmk8yWe
         HTQufxOr5UFc6ZICD+XFKncwOPxeJ5Y/lIILOtahCcCE27gkThhALtp+uMmoUZIBc8Cd
         p6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490339; x=1756095139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=C1tPbEEFWygmFBAuev83lYAUFN9NKNnq6jvkApuW59FaCT134wvlyc2IOElvHPlTex
         nUax79gda/kbDMc9YbLcRhoFeO/HQpQmGPsml/H5YCd5V5+eOivEzRgz0J4aNsL22czt
         FNFgXUn5gutPM1WlRXQ2fIM99SRs1HHM/SJFak/HFjmhpB2uOAvmRrInGMM3IXQQKBXU
         ZRDqLwpryQzPdE+HGvnbcNLQr5eE/SWDGm81hq0Zl5A0p+EOUYzXlA6zR+eECUnvFc0r
         dfHXyRO2v3Lw/nY1csYGYHvGgqYxLQH+LZE3a1JuHzXi98wcc3ezXvs9wr3143o0ksRQ
         Yxng==
X-Forwarded-Encrypted: i=1; AJvYcCX9iUN+9rLm3pxvl6CJP5hx3z3GdVAinawhr7Gz/3vVyhqYykVqyNXhTp0hU6Au/opJyThX+9Adx0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/xaU5ihD6mxnNbtPI5EFusRk7NWU1HjFfm+xqLjDSBJ/uDXm/
	QIY4lgnYrB4dVJpZZHxGIo2cUIsUNeljtpD5stNNrJNVysuYfNG8d3cEXpA2bjRDbc4=
X-Gm-Gg: ASbGncuYQWDgTJRrOsjd86zsSAf579+fn6syzn4wsgfv22MLge0Nn8ad7/6ATIgIZ2l
	mAglqhD4o7pH62sqWgV8lm6q1cBWFYkhJQDS+yim7wVIDbyTR2X5Yh/PApE31IUZkEZkumaP+uN
	+JK806cCGlPERdxIyTs4gqZA2x+/HXdfx1Fu87UpKjUYe8Nzio4Shbk/MoolTF3W2eRWpfxwaVv
	O4DrlCFWKxA2be6Q5Au1tobKSaQmBb9KAAhemps8hOCO6WeyI3jP1sobcPjr4bNe+Hvx5XY/ify
	3Cgp2Kxdl8WaeVvtIua3mxBnKR5TChEhnZzS/JCWzjQeZZtJUB79/mehzkm8WcwJGbYvZNIRuLf
	q40J+KfPlqHplLckp+q5s4fWPZcc0JZ7qPLXLwQYJPt6bgZZvWpPAbP55pZJo5ynu
X-Google-Smtp-Source: AGHT+IEPxSb/NsG9Zm6Sde3dy+9vjl78ugsOjUnfoDwFeFFug3ocplCGnN7dY2ngRx9phRfT5mXqyQ==
X-Received: by 2002:a17:90b:268c:b0:321:87fa:e1e4 with SMTP id 98e67ed59e1d1-32341df8cfbmr15719154a91.6.1755490338939;
        Sun, 17 Aug 2025 21:12:18 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:18 -0700 (PDT)
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
Subject: [PATCH v10 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Mon, 18 Aug 2025 09:39:12 +0530
Message-ID: <20250818040920.272664-17-apatel@ventanamicro.com>
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

