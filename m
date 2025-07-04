Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B927FB34
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612888; cv=none; b=k0j9TI00exF7f0OQK99sPSRml8NkkpUTVSa2HobnA5WJC17w+4DlH8THALfLtNOBh9ot+BxJ8DDUNNP0/qmPO9o1dFJJPCeXsv2Vbbw272PXHIrHuLxRgxvKxuHEYhNEEXPMgDYDG+zBEzeIsMIfo9DVr3TkuOBssy20L4gxvuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612888; c=relaxed/simple;
	bh=bbsKQgQKotFffImznTiHFRZUkpn3l2AEmmz1a9sty/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ubgLMp4Nw7PpE0VzXTzIX4AW7qFqn7iQ9I8+9HHK6daO0mAdJGPO/QIjqhqUzU3fUUh/iQuzgSJd2S7D6PftrxbRyMmL0s7Hx+bsTDplHCYPTALrm14JCIk3gLy2LQ2bBFPSfdDp1q8tlPgPbkwhHtAEmdOmChQ6HZukllYhBPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nPKIBTF0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nPKIBTF0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso1023183a91.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612887; x=1752217687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=nPKIBTF0AK+/1HHoTW+QCGP18nXWXDLUIA9nglN/twuOKc5qKK6669ADY6e8XQfppB
         8oBEqnvbVxtwDWumfi3pJgwBPf7orNb8cKTyoUUQLsinu4DEACYhWsNei5SQEag97w+Y
         FPsM8toAFQPdVQnGO+/EptIvT+Qbu7Dwlzoujf00OyIxc+zFhlrzT+uX44XHSJjLMGu+
         wmrGk7YzjOng0HY+nY6+88eej74P3uB6aTMPZKPFnSCMBXBgYp4hoG3NIOKfIV0wemV4
         JCZtB4JvXHaTU6oHmrKg/9b5uy0bkn5QkySpFgv0nCdWi6iz6duF91Id+OID4XET5yt7
         7k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612887; x=1752217687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=wyymvyfIWPe+BWowq3vlIhpz0yJ/E1MzLL/cMeGCxybhFIFREPA+5JMwYCdm46pPvp
         uYa3H/L7hgiVUEoDEIu/wj0jM6X+G6KE9kLiyeOyiCshr/Oh1ZywC59VqtaQyQeqK7Hg
         P9BkBmwSje/PpR3xeTRCPEmRpu/yig5107gjI+3/UtEaSxKdnjE3WzzG+jx8z6u54SrS
         kwWm/Xclp0utzStW25AlpVYpt31Yd9FnGuB4b/OcW1Czl2C3ENQTRA8IDjyzM6F8w73C
         92earom2Kyg9GFTxJt9S5fqJFdcyIzx72akImcRpP+v931V1kztCuKk+0rypD5S69p7n
         cXGg==
X-Forwarded-Encrypted: i=1; AJvYcCXk1sNQCI9En8hR86PhJ5kq/jkmbqg8XwVtM+ZGnmn5ElsqGWsVrByDTdMaFFYlGk/rCFL0C836VXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXZB2+QTCvAqbrpSO+1pJzEJW2Cd27IeYsjNIqiV5iDIQzrnQx
	eZMt3q52wgP/BZdbd45sOVWhdGGNlI1cAOy87hM79Mknquspf7GECpz8MMlOyeWavpE=
X-Gm-Gg: ASbGnctvISUfMqKaWp1zw5x1w0afVT29GyOPDIQJ7TKf1XkjJFV37mEnSY81Q8flH6n
	7ecJ9CR4Q55O3rm1hMStvzz12gQY+t5v4bKRBKuCJ5zCe1wxGMLnW5gDThyUw3lqflHRz8fm/ts
	wQvECWNIrRXHPXvjlbGZ86meqvKp4mPT3qkAlanpdpvF5o8aLNs4VXyRo+IfTnFqtT7md6BhwrW
	xyeBQ1LL0JQcaDZFB1ico1r1BDdcP6oXkK8RCQqrFIaR8iqYUpdoOAmKqCkeZzVJIIttcIJkXhJ
	jfrYe7czeYaZkzJrvoOI0c9F0yyGmTZyEmTuOmPtWc6Vp2amW9nUmHo7Fjw+QpRF7TnVP9dUDHV
	/HW/ynaXw+MUVcVPbDm/g5g1y3vHOHz0h/2Oy
X-Google-Smtp-Source: AGHT+IF0zc2Duk30cC4boPPLQkPLExP0m0SOo91oiLUKWYjOgmAFhVPRmIXRhh+FnhO03cSYBVMJxg==
X-Received: by 2002:a17:90b:54d0:b0:313:d6ce:6c6e with SMTP id 98e67ed59e1d1-31aac449e2bmr2377250a91.8.1751612886401;
        Fri, 04 Jul 2025 00:08:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:05 -0700 (PDT)
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
Subject: [PATCH v8 20/24] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Fri,  4 Jul 2025 12:33:52 +0530
Message-ID: <20250704070356.1683992-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
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

