Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930322D4F1
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623180; cv=none; b=GTYoEp7X/vuX8c+7W4rWHtlmVs1bQDGTgQWjqvE8h+m7cYeXlASGikvNllWuz0wuu988QCtsZyaRgeHg2I3Hxb1zemBmg6tz/tiRRL7ZT9QlZDP3zMa9vcOH5CBujapqd4TP7MDxnFGGoQRUsSJPZHYg08M/BuqLH4HeRtVtkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623180; c=relaxed/simple;
	bh=hR1n8x0Puv7CTZWZxD0bA8wGkXIKo6DifapRtybNFHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbqLGjpawjyJw4H8zOxqmfOK0UQVLjrIGqAcP4DVMt91/vxW3uDs6foFV+VWPKkTlXVjmkG1ycJS+5GLF6+aI0tIGjp+D8aD/+WjW9C+Kbx6eYNj645ExRO8WJawzn8JAMoYa0b2ZLM16xXxeSwXvIcbBsYCS2ozr180bB2ooyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Uu+uBohp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Uu+uBohp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235f9e87f78so57742345ad.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623178; x=1750227978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2ugGpXC4o/CNHHmtI6Ytb/JDD4uHU55rBbbL+FpeXA=;
        b=Uu+uBohpwjzphPE9rzlGsE8JsFoFTE4976zPzsLwAi8Goknqv0ZijLTY4lAveaov4N
         PGaSLm/r01w56mLagiXxSufJCsGcjO8Vidg6WbqmoBK+JjGD3JZWtG75E0erWEWYoSqd
         p66hoznAJCWBoNKmwn4bz03X8uNjrGxte6Z4/RpqaQANVRLXZl4tNh4WVKnDI+5IsO+W
         UrF5+bMXzhLqO8V54rSsJK2iSEddGC9Qub5i+Es+wVN98B8fw2onubNbqAWVVFWaBtzN
         84MSqrRbqoGfRWTRZI75btmnhWJmQqXw7TEJHF6s+pdyqbi+2Sqoda2hLe6xeQ6AUIbq
         1nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623178; x=1750227978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2ugGpXC4o/CNHHmtI6Ytb/JDD4uHU55rBbbL+FpeXA=;
        b=iddhOi8ZB90PBzcmYcU7ELTzb9BfkUqcXEzdyA68cxAeG1XoP4AB9o9s2YET40ku81
         y8CMjIKqNmGM1t4UqsMaW0YGS5vUy6vfBG5LwbfGJEI2fPKptp0ruRuAZqW1RUeu1XD+
         c+SxGnX0uX0vRLpvXZ1Bv7235q25qT7bkiU0dTuWYpNwhWFBxERqOGs8SxQ5ud36D4Jg
         t9h6UI1VzWuJDJbkbyoiGl1W4hVamh/VqzTd2Z+7cj5toig6sSwn3hn8tFECgBfgW1ga
         ycntL4M1PstAeMWIcfzVJECC42Cuf+ZcTgTioNHAdfBDRLIHHKDO9XUW1m6ZQND7C2aY
         37hw==
X-Forwarded-Encrypted: i=1; AJvYcCWivyV3yPZW2pIFMZceggE94RD10ccB9DiDaBzaROFTVReGco6xPAn+QCZR8+0aWvE1eShMe2bsZZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycR3UWnPwiuT8R7I50//XHJu3Lc8anLt0cxdAJToj171Kv/CQ7
	V39PfmtAmWZ4mbqdZOJsHsEgS+bATtShL7N2Qy8oQuWCnFfyPcE7nbwMDQEtOgu2R1M=
X-Gm-Gg: ASbGncv4VBKfv7LcTwMnMmU86i/z+6fY5rulgU+fX80KDvVR3v4GNORFJoOB9focUE6
	Cvq0T5+0X8+RcmTGFGH8PQbLVOlboLgU8a7h9A9B6WEiMn106Wjd3zeyss27HTOiPkGIjRzkQxT
	R9ioc0akeDv+F5IIv1p+G9H4DWnneq+LsQXLRN5EogwjxhyKnJQqG0tJcuPDWrm5epvfC1C2s0L
	uPnbMzTlTq5BbXuZnk7KUxz1Q8m3mgG3/FmxatTjabQ7cgz1xCfqXJ+brD+DX6kmOcdTGlhsX2G
	rSBYnGxwkvI9dSXwHmhrLuK2Q8+iCVZQydc8WPIna+H5ZP3sXXweR9eurriqP4n0grejysc6vKd
	CdJkf63FvipJ80YLZJfecGqKc6Q==
X-Google-Smtp-Source: AGHT+IHWcPo2T5oWAHxVCtrvEXenhjJ10/Omq5VoGqBDmOSNSjGENAvaM/GRXOOcD2Yi8BQMsG2wZQ==
X-Received: by 2002:a17:902:d48c:b0:234:b743:c7a4 with SMTP id d9443c01a7336-236426b4fbcmr25446925ad.38.1749623177773;
        Tue, 10 Jun 2025 23:26:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:26:17 -0700 (PDT)
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
Subject: [PATCH v5 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Wed, 11 Jun 2025 11:52:38 +0530
Message-ID: <20250611062238.636753-24-apatel@ventanamicro.com>
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

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..5ac1746f3086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21361,6 +21361,21 @@ F:	drivers/perf/riscv_pmu.c
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

