Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677625DB0B
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695894; cv=none; b=fqeN9IqlQ4loPrIPcy6gXbxKO4PuePNO8V5mgPCeAongqLuHE3hR0VxNLRPmQ9GftsbvGW9Kg1lcUl4tI10qdKZkgSNyiV8Z0p9WBikekqY7Ifh/ISe8rK9UUrJPkSlAECJ7oq+Yl65ezSNbZkdtdW2xMvWzzjvj+5CpoB2J3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695894; c=relaxed/simple;
	bh=BkvhWSTnjiIWMOiaDZEJPElgPR0D+BhOKMYO4PPRBxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kf4A/x29rkKVLb5ZoB+4VCf6iq5+vFMLdC7rHiY2r7sFOHGO8htNU8WadEUOIwQlslrZKvZ7pjRBf9VzEzj7pd/XaMQXGOtf7tW8mI60kkk4Va5LPCehxilSkuXYE2dHfR6NsLuYmh7dzLePBKB5ej+WJmGhynb3aJMHZi09MHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OQ+xphiu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OQ+xphiu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso3325445a91.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695893; x=1754300693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x549zkWeZBn9yckX51psel8f2gpHv6i7OmNEj/3BvHk=;
        b=OQ+xphiukz8x0QDClcE1KNags9bZfbkyI+HyW8ZfgLHQzcIYmUME3vsKa348RFPem6
         C8qPbFEvmedn1MhHtaaR7e9m0+U1Ss0Axs422nT8j4QIRHXrUcdbymt7m9hVcaZyXM0S
         gyBM4I3yXVNLzif7EtzwnAB2A/HaOj36HIRzmXx0CW+SFvtEX3a2UtktTq5dXAV9k7Ig
         FRgX2PfGzXArxzr4wfBdF7akOpQMx+2YcewmJ0HvmIm8HC8njEJH8NdZPvS9xnO4/Pbl
         bH27VKv6XZsqnH7+im+3U/GFh5N9GoEal67bLpTk9iKLHQR32Tu2cvkUemZbzw0/HuOG
         IwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695893; x=1754300693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x549zkWeZBn9yckX51psel8f2gpHv6i7OmNEj/3BvHk=;
        b=rv+9x74DZhq4qUIaVDt0vgU4NCPSORP3TOOz4RssLu7WL5wq8WjP4yWD/4oyxu7cR1
         5vAG3qBTKzwbxjQL7ucRD72rt75EG0ASnGQ9OvvAwguxJynh8FLanvPl8v9+o0c7dbEF
         U2Gxj/aKfjCmsmsuinUEfCzVbFVZ2cKVl/qXZm/cBFrK1EA3uviYlVXmHi25Md/E/Amd
         +LQ8yh7IhTY9BByAMV//wP/E8OS3Vtia/j1JqNq7hdi7bi5wn95pUphMW8KtnWE2rprH
         cb5nQ09jjvGU0xCySMWrN6yKmX+/GKx7aIUQgHB+DySVgXpqNB/0+XtDYg+v3ZClH8pA
         hDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwDWOk9fzUI+sMOZ4DHi2xHUCOVPcfuXmpqE3Z1Dr5u7zJ+Nr8eAnyXZEGxUu3eVfjRaM8MFG1FNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmrt/K+yNIi4TzTAk4tSjsLIgjQAeJ/dfue3vdtu13wGsnvNkp
	SI1z/Axsaaj0tr+GLiHOGvMwj+Zts1wrUXDa7mePQS62e74Bs3Bg5Gk8L5kGJbtV8Qc=
X-Gm-Gg: ASbGnct4pYjKrig8G96wJKfje24gNUBeCSWCX/nvOYS9UMrVB7WwaE34VQkNDZUP/Bt
	4WkM87Gaom28hm4XBLGwu5yluWqxBlpg/6JojKdUT0limm47Oyosthfxt6t8VXZlxH7oCncXNi/
	IdnOSZhWfVlWvudecvrk5N3kjmeBpKB39N7PYosWJ2E1x+AF0As1+7DDNEyyoe8DT7rKcf+Hxcv
	GrSNwJhYrTrioTY/BnGdB5vowoGYD+9P9mUcbb85ITtb88oD+xuHAm+BhZ97D5lbQ1AvwKQIl0y
	AooI3UQs79TxZHL4kUsKxsbtfzPVBCh4HcElZuHA2iihG1W7+MaDjHlr61fl73iHV3oUuCmLQO+
	FEfhVqU/NHGTCqneFNPoV6JQ7Nu9pVAv9X3MqIEu3Wd/LTLZYSUEM6TEOL0ZS
X-Google-Smtp-Source: AGHT+IGSbo27hBN363qDwsNMdhMoZk2PtIESdVUuOULrb8b8ZFITrd8ZdG3auXim/8/7RPtqAB6o6g==
X-Received: by 2002:a17:90a:e70b:b0:31f:1744:e7fd with SMTP id 98e67ed59e1d1-31f1744ea0emr283600a91.31.1753695892281;
        Mon, 28 Jul 2025 02:44:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:51 -0700 (PDT)
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
Subject: [PATCH v9 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Mon, 28 Jul 2025 15:10:32 +0530
Message-ID: <20250728094032.63545-25-apatel@ventanamicro.com>
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

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10850512c118..ad6404e8292d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21395,6 +21395,21 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V RPMI AND MPXY DRIVERS
+M:	Rahul Pathak <rahul@summations.net>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
+F:	drivers/clk/clk-rpmi.c
+F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
+F:	include/linux/mailbox/riscv-rpmi-message.h
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

