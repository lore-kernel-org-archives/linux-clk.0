Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB57F3BBA08
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456643; cv=none; b=DvZHQQ9vJGPaPnr7Fqv+TO/loEv8/NGD76vp8622NPCLiZD9gU2eVJACe8qJ8RoSyq8EpW4QltKr+mjXU05ziEM1VbDZV2Zettlh+w11NoY08W60Q/jQj4jcdROy1CF6RZ5EeqRVrwtLYKuVyqfcxx177OuSNfTR1sb7m6DchdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456643; c=relaxed/simple;
	bh=50z5aLe/utRyMRS+DG9tTAyot6zu9u8aqp2TcBzvdwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2+9xI9UjuPS0Vm4eyGH3J7YBAJY5xzgVG1y41ICzyWZ20Sdoyo5d5ySJyWsdz3+owXgnRXcj/ip146hmVUGLmeI/YQkaxH8krlulmGJdw+Le/NHPjTNDEPbz5n+55YMbuuQx9H7SsBe/3dkESRzyPJWR0wyKN2GwHuO/1NvrEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfYe2Dbu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfYe2Dbu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso79212665ad.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456641; x=1780061441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCbc6evCAnW5/Lk0bejiMZ9J5LObQXJ3ouBPH/v5c+8=;
        b=XfYe2DbuB34FZb8SQXY4wpNoPLDesRoVUR4xPnZFLs+eQ8DA7SpBzNDsFTUJaZHzGf
         zFUsoIN30IGqV7ub0vN382Zq84aLiW50NcxLuJfg4kgQAkTiXQIj0ZWd5mVi6Tqz9V7t
         T+roTdbpH3NuvqWQiBBdtiUSvNcSEtJwRSr/JhCjlB44zrx1Z70Nb6zZXA3Pk516FK4T
         oFfUPU8aRjdm55ZBVGUOFkBgVMXOxwCLyBHbZkewiopcrfOV1KI/6W88Bg+kLh2kCiix
         lZzmCOoo5E42Bhh9Vbh3r1tCK8K0THHMWHRqcyuJKMlQPEeX+ZphLtZpVVgjQs5CzmZ9
         +IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456641; x=1780061441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCbc6evCAnW5/Lk0bejiMZ9J5LObQXJ3ouBPH/v5c+8=;
        b=ZjmrGajZvdvJEZ5bzbFl/U5iJIHcLfcC4y46A1zf4yU3csgI2spOVqFykJS9HwkJd0
         eqAaljTmCPut9wXNEDg4Jd0Dt0RpmITXwH+2dwaQYjq8PsKU0idRwg8DODXuqXcknrKa
         +yDZBjIpiuoshbwn8DU2TZ2EnkrLypAls2WIuAJGEKWN4/i3aAag0ztM8ryRr2EUcamt
         X1wbpbhxSdS/I5yRxhABwGAsiuvNrtp4oluuMHXQAvnG55nwEA+MG3kp7WoyFVvfHcAD
         rXMoSNBUCxEy/c8b2LHgLAzDBjs3q/DioR9nBj45kZmvPgTS00kib7yChxZhLPgo+y0V
         uC1g==
X-Gm-Message-State: AOJu0YyKyPOZUlxLIA1i+QeayC0sPntKNU+vvo7q3Nvk7krWaBtn3Y+5
	mSN3yd+aF5Sa7ZYUTiBGO+WPJ4AIxcCkG3OdRZB5xAguxdedpykQxY4U
X-Gm-Gg: Acq92OEwpdCrvLCaTjYN3WdJQtH+R6InkIhgmDCiA9IY3YLSgJD72Ah68xwoo1jisun
	Xi9RxrEPDHg16FWGyE+XsxhkygUzDT0eCpxCQx6EMcY2n9F+kaglNfFawD2Twd7bH44WmpmFyeX
	9UXvPEQDEryxS2shGekd8hrOQ3pwNP+KTtdnVvivU7WS7LT0zmiZTZ0GnCROJgZOvU33M0NAzAy
	hPo3ad6j3MvihUK8tnRBvosn8bU9/m9nOnbo/NnV1wnBoRTllldMexd0wuNhdWXBOv4+t3bjAzz
	CPDT+M1PgCJ7GVZmBlkF5rrW2z+/QBOjFfXUwez4EtggSPL4LYggQ20vWdC+/P0L2R4aAn7u1Rw
	yUCq8lpWHAUGF22Z1VPeC2FJ0JrS62UalPVziG5L+qxYovhly48XnknaJXe9/TSYOk3fjucAwmw
	p+NXoa0bn+aUhSjEQF9Iy3jMLi3AwiYx+XCLMmUSVZ2uY3RFpJCjsCLT0u8V/5OnnJuh0U298av
	25KVRU=
X-Received: by 2002:a17:902:ce84:b0:2bd:3bfd:74f2 with SMTP id d9443c01a7336-2beb0593137mr38054985ad.10.1779456641134;
        Fri, 22 May 2026 06:30:41 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm25147605ad.6.2026.05.22.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:30:40 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	laura.nao@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
Date: Fri, 22 May 2026 22:30:23 +0900
Message-ID: <20260522133023.355404-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8196 vlpckgen clock driver uses
__devm_regmap_init_mmio_clk() by devm_regmap_init_mmio(),
which is defined in drivers/base/regmap/regmap-mmio.c.
However, the driver's Kconfig entry does not select REGMAP_MMIO.
This causes a linker error when REGMAP_MMIO is not enabled.

Fix this by selecting REGMAP_MMIO in the Kconfig entry.

Fixes: 2f8b3ae6f0cb ("clk: mediatek: Add MT8196 vlpckgen clock support")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2c09fd729bab..fd8440122ec2 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1006,6 +1006,7 @@ config COMMON_CLK_MT8196
 	tristate "Clock driver for MediaTek MT8196"
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
+	select REGMAP_MMIO
 	default ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8196 basic clocks.
-- 
2.54.0

