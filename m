Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8B269CE1
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490404; cv=none; b=W4Kxg6dUaM7KdX4aDO5Txu8JENRrmUTfvlzgf+uGjHqt7n5Qr4VPJ6nLacv+mtv94U5nbmSJpXJUnrI8Y351D1B9wPs/hibLr+KhCcS/CMGOG3LH3jcw6wGWvpoR6de0RBpAIybn1DtJ6FWl0itCD3IVXhd7LNB9GCcMDQwOG/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490404; c=relaxed/simple;
	bh=t7NZai6cVoSZUb1jEl1jkTYbe9sRSs4UCr60ihc6DlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEkzDBHMLZ2Ev3JOP4yos5zdVhn7Y4+F4u8Dm1ph7TeGfmEQiNLV9OXPcXtw/S9wJiIUFcsPYkR2O8HXL5lmWfZQHEfD6fasqsxAo2ksCauZpX8khV/vOxBx2po+EbXpYhtN1ar0fbVWrku/NKknOpeKMFRvb2Eo2mnvUiIRg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=bjUvMBLU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="bjUvMBLU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-321cfa7ad29so3430445a91.1
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490402; x=1756095202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PujbwOz9dknJBj0WiTvzomVt33H+ylTg1a04PuImAic=;
        b=bjUvMBLUiMSGcvfX3ukFcf279nI6DcxdY5uzQWWkWPcszcRg9guWb2w0Fzv0HUT74F
         qdTp7rya3Jbmi6MmQNU2oG5yR6m1JvRZKYO/QMXwJV4NKHH1/poTNP3D3eyScFdtpcaz
         7QB4b6BeIjv0FomZFtY/B3k8defAy8RnlG4G5W1Lam0lCPTDDyGxIMS4xlUwjTAh/wwB
         8wELw+xaoD5XDjR01eBVTcTmqC4aLxVIMf7pemAs7ZLlly1F+PxdWG1jhF6U3uNct8SU
         S9+1Je61v3AIK3YWmt0hSsqnfenbFekkgLMEi5ASYxvJOgIfugNhEBxypT2pUaVMUatv
         WlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490402; x=1756095202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PujbwOz9dknJBj0WiTvzomVt33H+ylTg1a04PuImAic=;
        b=w0cN7jYs7s6dkTXW3+dyHdTwWv7/KdvAkRh3p8DbvQfoJ7uY2TtupYmFVn6bQdH5yU
         D8HmmmKpusjpaBmWMDB8sgmxmk4du9MyFqwzF9I6dWc5NzrTtFyBCt97abMyBIdqwQ1i
         fKLZbjzyHA5SiRXZwOwoifI7+pYiIG9ImauiQHUwKOs9/ko7PZENw0DWlM7oeQ4ZvTsE
         cYtbseS92S/Esg5CWNB2V69x764/csqkwQiH4IrQQHDSHR1T1qz8sCL8Ps/O3lEYzQ/s
         omBlMj5MhOD9shee0aAfixWh9tZ8X8uj/hGh82TTcdTaoCjOaRCE58Cq8bfYrh2o9uq8
         lBsw==
X-Forwarded-Encrypted: i=1; AJvYcCWq4CdTulN/yLKeAOnsdblnGJ4WO8odiCgQKmyO/g/rSVNuFB4krB+yBTVBfIa0yOAF3/Am5vYHESI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRLNfJzLoRnStgrZWUuZSL9nfddIzh26fUT/TClfxHFAdW0eON
	Lz/qcWPTpMZtyBZahRGIAxsHzCKwISgcZERTcFbUOdDJYikTxs8qw3gTepZJ1Rm9600=
X-Gm-Gg: ASbGncukA0sUTTNDsvjiFlJn7dgJMl26bxZIkEwPLap/f0xio9JV/+NrkjxITtmYvtn
	y6mUIpaZzDUgSVtm/7x4P7j6lHh+8i8Vj4nMWiOTY8eF+lgl0OkKEksAxHK1aYlsnWdmN6UvTCB
	/n4A9t6Sq4gD5rVBT0YotJI1UD1f/uarATOe41ShA87zUllisJcSY7ne3/PnB/aOc7g0Zq8TCu4
	lUeN2ARr/63oBQ+qIqPkb5L19bw0tQbHJqFCoMoD1/ErhuZqPj+jGbHn90s4CqCYNRBHdhXtWJe
	WXcXe2UoOzo6ZogH5dWAPcbaV/cevrbCdlRLE1J3QpJfXbQcN0tqhLdzpd4GXqs+aAFsgD0FRvS
	egwQ05Ljf0I48Io3avyuPDBvAxRWlL+cbMOc/mv+e5pvMCZGa+baF7g==
X-Google-Smtp-Source: AGHT+IHd64OLVzgyUo/oPlpqgL2RhIpctnfrLzAnLHSZJO6tBzpwKW59cA8/JZnKdWHEIOpAgVUkNw==
X-Received: by 2002:a17:90b:2681:b0:321:c9cf:deaa with SMTP id 98e67ed59e1d1-323297bdeb6mr20158792a91.17.1755490402208;
        Sun, 17 Aug 2025 21:13:22 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:13:21 -0700 (PDT)
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
Subject: [PATCH v10 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Mon, 18 Aug 2025 09:39:20 +0530
Message-ID: <20250818040920.272664-25-apatel@ventanamicro.com>
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

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13bdf..c675625504de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21698,6 +21698,21 @@ F:	drivers/perf/riscv_pmu.c
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

