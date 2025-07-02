Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E895B1FC7D2
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433400; cv=none; b=Lpn3yUEllJyc6WdXURQPoirLlFYLKymsOlLKoPWEl97/2FbEUL7BWTZV30wcX1YLh5JMx3y2FXjWcMRgDVfeXJEE1J7E9vNyi/UzHgj280stpwErAbsR1AWKqZVEx5sUhw+JluYvmbkeKLIdmDwstLVS4bD6vGdmBS48drqGgOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433400; c=relaxed/simple;
	bh=bbsKQgQKotFffImznTiHFRZUkpn3l2AEmmz1a9sty/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3k4SzYEGh3xNCkw6gs0O4lLSB8sU77sVcN2y1FizwGL3HmZ+9vgmsoNeim/fxvb2cDWy/1WVeQbqz6DHDakHwEoc+iXe7SFLcU6WvkBP+DXmh0UjkppjqwNT6CTOFbysfJSn1t6mvSpFk+7BYbAgyjOqW55DYlcMUcU43Xl7pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=hBIMJ2Qx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="hBIMJ2Qx"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234d366e5f2so56024855ad.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433398; x=1752038198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=hBIMJ2QxGvBn9LASwz6VN2AHYtgG3f1h+RAJXq50OgG/snVrBDiENXdK4ZvlzuX+k+
         fKIRNe45LAHzrcFabnLUvcaXaDxAzGmhW6DWKe79W+8KiiEyHctLD8MxCK7Vp3xu3faO
         1eSwFFlBnqOmH03Wj0mJ7F+JLWUTjYFchFFZ30nFBulWe6WMuDtI2nQfNqe4it7DJU2V
         O0K1sRs6tv+gpwDW1Pq/mdmChe/jGILGmBRgO08IvcmuWUjhbozAZL8IiZ2L15SwQ2Er
         JWOm1UIHk8/TJwxPtqV8NLiZgdJtMGiqE2CPcCdzMfNgsTI+hNaDIxZZEEsLvTocM2eD
         tb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433398; x=1752038198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=UaVi69Ih4M1Fq3gxx5l4CA9rt5kpj4W5H9o684fSdgsTPaqixAl3ZYM/LXoaliScmG
         a7Iee7Q27oWSrwX2c1ZVAPac9BcD5SqbxT4K9NueD7KjGJ0+PtoDRtn50c66JX2rMyvw
         VrgvaDWdyduZt5E2/1oVgl/0b7JxC+XKetRRtFdOYTrqjsQLzvhsUMATSNal60OHD7C0
         rwfhoNtG3NP+OT76SooINwSMwRKnMfcrzNNHrNYMb6syp7M5MnkDjW7YEQ5ATqV3zrcy
         HXle3ZjXNfIBfZyVrrQRhYOHifxrvgRTkFz8npLVSuFt8Qw5QTeDuKPPBi565/C75cSk
         mrhg==
X-Forwarded-Encrypted: i=1; AJvYcCW58qf4LOkT02DYR2aT47ehIVwhtpILpTsrCCF3NFmDrVBqSMV5PS11TvoEDl5JSdSPCwcCBBl+qRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUVDJinl6DekVrpwdIzLdGIJvJugYQnynw26ecyjh9Rk5yyxku
	z1oV+N0JRbvDchWz1th9oi4SdyPVJOlPO+yCuZ8oDC1VOMoWE9e9JFFa3keoxH1hWN0=
X-Gm-Gg: ASbGncv0tfBLTvcBqDVt4yyvff7y92Yv/LWEaOsLb6uwnygmQaXw4ev14wuwA0c4YSL
	+aerpYoC0kvN5GAR+CLED018XDy6P2hRlRG3zOnsen1J/sIGOWUVyFlktsgwD4QZ9IU0HrfNsJu
	jWBwfxs2/HHDd0RDXhdWl1YXFeYQtsTGug27O7mbTEdqkkrFfZM1GOThbsfENsdMuIyb6KQiHFF
	PeucIRbiRoeXiKjY/QFtMckKAo05TTbU/Z084PBKzoHAQX+WRMxzaJtFkDItFI49y+QRRJvkz8o
	jw2TQoo7zewZ+AXxfMY6EfL2JgHBShIad02qSmLh6Iwd5KXu6t+gSsp3Tpri5qcqe7YH1kGb6vO
	n7cyVYPNa4030Gyww
X-Google-Smtp-Source: AGHT+IENCvcAnrrecQXBt5V9LFuZ+rQKh4OUv2G9tNtl1lHXMhnri6Hzogn+Hw60JHYcRZ/blVSc/g==
X-Received: by 2002:a17:903:4b0c:b0:234:c549:da10 with SMTP id d9443c01a7336-23c6e5d6335mr17948045ad.47.1751433398116;
        Tue, 01 Jul 2025 22:16:38 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:37 -0700 (PDT)
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
Subject: [PATCH v7 20/24] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Wed,  2 Jul 2025 10:43:41 +0530
Message-ID: <20250702051345.1460497-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
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

