Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD10257443
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746971004; cv=none; b=lhJ7lbwBFqygUhLeGuwES+DikXNQWGXS+uJajQP2jcI7DIZ8jqNrMO+pEq+BNYJDBli2DkvqrcH9Jk3ndJT8Kw6INqB16V4Tm97zz+Sto+NvJZF7coKvWyo2LHbBGgXwp7Y7pPuwco/Mw9K6MLi/nGqSiw3OarqpWVSpUTEmpSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746971004; c=relaxed/simple;
	bh=DGrIKW6QLI5GXj0WJzMWfVKaiU3ubl+sUPYQLJ6Uq80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzQ9ylNm1V2BjsKa4Gt0iXmel4tH/8mbboo+O2rw38kjuXMw6gc7K0TvpCEz6sd9tE106fiZIU3otSki7fV+9iwWtr43Bpr/zH4CxvcOSc1uAewkhh/jikrzEN0543JOCGTCJjOvx0SUenVo1QGcUwslTY0Hv8XBbV181h5W65g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=D0/ceyjj; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="D0/ceyjj"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2093aef78dso3384671a12.0
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746971001; x=1747575801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYGn3XecLxKlXcXghuizRd0ORyv4dXXBBqocKLMzEs4=;
        b=D0/ceyjj/QYLGGdm+n7zPKKEr6+WNeSJD4jliTP0+tsdOMKIQgW9I3xlZU63U6euOF
         ZZG1Rsk7L2CQtpB0RZ8iktR4UqZlSWITCrqePgn+sWAGZjXzGAE6uj8BIh4AAdpCkmQ5
         gtZXLus6S1IhBF50FPZ1JSXejnPsV+JTjmGgFX2pJAR0KC2wZgz+TCA9jQv0yCS5cW1s
         6RPKLbNxs0a1jnRIh1DI+bb7Usd6BEfCpCX3mexoFL4ChW0iV1hv7ExjrKjsz61d5+Jo
         6BGLDzkXEEFYHKENrdr4ERa9aaN9SwmW62PKJOZdaChj7/L8Qz1ymGe18wa3XP7c4opO
         qbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746971001; x=1747575801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYGn3XecLxKlXcXghuizRd0ORyv4dXXBBqocKLMzEs4=;
        b=EMflqSTrUiYDc6vickCJEBGs4YN9XvCe0idNK2NCIyRmJ+g/eLrd1kYS1MXYvP3SIn
         5D/7Wah2qDQSD/YXmUi5ZmJGe9+FknEZWjRHzcdgPA1+Tu0QbsVKl4dskYJrlU2Qu+34
         95zccCo8R2sMuYs94SO6NByp7tTyuTU96LrmhsM4FqxF4L6K3EfSVBAeQlSkQqzpmutN
         dg5Ks+x5zW62f83HahR69DcKPZyCabLTyWte8H5RE5aXQFRrSLuKLI4fTBu3taBOvqkh
         2g2Ez+XLoIkVq5dnIvpZWTA8aBM5vdz0htPsYTjcPSUnF1RGCEiE4hPEIHoePUZa+aG6
         ROzg==
X-Forwarded-Encrypted: i=1; AJvYcCUqpwu/zM+Zw/XIGIXbknM5G0QzbE9Dnd0WOnd1zCB2+DyxLDEyzCJffGTVQ2PdR6FBjZp3o3tgtzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8p8OJ1/NLhCScM4cV/KRWK/S02tCsR+h4RYgVGZSNpis7hC/
	AnUiqswuZZ0aZG0fsgXTUIdq2ZwXfdQY3n4mQ/RLoOqhDnL1gUsaIPMOmZh4dbc=
X-Gm-Gg: ASbGncthUEQzzTsv+dop+3VNWw58J9A75ZA7du78kxfXmbsPVPGRgIf99/lbJqkcUFJ
	cWRlHcnUApR31B9N2DcJv2WNWPbMB/FTex41Tvf7KPQbAVtwwTrI0mZC+jizTjrQrCMAHwPe3Ui
	GzvO74jBdC935EuEg87x0zynA6lg3elN6e+jUyaveKVUHS2gyuKeV7pQkPKkLU4Jg+IBK26ubhh
	6h4Z9QUohWlgoDwx8M2bqiaN2oaHYy5pNd9fYHClJnqydvF6Tb5zOd8uBooJMnkg0GdyVQqpp87
	atjxe9BwnWwvy6bG8DynkLvbxrwParDNcxlxJ+zY/vg3mIVotXFS++YBAKh5tkNhDdl3uI2jjJw
	rTPibhYnsQOlJ1A==
X-Google-Smtp-Source: AGHT+IG52LyOtdqyYBdOZ0QKQPhVZkpzaGbfXrQI34jhYPtmLfmrXHBFBAebuBhiCsLhxrZFt4LIYA==
X-Received: by 2002:a17:902:e94d:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22fc91a8448mr169477755ad.48.1746971001231;
        Sun, 11 May 2025 06:43:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:43:20 -0700 (PDT)
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
Subject: [PATCH v3 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Sun, 11 May 2025 19:09:39 +0530
Message-ID: <20250511133939.801777-24-apatel@ventanamicro.com>
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

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76..46a0909a17d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20885,6 +20885,21 @@ F:	drivers/perf/riscv_pmu.c
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

