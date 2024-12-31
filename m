Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0F7189916
	for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735671824; cv=none; b=AnMuSMDeNwDepay/Fk2X9P2BIwbSNUkY2SM+T3y+rKBXZy3xrQMVAT2F3BSK+RHF8T+b/bGciFLPb10YN/kl3V+I6/bkFDzjUToOGuoJV+YgDfTDROQi0+0E2zxFEIppo+RomCZbRE5oQ14b4lXYahoXGmNTs6zkCnqQq4xh3/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735671824; c=relaxed/simple;
	bh=hGtZBU3Z3whGzmH/7CDGTmQQIyKDEqSx3P97I06QxQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=speVp9vyCHc3/6XWsSZszE48yFdP29ehrTEqf1hs+8tjqSztBUeWP0pcwHBTXzvgWH7zyS5GBMQXb+YDbVB1THrO8zK794uR4SPZpKk3C0W2oL8SFF6FgheTwbHZ4qXFjalYw2kOBi2eRdz3/qCJpNpJKJ2Fgd7Bu3FFoAkJKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GBVFPsx5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GBVFPsx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735671821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+5xWAUF+fycztH/1bkPrUC8z4WpEalfNEkRojaFt17A=;
	b=GBVFPsx5dV8bjb16jWu8+0pEizg3KwVQPUyqGsqDYPOEa/SoeqPiZZHwFIfdhkx0qMoLcn
	vgP+hAe8GhiuWwOhtoeEg62S0lLfPMfvtJM0W9JnJJGnal1jUSXCcFFKQdKxO65pPulraj
	HZayL1W7ClYFn0PflTefolI0woel8Sk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-a04Reek2PnW2hDV_slOBLA-1; Tue, 31 Dec 2024 14:03:40 -0500
X-MC-Unique: a04Reek2PnW2hDV_slOBLA-1
X-Mimecast-MFC-AGG-ID: a04Reek2PnW2hDV_slOBLA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43619b135bcso55186805e9.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 11:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735671819; x=1736276619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5xWAUF+fycztH/1bkPrUC8z4WpEalfNEkRojaFt17A=;
        b=bi5zD9nH7cQGxzqSaa4PUrTDnNpfrrvmx+hqzO9UZFWrCp411UXzPDh5LtpbOC4WI9
         wyLd9P5E8wKe43WHEP+yz+gDHMb+4wGqZPToFi1xWOAMu8lqzXjm1Wb1DUbs8XCGwCwp
         Y5I4SkQXF8/kmDmOB2L1lK+fIwMjiFCPsUILPv1Eggduh7KmMyr6eI9og/U+oPWh58w+
         OEG27VPOU0/B8XusikMeNEMpjsfjgOqfuz0GGyYlV3p3c8nlBJVMKYEhx9J4s/zbPksU
         pOT1pylXdNm1NqrLsnV9xlEkiIiqBoZPGGBAm8txWsrfEzTjp2WLNZ5SQTBfECRIPG6I
         LiyA==
X-Gm-Message-State: AOJu0YzQJ6GH/4zF4nprHRv/hvi/sz3Wck/l+c1ocCPkfCK3Km3hFq2U
	B90AMSrUUlP4/ONt7ugLD9s0g2KUJCjvXmzUoG0JeP5T9bLwzQQrUYqZwgfk3M2CBaHHR40ZOcE
	8oWsLYm1/dNNf1x0d6V6IVU/i7cI4tTrQBZj7BOuuI0N+TVWZg6T6al4isDYQt1iG6nCbHdluWn
	FXbhi3BccEhHBmOoh/4KPT9mr5Pa8OM1JZPClidqvOmIo=
X-Gm-Gg: ASbGncuHqNzPq0JNLGQHAQd7tPvbDhvhdOdQ//5ClhB0huNKrESnEkCvtdfrRczfK6F
	hT2q8tImAkJ/sPmSNaaZx/m6vKVHO75m+bp3swnY2+KThXD70seiSJ450gL/PXfJBhnw/JwRVu+
	6YFvpoiQ20CK9cBXg9swIMFNQLcq4LHGNKAsJTBvYI6zp8NLGKoa4SxBusll+V4zdpY4GZW2Dz/
	gBNuWyy7GbhNbbZwlOVBQHKleHkOv/aNNseac0Obj+vGwx5rhHXL27HCD3wuIVFQzn60RJD1k6Q
X-Received: by 2002:a05:600c:1d1d:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-43668b5e172mr323373255e9.22.1735671818909;
        Tue, 31 Dec 2024 11:03:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwu7VHUjCze1BiN8/L4Xx9WF41kXaJ0+tvzbxOl+oLjN2qBl4D9Qlq0vZZh56pugMVJl3/Mg==
X-Received: by 2002:a05:600c:1d1d:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-43668b5e172mr323372965e9.22.1735671818462;
        Tue, 31 Dec 2024 11:03:38 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea487sm394711105e9.8.2024.12.31.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:03:38 -0800 (PST)
From: Lubomir Rintel <lrintel@redhat.com>
X-Google-Original-From: Lubomir Rintel <lkundrak@v3.sk>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	stable@vger.kernel.org
Subject: [PATCH] clk: mmp2: call pm_genpd_init() only after genpd.name is set
Date: Tue, 31 Dec 2024 20:03:35 +0100
Message-ID: <20241231190336.423172-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the genpd's struct device's name with dev_set_name() is
happening within pm_genpd_init(). If it remains NULL, things can blow up
later, such as when crafting the devfs hierarchy for the power domain:

  8<--- cut here --- [please do not actually cut, you'll ruin your display]
  Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
  ...
  Call trace:
   strlen from start_creating+0x90/0x138
   start_creating from debugfs_create_dir+0x20/0x178
   debugfs_create_dir from genpd_debug_add.part.0+0x4c/0x144
   genpd_debug_add.part.0 from genpd_debug_init+0x74/0x90
   genpd_debug_init from do_one_initcall+0x5c/0x244
   do_one_initcall from kernel_init_freeable+0x19c/0x1f4
   kernel_init_freeable from kernel_init+0x1c/0x12c
   kernel_init from ret_from_fork+0x14/0x28

Bisecting tracks this crash back to commit 899f44531fe6 ("pmdomain: core:
Add GENPD_FLAG_DEV_NAME_FW flag"), which exchanges use of genpd->name
with dev_name(&genpd->dev) in genpd_debug_add.part().

Fixes: 899f44531fe6 ("pmdomain: core: Add GENPD_FLAG_DEV_NAME_FW flag")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Cc: stable@vger.kernel.org # v6.12+
---
 drivers/clk/mmp/pwr-island.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/pwr-island.c b/drivers/clk/mmp/pwr-island.c
index edaa2433a472..eaf5d2c5e593 100644
--- a/drivers/clk/mmp/pwr-island.c
+++ b/drivers/clk/mmp/pwr-island.c
@@ -106,10 +106,10 @@ struct generic_pm_domain *mmp_pm_domain_register(const char *name,
 	pm_domain->flags = flags;
 	pm_domain->lock = lock;
 
-	pm_genpd_init(&pm_domain->genpd, NULL, true);
 	pm_domain->genpd.name = name;
 	pm_domain->genpd.power_on = mmp_pm_domain_power_on;
 	pm_domain->genpd.power_off = mmp_pm_domain_power_off;
+	pm_genpd_init(&pm_domain->genpd, NULL, true);
 
 	return &pm_domain->genpd;
 }
-- 
2.47.1

