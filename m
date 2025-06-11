Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F1522F3A8
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623108; cv=none; b=qlraIcX+NdPOio0d3v/LSdoD46VqVrqc6pHFdL36+shJ4HCd+IRM3FWigEtmY+2+Y+2qyWbxKl7QW/7YzFpdVsTqFcuCU7QtUwJAXWZCFVS4bJzm3yYs56Ltpz8gxItQj8fFycX9v/4fe/ZMi7M8hNHQRHwBuqKYeJtGt4z/vYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623108; c=relaxed/simple;
	bh=BiKDpKKLxE/k6ZY8kMmrwXJi+9HFJObjqUV7Aozt30A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mM2UOKEN5Y8ed6EEieY496GQ+I2T0QnaVMvM++GaZ1ANCThZ/Ph9EjFoZwvRZx+dxbJ6ikEpm7OQhyWYJc8OhXr50uvsPHgop9WjG01eeYIdU7eJHlpOz0EW0NSmGTqKiVvbFAMisY1oFNVPesWZCABy4DPqJh985ZxFSa/nHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=A97qx1DA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="A97qx1DA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234b440afa7so62633485ad.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623106; x=1750227906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=A97qx1DA/K+L04xx6PF3Wu7xkBcvmuzPaPjyVaC4jMtAPWLcnBYxr9ytGAf9GRLkQe
         5Hra3qT2E/CtwAmeZb5Zp9Y/XnuzTdi+m8eEf1tqx2k0uW/7tBSCScvGAhdBg//7uEdr
         na6f+7XfcyKfsjqoIFAHXlSPMfqtAUaVJmoUYutq0oUstCAnlfRUmNCvk9WcF3FW0HGX
         /fyQ0zpWsnxzI/js5P8rEBJzhfYo1vDZTD9zjxRruOKNgprOlI9HiGcmVnJe7LzSxE5y
         iRN/Y9Yz2FjutiLa3VKGN9m6W76fBMO2w2Fkh4JDgfpSY3D7J2gplyeiz20GfbxjjkW7
         DvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623106; x=1750227906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=jck+PXd6F1W4ijLU0LnIYuvkOx0IC9Fer5QwMaWZ3TsOPVGclMiIRSmSeQHWNh1vbz
         2Px2dUv6fARXs0BN2PpEuW+MCJOH9v2BZYDgS55MJe08lP6q0BPoQPCfkKaxjNw2TuXT
         /Sqx8pCo0MOpjpeEwbLPFD0nrgtao1a01Z2R3nvQ1hQzJkXJ0RnZJxKI9sJWTgQM91zB
         YEXZDp5FUMSl35NYdEYSms0D7oTaHevFlJdyKxJMrUxDLDS3oMS/6RHVgKrs4hOq15ax
         Ka32iUIy8tycsvaHcmHjF7OuiY1fKKN/6a8uiXHz4j/q/FhgHQXNFLmVkDT1Kgsf4hnX
         iMYg==
X-Forwarded-Encrypted: i=1; AJvYcCVSfI8466pa8do0o0dh/7Y49+mMEOlV+4UyGQAnLaQPey9JMKKk+umpCx8B5aA3fGr9OkObvvNuNcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NNdbZNCxBSdcynW4j4f0RGwcf5cyqoD+y+LMJu+x+UqkP7tA
	jt25mp1181SoI7XvLpoCii117EejuYJBj6yroPPjMP6y6yjb72tXinUQoRYbmfihLUk=
X-Gm-Gg: ASbGncuKm1QGSZzPnWoERPm+JB92P4oQyHgcX88YAUo4dhRlnXaLHsJBORkuGNoIZnZ
	B3rdqREnjnb8gY5DRM6/qIhFkpMrg76SPsHzgW4bHNxF4+Ax2R6UlKUyWeKf5CPbFWmaAqdfWEw
	0aweexg/517dWsw49J6F5xI8T8uSBEe8Z5CWX52dS5dU5v05X7hFTbIrxwEsbPUyJaAbyPVkJFe
	TNLGit75oKaHvtQ09xMRgh7v9La1J31apSzdCb2oGf2BHeQA2P4QjFQOWSmGQxxwcPAveNJGNQZ
	VQZo30tYraONj10U9jMtKqTcN3IenpP78oBpRsKu4s2uL1a216kcPlRuRj/y1/z50LoSp2Azn/S
	+8Hqj7DpMiFHNDEVxqNZXRpf1Iqqm0JlEUR3g
X-Google-Smtp-Source: AGHT+IE0UM/d4M+csfHbg0ruhjIIecTEOfGpEWCQ4NLi3fmPp3zu1MWGy4f0Hx7tOO8mYCGU/KKuFg==
X-Received: by 2002:a17:902:bc46:b0:235:f4e3:9cb0 with SMTP id d9443c01a7336-23641aa239dmr20067885ad.9.1749623106244;
        Tue, 10 Jun 2025 23:25:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:05 -0700 (PDT)
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
Subject: [PATCH v5 15/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Wed, 11 Jun 2025 11:52:30 +0530
Message-ID: <20250611062238.636753-16-apatel@ventanamicro.com>
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

