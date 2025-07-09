Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7323B63F
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088445; cv=none; b=Z5FGgKCf64B/EhdhUX8Cw17BrKW1QNZU3O0g1DPnk+Ed5d7/zemJo1ZKgupsgjSzcJa98GGHj4x6aCW1fBBzw8C/VKZhr5lG7hoP52WEnsQjfyDD1HUKmS8dVw52vw1XPQrnDFlAzMb0XmCiRUd3qaQI4fDxFi40nWLMV/0CFVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088445; c=relaxed/simple;
	bh=zHDAgo+3usMVt1m3EEn01KDZ4SXsamOfc9Zt4WzYYcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QTILWzYdprXh73fRII6/fC76ygqDuhke2/HZ/ppg42GEuo2dIM6v44SB+ibLZg22OHOh9tk2FbQKu73dXkglpAzv/wMmOWgleesYy7A8n+guQWFllkE+NpCDSNEb/Oh4kBvXlCeRqnQCmNcygpL00jLeVQ9uYYFdWMhhHb2/ZXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDNcYaPS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDNcYaPS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-454a3c5d6f3so249295e9.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088442; x=1752693242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LO2SvKCCqko+0I0eG/Gzz/cIcDsvNsYtE0Nh9DYuiN0=;
        b=sDNcYaPS/eXYFC7nF1pKmAG8GQT4TIIdN38xtjIWCIEoYHSyjVnbV2fkU01TiwLJMi
         l2RR/DdLzA9BEkSgMO6PgKc/TCOLX/YjSFcjACezjx/tKdET5xWP/NJsF4FwZoLOQH0W
         Tj41S+I1OMM0dJ8c6np7eKgfucbZiMkk76TW2YO8wOTXmPrYMjZy6rgya5FMK1ZKads8
         JCr/Gl/GOkLtC8JZAdXDvvCXvKUKiHHefnw3eHeLj9pzbA7JzovbIpFM6rrTMpAUykbN
         YNovUCCv1gMX62o0LWCVJT/Q/xfaWHonn+JH/2NLqtCRC78bPSDNV+Kj1EVS1M+Ookwq
         aD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088442; x=1752693242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO2SvKCCqko+0I0eG/Gzz/cIcDsvNsYtE0Nh9DYuiN0=;
        b=PSHjoVqX2opQ5uS2L6fWVJ1ddU41MI6AP9zy2HEXAQnKFE7kHc12jYYtEKsEeZBnEB
         Irrsf101ZVOmxLpQ5WImvP7pTuTnVuraavXujXn+f+etDTEEouWk5f6OlEgX9u5vepB8
         91Uclp7EKVUXxmLezHX+86YeDxmBXownycxCQv6ZdI/bRHu4ul83chpXrjreISZCx9Tm
         yRerPsB4rG34BHnmIa6YfqvR1vPCX9BzcEEsv8dx2iex/YzA1EYfsQyG3HrTOeeKV/C+
         TQa6niy7Z1NXBKNrUauQY/SN6UswrsXzxARGfvVoB2opCRdjlJkSYWlXFqWiMNATuVEM
         n39w==
X-Forwarded-Encrypted: i=1; AJvYcCX6z7XbsxlkHBGmnHPTiLiJq1bFH6aQ7h/euZ5Z1FZ/FKFRjlXCriMLbZDe2JuFtpCpM2pnxDOkWbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YySgXOm3udXp3GejyfWBJbu8LZKjNtEzUcrmplfB1dBlnDzgZEy
	SYu5D7RbqJofQdHts5Xpnu7g449WYHDbeWlMFaZ2yknuhO6BS63hpd94yxrJdZI4trI=
X-Gm-Gg: ASbGncvJbk881Swul6GlasGZB7t+Bg7XSh56s8CZaog4FuhNIaborhLko10CEkt2KBj
	VlFjR0t2tDPpxaBhRqI/U/5WS2rLv7b1/g9zKgWg2vRg/ZhPuNCficBdwA3ehUK8mU897K1Obj2
	OY7iZjEGO3x45Iy5KowjYU16/DC2Z80DkywYPJ6m8lITMkCmGYlo3/wKBxxtJpH8AQxCk+Xb6tj
	8KeG3anT5F+dpgSlMYVLLdLnRzZUpRujkitjSPOP774KLyoaQ17JUK0W86jMIU8xC6Ee1uSTqd+
	msbx7NyQRgNOaPPCf4kjoIM21SDWqYCr/IYWlPg6HXBoxMM8R+L0ZOAaZ/igsOARRdqg8E7HLiM
	=
X-Google-Smtp-Source: AGHT+IF+y4VS+J+ifAdhQiRONDZqZsKUZRm/2F/D1x8s7RGynhJsmman4W9nCsHt84pBRtIV7i+ROQ==
X-Received: by 2002:a05:600c:19d1:b0:453:9b3:5b70 with SMTP id 5b1f17b1804b1-454d53eeff3mr13735995e9.8.1752088441748;
        Wed, 09 Jul 2025 12:14:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97353sm17115944f8f.51.2025.07.09.12.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:14:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.17
Date: Wed,  9 Jul 2025 21:13:57 +0200
Message-ID: <20250709191358.171004-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zHDAgo+3usMVt1m3EEn01KDZ4SXsamOfc9Zt4WzYYcE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr928v6ljIcAcuQ3vV9rIKJq6n7Tm/0r2elL4
 FOSeEekazqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/dgAKCRDBN2bmhouD
 13qOD/9pbiV+Cnbqp0KsjL6cy1H+uJszH7jFQPm4e7juzTsGXcLalJmneRiviNHPeQlhY4Re2Fu
 sHLTlU59BDYNC9BHWjmfHo4jqxNh3FWStRKxTWvurS4QzcqRXtmhjwQYHSc2aLRl48Lvt5gDur2
 RrNnEZ3l9sh1m2mV9wldUyBmloQwS08tIkYd9LQKLOJ2KWRr2PYi2H7ezKcVbCiqaNdua7eWlGb
 NGPeEMf+mCVnEz0zobdeYe8nzsKgki7BPDGbBR/hurovDsQSCwag7G+nuOM/G17yne6mKayaVfa
 8fpx5NWgQfZGFaqTuWJVJeruhv6P370Rme8tVIb1d/QgEUv99N0JiZqOFTmZtT1pSKvn+tigY2Z
 kLGHC6xW0/ZqexuNCujKcptcR7pDcBFxuzCiwufFjTyMFbWcJ9E991WA8GLKRBfArtcwACYxqPF
 /3Hp23E/jm/b0xsWKTVMuxFSrh0o4yoKZ3f99WAHWSpEWGaGADCLg5+hm7wiA23Lz6S3PQaywP5
 22cXVmRAjSkOes+0ADM3ViW69HlVCDoZ/FcN8o8xy0z4MyAIyZ5Mgn7YA86ZGu/dgr0BTgymzbb
 dfC003omx/U1bsB+mODbyrgVy9C/GE3PVFXOuafmfkb9undGYLEc/7NMzciiCwrRSRafYYoeA0R S+lSfuRP3SDJgEw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Clock drivers. The bindings were kept on separate branch, just in case, but
eventually they were not shared outside.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.17

for you to fetch changes up to 2d539f31ab0eb3eb3bd9491b7dcd52dec7967e15:

  clk: samsung: exynosautov920: add block hsi2 clock support (2025-06-12 17:28:11 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.17

1. Fixes for clock topology on Google GS101.
2. Add HSI2 controller on ExynosAutov920.
3. Minor comment fix for Exynos850.

----------------------------------------------------------------
André Draszik (3):
      clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      clk: samsung: exynos850: fix a comment

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.17/clk-dt-bindings-headers' into next/clk

Raghav Sharma (3):
      dt-bindings: clock: exynosautov920: sort clock definitions
      dt-bindings: clock: exynosautov920: add hsi2 clock definitions
      clk: samsung: exynosautov920: add block hsi2 clock support

 .../clock/samsung,exynosautov920-clock.yaml        | 37 +++++++++--
 drivers/clk/samsung/clk-exynos850.c                |  2 +-
 drivers/clk/samsung/clk-exynosautov920.c           | 72 ++++++++++++++++++++++
 drivers/clk/samsung/clk-gs101.c                    |  4 +-
 include/dt-bindings/clock/samsung,exynosautov920.h |  9 +++
 5 files changed, 115 insertions(+), 9 deletions(-)
