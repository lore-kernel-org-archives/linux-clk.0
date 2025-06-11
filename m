Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819322F75D
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623143; cv=none; b=W55p+hnSU32UbMUUV6GjrVZ2jFZXqB+u501Y6yoxq0Zi4+CbOtGhDRLDjOYuNkkwk+rxwdB81jSwg5TlZPI6dVZiu00tTHomgPbLpRpQMpgpn7rTpPtt88+ou+WMLtcImb/fy/2s2yzNawVy4wp0y90W1R15fP6GkHOjVN/kbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623143; c=relaxed/simple;
	bh=Pb4fKfMGleHNMPqEtSCsUXXEOw0RGKvlO14pbjto6vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHusPZAAHdrNMU7pF6oLKpT0ujBSsW2mhH6R5s9KYM9EQXkAzPYZLjqSqCxC9WlAaNODJfto7svfMqD/fLNSVbTBVuEWRmErGDPHvw18lSgxkFh2Ao0XHfFJdGta/8eD9t4SNpGOTLvqIsE226bNTNPdk0vhBdDdeBzC1yb5vwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aGLZ/zBU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aGLZ/zBU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235d6de331fso73696955ad.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623142; x=1750227942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7mx0GUiR5U+ns4+v9sHac9w9AvSdl9HF8/h3RrjQkc=;
        b=aGLZ/zBU+cZooKEvosxzzaymDEQZq23CAExcmS07T35i5QHUfqc0aEs2KjFq6wnCHv
         FDgP/+OkyCu1o8hcbHDBUBTGKQ1i1Weke5bYONMRHEblHMHddOdeupxhUJDDXn/PGoAS
         DQrfSOJMtJC+av2YjRC4eOb8i6DT+haU34ZOnJSHKURNHSdFQXCBCwTcWNbYanILxOQg
         9eOUtHEVTLzzop8GSpF6VXzALYUiN1gmgUy1qctCMxVNXOfbABgpiBDZ5/OiWMEDCMd0
         VGvkk6K38rMRK1fEhDZQOrwKi7Bw+tL8X6jCgjiqTPC2G0bX2p5ju1j2Aa9ycNm8PMyt
         GWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623142; x=1750227942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7mx0GUiR5U+ns4+v9sHac9w9AvSdl9HF8/h3RrjQkc=;
        b=v5ruA+8Ms1Df+UDk/cIhqLTaJ5XmaV2VJ9Pe4luai5z1EJbl+WhgeW4+CVF5ONylFf
         E/Qid4JZlZwtlk+WhQcsCAZ/G/OkuSQYMFwtTXpK5vdx9uHF5MZ36p7npbnYLo37398M
         +ymffPp3zj2lnoh8J6gULG2uC4NM1WZWuS/lLSBzetPeNmu+fI8Kr75c0X4MG6CDq3Zb
         LN4ib/bQ5wi3+PPcoyxhqKOChrrZZbgueffCA2bFGW1MWAd0xzg/Epm8/q9K8aQXhl9K
         TBGRUXERPzA5PeAW5VJcuxEZD7DWcMzNB7gzssbA1jTpszR05pVvmoPTfvdPY2tH7HIq
         sWjg==
X-Forwarded-Encrypted: i=1; AJvYcCVzVBTZCMsW4L9ETBglm/GB2swEb0W4fjrZ1igQ+P4uPqcW6npihPfVLN+dWn6qns+vx+M20mmjF0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3cs4N7K7Fy1rZhZ/QJpnv2onQjdr2bUF6fpqWxsrxOQh4Vsfl
	Edlu09ex7oca7IiMjDPXoKiUfnAc57RwUosTkAgsuQG9cno0Yx56AxOJPCdt1I8XiK0=
X-Gm-Gg: ASbGncu+FFIx/NJRR6KvtrvmrvhrNQ7hK1BpVqTRh/2ykbhMC6sWcFMAQsFXwBu05+m
	//lcwXHKtM6CeEQC0B6SKJQSdUhhtGfZZKLTP/lZBqNH+IUPpsVnDD1fGHW6zw39C5HyXp7lZVL
	ZC7P9FSqmbmyoXHXFXIo/pM9vcZ2TyuMwa9YfYwXv8sWJWdbp4CqJ7LSUfWgRXiL7dJY1aNp2Tt
	RzEJyZZ70H90gBF+WIg62Ly5e+jvRViuftTpKpboBQXIlX7tbO5jLZvx4o6hkzLaD728xRHaRkn
	jweBoMuSUOr4hyR5aLtkCADo6Fl4bePM3YBFSh/8q8o81p61pzn1IOBrgAgsTGDVYtkNjReTDuE
	srkdlOZiSLPYwhmVwYcofKo7s10LLfG1LAPEo
X-Google-Smtp-Source: AGHT+IEfcy/atZIXks3ZUrd+ueaz0kGJBeRvccpphWnGgi4UbEP5A+4LOl8ZEzl2YZ+s8KI4mCAfHA==
X-Received: by 2002:a17:903:144f:b0:235:eb8b:9968 with SMTP id d9443c01a7336-236426b4f43mr22663805ad.36.1749623141716;
        Tue, 10 Jun 2025 23:25:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:41 -0700 (PDT)
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
Subject: [PATCH v5 19/23] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Wed, 11 Jun 2025 11:52:34 +0530
Message-ID: <20250611062238.636753-20-apatel@ventanamicro.com>
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

ACPI based loadable drivers which need MSIs will also need
imsic_acpi_get_fwnode() to update the device MSI domain so
export this function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..1dbc41d7fe80 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -215,6 +216,7 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
 {
 	return imsic_acpi_fwnode;
 }
+EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
 
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
-- 
2.43.0

