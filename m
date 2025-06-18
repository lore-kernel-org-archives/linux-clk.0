Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC0427C175
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249056; cv=none; b=ERjQi8oJH1eiq1oGLOXs4bO/GtSiMb37l6VbcuP6PT+cDAOJ6ujh3pVxNAUM8BQM5cEaHGMYQ6c17xRh34iFQClSDFl/9sUmfnbuMmtD62VChbzA8a2cFwUhyZ3hrh3oV3Hzr8kGUPCNsPWNj7KLcb1mptdmM7gf+8mopUPUJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249056; c=relaxed/simple;
	bh=9kK418IxmIiVXeyQBBKgdXjSPQQoBgr3AO66/gZokjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoBzdLuEjOgvdv0zaHAZNr+ytqM1XzmQfBE/V4JOIeZL362GmRg6FKXgvP1HglY8lIdv+95ahjBI0ziZF/FoopytLixeCpLKjuBwFcXfIdRQLGd3PqgnyHl5axvOM3NHdhMPqVkLlsDQPRlnPSV5mAz7WfLOZER82cx8oOkF4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=iAt/AJPp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iAt/AJPp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so587021b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249053; x=1750853853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8tBKVX30NLoa4br+Bk4w/D/MRgyFgU//5djHLJDdbc=;
        b=iAt/AJPpdBD8nRGQOJCDUSNggD3pG0XlCzXE6qe0lMj8Epvq4J83PgWbY9tArEMlth
         jzE34FRDPygtFCT2hgmEre9getN/lTjKheMdMfOgaqGCXuoROjd04HTogOzzCgSd4xR9
         4hTleJo9x5RebMiJfNN4GCm8aerxWQGjjKYa/4vwp0bv/lPxH3rSyhIiPnQlMX40QzKJ
         NhOVM4NHTLhFDkm1kwtTS3Rotn+BMwwg9K5nNHdxjN6FKV7TWxWC2ZRqkuhE9BXKUYBh
         nwrvG2NytoWaFtenTPHjyk1u3Fyuj+Bi0GHEUS6ZEouPV0AdCvu+wnQB5lNVKH0ci3mE
         KJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249053; x=1750853853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8tBKVX30NLoa4br+Bk4w/D/MRgyFgU//5djHLJDdbc=;
        b=uGsIPFumUFkjv/lzHWuBR5K1e4iHWZxHocZ5yOBJYt0G38Cz9FKNcQdeZN73oDwFWa
         QhalsYvg5aId1KBMIfHPYJegber8hoGN2swoOr4hkmhH4xRcb6EjSdDO/cZq4+MAhl5X
         OgQ+t03giHoIgPnQlNKlrhbU19dzzkhfW7p6vjzQuSNv7yT6nxDIYImgKTdYGsiNEdFF
         sqiJ7peA48inB/cZfZxoxNUEIAxXXoOhExioLcgVBtPgMkyzsVkLKrRKIQXhda4QS8Oe
         ENREJ/MVQxJQX+PvS72XF+pyL2zZxgAHq466sZZhjTXU8XwhzvkxaL5Q6TZ52pOnWl6/
         wP8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUIPqNlAFod/cKRXIsJuUc3jL8BDIFp+R2DSzIYk2npMufl4il+tjkgRX6KRBuIAqub0pGsasSsqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZGsuiKQ92p+sbrcI3XchWLJv+2W0tJuE04vEG3p6TgUqdyTr
	uj8hNcw5C+3q5Ez0+ZLoCZv07VMAvgDo/YdrVktVUg2I5+e+msx1L+PorlbjbBxBNqU=
X-Gm-Gg: ASbGncuS6bVtRJ79e9FYGOGJ6IHl/zR3uH046YSLxW1JwOyfd5jhsLRdFEdj3rsjr8H
	/NjqbbXU48GZaUTjTydtRmUFEvWPSjFi7vuo32KNSK1R/krAouQaX/NwkNqbQrTPo7/NGa1MgSu
	2RQwzTEKw7IyLACHI0rikeAr+/TbdDvcgaid8i4zpLF8qvdpeekIIuLiumPqTTrRjdjXKuwNAcP
	ymEdNLzcZt0pIDUSQ/tf9+0TofGD8zCxdwdqNvOKhNJcsbpDUpZvHJZ1sxX0obBeTJVrX6s9VA3
	ek+rzU82xXhwA8dB8xbXb3IgPI8muB3VN7vdrcECI/xRPbH9eIsHJqVuQQZNM73bUGcGoo+1cVC
	/2yVydTIea43rABSIhg==
X-Google-Smtp-Source: AGHT+IEWGi/cAL/pfhnuBa+HjvvoDBVM4CSi/muR85WOt2UwTAsiTGP0+QbukmJ4eBCotN/31dgHnQ==
X-Received: by 2002:a05:6a20:2d12:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-22003652154mr4644799637.3.1750249053381;
        Wed, 18 Jun 2025 05:17:33 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:32 -0700 (PDT)
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
Subject: [PATCH v6 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Wed, 18 Jun 2025 17:43:58 +0530
Message-ID: <20250618121358.503781-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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
index 0c1d245bf7b8..688bdaff566a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21364,6 +21364,21 @@ F:	drivers/perf/riscv_pmu.c
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

