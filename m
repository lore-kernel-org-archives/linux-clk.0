Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B41922F7
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430990; cv=none; b=kdziKgfw3KVBQ76SBOwpKaApUQb5I/huSjjLv0KxAgT89N3CVwx/Rgh6o8wLo9rwiIDF+yLyWinQNyydOfhcN7z8SF+QLoVdEQua7BFeQr532jv3ebiNC0j0LFVtn/W+lpcb0yR3LbrGL0nlWNkCkm3ADc5WR6Hgpv/mBv4o0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430990; c=relaxed/simple;
	bh=wQfLyPSaduwhoXhyw7tCofrvU/aH1SkdI6MXu0jHKKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9VZxtYPU89dLR/Oqvolex3dYDZ7FQhQw7FlqgfVDzqrqREB62rFRzuGQ0IS4VIHZJxv7H4OhB4abVcp4uBR1alNMq5PHftWvUP3HHHBd2xNczB1h70I+dR9UG4moanV/OB75V7CZpclnQ/5gtrQg1mXa7eEYL54C9eKyjmKb/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTNtSLMH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTNtSLMH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-424ad289949so10185655e9.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 12:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719430987; x=1720035787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnjsauIL/CcAxAa/bQLK55jPhlKZNz6Is4DxauRo/E0=;
        b=UTNtSLMHPX6W4Z5ZTUik5X0mZtVQGth8+tRfRkfP8FWhXBztW4jN0GwCfb0zcoSe4d
         CCIpKNW0qUTqfIO66Y5ttnKoNvTgIis9fo1mAcJ0JjascqfQYDgOCyb32pC66qn6lQzV
         mp45YgWQKL7HG2S3502mqTQkH8ge5iT9EGe3vgFhCbDkPpNA6ajmM+GBgZ0ZVM0WwJv5
         BBOZwrGLyB8oUGCyAJ1hE07nhSmAmTiCQ6zUvfXrR8PkHaYIPKyYDyLf6yIUjMu3pT+o
         m7AdNN4PH1lUVnvGiWAvh9I8bph8m7G+DNLMn+0EFC6O1tD4/7ieQauWTzka/Wyds84B
         fN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719430987; x=1720035787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnjsauIL/CcAxAa/bQLK55jPhlKZNz6Is4DxauRo/E0=;
        b=rri2kyLA95L7uZTE7/c1C6KDnEKjHBMA9TScknwt6ionpd8P9tBxRup3ZB0SGgaUTU
         2GPrYXAwcr2OwYkH3pqvajTe12b4C61jmcvHWMfwbOsFsyUYPIk2cQd3OW/3nqQ77kMa
         pW0GuFP/tktfOywU3CIpOCevebXW+mzdP1snvwa2gdoKVzUxJl50i3rqliVamzQvTuPc
         3BedIi3MZeyde974t1mxPdmVbbvuyi3sgvwkv3dcxB2Kbbir6MCpzArGCIaXqpQzMUc4
         SIVgk9pUcbRnUAoHDevX2I/mHQb3SXczi4bdHykmCIb6udPRPXel5p4CyzdCP+OurBXU
         dohg==
X-Forwarded-Encrypted: i=1; AJvYcCUPtqpb9cGJMSnhTP1153lLEBPm1RS4zyUFHv0dX8FjUFHrkA8QHz3OOzS/BB2bcRNbE4oibco91Q78fVwiKq+GDf0gds+0zmNw
X-Gm-Message-State: AOJu0Yx41cW43dC5W5JARqBbRPgTLwhxsoXmtk9lbiPI5I3GnwAWurRX
	aPRsT3a2YV2NRs2mgL1f2ZwrZL+gFjU47npl7ZxkF7Gs+1bi34UduHHNAD+TBCc=
X-Google-Smtp-Source: AGHT+IG2LSoOJQA11RV0AZDKvrStmKskCO7Ie8cnMZ0Kw2R/ExVN3FkSauKy1goNEMtUgpFm9FC1NQ==
X-Received: by 2002:a05:600c:3510:b0:424:76d7:2cca with SMTP id 5b1f17b1804b1-4248b9363d3mr74795175e9.4.1719430987018;
        Wed, 26 Jun 2024 12:43:07 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:24d9:a20a:2de5:8eda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c837eb2bsm36728905e9.39.2024.06.26.12.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:43:03 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/3] Add syscon-reboot and syscon-poweroff support for gs101/Pixel 6
Date: Wed, 26 Jun 2024 20:42:57 +0100
Message-ID: <20240626194300.302327-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

This series adds support for syscon-reboot and syscon-poweroff to gs101/Oriole.
It has been tested with reboot and poweroff commands respectively.

Note the syscon-reboot/poweroff has *runtime* dependencies on the exynos-pmu
and clk-gs101 patches in this series, as well as [1] which was just queued by
Lee. As you are the maintainer for exynos-pmu and samsung clock drivers I've
included those patches in this series.

For the moment I have left out syscon-reboot-mode dt node as whilst it uses the
same SYSIP_DAT0 register as exynosautov9, and setting this the reboot mode is
correctly reported in the Pixel bootloader. The bootloader is also checking a
scratch register in max77779 chip that isn't currently enabled upstream, and
thus the bootloader doesn't actually enter fastboot.

Kind regards,

Peter

[1] https://lore.kernel.org/linux-arm-kernel/20240621115544.1655458-1-peter.griffin@linaro.org/

Peter Griffin (3):
  arm64: dts: exynos: gs101: add syscon-poweroff and syscon-reboot nodes
  soc: samsung: exynos-pmu: add support for PMU_ALIVE non atomic
    registers
  clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 15 +++++++++++++++
 drivers/clk/samsung/clk-gs101.c              |  2 +-
 drivers/soc/samsung/exynos-pmu.c             | 16 ++++++++++++++--
 include/linux/soc/samsung/exynos-regs-pmu.h  |  4 ++++
 4 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.45.2.741.gdbec12cfda-goog

