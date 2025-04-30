Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD025B1EE
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009189; cv=none; b=KcYhQGz6m1/ZuSrqphhxEX2fxf0OeAIajfLRE2jFXxqrF8OECMwCSEOzJDTPftARFeeauRW1F+Tnn2X+0R5pCcQRuFvvl5JCrvWyf04QgaYyTtpRmgVC08bg0hVSFY+cSV1ElszCFtquAoJTdRHQg/jTtrOkH0SazKdsJvBMcQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009189; c=relaxed/simple;
	bh=qqyemasPL6QK59u6QUV4f+mqdNA0WLZoLI0hQaQeRAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViMuP6yrTg0ttBsuDOkMGWPMj8xtsTEkupXLYME9hd0kgUUzUMkDgxPJnOEw0mLaj6HXENXiAuOvbSBcLszYBUR++QpXkCagatEDdGRsEAJAa/pJbbqS3uJAnAOiOv873rdCeJsw0UPLBezNR9cI/8FHs1Rz1wk8KJZipdeCJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ar3MVEeq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ar3MVEeq"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so11239779a12.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009186; x=1746613986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=;
        b=Ar3MVEeq032Zsp2bufQHkoUShr0l2ARJ00SAzEmIxHbLo7ufXPfuT/OFIyzkjbHwB/
         8arCjpcysqoHLbdlRHedX1yniC1MAit4Iy61zTfmmZIb+kRzpr8Gju7toflkHnFr1ioC
         siWYCQ7rnG5t6S8fJNXn53WYfeM8Jajveq9c3o8JcD4mWeHHkhgGrC2or5IaW0li0pjb
         hQ8/Q+5xVz3yBufrns5L+OAr58s1kdAwnTkENCcBrjWv/mVla3y3YaM8xCkveG4/NgR0
         t0ZdJ2jKLabmgUxRK/h0CmhiiZUcPWCiKG0rNW70CTFT5I1NCixAVa5hpm1Ud+BC8XFI
         u4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009186; x=1746613986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=;
        b=sUHIJoZsnhBLcGMYCXiP28dDB7JuG5ehgZtobmAoxyk+5s8ZGOELrs5gjXycfUYtsX
         NhR3IhYG2odpdADa+7TjVvaj4x0hGzYeNeOGtqUrd/C+KIYkFRwKx5oPpEv7Rqi7bVkk
         584aYrowyALxmGd+TnxURXSDh8dJ8wsCnUrKO9a8Lt6uiQ07/8EJHe/QZj3Mu+vxugob
         svmNz2r0jy9RRz6y2Th86g40Vvwzg6KMyQaC++cpSlaGcwLgt39DxuMsm4NGZWF3lM0j
         iYwKt9Oh9hdHRiN8phCsYpRCASXyy4+RAAEe5b36+ki1QMYFgOqntSYyT7+eF3W0CYiR
         +ckQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFU+QqeQTQVLN5Nn9r3l46ooyPtVxu3UFjwnPOl74+hHNQx28l1P5leCY+6eTHXC4iFcMZCoEyEBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtv63iMzVMyZ1p4P94zsNrX2UEtpq7cw8bgVyCFwv8Yg6pnn8H
	f+GdxShw9st/hMOW4xmuDPy8Z5Eamp/Khvh9BwfHESIlp54d6dZsZpiumGuLhPg=
X-Gm-Gg: ASbGncuWBJv4u8pPtSIAzqsq/HJ+rRSDZYKS3mziayG17O/LwrLP1aNT/YIYCIl6ec4
	eSatOPJrrmjELbP71jK2/nFDHOK671ViOAQs3szu5wDViBJ/0ZE0PX8WpeZHNZd7UKfFPXFyeVI
	06tlbZKHmK5NUsTfwOkymqjK3yYdiiqCW5iZ71oy4ZsZNp9x76AeiISdbjQnKiQDdJdBX5nnRYO
	KHDpD7kmYLoKQYzZX+hirbUeKc99GRD2HMOYakryy0ZCIKwWkvNNafQP+whP/KSj7jdUWDN4aZt
	R7CIrFPQTAhVDldZmi2y27yV8zFTfAZTgOBwIkrsaQKvtM2+RWidvGO7FjDZmcPN4tOqMIIiBTu
	OUNPTIQ==
X-Google-Smtp-Source: AGHT+IEEfl+k3BC6Us3G4LOLDc9wt5JbZ4OiyNOr1AeXljqq4kLkSZXbAFThitp0f3NmQGw8dzbixw==
X-Received: by 2002:a17:907:1c94:b0:ac7:1600:ea81 with SMTP id a640c23a62f3a-acee2600a17mr193116866b.49.1746009186334;
        Wed, 30 Apr 2025 03:33:06 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:05 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/8] of/irq: Export of_irq_count()
Date: Wed, 30 Apr 2025 13:32:31 +0300
Message-ID: <20250430103236.3511989-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Export of_irq_count() to be able to use it in modules.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..5adda1dac3cf 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -519,6 +519,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.43.0

