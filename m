Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B7379ECD
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707671; cv=none; b=VmLVY6zTxja/O5yvvaWtUWuKBx8R7MPAawzj+HkCwDDqldhX+Axf9ZOe8AucHIOB34ir7Q+3nsVnCYv+vHig+5b6Ru0BzPIHBmkjT3Vuoump7FoGz3Y8yxXZNN3BNGAiw5RLmpf18+0un6Gi7ow6fI8V2ZkpW7OWMkq7ahuFDJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707671; c=relaxed/simple;
	bh=vLKslen7PBG3nSXhKe3ByGeSxA0QEtveFGGqGO5IELs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OjGMW+wSF9I8FBPIPBDpQGANC6R8F7AUBX23Sz04wTAvvZ/C+KPxUMppsIw+erbfKRDoIBM4F0VbgBdnU6NmwwtRhKwmjtFtIh/ji9k/TgYjhYVr34aHANEXut3TxAayQLx/AUsA9c3910GW+bxsFUJszzSI4Ije0PLsGjK5wmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZ+XPbyH; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZ+XPbyH"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a33c9cso519511b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707668; x=1790312468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2PEaByhKxlg2O+w66oiofCngOTmz8xzHYd1tomOchxY=;
        b=iZ+XPbyHcwvl2IXnDQdTCMOA86Tu0bhFLGQYGXSlK/d5kOEFQND1AJ0SUhUJbdUqtT
         F8MH81ucTtwVGyCJKk7h2lakfXGICclBYS3Yy16Wu2yRBGtrtdPye12HAt6xHxvWmgyl
         oeim8EX+sNhQubNXnbHZ/VM1aMhOpi+PUFhMUHMF4fFn1mMRFKWUe5LB+FKz5kEKM74a
         Jja9g0Ata0lZA1XrnKZ23MAUyhdj8XZl2NoK1Z1NWpqCFDqmX8XW3O4+GOM33ieC+9+5
         52LZL/m3BxYex7V9uwpb3GUvqCQAz2+jSEmNQ6ilopmK4bLvrpW65nTlPF4ziJy6DnpL
         iQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707668; x=1790312468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PEaByhKxlg2O+w66oiofCngOTmz8xzHYd1tomOchxY=;
        b=PdKftdU/vdOWtg0MSwWtHmoI8uf0Y8JFXqPzMndD1sa9myCzzRKyf3pTZ7KA5tYH9K
         DeFsCX3WzrV9pF6cYJc+wa/vrv7arz12CI54YAm9ea9AnOGfDFXlvxiIY4DKY5KXGo4X
         9q1fx76C/pGh+L5tUjcKp8Hm3wIlsgrqJD70u130oK0px8UyuDU8jQpeo65MP3L7aIlN
         o0uWnq/l/8gNrxjqyOuRY0BPuOCNMLjzkeVF3g3WL62OmRQ8NO0X8LQ/JvSOueaiuJEJ
         4XcQQnhqh57WC/EZV9okQ9CBfoj/4J5ADa6dJhKRUREWR5PqxRITyI1lDIs8xl1DHvEi
         JMuA==
X-Forwarded-Encrypted: i=1; AKwUvBwbvoSueylqHpSkHLDAcYg9L3q9IZJIOYq9UA0FzQ945bs46QmYArg83WOqYtnn5hewggKA9lIxebI=@vger.kernel.org
X-Gm-Message-State: AFuF++kmFPHjDOg0UreZpY0PqDjJOnGlic4OGapTB0rrJa46TVK3G/qQ
	GuIDkZXLhfLZIR51guouxR65XAuXcNVWXswZNXkyCfggbGOyzRU6Ey2rcyhTQA==
X-Gm-Gg: AYBFou2Aaisjs6t+KZlfdpP/4WpIGw8a0kX9L6U6wxlM0aba2Tag9JvJkE8Jos6oDpA
	RrUo2HTgK2McJr4He/etA+KxIAWyA4EfzXIWmYTIc21UQEThaW2ioPtkiJPJgbd5zV03r1zi+9d
	yYb+67Dry/GTQb8GIk7BMNnOuzxwdsNuo+bgiFrwm0j/JRZW7xDHNrAmQN7eTFBTc1rorIVKkxd
	U7+Bxydfs17BPC3eBz+gA7YfsQhD8WgEZkSSUbBMRmVfWeKeLsW1mm7BPcnsNysH9dSp3bxeTz5
	ktREYnf56cysntN+PLz3xSKHyQGC+SoLxVV/n/CP6Q/4vTj3coQe0lko5v8qgp8btCBoUj9tMGF
	G1vrio9mefgoM7cd7wOxl7hfjqqjVMh9f7bVVp3Lpx+GKuR6/0Ii9VVnaLtPzlLH7OFFlW+kA+V
	LlcSs2bRYASqqC2+Bk5irIXVQmRU4u1eXAFwVjnMxGOEkS/HlKeu093ofbpCpkBh/MJFGxgVQWZ
	8wB3j2gT8Dwx0OuJyhXlB47nNcqX3pilH8YkEn3w3dJ5QMw3r5psNs5bI69FBux/y8GcJRneJS0
	P4/TCmmlTuthA8s=
X-Received: by 2002:a05:6a00:1da2:b0:857:726d:270c with SMTP id d2e1a72fcca58-874de8faa1dmr2970590b3a.24.1789707668021;
        Thu, 17 Sep 2026 22:01:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8fa6acsm215958b3a.13.2026.09.17.22.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:01:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] clk: starfive: jh7110-isp: fix pm_runtime error handling
Date: Fri, 18 Sep 2026 12:00:51 +0700
Message-ID: <20260918050051.14986-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in jh7110_ispcrg_probe() does not call
pm_runtime_put_noidle() to balance it, leaking a reference each time
resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Also disable runtime PM before returning from the error path to balance
the pm_runtime_enable() call.

Fixes: 81279f5d0812 ("clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-isp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
index f3fa069db193..860c9ec897e8 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-isp.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
@@ -130,9 +130,11 @@ static int jh7110_ispcrg_probe(struct platform_device *pdev)
 
 	/* enable power domain and clocks */
 	pm_runtime_enable(priv->dev);
-	ret = pm_runtime_get_sync(priv->dev);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0) {
+		pm_runtime_disable(priv->dev);
 		return dev_err_probe(priv->dev, ret, "failed to turn on power\n");
+	}
 
 	ret = jh7110_isp_top_rst_init(priv);
 	if (ret)
-- 
2.43.0

