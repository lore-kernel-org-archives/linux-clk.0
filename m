Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35C429CC6
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 05:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832227; cv=none; b=mcJHoTl94r88ISdWTGm7gB5h7S6gAchEg0xGrlU5JKho3Qc6Oi1scCUfhibUVbznRmNEqwq3m2qnhUU8Y2wamjSdqk4Lc6R1xR/IIikWyaK5Z4h97AiCfY7+Vz1yvSF+NfwnrvubRqdjS79I9I1izXEsip7tWF6oRPxwOGEdl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832227; c=relaxed/simple;
	bh=MBIpyNevKvdcy1ReQXJfl3s6aCjaGkASxY+LnR4nDco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVjZvsk+1GZ2pHlb9tr1fyIK7cHDKnwoo8JVL1ry7knjkvvCjwyEc4Go2nAb/IsicaWtCyt+Wn6e5tRFjL9yRFkJMQQtXUAB2jeZD2QeK2mjN4pZsZCawF/MUbv7fNYQUq2nADCEHF/1sLrDMNOeFxIxsxyq0l/1OxYpSrIknlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZwfOwIC; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZwfOwIC"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso3039457b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 22:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832225; x=1791437025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91kvZvL/b7kEJ+z/UOjc61NVYBtM0Nxql86cBHMnH4o=;
        b=ZZwfOwICzUyR5auRXwnSPy/zLyRyDsfqYmOPIGdTSssDQUexbFVmtKuIowb9C6yNMx
         B4Hy40zkH5VsupLH8LfhAeevqQfFmbESwIp6q9tEXY+fJMKtbvQr/VLAQpY4cs6aCJQm
         X0M09KW+eyDMbzgTTshKQyzKkav8vJG9WPRMr8oVohYZJMkD+vGjw/1mYfxbsWsC5gM/
         tn/RqNLlyLAmFZoUiI/MOp9pAhj1+jfYuMBX4b2x0qso4urxuaa7sl6pxsx+9QyAh+Er
         VblqY4+wE/znak1e8j9mFjx91QOIXsm1ZCMWOvsA+5c/BLJUWomeJdpHDGYPURUzl+2F
         35Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832225; x=1791437025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91kvZvL/b7kEJ+z/UOjc61NVYBtM0Nxql86cBHMnH4o=;
        b=tgSTs0QMKlGSKI2SQ/3G/pL60RXNz/qtsII74IO2J20Tm8iGsOFMBd/cbctM/fRMoI
         oqtSxHoPeXVd2SHm5LduAAM7AUxfw4qHD5AP5+GyXLaAYWY7vhu304hwEoxvrr2qpqPF
         gzz/5nCAKisSVdcN02HtmkvOIr8QQ01Xtgb7/QuMhWV/yNQJZETrsfcRV+agyhczdHhc
         swUSmxIj0NP6S4VN8D3ZNwmmrwX+2pmh78nj8zVPyuWarYrBflKwjCLt2ehBhbgZDSBL
         mb2BdmbzA/PiOfMECctKWAVLFZUH+ymopqP8L8x3ywepSZlW7VTe01WtfbcE4xHDJjYU
         4iHg==
X-Gm-Message-State: AFuF++n8/hnVTC8FB0tESP7WAeZysFu2w6Pjz5pxQh2cLeZpZSU8xYrI
	UhBMJ/kRkTFB9sO2acQSivzQqLcih2MEI4x7sYhAFMq5gnVq07wIv289piQqGbFt
X-Gm-Gg: AYBFou2ggt2mVZbcN3FTxRbOfSfZDAi2ZTdyxX04PnCKDmhMNyXA385YcMjrjV/Lcog
	Y0eu5LHUyPKOQsLR83kf++oG9xNukkLkNuCN10Dz53GlIaDsR7OyKJd+byVTujkAiicwjIOULYC
	HNcPB1Qqk6lWNVFRekKicScxVn7efG78pYuavIW4GfEWWFWoCBrQgIISyY5uP5zqiGMG9qyMZIh
	R8t/zHCvu9QcLdPPRUDLMJ7xtb0ZUcdLGqoYSwkBlflGuPN/+tb5vgTNd0vSSkYDNIyR/q1zyje
	0Jm6W2GwJpwPXviw8oNhgQX2pwx71Zn2/rv64M+ixZAKb2uwKTEkmqOvc4BjSLc7d/v36K3agXS
	hhVwQvREKpTOe/wghKXybGX6FzXNqRFGfF5R+cZsLZtkXf4ATKt5bQiYIpFeH8Xc7chwdMp7gOO
	48+OlkpyRE8IqK8MiAl9H4xLMJqXJ6gYCKsNvcY6HfvJMriC+kmWE6W/oShsJsSjqfDzYVrqgT2
	BTFCbFiAFKWXQlOpu+k4xOHePmIo+QV+4tfD8eKhTxL7myVZ67z1XjR64lMMrjUnOVKRHPwT6/1
	aDw8hANcLwrx4u8ucpvsQc11krzGMdLdvrmib8y/CRvEQ6CC
X-Received: by 2002:a05:6a00:2301:b0:877:c77d:af8d with SMTP id d2e1a72fcca58-8874be0d9famr2886793b3a.13.1790832225393;
        Wed, 30 Sep 2026 22:23:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818718205sm491780b3a.17.2026.09.30.22.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: mmp2-audio: add missing PM_CLK dependency
Date: Wed, 30 Sep 2026 22:23:43 -0700
Message-ID: <20261001052343.17966-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_clk_suspend() and pm_clk_resume() are used but a PM_CLK dependency is
needed to expose them as actual functions. Otherwise they are defined as
NULL, which does not work with functions having parameters. NULL is
probably used as these functions are normally passed as function
pointers.

While here, convert the block from spaces to tabs so it matches the
surrounding Kconfig style.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610010151.2W0MrmxE-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index d035f2dbecae..9789b2dae51e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -463,11 +463,12 @@ config COMMON_CLK_MMP2
 	  Support for Marvell MMP2 and MMP3 SoC clocks
 
 config COMMON_CLK_MMP2_AUDIO
-        tristate "Clock driver for MMP2 Audio subsystem"
-        depends on COMMON_CLK_MMP2 || COMPILE_TEST
-        select COMMON_CLK_MMP
-        help
-          This driver supports clocks for Audio subsystem on MMP2 SoC.
+	tristate "Clock driver for MMP2 Audio subsystem"
+	depends on COMMON_CLK_MMP2 || COMPILE_TEST
+	depends on PM_CLK
+	select COMMON_CLK_MMP
+	help
+	  This driver supports clocks for Audio subsystem on MMP2 SoC.
 
 config COMMON_CLK_BD718XX
 	tristate "Clock driver for 32K clk gates on ROHM PMICs"
-- 
2.55.0

