Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA52256C8B
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695827; cv=none; b=OGo4kL78eXJBeEhJnGPD0wZGFhnNVaQyX7WsXZHkaIedL3fKL8p9HPltjUwo2zY4/PTy8QwIBbaOx+989uP2p+/opXObyw0TRDKFUfkR8NmuobIzkSNUCzZUyUGqbnXSeUWxgOCXdZX1viiN9kutrZbyiVuRNYujYP9O//oxgD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695827; c=relaxed/simple;
	bh=uLkW3DQcKIIgVHib4AKQIVSEPy4uT4MPjoilFNj5tRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/3sruN1OdQSkFm7Zcgd6xPbUu5CXv29+7Ivwq3M6W/ZzAtN1Xbrb2PpzTDH5y+Gry9Ut/uYV8iYv2UCzdi1Sn7dYdjx6mAm7XlQ0JxC66uB0ToYiv0AcV9Ayqwk+eU1BfFsQMrO17opfM1R3SQELss4DiAcYmjbGhr7sgauKO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=lAKuSiyo; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="lAKuSiyo"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23636167b30so38331805ad.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695825; x=1754300625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=lAKuSiyopFg3EsGL9UpfO/sDfXII6rV5nZVqgP/YGrMW4FdbKUpOZY8I7RXLyQr/1/
         y0wpFuGAEYxfUpFwep5PQadGvMWxYoWIg9mVHXGAQLEcCfsOVxqS1tnGLtEDvgHBg31Y
         gK6o4fycn0kd9ReJBHvsheK3WY+ZzO0xRQPJI/T+/x/cyxx21jOonaT0c8M5Yt2/Wurt
         AfCzc1Ckf0Gf2/BcxfqtA9W0O6Ac04NvgyfuLDKCFZqZsk4u0wlL30Uv3jdbhIofEQEU
         r7q0WekIjE3M/ZaIBzF9QgytIGQB5TbE2V7BTJaMw5G7bP4Zwy3U+yQFrPsX5pqY8q7x
         x1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695825; x=1754300625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=ovNguhvN9mRZcLzYrNAg+sGYyXz62eqmB8O+CSEm5exAUsVYVC0VSYw/DiwMFqa/LL
         p0QhS0EevUp2VSFKEEL2Grxf6EB8+R4qb+VD0qxKvdR1vEeMPMJa5Bip1l10XdTZCJoN
         KVtlHBQQ4kWP+LQfTQucSLG2P9/Xcvs7yF2qzghEh8tVXgHy/dv8AWOHXaeA0edyEA5R
         jolqMk6C00n7+P+UQWUvmSf5JT5Oasz/jfbXx3/+cRYCawz5D30bOULcDZWpxwjXh7o9
         FzSkaF8ruW2WPp4YJENgOdQ05SvxiPZgD7zT5r3YE5lZ3ow/o97Qte/ZdHCAInmqt5I2
         DJfA==
X-Forwarded-Encrypted: i=1; AJvYcCXaDC3YFBOi2Wp2Wv4hKNGBvxyLkuBRIYBbzJQZAqDLPd1BgGFi7y6Az7bGjUMw3/o11pdruBurABI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX2cvunN+A/heR0RqAgXRjfvuBHJPGwYu77y7FQ6ZczxAx7Qyf
	j4lNFpu2GGDuQbtjO0qp+iC/RzToud6JleLC4WEGv6gwzTdNYIcp6JdpCedXWRr0Y9o=
X-Gm-Gg: ASbGncvee/9JeFuz5FCmTBRWXAsHBNRv54nkLtXbkNYg/wQiPS2iM2HG8JMNoeUiWhq
	XSHhgx2s7SYOMG1z2Gbt+XQuKamvUks6HvnsjsjMF85zDMYXqSwzK1j+VZ59cSgguLn22I0F2YL
	Xp6QD+mMxgzPmxTWG1KB/h1Blu3idHVSdmLpkeVAfNLWe0jyOeUmcQzUf2/0LYep9y4qafQOTVx
	1NhhvBQ4ckbUgKMcsUAC0kyza41kIDjWKW3KSoJwLd6ctfrSLi15LSm8G/XES8F15Wj81hnaNk1
	/VOZwcLCVz4EIdAFauNHpSI8JXwGFxHMA2H1fIfFkTMhid+qkqV/JWEpzRtYZKruLxJlZxcZwAm
	tUsFY0WnunxSXP3gyJY7FOO/w0DkFP/gRb/5VdX8Q0R8lHm1ZQUtD9OFuiSAI
X-Google-Smtp-Source: AGHT+IFS53uLoHppmjznOMdJcZkAmiTSfCzfdzzbbuX7HdvnQYvfyEZtYQl8EZXF/rrU4jEX1LYO1A==
X-Received: by 2002:a17:902:e887:b0:234:bfcb:5bfa with SMTP id d9443c01a7336-23fb302a71amr154565295ad.15.1753695825111;
        Mon, 28 Jul 2025 02:43:45 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:44 -0700 (PDT)
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
Subject: [PATCH v9 17/24] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Mon, 28 Jul 2025 15:10:25 +0530
Message-ID: <20250728094032.63545-18-apatel@ventanamicro.com>
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

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, the interrupt controller list is created without any order.
Create the list sorted with the GSI base of the interrupt controllers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..33c073e2e71d 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -115,7 +115,7 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element;
+	struct riscv_ext_intc_list *ext_intc_element, *node;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
@@ -125,7 +125,12 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	list_add_tail(&ext_intc_element->list, &node->list);
 	return 0;
 }
 
-- 
2.43.0

