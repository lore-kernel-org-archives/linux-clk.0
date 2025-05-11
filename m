Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB3E197A88
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970951; cv=none; b=LKLp2YbrZ1+tqDfkMDp7wPuH3gLOu8iIa1p4V+0ZjwRacXIO4HTSUPLNlmvOHxSVKsPGdc8+RWm+0i/eTDHC7G3yQAPovcwZEoJDjYXZIUjDMKu9bTJMA0TRm9xB6wmw++oxK1y0IlTIDE0s1OgTNVVGoM8EO6nFuV7Ob+xbvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970951; c=relaxed/simple;
	bh=iYFTMRQJYHERqAkl7SYjQsJyICxvZIoB3wXVxoG7tuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9WTfT3J2ckAvIebvWRlqRwV/xsvg+ndG3c812804btmPmTbEDWlNK7VjmET3xVJw+qFVnR7AIGzJvD+6/+wfFU554M/Dw3KcKO3hHgK6ladPFuhbVV6dBi6CGsfLr8p+37m8ChGv1QM+cheI0R9molnpjsDFYQUIf24IddDzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Bal7FfTg; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Bal7FfTg"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e7e5bce38so40460125ad.1
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970949; x=1747575749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=Bal7FfTgTOBojacRRWl75bV127Aj/9YIp3AySd4izIFQld5uz3dhhMu/Y/UG4XdQQx
         FmS+KpUxTjQCINdjvEw+td7Fy4vUH435psmwpcsgKocxSqpqWFYRtXYyOYKbqI7oUEUK
         jd2Llg89hgpabphCnF8zVEODtqVaomG8AfHVNSFcIuwWrsWyFDSu97joXaixDVJFeOFg
         N/GBF4lnKdn8/O5zeECplGI74bA6d8T4kE2eGXsLh98Q6BYcSO5G3GwpQCMFG/FM1zjB
         bYYypLeeKOXBjFU5uzyu36lkCYVptWSaX2j/5/fBBrywVI7wnPcL8V5d0hjJcqoldpaa
         u9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970949; x=1747575749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=oGOd83QkWuyWIUX3PapEHsoYTFTlI7vxCS38cLfHzx4MqWIuE+fCQO730qT88H9nWz
         aLu5BN+83tIToHp8XaWuy6EFOmhl9EKSvZHLojuukuHHZdWHf1NwlxcU5g3nOIJtw3Cm
         ffs9h56A2Ox1lQ8kLEm40ILj8pYvrg9/8+M0IfYQVYgxrfugo4VW3ft34M3KOwbFRv9x
         qL7p2+e5/Ujz6mLie3p20WzM/wDWzNkYr5o2JWnyb1dNXGdcRmyBgBDNEih3uSOHqXf3
         t8dL1AkdyJGssw6J1xuht7tD4kJmOuyNU/Ro+ILbh1zE0fEsSjhrybD8ksC2j1zz7lfy
         0hlw==
X-Forwarded-Encrypted: i=1; AJvYcCURzrlQhcAVHWfxyPEm1wSIJwgcGE+3dV1xIkmaSIwlUQ+aaW1VT8DVTGG2cHm83cUsy8dvmM+LPpY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym4WcCnb8iKpsPMKmJD2aeWqMpdKgbnzffJuA9Q77bAzb3ok6U
	cW2IJvI+QEVDHsdc9eYVabkexhZYAHUd3EY3f5hiW+hN48clHgyquqtvTjldtcE=
X-Gm-Gg: ASbGncs8llJQZd1PPHjlMwfFbFntM+eOKzMtGwp7IMreWMl/AKF2nrRK4vj9ImI85vq
	eHojIfhUgaf0MFjyAYvZBM0tMb2gv3m/1SncsgLA4mA2QVa1TvYPRPDinKHLwX+Lh0PrUiRKFVV
	CFrzsb75zXmhfMrGrxqFgVK73PWHouM/vL7Nk9RITXx/OfdCxvixcwIvT1+vFP9Tk25SbuHERUv
	lCbARlbIJPB7MCLnxUqUl2FyMr3J2f4PeNh75q/vqqvQVW2Ohyz7k5HkQhk6Cb30cEdjxEceYmw
	d5JQvxADSfgSkrOxaGSLklSiz6gRwiG6032bSoP/L5Z5b3+kxfGrATkKUvnxdC5k1PQc/zDg97+
	5DP8yFgO8JuX5YA==
X-Google-Smtp-Source: AGHT+IEe5MoHmRn7VMhcjZzc/oDhZp6CpsUXB5Vc9hjV0uT28JPcfqXvqK8cpfVDg2JO3fpzBT16Ng==
X-Received: by 2002:a17:902:e949:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22fc8e99d25mr152020315ad.40.1746970949344;
        Sun, 11 May 2025 06:42:29 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:28 -0700 (PDT)
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
Subject: [PATCH v3 17/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Sun, 11 May 2025 19:09:33 +0530
Message-ID: <20250511133939.801777-18-apatel@ventanamicro.com>
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

