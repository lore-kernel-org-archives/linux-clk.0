Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1AF1EEA47
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162987; cv=none; b=FjfCO8sCU0YtyBvh3lxFnXzmglLrj5cVtUd0jRp9Z0TDHe+drP5qE4jDVYVa80GEMpklLETpMYQ9WkZ0SoP3Ub9yNemHKCzdGmINZoQXuH1YbhsPoVnOJeeka0YyM6Epcmgg3FT4NPT1MJ0KuHr8RSiJuuzJL+ZIEcsa+Q54oyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162987; c=relaxed/simple;
	bh=iYFTMRQJYHERqAkl7SYjQsJyICxvZIoB3wXVxoG7tuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBSgmZ9Cz6/h9P+CN6mxUxyAzOEiqNqE8E3OfuGd9AqN7xu1g4/uS85urJviCVaSHBB8oJrebLXRPGG0tuoZv+wFNB3JY3h6wxdAu3cFB1fZ8p/TU6W8mNePmfd6orWRYKvNClOsPcLN/l2TPMlrvj6AgLnAKPeFBbwLdlTuDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Sere2Dq9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Sere2Dq9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso1426052b3a.3
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162985; x=1748767785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=Sere2Dq95x7CnZcCUYc9cz0+IFwF/lerDK3DWaP8wS7p98iA1k5O1lQuFXxWbuB/El
         /rRZAvWVjDJkPcKlsq97fMCq1LfgqBJn+JWl2L1kOntuHsCGkalOhR2S5VqspYA+uTVe
         cWGXGc3gpK0wB5vPhrn4F46vAVlgjKR7qmoGBi9Uxann9oE8Oeu8JPXD/rNoftCBeF/H
         8Y9BQEroTBZtZCqN+00Cg7t9GuZ/vNLptPjatd5lXVeoMf8O76HUbPzKmtX0zi00e75R
         C1HkRlH1eMTkqvGUAkNXaBekg0wED4KVfl3AxYQuXeEmnKSIsHVYvgxGeX2H31bVwy1u
         eivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162985; x=1748767785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=bBMY4T7FZfXz/iM9jhJZYvU6zNYDxpaVCnk3bFX0Hrm1+uP+oSB1YbXg9t6Zet8/E4
         i+PK/ox3EZ3q6pQQmeuqDui+lAuQxKnbYX2ZVjAok5anhzygO7Fy/Y4bgEuJrEbgz079
         O2mRbGmqkF8jsjIh3kVTy0dtcxc2WtfWH6Z85xJMsT2Q7AWOtB+DSRc8DaikS4tGwRLw
         IhfFuZ9daa8kUClBbYxKfykHD+ozqHjKMXhpZAvisrsHs+Fmq6HqOike+eMHuIp7Ucug
         kG5JZw39Uf5w5h3v5f5hjGCJiKGPv+ebs8pV/fA+ZLMW+wnMIlnMO5rKjcBLS2j3g64j
         m0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVpFIhStikyxm+k/3kIFQv0UAMUsRYsBCFWPwLs+EIZCcHb/0jDNKiKOgBeXE/lQCyrrowPNub4y5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAAsquGGSYkmhipgjD89KpzjCiz7y+qmEsK0zbycromkmJDrmU
	r4XHOi14GmfDmGYj6LLWvIYf3tjZosEFGH15bWxq7GLquKVFMWmVgLx79XeuCGcmM7Y=
X-Gm-Gg: ASbGncvUEY4DFh2GeC7IqiSlzkadod9BkmtYRK3FuM30pVZtTHDlDcu3H2/MHUnLLWh
	XtpkDjU8BK92QnuW8snlgxtF87rF29Dfisfr+4AyJr9sxsoLQP9h2Q53tVZi25ZE1XODMvZm02u
	j6eodtrA2uk1+dFjkV9pQNoLHYQrs699P0p1irT/aZoKReH001gyqu7np4R/JBi/NFX/x6jAKE6
	5Yczt8U9YAijzL03IivpNiFulGGyt0S5j852ui3LpjKjPloVjbbLo+SBlZG0Sr4xwmZ1/GTlmox
	X0KKDjjOjwPRjDFBbtof2cap1X6OVJ+hz6CFrrFXd0jSUvKyg236vKXqfvlubkSKlGIJajrDjE0
	9lccV3U6+xUqZ8QYuGRk=
X-Google-Smtp-Source: AGHT+IG9TTZb+OY85zw+H0eNYjGgFyHc981BMuloFhe2PCTtl6RRkSB8ul9TS3wJ36HaA/NGbUjQ+Q==
X-Received: by 2002:a05:6a20:a11c:b0:215:e60b:3bd3 with SMTP id adf61e73a8af0-2188c353194mr9297558637.29.1748162984743;
        Sun, 25 May 2025 01:49:44 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:44 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Sun, 25 May 2025 14:17:04 +0530
Message-ID: <20250525084710.1665648-18-apatel@ventanamicro.com>
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

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, the interrupt controller list is created without any order.
Create the list sorted with the GSI base of the interrupt controllers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..95b4d7574ce3 100644
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
@@ -125,7 +125,17 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	if (list_empty(&ext_intc_list)) {
+		list_add(&ext_intc_element->list, &ext_intc_list);
+		return 0;
+	}
+
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
 	return 0;
 }
 
-- 
2.43.0

