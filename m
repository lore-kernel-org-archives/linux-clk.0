Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D11F189F45
	for <linux-clk@vger.kernel.org>; Mon,  4 Nov 2024 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730706646; cv=none; b=Ua1G23N+drH/1X1G5JyEpSFuWFaduFSE2CALcaYV3YHA8FuQOZ8InlRtjDIcW+Q4iQJ+fmv4FLWUTiZCcP1uub3Z1NvoZOlkmLAyf20y24o7znwV1GAu0+2vlzDFoc4jH8fafEsTyo2fWTAW525m59kMpzb0WZx+Z3s4fLO3DPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730706646; c=relaxed/simple;
	bh=/Y28vokTpQb4d1tXRJmorOa0iViEBF2hFEc+PPDpI44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GM96GLeiiLqX+HMv99o3REza6iTmDajJO5bT1JHLqOkNKPAG1NCCHfFTthjv9b2E/UV7hiJscNHDOopv2mdlj7Y9TCJt5DmjZdpL4tB816/cZwwM/fHdUR316+zbcSVjoj90u4bPVlCagiLXmKoUTg30mumJc7vBXyRiwY3gIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VIzqfx18; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIzqfx18"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a273e421fso88272966b.0
        for <linux-clk@vger.kernel.org>; Sun, 03 Nov 2024 23:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730706642; x=1731311442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9nHH1n8ZLYE4cUy1f03ZslOc8OPqBEHgE84YmFhawg=;
        b=VIzqfx18CbAbeUr9i5ZLfk7DB2zaD/c2zk4v6HrvfbjFQ8DN3atauRSs3giY1g6slf
         5oExa81iR4hnG42Soa63Zxk63+/pSeztCpZSsjOLwQiYYHLWTOczVQcKA0Y4O+GO1RgT
         pcBWw99bY0IvBCnoDabFJenikvUdMJRCmeHMzb8gebYUSGIq6HQbr1RrD9JS/R0+x9Sp
         cwQK0szDeBSka2wSm4qzpkZsQnjDQ7h4mUoB5e1wTEfnQnoD5HdqS5MbS+PEWmeLtc2L
         4sYYb1WQtqpw04xbo3GKavcvvZF9lDpiIox4JK/pjusTRaqg+PMUNLlAIZFWZfIQRf1C
         vkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730706642; x=1731311442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9nHH1n8ZLYE4cUy1f03ZslOc8OPqBEHgE84YmFhawg=;
        b=O5RPDzV4Qefz2SaXaOfjjr8CQuJgXP6N3TtmIz5AvrmWlcgaScDYuTu6tnzHn8D6ov
         XNb3J1Ukzag48mKs8P40rH/hd6lKUvlYF3agp96M/bQDUPC/fjI4T/gMQ4J2VVce8u9q
         7bnNvhlrDrvUiQNLaQE4lqDeDJeIn2wyNunsKVm/F5tYJdZ+v2a3koLksUmfw9g6xiXc
         AHQxFHBsONJT8uTYOx+bM7Vvir+X/4HjBqEvDwuLHgnbKkFp5ZOcbUtdd/w3ByFfAj3Q
         KbM95BkcHNrz0d2WI+sPVC3oMf2gM5QE1As9PXhOmkecqO3M4vGzLPi+AGMPVnOkTP9L
         acrA==
X-Forwarded-Encrypted: i=1; AJvYcCX8lQuU+3bmDOt15L/Ao//PRFAOzFILLX7lNvPe57dQ6oY2Gp7CClcShS7cpWT2tHf4tzF+6QPSXNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQeg5C++yzPk4VBXrZ/eQXUsglNRIk085IeqhwJlhK+rWZxNB
	xWJYDWSiw9NUe5x4tOsJIvIFrn20X/B12Ri/mM4jSBrcdwolAXphqSHUV8Re/Uw=
X-Google-Smtp-Source: AGHT+IEbIfNzeLwZgrrpPLLaSv5bOleyHd6msDt353EA2HHUzNhF9o9Fa5Cuz6VIqVTylhnb+z1K8g==
X-Received: by 2002:a17:907:74b:b0:a99:fbb6:4956 with SMTP id a640c23a62f3a-a9de6175f57mr1477251366b.10.1730706641496;
        Sun, 03 Nov 2024 23:50:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5668499esm517640966b.219.2024.11.03.23.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 23:50:40 -0800 (PST)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.13
Date: Mon,  4 Nov 2024 08:50:36 +0100
Message-ID: <20241104075037.13323-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.13

for you to fetch changes up to 9174fac3b302a853b78c78f2f5ad11462b0c54b0:

  clk: samsung: Introduce Exynos8895 clock driver (2024-10-26 14:00:12 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.13

1. Tesla FSD: Move number of clocks from DT binding headers to driver,
   because these are not an ABI and might change while finishing support
   for the hardware.

2. ExynosAutov920: Add clock controller drivers for PERIC1, MISC, HSI0
   and HSI1.  Context of patch depends on a fix from fixes branch, thus
   pull in my earlier pull request with fixes.

3. Google GS101: Do not disable UFS host controller clocks, ever,
   because gating them does not work well with UFS sleep/power savings.
   Downstream does not gate them via OS, but uses hardware feature -
   Automatic Clock Gating - which is not yet supported in upstream.

4. Exynos8895: New SoC with initial support for clock controllers:
   FSYS0/1, PERIC0/1, PERIS and TOP.

5. Few code style improvements.

----------------------------------------------------------------
Inbaraj E (2):
      clk: samsung: fsd: do not define number of clocks in bindings
      dt-bindings: clock: samsung: remove define with number of clocks for FSD

Ivaylo Ivanov (3):
      dt-bindings: clock: samsung: Add Exynos8895 SoC
      clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
      clk: samsung: Introduce Exynos8895 clock driver

Jinjie Ruan (1):
      clk: samsung: Fix out-of-bound access of of_match_node()

Krzysztof Kozlowski (3):
      Merge branch 'for-v6.13/clk-dt-bindings' into next/clk
      Merge tag 'samsung-clk-fixes-6.12' into next/clk
      Merge branch 'for-v6.13/clk-dt-bindings' into next/clk

Peter Griffin (1):
      clk: samsung: gs101: make all ufs related clocks critical

Sunyeal Hong (2):
      dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock definitions
      clk: samsung: exynosautov920: add peric1, misc and hsi0/1 clock support

Varada Pavani (2):
      clk: samsung: Fix block comment style warnings reported by checkpatch
      clk: samsung: Fix errors reported by checkpatch

 .../bindings/clock/samsung,exynos8895-clock.yaml   |  239 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-audss.c             |    2 +-
 drivers/clk/samsung/clk-exynos3250.c               |    2 +-
 drivers/clk/samsung/clk-exynos4.c                  |    2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |    2 +-
 drivers/clk/samsung/clk-exynos5250.c               |    2 +-
 drivers/clk/samsung/clk-exynos5260.c               |    4 +-
 drivers/clk/samsung/clk-exynos5410.c               |    2 +-
 drivers/clk/samsung/clk-exynos5420.c               |    6 +-
 drivers/clk/samsung/clk-exynos7.c                  |    2 +-
 drivers/clk/samsung/clk-exynos8895.c               | 2803 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynosautov920.c           |  290 ++
 drivers/clk/samsung/clk-fsd.c                      |   23 +-
 drivers/clk/samsung/clk-gs101.c                    |   10 +-
 drivers/clk/samsung/clk-pll.c                      |    2 +
 drivers/clk/samsung/clk-pll.h                      |    2 +
 drivers/clk/samsung/clk-s3c64xx.c                  |    2 +-
 drivers/clk/samsung/clk-s5pv210-audss.c            |    2 +-
 drivers/clk/samsung/clk.c                          |    2 +-
 include/dt-bindings/clock/fsd-clk.h                |    7 -
 include/dt-bindings/clock/samsung,exynos8895.h     |  453 ++++
 include/dt-bindings/clock/samsung,exynosautov920.h |   47 +
 23 files changed, 3873 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8895-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8895.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8895.h
