Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F251EA7E1
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163035; cv=none; b=MnCpR3YgKSZ3aEBMfz8DW3yOp/NqCky5T6SObUXWE9VRglRY8l0S1XBZfZqkdwvO4pRaeblMye+pClxlhJfQsqfMnRbK8rnCmWfntPf71YZ2dVLC5XTXR6GPuF6G7GSQWy8TmOcO/GVKT6fFvBXaihUur4BmdSOJ6NHu0Z6LWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163035; c=relaxed/simple;
	bh=oGSCzCROCq47IZD65VMMVOn6HMFmoELYuYWTwWyFJAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdK2XoG4q4KlxdSd54aYXiHFcAdpVFgz8YYOoAZfJOmuBULgRe7pRFZkiPQAse4+yires9JDFzVBOn4O2NC7ho9vvcg43x5UWGp7ryaE7SMpbglBKstWpqBMYtSWcS6YuNTPrRq0ZuU8z6mFfo/1vKDHjvL5slLvZy5IK9P8DJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YTiViTxA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YTiViTxA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234477e3765so1683055ad.2
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163033; x=1748767833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHC1UEZymw9wnnpkV/BuwvpiaSVPH0/q81+93KLNW1U=;
        b=YTiViTxAFXQBzfVLV9Y0CfEFSlyxP3YxRnSC5XnvrlZG0gvEFkzIE1miO5mGMrNEDL
         uCOE340WqBqCQDP+qMWSDAMizznyTh0+Ah44kcnR2S41iU86Oryo24xZ8erW+KNxJGlb
         nBWimM97UD9d2xfdtsP9UM7z3rIjOSa2dpRrpO21mVC4gzUfoSela8KpvYhPnQsvqCWP
         7lEdJq2DyByEEozaYkbyOIJ4u+v2Q+KksaQOxafoH9+GyvhND61QH1j/506Wh+z9nQJm
         f+KK+vebqGgRfu/l9JSETH4U9kHdP8k6NwsCxEX3X5DHLQ8RmaUhph6u8RyL3VDTrTNR
         TDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163033; x=1748767833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHC1UEZymw9wnnpkV/BuwvpiaSVPH0/q81+93KLNW1U=;
        b=SAPI87gROwgf9qzjAz65LMo4DMakfpy8nkUb4KLT19c8pA5ZfS254IovGWAzUA4t+N
         xkK6phF1vbLdpaZrGLTFbSany9kSn7Dv8Nc9TO1z+Fk8njEWlUqWgGejuaSL6u0SIbcO
         kLiXHv1pPfDffacrUfzwugagnM6HMDhkEqxVb7Aa0X5vNrWgUgugC+3uMmsNz2BD0L6D
         EB7RVTakFzUSxuHpj5gYHM1oJ7HyHKZ76wYsBQn54TsvQ5hDqTO5YqH76VN4pzH8tCWV
         St8bhAacQ8JWoSRJKJuIdr6QINgwEreYPoJtXGETA1zqFAf2gy2p33CKhz5nhQsh/5M0
         +N+g==
X-Forwarded-Encrypted: i=1; AJvYcCUy0bWiV9L/QhclMOYRAaw6WwG2krlLYdVV6goFoApduX+qR0kGZHU+o6G88H+y0tKIGVEKKh+ghuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPenfblH9oL0g+ivZS/kgAu45mktju/DUuzoUxSvyn53MQfWla
	UUbCKY4TeCNAuhIyLX1MmTaz2i4ZLIt6JES2Xa0SHsb1vYwOO5pPqFZm+mlDgn1ic/U=
X-Gm-Gg: ASbGncv7yfUrfuXbwyxUjqXglgdchdMoTEILvL9IUCWX1Qw9eW6Fgvqkbx07IIMd/Co
	onJHWlnDBY2GBCmtnt/xVtzObnpyEspY53Jcudw4vCEQhhxVac0BXNHKMCGVARtKTHAta0ej+CE
	Au7M+p/wWIGHuIF1MYcyYjbJbrWpbXizsYOn3EUvfoDbpdffyldvUq4ch40jlL6kU5x3DkNpk7E
	NP9HArT347ZJhjutSdS5hu2AIrAgErUxVyUZ6DY+wKef6y0l5T2Z2CG9RhktFkCqL2R0zXfFw5W
	8VwDK7vaqDpjfGKNmtR5srDfZVQvHQvOT7X8sClAtaUPrxAIcUSf5erL1qXe1pxc8DIj39SyQIV
	cRvdbDIuR
X-Google-Smtp-Source: AGHT+IEZvm0nbOinSt/PdP1ymjs9KkhXXFgMyCQpgodAAZI4iEJHOoECkEhtpUUCnZco52yWUXVFNQ==
X-Received: by 2002:a17:902:ce8b:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-23414f7036dmr90752035ad.21.1748163033368;
        Sun, 25 May 2025 01:50:33 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:32 -0700 (PDT)
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
Subject: [PATCH v4 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Sun, 25 May 2025 14:17:10 +0530
Message-ID: <20250525084710.1665648-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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
index d48dd6726fe6..f09b865a697e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20963,6 +20963,21 @@ F:	drivers/perf/riscv_pmu.c
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

